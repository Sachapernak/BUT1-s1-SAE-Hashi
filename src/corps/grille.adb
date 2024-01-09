pragma Ada_2012;
package body Grille is

   ----------------------
   -- ConstruireGrille --
   ----------------------

   function ConstruireGrille
     (nbl : in integer; nbc : in integer) return Type_Grille
   is
      G : Type_Grille;
   begin
      G.Nbl := Nbl;
      G.Nbc := Nbc;
      return G;
   end ConstruireGrille;

   --------------
   -- nbLignes --
   --------------

   function nbLignes (g : type_Grille) return Integer is
   begin
      return G.Nbl;
   end nbLignes;

   ----------------
   -- nbColonnes --
   ----------------

   function nbColonnes (g : type_Grille) return Integer is
   begin
      return G.Nbc;
   end nbColonnes;

   -------------------
   -- estGrilleVide --
   -------------------

   function estGrilleVide (G : in Type_Grille) return Boolean is
   begin
      for J in 1..Nblignes(G) loop
         for I in 1..NbColonnes(G) loop
            if not(Estmer(G.G(I,J))) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end estGrilleVide;

   -----------------
   -- estComplete --
   -----------------

   function estComplete (G : in Type_Grille) return Boolean is
   begin
      for J in 1..Nblignes(G) loop
         for I in 1..NbColonnes(G) loop
            if EstIleComplete(Obtenirile(G.G(I,J))) then
               return False;
            end if;
         end loop;
      end loop;
      return True;
   end estComplete;

   -----------
   -- nbIle --
   -----------

   function nbIle (G : in Type_Grille) return Integer is

   begin
      for J in 1..Nblignes(G) loop
         for I in 1..NbColonnes(G) loop
            if Obtenirile(G.G(I,J)) then
               Resultat := Resultat + 1;
            end if;
         end loop;
      end loop;
      return Resultat;
   end nbIle;

   --------------------
   -- nbIleCompletes --
   --------------------

   function nbIleCompletes (G : in Type_Grille) return Integer is
      Resultat : Integer := 0;
   begin
      for J in 1..Nblignes(G) loop
         for I in 1..NbColonnes(G) loop
            if EstIleComplete(Obtenirile(G.G(I,J))) then
               Resultat := Resultat + 1;
            end if;
         end loop;
      end loop;
      return Resultat;
   end nbIleCompletes;

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

   function aUnSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Boolean
   is
   begin
      raise
   end aUnSuivant;

   --------------------
   -- obtenirSuivant --
   --------------------

   function obtenirSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Type_CaseHashi
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirSuivant unimplemented");
      return raise Program_Error with "Unimplemented function obtenirSuivant";
   end obtenirSuivant;

   ------------------
   -- modifierCase --
   ------------------

   procedure modifierCase (G : in out Type_Grille; c : in Type_CaseHashi) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "modifierCase unimplemented");
      raise Program_Error with "Unimplemented procedure modifierCase";
   end modifierCase;

end Grille;
