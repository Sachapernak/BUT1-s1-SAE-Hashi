with Coordonnee; use Coordonnee;
with Ile;        use Ile;
with Pont;       use Pont;
with TypeCase;   use TypeCase;

package CaseHashi is

   type Type_CaseHashi is private;

   TYPE_INCOMPATIBLE : exception;

   -- construit une case dont la valeur est la mer
   function ConstruireCase (C : in Type_Coordonnee) return Type_CaseHashi;

   -- Retourne le type de la case c : MER, ILE ou PONT
   function ObtenirTypeCase (C : in Type_CaseHashi) return Type_TypeCase;

   -- Retourne le type de la case c
   function ObtenirCoordonnee (C : in Type_CaseHashi) return Type_Coordonnee;

   -- Retourne l'ile de la case c nécessite que le type de la case soit ILE
   -- lève l'exception TYPE_INCOMPATIBLE si le type de la case n'est pas une
   -- ile
   function ObtenirIle (C : in Type_CaseHashi) return Type_Ile;

   -- Retourne le pont de la case c nécessite que le type de la case soit
   -- PONT lève l'exception TYPE_INCOMPATIBLE si le type de la case n'est
   -- pas un pont
   function ObtenirPont (C : in Type_CaseHashi) return Type_Pont;

   -- Modifie l'ile i de la case c
   -- nécessite que le type de la case soit ILE
   -- lève l'exception TYPE_INCOMPATIBLE si le type de la case n'est pas une
   -- ile
   function modifierIle
     (C : in Type_CaseHashi; I : in Type_Ile) return Type_CaseHashi;

   -- Modifie le pont p de la case
   -- Si le pont est dejà de valeur UN, alors il prend la valeur DEUX
   -- c nécessite que le type de la case soit PONT
   -- lève l'exception TYPE_INCOMPATIBLE si le type de la case n'est
   -- pas un pont
   function modifierPont
     (C : in Type_CaseHashi; p : in Type_Pont) return Type_CaseHashi;

   -- retourne VRAI si les cases C1 et C2 sont égales et FAUX sinon
   function "="
     (C1 : in Type_CaseHashi; C2 : in Type_CaseHashi) return Boolean;

private

   type Type_CaseHashi is record
      C : Type_Coordonnee;
      T : Type_TypeCase;
      I : Type_Ile;
      P : Type_Pont;
   end record;

end CaseHashi;
