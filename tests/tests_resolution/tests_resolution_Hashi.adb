-- Bilbilothèques d'entrées-sorties
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Affichage;           use Affichage;
-- TAD
with Grille; use Grille;
-- Opérations Hashi
with Remplir_Grille_Hashi; use Remplir_Grille_Hashi;
with Resolution_Hashi;     use Resolution_Hashi;

procedure tests_Resolution_Hashi is

   --------------------------------------------------
   -- Procedure d'affichage du test de la grille g --
   --------------------------------------------------
   procedure test (g : in out Type_Grille; m : in String) is
      Trouve : Boolean;
   begin
      New_Line;
      Put_Line ("******************************************");
      Put_Line (m);
      Put_Line ("******************************************");
      New_Line;
      AfficherGrille (g);
      ResoudreHashi (g, Trouve);
      AfficherResultat(G,Trouve);
      New_Line;
      AfficherGrille (g);
   end test;

   TRACE : Boolean := False;
   V1    : Type_Grille;
   V2    : Type_Grille;
   V3    : Type_Grille;
   V4    : Type_Grille;
   V5    : Type_Grille;
   V6    : Type_Grille;
   V7    : Type_Grille;
   V8    : Type_Grille;

begin

   --------------------------------------
   -- Initialisation de toutes les grilles
   --------------------------------------

   -- On initialise les grilles a des difficultes differentes
   V1 := Construire_Grille_V1;
   V2 := Construire_Grille_V2;
   V3 := Construire_Grille_V3;
   V4 := Construire_Grille_V4;
   V5 := Construire_Grille_V5;
   V6 := Construire_Grille_V6;
   V7 := Construire_Grille_V7;
   V8 := Construire_Grille_V8;

   --------------------------------------
   -- On teste les grilles une par une
   --------------------------------------

   -- On les teste une par une
   test (V1, "***  Hashi très très facile - grille 1 ***");
   test (V2, "***  Hashi très facile      - grille 2 ***");
   test (V3, "***  Hashi facile           - grille 3 ***");
   test (V4, "***  Hashi moins facile     - grille 4 ***");
   test (V5, "***  Hashi moyen            - grille 5 ***");
   test (V6, "***  Hashi dur              - grille 6 ***");
   test (V7, "***  Hashi très dur         - grille 7 ***");
   test (V8, "***  Hashi super dur        - grille 8 ***");

end tests_Resolution_Hashi;
