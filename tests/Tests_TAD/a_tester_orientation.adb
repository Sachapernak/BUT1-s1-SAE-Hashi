package body A_Tester_Orientation is

   -----------------------
   -- tests Orientation --
   -----------------------

   -- test NORD
   function Test_Orientation_P1 return Boolean is
   begin
      return (ValeurOrientation (NORD) = -1);
   end Test_Orientation_P1;

   -- test SUD
   function Test_Orientation_P2 return Boolean is
   begin
      return (ValeurOrientation (SUD) = 1);
   end Test_Orientation_P2;

   -- test EST
   function Test_Orientation_P3 return Boolean is
   begin
      return (ValeurOrientation (EST) = -2);
   end Test_Orientation_P3;

  -- test OUEST
   function Test_Orientation_P4 return Boolean is
   begin
      return (ValeurOrientation (OUEST) = 2);
   end Test_Orientation_P4;

    -- test NORD
   function Test_Orientation_P5 return Boolean is
   begin
      return (orientationInverse (NORD) = SUD);
   end Test_Orientation_P5;

   -- test SUD
   function Test_Orientation_P6 return Boolean is
   begin
      return (orientationInverse (SUD) = NORD);
   end Test_Orientation_P6;

   -- test EST
   function Test_Orientation_P7 return Boolean is
   begin
      return (orientationInverse (EST) = OUEST);
   end Test_Orientation_P7;

  -- test OUEST
   function Test_Orientation_P8 return Boolean is
   begin
      return (orientationInverse (OUEST) = EST);
   end Test_Orientation_P8;

end A_Tester_Orientation;
