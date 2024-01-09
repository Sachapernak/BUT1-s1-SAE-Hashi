with TypeCase; use TypeCase;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package A_Tester_TypeCase is

   -- tests TAD TypeCase
   function Test_TypeCase_P1 return Boolean; --1
   function Test_TypeCase_P2 return Boolean; --2
   function Test_TypeCase_P3 return Boolean; --3
   function Test_TypeCase_P4 return Boolean; --4
   function Test_TypeCase_P5 return Boolean; --5
   function Test_TypeCase_P6 return Boolean; --6
   function Test_TypeCase_P7 return Boolean; --7
   function Test_TypeCase_P8 return Boolean; --8
   function Test_TypeCase_P9 return Boolean; --9
   function Test_TypeCase_P10 return Boolean; --10
   function Test_TypeCase_P11 return Boolean; --11
   function Test_TypeCase_P12 return Boolean; --12

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     (
        (Test_TypeCase_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 TypeCase")),
      (Test_TypeCase_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 TypeCase")),
      (Test_TypeCase_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 TypeCase")),
        (Test_TypeCase_P4'Access,
       To_Unbounded_String ("echec de la propriete 4 TypeCase")),
      (Test_TypeCase_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 TypeCase")),
      (Test_TypeCase_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 TypeCase")),
        (Test_TypeCase_P7'Access,
       To_Unbounded_String ("echec de la propriete 7 TypeCase")),
      (Test_TypeCase_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 TypeCase")),
      (Test_TypeCase_P9'Access,
       To_Unbounded_String ("echec de la propriete 9 TypeCase")),
        (Test_TypeCase_P10'Access,
       To_Unbounded_String ("echec de la propriete 10 TypeCase")),
      (Test_TypeCase_P11'Access,
       To_Unbounded_String ("echec de la propriete 11 TypeCase")),
      (Test_TypeCase_P12'Access,
       To_Unbounded_String ("echec de la propriete 12 TypeCase"))
      );

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_TypeCase;
