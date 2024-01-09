pragma Ada_2012;
package body CaseHashi is

   --------------------
   -- ConstruireCase --
   --------------------
   
   function ConstruireCase(C: in Type_Coordonnee) return Type_CaseHashi is
      ca : Type_CaseHashi;
   begin
      ca.C := C;
      ca.T := MER;
      return ca;
   end ConstruireCase;

   ---------------------
   -- ObtenirTypeCase --
   ---------------------
   
   function ObtenirTypeCase(C: in Type_CaseHashi) return Type_TypeCase is
   begin
      return C.T;
   end ObtenirTypeCase;

   -----------------------
   -- ObtenirCoordonnee --
   -----------------------
   
   function ObtenirCoordonnee(C: in Type_CaseHashi) return Type_Coordonnee is
   begin
      return C.C;
   end ObtenirCoordonnee;

   -----------------
   -- ObtennirIle --
   -----------------
   
   function ObtenirIle(C: in Type_CaseHashi) return Type_Ile is
   begin
      if not estIle(C.T) then
         raise TYPE_INCOMPATIBLE;
      end if;
      return C.I;
   end ObtenirIle;

   -----------------
   -- ObtenirPont --
   -----------------
   
   function ObtenirPont(C: in Type_CaseHashi) return Type_Pont is
   begin
      if not estPont(C.T) then 
         raise TYPE_INCOMPATIBLE;
      end if;
      return C.P;
   end ObtenirPont;

   -----------------
   -- modifierIle --
   -----------------
   
   function modifierIle(C: in Type_CaseHashi; I: in Type_Ile) return Type_CaseHashi is
      ca : Type_CaseHashi;
   begin
      if estPont(C.T) then
         raise TYPE_INCOMPATIBLE;
      end if;
      
      ca := C;
      ca.I := I;
      ca.T := NOEUD;
      return ca;
   end modifierIle;

   ------------------
   -- modifierPont --
   ------------------

   function modifierPont
     (C : in Type_CaseHashi; p : in Type_Pont) return Type_CaseHashi
   is
      NewC : Type_CaseHashi;
   begin
      if EstIle(C.T)  then
         raise TYPE_INCOMPATIBLE;
      end if;
      NewC.c := ObtenirCoordonnee(C);
      NewC.T := ARETE;
      if EstPont(C.T) and then ObtenirPont(C)= UN then
         NewC.p:= DEUX;
      else
         NewC.p := p;
      end if;
      return NewC;
   end modifierPont;
 
   ---------
   -- "=" --
   ---------
   
   function "="(C1: in Type_CaseHashi; C2: in Type_CaseHashi) return Boolean is
   begin
      return C1.C = C2.C and C1.T = C2.T and C1.I = C2.I and C1.P = C2.P;
   end "=";

end CaseHashi;
