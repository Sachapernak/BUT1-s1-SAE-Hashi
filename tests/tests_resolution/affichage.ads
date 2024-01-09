with Coordonnee; use Coordonnee;
with Grille;     use Grille;
with Pont ; use Pont;
with Orientation ; use Orientation;
with Ile ; use Ile;
with TypeCase ; use TypeCase;
with CaseHashi; use CaseHashi;
with Resolution_Hashi ; use Resolution_Hashi;

package Affichage is

   NB_POSITIONS : constant Integer := 5;
   NUL          : constant Integer := 0;

   -- affiche la valeur de l'Pont a sur NB_POSITIONS
   procedure AfficherPont (a : in Type_Pont; Sens : in Character);

   -- affiche la valeur de l'orientation o sur NB_POSITIONS
   procedure AfficherOrientation (o : in Type_Orientation);

      --affiche la coordonnées
   procedure AfficherCoordonnee (C : in Type_Coordonnee);

   --affiche le Ile n
   procedure AfficherIle (n : in Type_Ile);

   --affiche la case c de la grille g
   procedure AfficherTypeCase (t : Type_TypeCase);

   --affiche la case c de la grille g
   procedure AfficherCase (c : Type_CaseHashi);

   --affiche la grille g
   procedure AfficherGrille (g : Type_Grille);

   --  affiche le graphe
   procedure AfficherTableauSuccesseurs (G : in Type_Grille ;
                                         C : in Type_CaseHashi ;
                                         S : in Type_Tab_Successeurs;
                                         NbPonts : in Integer;
                                        NbNoeuds : in Integer);

   -- affiche le resultat
   procedure AfficherResultat
  (G : in Type_Grille; Trouve : in Boolean);

end Affichage;
