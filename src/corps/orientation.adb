pragma Ada_2012;
package body Orientation is

   -----------------------
   -- ValeurOrientation --
   -----------------------

   function ValeurOrientation (o : in Type_Orientation) return Integer is
   begin
      if o = NORD then
         return -1;
      elsif o = SUD then
         return 1;
      elsif o = OUEST then
         return 2;
      else
         return -2;
      end if;
   end ValeurOrientation;

   ------------------------
   -- orientationInverse --
   ------------------------

   function orientationInverse
     (o : in Type_Orientation) return Type_Orientation
   is
   begin
      if o = NORD then
         return SUD;
      elsif o = SUD then
         return NORD;
      elsif o = OUEST then
         return EST;
      else
         return OUEST;
      end if;
   end orientationInverse;

end Orientation;
