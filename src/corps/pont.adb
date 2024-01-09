pragma Ada_2012;
package body Pont is

   -------------------
   -- obtenirValeur --
   -------------------

   function obtenirValeur (p : in Type_Pont) return Integer is
   begin
      return integer(p);
   end obtenirValeur;

   ------------------
   -- estPotentiel --
   ------------------

   function estPotentiel (p : in Type_Pont) return Boolean is
   begin
      return p = POTENTIEL or p = UN;
   end estPotentiel;

   ------------------
   -- EstInstancie --
   ------------------

   function EstInstancie (p : in Type_Pont) return Boolean is
   begin
      return p = UN or p = DEUX;
   end EstInstancie;

   ---------
   -- "=" --
   ---------

   function "=" (p1 : in Type_Pont; p2 : in Type_Pont) return Boolean is
   begin
     return obtenirValeur(p1) = obtenirValeur(p2);
   end "=";

end Pont;
