pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
package body Grille is

   ----------------------
   -- ConstruireGrille --
   ----------------------

   function ConstruireGrille
     (Nbl : in Integer; Nbc : in Integer) return Type_Grille
   is
      G : Type_Grille;
   begin
      if Nbl > TAILLE_MAX and Nbl < 0 then
         raise TAILLE_INVALIDE;
      elsif Nbc > TAILLE_MAX and Nbc < 0 then
         raise TAILLE_INVALIDE;
      end if;
      G.Nbl := Nbl;
      G.Nbc := Nbc;
      for i in 1..nbl loop
        for j in 1..Nbc loop
            G.g(i,j) := ConstruireCase(ConstruireCoordonnees(i,j));
         end loop;
      end loop;


      return G;
   end ConstruireGrille;

   --------------
   -- nbLignes --
   --------------

   function NbLignes (G : Type_Grille) return Integer is
   begin
      return G.Nbl;
   end NbLignes;

   ----------------
   -- nbColonnes --
   ----------------

   function NbColonnes (G : Type_Grille) return Integer is
   begin
      return G.Nbc;
   end NbColonnes;

   -------------------
   -- estGrilleVide --
   -------------------

   function EstGrilleVide (G : in Type_Grille) return Boolean is
   begin
      for I in 1..Nblignes(G) loop
         for J in 1..NbColonnes(G) loop
            if estIle(ObtenirTypeCase(G.g(i,j))) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end EstGrilleVide;

   -----------------
   -- estComplete --
   -----------------

   function EstComplete (G : in Type_Grille) return Boolean is
   begin
      if EstGrilleVide(G) then
         return False;
      end if;
      for I in 1..Nblignes(G) loop
         for J in 1..NbColonnes(G) loop
            if estIle(ObtenirTypeCase(G.G(I,J))) and then (not EstIleComplete(Obtenirile(G.G(I,J)))) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end EstComplete;

   -----------
   -- nbIle --
   -----------

   function NbIle (G : in Type_Grille) return Integer is
      Resultat : Integer := 0;
   begin
      for I in 1..Nblignes(G) loop
         for J in 1..NbColonnes(G) loop
            if Estile(Obtenirtypecase(G.G(I,J))) then
               Resultat := Resultat + 1;
               Put_Line(Integer'Image(Resultat));
            end if;
         end loop;
      end loop;
      return Resultat;
   end NbIle;

   --------------------
   -- nbIleCompletes --
   --------------------

   function NbIleCompletes (G : in Type_Grille) return Integer is
      Resultat : Integer := 0;
   begin
      for I in 1..Nblignes(G) loop
         for J in 1..NbColonnes(G) loop
            if EstIleComplete(Obtenirile(G.G(I,J))) then
               Resultat := Resultat + 1;
            end if;
         end loop;
      end loop;
      return Resultat;
   end NbIleCompletes;

   -----------------
   -- ObtenirCase --
   -----------------

   function ObtenirCase
     (G : in Type_Grille; Co : in Type_Coordonnee) return Type_CaseHashi
   is
   begin
      return G.G(Obtenirligne(Co),ObtenirColonne(Co));
   end ObtenirCase;

   ----------------
   -- aUnSuivant --
   ----------------

   function AUnSuivant
     (G : in Type_Grille; C : in Type_CaseHashi; O : Type_Orientation)
      return Boolean
   is
   begin
      if ValeurOrientation(O) mod 2 = 0 then
         return Obtenircolonne(ObtenirCoordonnee(C))+ ValeurOrientation(O)/2 <= Nbcolonnes(G) and Obtenircolonne(ObtenirCoordonnee(C))+ ValeurOrientation(O)/2 >= 0;
      else
         return Obtenirligne(ObtenirCoordonnee(C))+ValeurOrientation(O) <= Nblignes(G) and Obtenirligne(ObtenirCoordonnee(C))+ValeurOrientation(O) >= 0;
      end if;
   end AUnSuivant;

   --------------------
   -- obtenirSuivant --
   --------------------

   function ObtenirSuivant
     (G : in Type_Grille; C : in Type_CaseHashi; O : Type_Orientation)
      return Type_CaseHashi
   is
   begin
      if not(Aunsuivant(G,C,O)) then
         raise PAS_DE_SUIVANT;
      else
         if ValeurOrientation(O) mod 2 = 0 then
            return ObtenirCase(G,ConstruireCoordonnees(Obtenirligne(ObtenirCoordonnee(C)),Obtenircolonne(ObtenirCoordonnee(C))+ValeurOrientation(O)/2));
         else
            return ObtenirCase(G,ConstruireCoordonnees(Obtenirligne(ObtenirCoordonnee(C))+ValeurOrientation(O),Obtenircolonne(ObtenirCoordonnee(C))));
         end if;
      end if;
   end ObtenirSuivant;

   ------------------
   -- modifierCase --
   ------------------

   procedure ModifierCase (G : in out Type_Grille; C : in Type_CaseHashi) is
   begin
      G.G(Obtenirligne(ObtenirCoordonnee(C)),Obtenircolonne(ObtenirCoordonnee(C))) := C;
   end ModifierCase;

end Grille;
