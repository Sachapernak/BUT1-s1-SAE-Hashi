with Grille;     use Grille;
with Pont ; use Pont;
with CaseHashi; use CaseHashi;
with Orientation; use Orientation;

package Resolution_Hashi is

   --type Type_Tab_Successeurs is private;
    type Type_Tab_Successeurs is record
      NORD : Type_CaseHashi;
      SUD : Type_CaseHashi;
      EST : Type_CaseHashi;
      OUEST : Type_CaseHashi;
    end record;

   N_EST_PAS_UNE_ILE : exception ;
   PAS_D_ILE_CIBLE : exception ;

   -- retourne trouvé à VRAI si il existe une île non complète
   -- qui succède à la case c de grille g pour l'orientation o
   -- si l'ile a été trouvée, alors ile est la case trouvée
   -- Trouvé est à FAUX si la case c n'a pas de suivant
   -- Trouvé est à FAUX si la case c a comme successeurs
   -- -- uniquement des cases MER OU
   -- -- une ile complete OU
   -- -- un ou plusieurs pont de valeur 2 OU
   -- -- un pont de valeur 1 précédé ou suivi de mer
   -- necessite c est une ile
   -- leve l'exception N_EST_PAS_UNE_ILE si c est une mer ou un pont
   procedure rechercherUneIleCible
     (G : in Type_Grille; C : in Type_CaseHashi; O : in Type_Orientation ;
      Trouve : out Boolean ; ile : out Type_CaseHashi);

   -- construit le tableau des succeseurs de la case c du graphe G
   -- si la case n'a pas de successeur dans une direction, la case
   -- retournée est une Mer de coodonnées (0,0)
   -- nbPont est le nombre de ponts successeurs potentiels
   -- nbNoeud est le nombre de noeuds successeurs potentiels
   procedure construireTableauSuccesseurs
     (G : in     Type_Grille; C : Type_CaseHashi; s : out Type_Tab_Successeurs;
      NbPonts :    out Integer; NbNoeuds : out Integer);

   -- modifie le graĥe g en inscrivant des ponts de valeur pont
   -- entre la case source et la case cible
   -- en suivant l'orientation o
   procedure construireLeChemin
     (G     : in out Type_Grille; source : in out Type_CaseHashi;
      cible : in out Type_CaseHashi; pont : in Type_Pont;
      o     : in     Type_Orientation);

   -- Résoud la grille g de Hashi
   -- Si tous les noeuds sont complets alors Trouve est a VRAI
   -- trouver est à FAUX sinon
   procedure ResoudreHashi (G : in out Type_Grille; Trouve : out Boolean);

--  private
--     type Type_Tab_Successeurs is record
--        NORD : Type_CaseHashi;
--        SUD : Type_CaseHashi;
--        EST : Type_CaseHashi;
--        OUEST : Type_CaseHashi;
--      end record;

end Resolution_Hashi;
