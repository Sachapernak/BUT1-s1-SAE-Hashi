with Orientation; use Orientation;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package A_Tester_Orientation is

   -- tests TAD Orientation
   function Test_Orientation_P1 return Boolean; --1
   function Test_Orientation_P2 return Boolean; --2
   function Test_Orientation_P3 return Boolean; --3
   function Test_Orientation_P4 return Boolean; --4
   function Test_Orientation_P5 return Boolean; --1
   function Test_Orientation_P6 return Boolean; --2
   function Test_Orientation_P7 return Boolean; --3
   function Test_Orientation_P8 return Boolean; --4

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_Orientation_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Orientation")),
      (Test_Orientation_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Orientation")),
      (Test_Orientation_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Orientation")),
      (Test_Orientation_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 Orientation")),
      (Test_Orientation_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 Orientation")),
      (Test_Orientation_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Orientation")),
      (Test_Orientation_P7'Access,
       To_Unbounded_String ("echec de la propriete 7 Orientation")),
      (Test_Orientation_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Orientation"))
      );

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_Orientation;
