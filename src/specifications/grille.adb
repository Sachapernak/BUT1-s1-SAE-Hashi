pragma Ada_2012;
package body Grille is

   ----------------------
   -- ConstruireGrille --
   ----------------------

   function ConstruireGrille
     (nbl : in integer; nbc : in integer) return Type_Grille
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ConstruireGrille unimplemented");
      return
        raise Program_Error with "Unimplemented function ConstruireGrille";
   end ConstruireGrille;

   --------------
   -- nbLignes --
   --------------

   function nbLignes (g : type_Grille) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "nbLignes unimplemented");
      return raise Program_Error with "Unimplemented function nbLignes";
   end nbLignes;

   ----------------
   -- nbColonnes --
   ----------------

   function nbColonnes (g : type_Grille) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "nbColonnes unimplemented");
      return raise Program_Error with "Unimplemented function nbColonnes";
   end nbColonnes;

   -------------------
   -- estGrilleVide --
   -------------------

   function estGrilleVide (G : in Type_Grille) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "estGrilleVide unimplemented");
      return raise Program_Error with "Unimplemented function estGrilleVide";
   end estGrilleVide;

   -----------------
   -- estComplete --
   -----------------

   function estComplete (G : in Type_Grille) return Boolean is
   begin
      pragma Compile_Time_Warning (Standard.True, "estComplete unimplemented");
      return raise Program_Error with "Unimplemented function estComplete";
   end estComplete;

   -----------
   -- nbIle --
   -----------

   function nbIle (G : in Type_Grille) return Integer is
   begin
      pragma Compile_Time_Warning (Standard.True, "nbIle unimplemented");
      return raise Program_Error with "Unimplemented function nbIle";
   end nbIle;

   --------------------
   -- nbIleCompletes --
   --------------------

   function nbIleCompletes (G : in Type_Grille) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "nbIleCompletes unimplemented");
      return raise Program_Error with "Unimplemented function nbIleCompletes";
   end nbIleCompletes;

   -----------------
   -- ObtenirCase --
   -----------------

   function ObtenirCase
     (G : in Type_Grille; Co : in Type_Coordonnee) return Type_CaseHashi
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "ObtenirCase unimplemented");
      return raise Program_Error with "Unimplemented function ObtenirCase";
   end ObtenirCase;

   ----------------
   -- aUnSuivant --
   ----------------

   function aUnSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Boolean
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "aUnSuivant unimplemented");
      return raise Program_Error with "Unimplemented function aUnSuivant";
   end aUnSuivant;

   --------------------
   -- obtenirSuivant --
   --------------------

   function obtenirSuivant
     (G : in Type_Grille; c : in Type_CaseHashi; o : Type_Orientation)
      return Type_CaseHashi
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "obtenirSuivant unimplemented");
      return raise Program_Error with "Unimplemented function obtenirSuivant";
   end obtenirSuivant;

   ------------------
   -- modifierCase --
   ------------------

   procedure modifierCase (G : in out Type_Grille; c : in Type_CaseHashi) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "modifierCase unimplemented");
      raise Program_Error with "Unimplemented procedure modifierCase";
   end modifierCase;

end Grille;
