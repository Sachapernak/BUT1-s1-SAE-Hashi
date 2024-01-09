package body A_Tester_Pont is

   -----------------------
   -- tests Pont --
   -----------------------

   -- test POTENTIEL
   function Test_Pont_P1 return Boolean is
   begin
      return (obtenirValeur (POTENTIEL) = 0);
   end Test_Pont_P1;

   -- test DEUX
   function Test_Pont_P2 return Boolean is
   begin
      return (obtenirValeur (UN) = 1);
   end Test_Pont_P2;

   -- test UN
   function Test_Pont_P3 return Boolean is
   begin
      return (obtenirValeur (DEUX) = 2);
   end Test_Pont_P3;

   -- test est_POTENTIEL
   function Test_Pont_P4 return Boolean is
   begin
      return estPotentiel (POTENTIEL);
   end Test_Pont_P4;

   -- test est_POTENTIEL
   function Test_Pont_P5 return Boolean is
   begin
      return estPotentiel (UN);
   end Test_Pont_P5;

   -- test est_POTENTIEL
   function Test_Pont_P6 return Boolean is
   begin
      return not estPotentiel (DEUX);
   end Test_Pont_P6;

   -- test est_instancié
   function Test_Pont_P7 return Boolean is
   begin
      return not EstInstancie (POTENTIEL);
   end Test_Pont_P7;

   -- test est_POTENTIEL
   function Test_Pont_P8 return Boolean is
   begin
      return EstInstancie (UN);
   end Test_Pont_P8;

   -- test est_POTENTIEL
   function Test_Pont_P9 return Boolean is
   begin
      return EstInstancie (DEUX);
   end Test_Pont_P9;

   -- Test égalité
   function Test_Pont_P10a return Boolean is
   begin
      return DEUX = DEUX;
   end Test_Pont_P10a;

   function Test_Pont_P10b return Boolean is
   begin
      return UN = UN;
   end Test_Pont_P10b;

   function Test_Pont_P10c return Boolean is
   begin
      return POTENTIEL = POTENTIEL;
   end Test_Pont_P10c;

   function Test_Pont_P10d return Boolean is
   begin
      return not (DEUX = UN);
   end Test_Pont_P10d;

   function Test_Pont_P10e return Boolean is
   begin
      return not (DEUX = POTENTIEL);
   end Test_Pont_P10e;

   function Test_Pont_P10f return Boolean is
   begin
      return not (UN = DEUX);
   end Test_Pont_P10f;

   function Test_Pont_P10g return Boolean is
   begin
      return not (UN = POTENTIEL);
   end Test_Pont_P10g;

   function Test_Pont_P10h return Boolean is
   begin
      return not (POTENTIEL = DEUX);
   end Test_Pont_P10h;

   function Test_Pont_P10i return Boolean is
   begin
      return not (POTENTIEL = UN);
   end Test_Pont_P10i;

   ----------------------------
   -- Test_Pont_Exception_ --
   ----------------------------

   --  function Test_Pont_Exception return Boolean is
   --  begin
   --     return EstInstancie (IMPOSSIBLE);
   --  exception
   --     when Pont_IMPOSSIBLE =>
   --        return True;
   --     when others =>
   --        return False;
   --  end Test_Pont_Exception;

end A_Tester_Pont;
