with Coordonnee; use Coordonnee;
-- bibliothèque de gestion de chaînes de caractères
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
-- types utilisés pour les tests
with Types_Tests; use Types_Tests;

package a_tester_Grille is

   -- tests TAD Grille
   function Test_Grille_P01 return Boolean; --1
   function Test_Grille_P02 return Boolean; --2
   function Test_Grille_P03 return Boolean; --3
   function Test_Grille_P04 return Boolean; --4
   function Test_Grille_P05 return Boolean; --5
   function Test_Grille_P06 return Boolean; --6
   function Test_Grille_P07 return Boolean; --7
   function Test_Grille_P08a return Boolean; --8
   function Test_Grille_P08b return Boolean; --9
   function Test_Grille_P08c return Boolean; --10
   function Test_Grille_P08d return Boolean; --11
   function Test_Grille_P09a return Boolean; --12
   function Test_Grille_P09b return Boolean; --13
   function Test_Grille_P09c return Boolean; --14
   function Test_Grille_P09d return Boolean; --15

   function Test_Grille_P10 return Boolean; --16
   function Test_Grille_P11 return Boolean; --17
   function Test_Grille_P12a return Boolean; --18
   function Test_Grille_P12b return Boolean; --19
   function Test_Grille_P13 return Boolean; --20
   function Test_Grille_P14 return Boolean; --21
   function Test_Grille_P15a return Boolean; --22
   function Test_Grille_P15b return Boolean; --23
   function Test_Grille_P16 return Boolean; --24
   function Test_Grille_P17 return Boolean; --25
   function Test_Grille_P18 return Boolean; --26

   function Test_ile_Exception_1a return Boolean; --27
   function Test_ile_Exception_1b return Boolean; --28
   function Test_ile_Exception_1c return Boolean; --29
   function Test_ile_Exception_1d return Boolean; --30
   function Test_ile_Exception_2a return Boolean; --31
   function Test_ile_Exception_2b return Boolean; --32
   function Test_ile_Exception_2c return Boolean; --33
   function Test_ile_Exception_2d return Boolean; --34

   Les_Tests : constant array (Positive range <>) of Test_Unitaire :=
     ((Test_Grille_P01'Access,
       To_Unbounded_String ("echec de la propriete 1 Grille")),
      (Test_Grille_P02'Access,
       To_Unbounded_String ("echec de la propriete 2 Grille")),
      (Test_Grille_P03'Access,
       To_Unbounded_String ("echec de la propriete 3 Grille")),
      (Test_Grille_P04'Access,
       To_Unbounded_String ("echec de la propriete 4 Grille")),
      (Test_Grille_P05'Access,
       To_Unbounded_String ("echec de la propriete 5a Grille")),
      (Test_Grille_P06'Access,
       To_Unbounded_String ("echec de la propriete 6 Grille")),
      (Test_Grille_P07'Access,
       To_Unbounded_String ("echec de la propriete 7 Grille")),
      (Test_Grille_P08a'Access,
       To_Unbounded_String ("echec de la propriete 8a Grille")),
      (Test_Grille_P08b'Access,
       To_Unbounded_String ("echec de la propriete 8b Grille")),
      (Test_Grille_P08c'Access,
       To_Unbounded_String ("echec de la propriete 8c Grille")),
      (Test_Grille_P08d'Access,
       To_Unbounded_String ("echec de la propriete 8d Grille")),
      (Test_Grille_P09a'Access,
       To_Unbounded_String ("echec de la propriete 9a Grille")),
      (Test_Grille_P09b'Access,
       To_Unbounded_String ("echec de la propriete 9b Grille")),
      (Test_Grille_P09c'Access,
       To_Unbounded_String ("echec de la propriete 9c Grille")),
      (Test_Grille_P09d'Access,
       To_Unbounded_String ("echec de la propriete 9d Grille")),
      (Test_Grille_P10'Access,
       To_Unbounded_String ("echec de la propriete 10 Grille")),
      (Test_Grille_P11'Access,
       To_Unbounded_String ("echec de la propriete 11a Grille")),
      (Test_Grille_P12a'Access,
       To_Unbounded_String ("echec de la propriete 12a Grille")),
      (Test_Grille_P12b'Access,
       To_Unbounded_String ("echec de la propriete 12b Grille")),
      (Test_Grille_P13'Access,
       To_Unbounded_String ("echec de la propriete 13 Grille")),
      (Test_Grille_P14'Access,
       To_Unbounded_String ("echec de la propriete 14 Grille")),
      (Test_Grille_P15a'Access,
       To_Unbounded_String ("echec de la propriete 15a Grille")),
      (Test_Grille_P15b'Access,
       To_Unbounded_String ("echec de la propriete 15b Grille")),
      (Test_Grille_P16'Access,
       To_Unbounded_String ("echec de la propriete 16 Grille")),
      (Test_Grille_P17'Access,
       To_Unbounded_String ("echec de la propriete 17 Grille")),
      (Test_Grille_P18'Access,
       To_Unbounded_String ("echec de la propriete 18 Grille")),
      (Test_ile_Exception_1a'Access,
       To_Unbounded_String ("echec de l'exception 1a Grille")),
      (Test_ile_Exception_1b'Access,
       To_Unbounded_String ("echec de l'exception 1b Grille")),
      (Test_ile_Exception_1c'Access,
       To_Unbounded_String ("echec de l'exception 1c Grille")),
      (Test_ile_Exception_1d'Access,
       To_Unbounded_String ("echec de l'exception 1d Grille")),
      (Test_ile_Exception_2a'Access,
       To_Unbounded_String ("echec de l'exception 2a Grille")),
      (Test_ile_Exception_2b'Access,
       To_Unbounded_String ("echec de l'exception 2b Grille")),
      (Test_ile_Exception_2c'Access,
       To_Unbounded_String ("echec de l'exception 2c Grille")),
      (Test_ile_Exception_2d'Access,
       To_Unbounded_String ("echec de l'exception 2d Grille")));

   Resultats : array (Les_Tests'Range) of Boolean;

end a_tester_Grille;
