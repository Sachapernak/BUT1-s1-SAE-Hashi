package Orientation is

   type Type_Orientation is private;

   -- crée l'Orientation NORD
   NORD : constant Type_Orientation;

   -- crée l'Orientation SUD
   SUD : constant Type_Orientation;

   -- crée l'Orientation EST
   EST : constant Type_Orientation;

   -- crée l'Orientation OUEST
   OUEST : constant Type_Orientation;

   -- retourne la valeur du Orientation c
   function ValeurOrientation (o : in Type_Orientation) return Integer;

   -- retourne l'orientation inverse de l'orientation o
   -- NORD et SUD sont inverses
   -- EST et OUEST sont inverses
   function orientationInverse (o : in Type_Orientation) return Type_Orientation;

private
   type Type_Orientation is range -2 .. 2;
   NORD  : constant Type_Orientation := -1;
   SUD   : constant Type_Orientation := 1;
   EST   : constant Type_Orientation := -2;
   OUEST : constant Type_Orientation := 2;
end Orientation;
