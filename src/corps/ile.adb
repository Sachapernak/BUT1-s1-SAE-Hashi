pragma Ada_2012;
package body Ile is

   -------------------
   -- ConstruireIle --
   -------------------

   function ConstruireIle (v : in Integer) return Type_Ile is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ConstruireIle unimplemented");
      return raise Program_Error with "Unimplemented function ConstruireIle";
   end ConstruireIle;

   -------------------
   -- ObtenirValeur --
   -------------------

   function ObtenirValeur (i : in Type_Ile) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ObtenirValeur unimplemented");
      return raise Program_Error with "Unimplemented function ObtenirValeur";
   end ObtenirValeur;

   --------------------
   -- estIleComplete --
   --------------------

   function estIleComplete (i : in Type_Ile) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "estIleComplete unimplemented");
      return raise Program_Error with "Unimplemented function estIleComplete";
   end estIleComplete;

   -----------------
   -- modifierIle --
   -----------------

   function modifierIle (i : in Type_Ile; p : in Integer) return type_ile is
   begin
      pragma Compile_Time_Warning (Standard.True, "modifierIle unimplemented");
      return raise Program_Error with "Unimplemented function modifierIle";
   end modifierIle;

end Ile;
