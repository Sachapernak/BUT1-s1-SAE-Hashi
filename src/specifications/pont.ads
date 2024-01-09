package Pont is

   type Type_Pont is private;

   -- crée un Arete de valeur UN
   UN : constant Type_Pont;

   -- crée un Arete de valeur DEUX
   DEUX : constant Type_Pont;

   -- crée un Arete de valeur INCONNUE à trouver
   POTENTIEL : constant Type_Pont;

    -- retourne la valeur du Arete c
   function obtenirValeur (p : in Type_Pont) return Integer;

   -- retourne VRAI si la valeur du Arete c est POTENTIEL et FAUX sinon
   function estPotentiel (p : in Type_Pont) return Boolean;

   -- retourne VRAI si l'Arete a la valeur UN ou DEUX
   -- leve l'exception PONT_IMPOSSIBLE si valeur(a)=IMPOSSIBLE
   function EstInstancie (p : in Type_Pont) return Boolean;

   -- retourne VRAI si le Arete c1 est égal au Arc c2
   function "=" (p1 : in Type_Pont; p2 : in Type_Pont) return Boolean;

private
   type Type_Pont is range 0 .. 2;
   POTENTIEL  : constant Type_Pont := 0;
   UN         : constant Type_Pont := 1;
   DEUX       : constant Type_Pont := 2;
end Pont;
