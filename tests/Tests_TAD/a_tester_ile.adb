-- BibliothÃÂ¨ques entrÃÂ©es sorties
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
--with Affichage;           use Affichage;
-- TAD
with ile;         use Ile;
with Pont;        use Pont;
with Orientation; use Orientation;

package body a_tester_ile is

   -----------------
   -- Test_ile_P1 --
   -----------------

   function Test_ile_P1 return Boolean is
      I : Type_Ile;
   begin
      I := ConstruireIle (5);
      return ObtenirValeur (I) = 5;
   end Test_ile_P1;

   -----------------
   -- Test_ile_P2 --
   -----------------

   function Test_ile_P2 return Boolean is
      I : Type_Ile;
   begin
      I := ConstruireIle (5);
      return not EstIleComplete(I);
   end Test_ile_P2;

   -----------------
   -- Test_ile_P3 --
   -----------------

   function Test_ile_P3 return Boolean is
      I : Type_Ile;
   begin
      I := ConstruireIle (5);
      I := ModifierIle(I,2);
      return ObtenirValeur(I) = 3;
   end Test_ile_P3;

   -----------------
   -- Test_ile_P4a --
   -----------------

   function Test_ile_P4a return Boolean is
       I : Type_Ile;
   begin
     I := ConstruireIle (3);
      I := ModifierIle(I,2);
      return not EstIleComplete(I);
   end Test_ile_P4a;

   -----------------
   -- Test_ile_P4b --
   -----------------

   function Test_ile_P4b return Boolean is
       I : Type_Ile;
   begin
     I := ConstruireIle (2);
      I := ModifierIle(I,2);
      return EstIleComplete(I);
   end Test_ile_P4b;

   --------------------------
   -- Test_ile_Exception_1a --
   --------------------------

   function Test_ile_Exception_1a return Boolean is
      i : Type_Ile;
   begin
      i := ConstruireIle (10);
      return False;
   exception
      when VALEUR_ILE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1a;

   --------------------------
   -- Test_ile_Exception_1a --
   --------------------------

   function Test_ile_Exception_1b return Boolean is
      i : Type_Ile;
   begin
      i := ConstruireIle (-10);
      return False;
   exception
      when VALEUR_ILE_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_1b;

   --------------------------
   -- Test_ile_Exception_2a --
   --------------------------

   function Test_ile_Exception_2a return Boolean is
      i : Type_Ile;
   begin
      i := ConstruireIle (6);
      I := ModifierIle(I,0);
      return False;
   exception
      when VALEUR_PONT_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2a;

   --------------------------
   -- Test_ile_Exception_2a --
   --------------------------

   function Test_ile_Exception_2b return Boolean is
      i : Type_Ile;
   begin
      i := ConstruireIle (6);
      I := ModifierIle(I,3);
      return False;
   exception
      when VALEUR_PONT_INVALIDE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_2b;

   --------------------------
   -- Test_ile_Exception_3 --
   --------------------------

   function Test_ile_Exception_3 return Boolean is
      i : Type_Ile;
   begin
      i := ConstruireIle (1);
      I := ModifierIle(I,2);
      return False;
   exception
      when PONT_IMPOSSIBLE =>
         return True;
      when others =>
         return False;
   end Test_ile_Exception_3;


end a_tester_ile;
