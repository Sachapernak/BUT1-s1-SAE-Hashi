pragma Ada_2012;
-- E/S
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Affichage;           use Affichage;
-- TAD
with Grille;      use Grille;
with Ile;         use Ile;
with Pont;        use Pont;
with Orientation; use Orientation;
with CaseHashi;   use CaseHashi;
with TypeCase;    use TypeCase;

package body a_tester_Grille is

   function ConstruireGrilleTest return Type_Grille is
      G  : Type_Grille;
      Co : Type_Coordonnee;
      C  : Type_CaseHashi;
      I  : Type_Ile;
   begin
      G := ConstruireGrille (5, 5);
      -- 1ère ile
      Co := ConstruireCoordonnees (1, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (3, 1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G := modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (3, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (7);
      C  := modifierIle (C, I);
      G := modifierCase (G, C);

      -- 4ème ile
      Co := ConstruireCoordonnees (3, 5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G := modifierCase (G, C);

      -- 5ème ile
      Co := ConstruireCoordonnees (5, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G := modifierCase (G, C);

      -- grille complète
      return (G);
   end ConstruireGrilleTest;

   ---------------------
   -- Test_Grille_P01 --
   ---------------------

   function Test_Grille_P01 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return nbLignes (g) = 3;
   end Test_Grille_P01;

   ---------------------
   -- Test_Grille_P02 --
   ---------------------

   function Test_Grille_P02 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return nbColonnes (g) = 5;
   end Test_Grille_P02;

   ---------------------
   -- Test_Grille_P03 --
   ---------------------

   function Test_Grille_P03 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return estGrilleVide (g);
   end Test_Grille_P03;

   ---------------------
   -- Test_Grille_P04 --
   ---------------------

   function Test_Grille_P04 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return not estComplete (g);
   end Test_Grille_P04;

   ----------------------
   -- Test_Grille_P05 --
   ----------------------

   function Test_Grille_P05 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return nbIle (g) = 0;
   end Test_Grille_P05;

   ---------------------
   -- Test_Grille_P06 --
   ---------------------

   function Test_Grille_P06 return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (3, 5);
      return nbIleCompletes (g) = 0;
   end Test_Grille_P06;

   ---------------------
   -- Test_Grille_P07 --
   ---------------------

   function Test_Grille_P07 return Boolean is
      g  : Type_Grille;
      co : Type_Coordonnee;
   begin
      g  := ConstruireGrille (3, 5);
      co := ConstruireCoordonnees (2, 2);
      return estMer (ObtenirTypeCase ((ObtenirCase (g, co))));
   end Test_Grille_P07;

   ---------------------
   -- Test_Grille_P08a --
   ---------------------

   function Test_Grille_P08a return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return aUnSuivant (G, c, NORD);
   end Test_Grille_P08a;

   ---------------------
   -- Test_Grille_P08b --
   ---------------------

   function Test_Grille_P08b return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return aUnSuivant (G, c, SUD);
   end Test_Grille_P08b;

   ---------------------
   -- Test_Grille_P08c --
   ---------------------

   function Test_Grille_P08c return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return aUnSuivant (G, c, EST);
   end Test_Grille_P08c;

   ---------------------
   -- Test_Grille_P08d --
   ---------------------

   function Test_Grille_P08d return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return aUnSuivant (G, c, OUEST);
   end Test_Grille_P08d;

   ----------------------
   -- Test_Grille_P09a --
   ----------------------

   function Test_Grille_P09a return Boolean is
      G   : Type_Grille;
      c   : Type_CaseHashi;
      s   : Type_CaseHashi;
      Co  : Type_Coordonnee;
      Cos : Type_Coordonnee;
   begin
      G   := ConstruireGrille (3, 3);
      Co  := ConstruireCoordonnees (2, 2);
      c   := ObtenirCase (G, Co);
      s   := obtenirSuivant (G, c, NORD);
      Cos := ObtenirCoordonnee (s);
      return ObtenirLigne (Cos) = 1 and ObtenirColonne (Cos) = 2;
      --       ObtenirLigne (Cos) = ObtenirLigne (Co) and
      --       ObtenirColonne (Cos) = ObtenirColonne (Co) - 1;
   end Test_Grille_P09a;

   ----------------------
   -- Test_Grille_P09b --
   ----------------------

   function Test_Grille_P09b return Boolean is
      G   : Type_Grille;
      c   : Type_CaseHashi;
      s   : Type_CaseHashi;
      Co  : Type_Coordonnee;
      Cos : Type_Coordonnee;
   begin
      G   := ConstruireGrille (3, 3);
      Co  := ConstruireCoordonnees (2, 2);
      c   := ConstruireCase (Co);
      s   := obtenirSuivant (G, c, SUD);
      Cos := ObtenirCoordonnee (s);
      return ObtenirLigne (Cos) = 3 and ObtenirColonne (Cos) = 2;
--        ObtenirLigne (Cos) = ObtenirLigne (Co) and
--        ObtenirColonne (Cos) = ObtenirColonne (Co) + 1;
   end Test_Grille_P09b;

   ----------------------
   -- Test_Grille_P09c --
   ----------------------

   function Test_Grille_P09c return Boolean is
      G   : Type_Grille;
      c   : Type_CaseHashi;
      s   : Type_CaseHashi;
      Co  : Type_Coordonnee;
      Cos : Type_Coordonnee;
   begin
      G   := ConstruireGrille (3, 3);
      Co  := ConstruireCoordonnees (2, 2);
      c   := ConstruireCase (Co);
      s   := obtenirSuivant (G, c, EST);
      Cos := ObtenirCoordonnee (s);
      return ObtenirLigne (Cos) = 2 and ObtenirColonne (Cos) = 3;
--        ObtenirLigne (Cos) = ObtenirLigne (Co) + 1 and
--        ObtenirColonne (Cos) = ObtenirColonne (Co) ;
   end Test_Grille_P09c;

   ----------------------
   -- Test_Grille_P09d --
   ----------------------

   function Test_Grille_P09d return Boolean is
      G   : Type_Grille;
      c   : Type_CaseHashi;
      s   : Type_CaseHashi;
      Co  : Type_Coordonnee;
      Cos : Type_Coordonnee;
   begin
      G   := ConstruireGrille (3, 3);
      Co  := ConstruireCoordonnees (2, 2);
      c   := ConstruireCase (Co);
      s   := obtenirSuivant (G, c, OUEST);
      Cos := ObtenirCoordonnee (s);
      return ObtenirLigne (Cos) = 2 and ObtenirColonne (Cos) = 1;
--        ObtenirLigne (Cos) = ObtenirLigne (Co) - 1 and
--        ObtenirColonne (Cos) = ObtenirColonne (Co) ;
   end Test_Grille_P09d;

   ---------------------
   -- Test_Grille_P10 --
   ---------------------

   function Test_Grille_P10 return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return nbLignes (G) = 3;
   end Test_Grille_P10;

   ---------------------
   -- Test_Grille_P11 --
   ---------------------

   function Test_Grille_P11 return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return nbColonnes (G) = 3;
   end Test_Grille_P11;

   ----------------------
   -- Test_Grille_P12a --
   ----------------------

   function Test_Grille_P12a return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      G := modifierCase (G, C);

      return estGrilleVide (G);
   end Test_Grille_P12a;

   ----------------------
   -- Test_Grille_P12b --
   ----------------------

   function Test_Grille_P12b return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
      I  : Type_Ile;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      I  := ConstruireIle (5);
      c  := modifierIle (c, I);
      G := modifierCase (G, C);

      return not estGrilleVide (G);
   end Test_Grille_P12b;

   ---------------------
   -- Test_Grille_P13 --
   ---------------------

   function Test_Grille_P13 return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
      I  : Type_Ile;
   begin
      G  := ConstruireGrille (3, 3);
      Co := ConstruireCoordonnees (2, 2);
      c  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      I  := ModifierIle(I,1);
      c  := modifierIle (c, I);
      G := modifierCase (G, C);

      return estComplete (G);
   end Test_Grille_P13;

   ---------------------
   -- Test_Grille_P14 --
   ---------------------

   function Test_Grille_P14 return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
      I1 : Type_Ile;
      I2 : Type_Ile;
      Nb : Integer;
   begin
      -- construction de la grille
      G := ConstruireGrille (3, 3);
      -- construction de la 1ere ile
      Co := ConstruireCoordonnees (1, 2);
      c  := ConstruireCase (Co);
      I1 := ConstruireIle (2);
      c  := modifierIle (c, I1);
      G := modifierCase (G, C);

      Nb := nbIle (G);
      -- construction de la 2nd ile
      Co := ConstruireCoordonnees (2, 1);
      c  := ConstruireCase (Co);
      I2 := ConstruireIle (1);
      c  := modifierIle (c, I2);
      G := modifierCase (G, C);

      return nbIle (G) = Nb + 1;
   end Test_Grille_P14;

   ----------------------
   -- Test_Grille_P15a --
   ----------------------

   function Test_Grille_P15a return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
      I1 : Type_Ile;
      I2 : Type_Ile;
      Nb : Integer;
   begin
      -- construction de la grille
      G := ConstruireGrille (3, 3);
      -- construction de la 1ere ile
      Co := ConstruireCoordonnees (1, 2);
      c  := ConstruireCase (Co);
      I1 := ConstruireIle (1);
      I1  := ModifierIle(I1,1);
      c  := modifierIle (c, I1);
      G := modifierCase (G, C);

      Nb := nbIleCompletes (G);
      -- construction de la 2nd ile
      Co := ConstruireCoordonnees (2, 1);
      c  := ConstruireCase (Co);
      I2  := ConstruireIle (1);
      c  := modifierIle (c, I2);
      G := modifierCase (G, C);

      return nbIleCompletes (G) = Nb;
   end Test_Grille_P15a;

   ----------------------
   -- Test_Grille_P15b --
   ----------------------

   function Test_Grille_P15b return Boolean is
      G  : Type_Grille;
      c  : Type_CaseHashi;
      Co : Type_Coordonnee;
      I1 : Type_Ile;
      I2 : Type_Ile;
      Nb : Integer;
   begin
      -- construction de la grille
      G := ConstruireGrille (3, 3);
      -- construction de la 1ere ile
      Co := ConstruireCoordonnees (1, 2);
      c  := ConstruireCase (Co);
      I1 := ConstruireIle (1);
      I1 := ModifierIle(I1,1);
      c  := modifierIle (c, I1);
      G := modifierCase (G, C);

      Nb := nbIleCompletes (G);
      -- construction de la 2nd ile
      Co := ConstruireCoordonnees (2, 1);
      c  := ConstruireCase (Co);
      I2 := ConstruireIle (2);
       I2 := ModifierIle(I2,2);
     c  := modifierIle (c, I2);
      G := modifierCase (G, C);

      return nbIleCompletes (G) = Nb + 1;
   end Test_Grille_P15b;

   ---------------------
   -- Test_Grille_P16 --
   ---------------------

   function Test_Grille_P16 return Boolean is
      G   : Type_Grille;
      c1  : Type_CaseHashi;
      c2  : Type_CaseHashi;
      Co1 : Type_Coordonnee;
      Co2 : Type_Coordonnee;
      I1  : Type_Ile;
      I2  : Type_Ile;
      Nb  : Integer;
   begin
      -- construction de la grille
      G := ConstruireGrille (3, 3);
      -- construction de la 1ere ile
      Co1 := ConstruireCoordonnees (1, 2);
      c1  := ConstruireCase (Co1);
      I1  := ConstruireIle (1);
      I1  := ModifierIle(I1,1);
      c1  := modifierIle (c1, I1);
      G := modifierCase (G, c1);
      Nb := nbIleCompletes (G);
      -- construction de la 2nd ile
      Co2 := ConstruireCoordonnees (2, 1);
      c2  := ConstruireCase (Co2);
      I2  := ConstruireIle (1);
      I2  := ModifierIle(I2,1);
      c2  := modifierIle (c2, I2);
      G := modifierCase (G, c2);
      return
        ObtenirCase (G, Co1) = c1 and ObtenirCase (G, Co2) = c2 and
        estMer
          (ObtenirTypeCase (ObtenirCase (G, ConstruireCoordonnees (1, 1))));
   end Test_Grille_P16;

   ----------------------
   -- Test_Grille_P17 --
   ----------------------

   function Test_Grille_P17 return Boolean is
      G   : Type_Grille;
      Co1 : Type_Coordonnee;
      Co7 : Type_Coordonnee;
      C1  : Type_CaseHashi;
      C7  : Type_CaseHashi;
   begin
      -- construction de la grille
      G   := ConstruireGrilleTest;
      Co1 := ConstruireCoordonnees (3, 1);
      C1  := ObtenirCase (G, Co1);
      Co7 := ConstruireCoordonnees (3, 3);
      C7  := ObtenirCase (G, Co7);
      return
        aUnSuivant (G, C1, NORD) and aUnSuivant (G, C1, SUD) and
        aUnSuivant (G, C1, EST) and not aUnSuivant (G, C1, OUEST) and
        aUnSuivant (G, C7, NORD) and aUnSuivant (G, C7, SUD) and
        aUnSuivant (G, C7, EST) and aUnSuivant (G, C7, OUEST);
   end Test_Grille_P17;

   ----------------------
   -- Test_Grille_P18 --
   ----------------------

   function Test_Grille_P18 return Boolean is
      G      : Type_Grille;
      C1     : Type_CaseHashi;
      C7     : Type_CaseHashi;
      Co1    : Type_Coordonnee;
      Co7    : Type_Coordonnee;
      SuccC1 : Type_CaseHashi;
      Succc7 : Type_CaseHashi;
   begin
      -- construction de la grille
      G := ConstruireGrilleTest;
      -- ile 7
      Co7    := ConstruireCoordonnees (3, 3);
      C7     := ObtenirCase (G, Co7);
      Succc7 := obtenirSuivant (G, C7, OUEST);
      -- île 1
      Co1    := ConstruireCoordonnees (3, 1);
      C1     := ObtenirCase (G, Co1);
      SuccC1 := obtenirSuivant (G, C1, EST);
      return
      --C7 = SuccSuccC1 and C1 = SuccSuccC7;

        C1 = obtenirSuivant (G, Succc7, OUEST) and
        C7 = obtenirSuivant (G, SuccC1, EST);
   end Test_Grille_P18;

   ---------------------------
   -- Test_ile_Exception_1a --
   ---------------------------

   function Test_ile_Exception_1a return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (-1, 10);
      return False;
   exception
      when TAILLE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1a;

   ---------------------------
   -- Test_ile_Exception_1b --
   ---------------------------

   function Test_ile_Exception_1b return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (TAILLE_MAX + 1, 10);
      return False;
   exception
      when TAILLE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1b;

   ---------------------------
   -- Test_ile_Exception_1c --
   ---------------------------

   function Test_ile_Exception_1c return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (10, -1);
      return False;
   exception
      when TAILLE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1c;

   ---------------------------
   -- Test_ile_Exception_1d --
   ---------------------------

   function Test_ile_Exception_1d return Boolean is
      g : Type_Grille;
   begin
      g := ConstruireGrille (10, TAILLE_MAX + 1);
      return False;
   exception
      when TAILLE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1d;

   ---------------------------
   -- Test_ile_Exception_2a --
   ---------------------------

   function Test_ile_Exception_2a return Boolean is
      g  : Type_Grille;
      C  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      g  := ConstruireGrilleTest;
      Co := ConstruireCoordonnees (1, 3);
      C  := ObtenirCase (g, Co);
      C  := obtenirSuivant (g, C, NORD);
      return False;
   exception
      when PAS_DE_SUIVANT =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2a;

   ---------------------------
   -- Test_ile_Exception_2b --
   ---------------------------

   function Test_ile_Exception_2b return Boolean is
      g  : Type_Grille;
      C  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      g  := ConstruireGrilleTest;
      Co := ConstruireCoordonnees (5, 3);
      C  := ObtenirCase (g, Co);
      C  := obtenirSuivant (g, C, SUD);
      return False;
   exception
      when PAS_DE_SUIVANT =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2b;

   ---------------------------
   -- Test_ile_Exception_2c --
   ---------------------------

   function Test_ile_Exception_2c return Boolean is
      g  : Type_Grille;
      C  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      g  := ConstruireGrilleTest;
      Co := ConstruireCoordonnees (3, 5);
      C  := ObtenirCase (g, Co);
      C  := obtenirSuivant (g, C, EST);
      return False;
   exception
      when PAS_DE_SUIVANT =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2c;

   ---------------------------
   -- Test_ile_Exception_2a --
   ---------------------------

   function Test_ile_Exception_2d return Boolean is
      g  : Type_Grille;
      C  : Type_CaseHashi;
      Co : Type_Coordonnee;
   begin
      g  := ConstruireGrilleTest;
      Co := ConstruireCoordonnees (3, 1);
      C  := ObtenirCase (g, Co);
      C  := obtenirSuivant (g, C, OUEST);
      return False;
   exception
      when PAS_DE_SUIVANT =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2d;

end a_tester_Grille;
