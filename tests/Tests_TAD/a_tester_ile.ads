with ile; use ile;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package a_tester_ile is

   -- tests TAD ile
   function Test_ile_P1 return Boolean; --1
   function Test_ile_P2 return Boolean; --2
   function Test_ile_P3 return Boolean; --3
   function Test_ile_P4a return Boolean; --4
   function Test_ile_P4b return Boolean; --5
   function Test_ile_Exception_1a return Boolean; --6
   function Test_ile_Exception_1b return Boolean; --7
   function Test_ile_Exception_2a return Boolean; --8
   function Test_ile_Exception_2b return Boolean; --9
   function Test_ile_Exception_3 return Boolean; --10

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_ile_P1'Access,
       To_Unbounded_String ("echec de la propriete 1 ile")),
      (Test_ile_P2'Access,
       To_Unbounded_String ("echec de la propriete 2 ile")),
      (Test_ile_P3'Access,
       To_Unbounded_String ("echec de la propriete 3 ile")),
      (Test_ile_P4a'Access,
       To_Unbounded_String ("echec de la propriete 4a ile")),
      (Test_ile_P4b'Access,
       To_Unbounded_String ("echec de la propriete 4b ile")),
      (Test_ile_Exception_1a'Access,
       To_Unbounded_String ("echec de l'exception 1a Ile")),
      (Test_ile_Exception_1b'Access,
       To_Unbounded_String ("echec de l'exception 1b Ile")),
      (Test_ile_Exception_2a'Access,
       To_Unbounded_String ("echec de l'exception 2a Ile")),
      (Test_ile_Exception_2b'Access,
       To_Unbounded_String ("echec de l'exception 2b Ile")),
      (Test_ile_Exception_3'Access,
       To_Unbounded_String ("echec de l'exception 3 Ile")));

   Resultats : array (Les_Tests'Range) of Boolean;

end a_tester_ile;
