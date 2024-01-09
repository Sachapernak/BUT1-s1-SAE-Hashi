-- BibliothÃÂ¨ques entrÃÂ©es sorties
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
-- with Affichage;           use Affichage;
-- TAD
with CaseHashi;         use CaseHashi;
with TypeCase;        use TypeCase;
with Coordonnee; use Coordonnee;
with Ile ; use Ile;
with Pont ; use Pont;

package body a_tester_CaseHashi is

   -----------------------
   -- Test_CaseHashi_P1 --
   -----------------------

   function Test_CaseHashi_P1 return Boolean is
      c : Type_CaseHashi;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      return EstMer(ObtenirTypeCase (c));
   end Test_CaseHashi_P1;

   -----------------------
   -- Test_CaseHashi_P2 --
   -----------------------

   function Test_CaseHashi_P2 return Boolean is
      c : Type_CaseHashi;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      return ObtenirLigne(ObtenirCoordonnee(C)) = 2 and
        ObtenirColonne(ObtenirCoordonnee(C)) = 5 ;
   end Test_CaseHashi_P2;

   -----------------------
   -- Test_CaseHashi_P3 --
   -----------------------

   function Test_CaseHashi_P3 return Boolean is
      c : Type_CaseHashi;
      I : Type_Ile;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      I := ConstruireIle(6);
      C := ModifierIle(C,i);
      return EstIle(ObtenirTypeCase(C)) ;
   end Test_CaseHashi_P3;

   -----------------------
   -- Test_CaseHashi_P4 --
   -----------------------

   function Test_CaseHashi_P4 return Boolean is
       c : Type_CaseHashi;
      I : Type_Ile;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      I := ConstruireIle(6);
      C := ModifierIle(C,i);
      return ObtenirLigne(ObtenirCoordonnee(C)) = 2 and
        ObtenirColonne(ObtenirCoordonnee(C)) = 5 ;
   end Test_CaseHashi_P4;

   -----------------------
   -- Test_CaseHashi_P5 --
   -----------------------

   function Test_CaseHashi_P5 return Boolean is
      c : Type_CaseHashi;
      I : Type_Ile;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      I := ConstruireIle(6);
      C := ModifierIle(C,i);
      return ObtenirIle(C) = i ;
   end Test_CaseHashi_P5;

   -----------------------
   -- Test_CaseHashi_P6 --
   -----------------------

   function Test_CaseHashi_P6 return Boolean is
      c : Type_CaseHashi;
      p : Type_Pont;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      p := UN;
      C := ModifierPont(C,p);
      return EstPont(ObtenirTypeCase(C)) ;
   end Test_CaseHashi_P6;

   -----------------------
   -- Test_CaseHashi_P7 --
   -----------------------

   function Test_CaseHashi_P7 return Boolean is
     c : Type_CaseHashi;
      p : Type_Pont;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      p := UN;
      C := ModifierPont(C,p);
      return ObtenirLigne(ObtenirCoordonnee(C)) = 2 and
        ObtenirColonne(ObtenirCoordonnee(C)) = 5 ;
   end Test_CaseHashi_P7;

   -----------------------
   -- Test_CaseHashi_P8 --
   -----------------------

   function Test_CaseHashi_P8 return Boolean is
      c : Type_CaseHashi;
      p : Type_Pont;
   begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      p := UN;
      C := ModifierPont(C,p);
      return ObtenirPont(C) = p ;
   end Test_CaseHashi_P8;

   --------------------------------
   -- Test_CaseHashi_Exception_1 --
   --------------------------------

   function Test_CaseHashi_Exception_1 return Boolean is
      c : Type_CaseHashi;
      I : Type_Ile;
    begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      I := ObtenirIle(C);
      return False;
   exception
      when TYPE_INCOMPATIBLE =>
         return True;
      when others =>
         return False;
   end Test_CaseHashi_Exception_1;

   --------------------------------
   -- Test_CaseHashi_Exception_2 --
    --------------------------------

   function Test_CaseHashi_Exception_2 return Boolean is
      c : Type_CaseHashi;
      P : Type_Pont;
    begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      P := ObtenirPont(C);
      return False;
   exception
      when TYPE_INCOMPATIBLE =>
         return True;
      when others =>
         return False;
   end Test_CaseHashi_Exception_2;

    --------------------------------
   -- Test_CaseHashi_Exception_3 --
    --------------------------------

   function Test_CaseHashi_Exception_3 return Boolean is
      c : Type_CaseHashi;
    begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
      C := ModifierPont(C, UN);
      C := ModifierIle(C, ConstruireIle(5));
      return false;
   exception
      when TYPE_INCOMPATIBLE =>
         return True;
      when others =>
         return False;
   end Test_CaseHashi_Exception_3;

   --------------------------------
   -- Test_CaseHashi_Exception_4 --
   --------------------------------

   function Test_CaseHashi_Exception_4 return Boolean is
      c : Type_CaseHashi;
    begin
      c := ConstruireCase (ConstruireCoordonnees(2,5));
     C := ModifierIle(C, ConstruireIle(5));
       C := ModifierPont(C, UN);
      return false;
   exception
      when TYPE_INCOMPATIBLE =>
         return True;
      when others =>
         return False;
   end Test_CaseHashi_Exception_4;


end a_tester_CaseHashi;
