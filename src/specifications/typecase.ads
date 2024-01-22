package TypeCase is

   type Type_TypeCase is private;

   -- case de type NOEUD
   NOEUD : constant Type_TypeCase;

   -- case de type ARETE
   ARETE : constant Type_TypeCase;

   -- case de type Mer
   MER : constant Type_TypeCase;

   -- retourne la valeur du type de case t
   function ValeurTypeCase (t : in Type_TypeCase) return Integer;

   -- retourne VRAI si t est une NOEUD et FAUX sinon
   function estIle (t : in Type_TypeCase) return Boolean;

   -- retourne VRAI si t est un ARETE et FAUX sinon
   function estPont (t : in Type_TypeCase) return Boolean;

   -- retourne VRAI si t est une MER et FAUX sinon
   function estMer (t : in Type_TypeCase) return Boolean;

private
   type Type_TypeCase is range -1 .. 1;
   MER  : constant Type_TypeCase := -1;
   NOEUD   : constant Type_TypeCase := 0;
   ARETE   : constant Type_TypeCase := 1;
end TypeCase;
