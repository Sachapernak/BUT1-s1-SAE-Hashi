with Pont; use Pont;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package A_Tester_Pont is

   -- tests TAD Pont
   function Test_Pont_P1 return Boolean; --1
   function Test_Pont_P2 return Boolean; --2
   function Test_Pont_P3 return Boolean; --3
   function Test_Pont_P4 return Boolean; --4
   function Test_Pont_P5 return Boolean; --5
   function Test_Pont_P6 return Boolean; --6
   function Test_Pont_P7 return Boolean; --7
    function Test_Pont_P8 return Boolean; --8
   function Test_Pont_P9 return Boolean; --9
   function Test_Pont_P10a return Boolean; --10
   function Test_Pont_P10b return Boolean; --11
   function Test_Pont_P10c return Boolean; --12
   function Test_Pont_P10d return Boolean; --13
   function Test_Pont_P10e return Boolean; --14
   function Test_Pont_P10f return Boolean; --15
   function Test_Pont_P10g return Boolean; --16
   function Test_Pont_P10h return Boolean; --17
   function Test_Pont_P10i return Boolean; --18

--   function Test_Pont_Exception return Boolean; --24

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_Pont_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 Pont")),
      (Test_Pont_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 Pont")),
      (Test_Pont_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 Pont")),
      (Test_Pont_P4'Access,
      To_Unbounded_String ("echec de la propriete 4 Pont")),
     (Test_Pont_P5'Access,
       To_Unbounded_String ("echec de la propriete 5 Pont")),
      (Test_Pont_P6'Access,
       To_Unbounded_String ("echec de la propriete 6 Pont")),
     (Test_Pont_P7'Access,
       To_Unbounded_String ("echec de la propriete 7 Pont")),
      (Test_Pont_P8'Access,
       To_Unbounded_String ("echec de la propriete 8 Pont")),
      (Test_Pont_P9'Access,
      To_Unbounded_String ("echec de la propriete 9 Pont")),
      (Test_Pont_P10a'Access,
       To_Unbounded_String ("echec de la propriete 10a Pont (égalité)")),
      (Test_Pont_P10b'Access,
       To_Unbounded_String ("echec de la propriete 10b Pont (égalité)")),
      (Test_Pont_P10c'Access,
       To_Unbounded_String ("echec de la propriete 10c Pont (égalité)")),
      (Test_Pont_P10d'Access,
       To_Unbounded_String ("echec de la propriete 10d Pont (égalité)")),
      (Test_Pont_P10e'Access,
       To_Unbounded_String ("echec de la propriete 10e Pont (égalité)")),
      (Test_Pont_P10f'Access,
       To_Unbounded_String ("echec de la propriete 10f Pont (égalité)")),
      (Test_Pont_P10g'Access,
       To_Unbounded_String ("echec de la propriete 10g Pont (égalité)")),
      (Test_Pont_P10h'Access,
       To_Unbounded_String ("echec de la propriete 10h Pont (égalité)")),
      (Test_Pont_P10i'Access,
       To_Unbounded_String ("echec de la propriete 10i Pont (égalité)"))
     --   (Test_Pont_Exception'Access,
     --    To_Unbounded_String ("echec de la levée d'exception Pont IMPOSSIBLE "))
      );

   Resultats : array (Les_Tests'Range) of Boolean;

end A_Tester_Pont;
