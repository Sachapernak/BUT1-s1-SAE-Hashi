pragma Ada_2012;
package body Resolution_Hashi is

   ---------------------------
   -- rechercherUneIleCible --
   ---------------------------

   procedure rechercherUneIleCible
     (G      : in Type_Grille; C : in Type_CaseHashi; O : in Type_Orientation;
      Trouve :    out Boolean; ile : out Type_CaseHashi)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "rechercherUneIleCible unimplemented");
      raise Program_Error with "Unimplemented procedure rechercherUneIleCible";
   end rechercherUneIleCible;

   ----------------------------------
   -- construireTableauSuccesseurs --
   ----------------------------------

   procedure construireTableauSuccesseurs
     (G : in     Type_Grille; C : Type_CaseHashi; s : out Type_Tab_Successeurs;
      NbPonts :    out Integer; NbNoeuds : out Integer)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "construireTableauSuccesseurs unimplemented");
      raise Program_Error
        with "Unimplemented procedure construireTableauSuccesseurs";
   end construireTableauSuccesseurs;

   ------------------------
   -- construireLeChemin --
   ------------------------

   procedure construireLeChemin
     (G     : in out Type_Grille; source : in out Type_CaseHashi;
      cible : in out Type_CaseHashi; pont : in Type_Pont;
      o     : in     Type_Orientation)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "construireLeChemin unimplemented");
      raise Program_Error with "Unimplemented procedure construireLeChemin";
   end construireLeChemin;

   -------------------
   -- ResoudreHashi --
   -------------------

   procedure ResoudreHashi (G : in out Type_Grille; Trouve : out Boolean) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "ResoudreHashi unimplemented");
      raise Program_Error with "Unimplemented procedure ResoudreHashi";
   end ResoudreHashi;

end Resolution_Hashi;
