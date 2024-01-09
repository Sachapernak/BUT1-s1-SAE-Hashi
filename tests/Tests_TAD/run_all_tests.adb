with Run_Tests_Coordonnees;
with Run_Tests_Orientation;
with Run_Tests_Iles;
with Run_Tests_Ponts;
with Run_Tests_Grille;
with tests_Resolution_Hashi;
with run_Tests_TypeCase;
with Run_Tests_CaseHashi;
-- Entrées Sorties
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Run_All_Tests is
begin
   New_Line;
   Put_Line ("Test TAD Coordonnées ");
   Run_Tests_Coordonnees;
   New_Line;
   Put_Line ("Test TAD Orientation ");
   Run_Tests_Orientation;
    New_Line;
   Put_Line ("Test TAD TypeCase ");
   Run_Tests_TypeCase;
   New_Line;
   Put_Line ("Test TAD Ile ");
   Run_Tests_Iles;
   New_Line;
   Put_Line ("Test TAD Pont ");
   Run_Tests_Ponts;
   New_Line;
   Put_Line ("Test TAD CaseHashi ");
   Run_Tests_CaseHashi;
   New_Line;
   Put_Line ("Test TAD Grille ");
   Run_Tests_Grille;
   New_Line;
   Put_Line ("Résolution des grilles ");
   Tests_resolution_Hashi;

end Run_All_Tests;
