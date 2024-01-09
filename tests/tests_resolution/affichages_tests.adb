with Ada.Text_IO;           use Ada.Text_IO;
with Grille;                use Grille;
with Affichage;             use Affichage;
with Remplir_Grille_Hashi; use Remplir_Grille_Hashi;

procedure Affichages_Tests is

   g1 : Type_Grille ;
   g2 : Type_Grille ;
   g3 : Type_Grille ;

begin

   ----------------------
   -- Test 1ère grille --
   ----------------------

   Put_Line("****** Grille V1 *****");
   g1 := Construire_Grille_V1;
   AfficherGraphe(G1);
   AfficherGrille(G1);

   ----------------------
   -- Test 2nde grille --
   ----------------------

   Put_Line("****** Grille V2 *****");
   g2 := Construire_Grille_V2;
   AfficherGraphe(G2);
   AfficherGrille(G2);

   ----------------------
   -- Test 3ème grille --
   ----------------------

   Put_Line("****** Grille V3 *****");
   g3 := Construire_Grille_V3;
   AfficherGraphe(G3);
   AfficherGrille(G3);


end Affichages_Tests;
