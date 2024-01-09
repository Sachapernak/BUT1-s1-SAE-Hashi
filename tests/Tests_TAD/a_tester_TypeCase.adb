package body A_Tester_TypeCase is

   -----------------------
   -- tests TypeCase --
   -----------------------

   -- test NOEUD
   function Test_TypeCase_P1 return Boolean is
   begin
      return (ValeurTypeCase (NOEUD) = 0);
   end Test_TypeCase_P1;

   -- test ARETE
   function Test_TypeCase_P2 return Boolean is
   begin
      return (ValeurTypeCase (ARETE) = 1);
   end Test_TypeCase_P2;

   -- test MER
   function Test_TypeCase_P3 return Boolean is
   begin
      return (ValeurTypeCase (MER) = -1);
   end Test_TypeCase_P3;

   -- test estIle
   function Test_TypeCase_P4 return Boolean is
   begin
      return estIle (NOEUD);
   end Test_TypeCase_P4;

   -- test estIle
   function Test_TypeCase_P5 return Boolean is
   begin
      return not estIle (ARETE);
   end Test_TypeCase_P5;

   -- test estIle
   function Test_TypeCase_P6 return Boolean is
   begin
      return not estIle (MER);
   end Test_TypeCase_P6;

   -- test estPont
   function Test_TypeCase_P7 return Boolean is
   begin
      return not estPont (NOEUD);
   end Test_TypeCase_P7;

   -- test estPont
   function Test_TypeCase_P8 return Boolean is
   begin
      return  estPont (ARETE);
   end Test_TypeCase_P8;

   -- test estPont
   function Test_TypeCase_P9 return Boolean is
   begin
      return not estPont (MER);
   end Test_TypeCase_P9;

   -- test estMer
   function Test_TypeCase_P10 return Boolean is
   begin
      return not estMer (NOEUD);
   end Test_TypeCase_P10;

   -- test estMer
   function Test_TypeCase_P11 return Boolean is
   begin
      return not estMer (ARETE);
   end Test_TypeCase_P11;

   -- test estMer
   function Test_TypeCase_P12 return Boolean is
   begin
      return estMer (MER);
   end Test_TypeCase_P12;

end A_Tester_TypeCase;
