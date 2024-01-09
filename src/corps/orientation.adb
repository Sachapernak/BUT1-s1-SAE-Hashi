pragma Ada_2012;
package body Orientation is

   -----------------------
   -- ValeurOrientation --
   -----------------------

   function ValeurOrientation (o : in Type_Orientation) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ValeurOrientation unimplemented");
      return
        raise Program_Error with "Unimplemented function ValeurOrientation";
   end ValeurOrientation;

   ------------------------
   -- orientationInverse --
   ------------------------

   function orientationInverse
     (o : in Type_Orientation) return Type_Orientation
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "orientationInverse unimplemented");
      return
        raise Program_Error with "Unimplemented function orientationInverse";
   end orientationInverse;

end Orientation;
