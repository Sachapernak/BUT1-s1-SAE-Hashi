-- TAD
with Ile;       use Ile;
with Orientation; use Orientation;
with CaseHashi ; use CaseHashi;
with Coordonnee ; use Coordonnee;
with TypeCase ; use TypeCase;

package Grille is

   type Type_Grille is private;
   
   TAILLE_MAX : constant Integer := 100;

   TAILLE_INVALIDE : exception;
   PAS_DE_SUIVANT : exception;

   -- cree une grille vide de nbl lignes et nbc colonne
   -- necessite 1< nbl <= TAILLEMAX 
   -- necessite 1< nbc <= TAILLEMAX 
   -- leve l'exception TAILLE_INVALIDE si nbl<1 ou nbl>TAILLE_MAX
   -- leve l'exception TAILLE_INVALIDE si nbc<1 ou nbl>TAILLE_MAX
   function ConstruireGrille (nbl : in integer ; nbc : in integer) return Type_Grille;

   -- retourne le nombre de lignes de la grille g
   function nbLignes (g : type_Grille) return Integer;

   -- retourne le nombre de colonnes de la grille g
   function nbColonnes (g : type_Grille) return Integer;

  -- retourne VRAI si la grille g ne contient aucune ile et FAUX sinon
   function estGrilleVide (G : in Type_Grille) return Boolean;

  -- retourne VRAI si tous les Iles de la grille g sont complets FAUX sinon
   function estComplete (G : in Type_Grille) return Boolean;

   -- retourne le nombre d'île de la grille g
   function nbIle (G : in Type_Grille) return Integer;

   -- retourne le nombre d'îles completes de la grille g
   function nbIleCompletes (G : in Type_Grille) return Integer;

   -- retourne le nombre d'île de la grille g
   --function nbPonts (G : in Type_Grille) return Integer;

   -- retourne le nombre d'îles completes de la grille g
   --function nbPontsPotentiels (G : in Type_Grille) return Integer;
   
   -- retourne la case qui se trouve à la coordonnée c de la grille g
   function ObtenirCase (G : in Type_Grille ; Co : in Type_Coordonnee) 
     return Type_CaseHashi;

   -- retourne VRAI la case c de la grille g a un successeur
   -- pour l'orientation o et FAUX sinon 
   function aUnSuivant
     (G : in Type_Grille; c : in Type_CaseHashi ; o : Type_Orientation) 
      return Boolean;

   -- retourne la case qui succède à la case c de la grille g
   -- pour l'orientation o 
   -- nécessite c a un successeur dans g pour l'orientation o
   -- lève l'exception PAS_DE_SUIVANT si c n'a pas de successeur
   function obtenirSuivant
     (G : in Type_Grille; c : in Type_CaseHashi ; o : Type_Orientation) 
      return Type_CaseHashi;
	  
   -- modifie la case c de la grille g 
   function modifierCase
      (G   : in Type_Grille; c : in Type_CaseHashi) return Type_Grille;

private

   type Type_Tableau_Grille is array (1 .. TAILLE_MAX , 1 .. TAILLE_MAX) 
     of Type_CaseHashi;

   type Type_Grille is record
      g  : Type_Tableau_Grille;
      nbl : Integer;
      nbc : Integer;
   end record;

end Grille;
