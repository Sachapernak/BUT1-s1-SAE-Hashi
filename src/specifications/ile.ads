with Orientation ; use Orientation;
with Pont ; use Pont;


package Ile is

   VALEUR_MAX : constant Integer := 8;
 
   type Type_Ile is private;

   VALEUR_ILE_INVALIDE : exception;
   VALEUR_PONT_INVALIDE : exception;
   PONT_IMPOSSIBLE : exception; 

   -- construit une ile ayant la valeur v
   -- nécessite 0 < v <= 8
   -- lève l'exception VALEUR__INVALIDE si 0 <= v ou v > 8
   function ConstruireIle (v : in Integer ) return Type_Ile;

   -- retourne la valence de l'île i
   function ObtenirValeur (i : in Type_Ile) return Integer;

   -- retourne VRAI si tous les ponts de l'île i sont trouvés 
   -- et FAUX sinon
   function estIleComplete (i : in Type_Ile) return Boolean;
  
   -- modifie l'île i en lui soustrayant la valeur p
   -- nécessite 1 <= p <= 2
   -- nécessite obtenirvaleur(i)-p >= 0
   -- lève l'exception VALEUR_PONT_INVALIDE si p/= UN et p=/DEUX
   -- lève l'exception PONT_IMPOSSIBLE si valeur de l'île - valeur du pont < 0
   function modifierIle (i : in Type_Ile ; p : in Integer) 
		return type_ile;

private
   type Type_Ile is record
      v : Integer; 
   end record;

end Ile;
