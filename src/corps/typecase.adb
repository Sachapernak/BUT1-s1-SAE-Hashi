pragma Ada_2012;
package body TypeCase is
   
   --------------------
   -- ValeurTypeCase --
   --------------------

   function ValeurTypeCase(t: in Type_TypeCase) return Integer is
   begin
      case t is
         when NOEUD => return 0;
         when ARETE => return 1;
         when MER   => return -1;
      end case;
   end ValeurTypeCase;
   
   ------------
   -- estIle --
   ------------

   function estIle(t: in Type_TypeCase) return Boolean is
   begin
      return t = NOEUD;
   end estIle;
   
   -------------
   -- estPont --
   -------------

   function estPont(t: in Type_TypeCase) return Boolean is
   begin
      return t = ARETE;
   end estPont;

   ------------
   -- estMer --
   ------------
   
   function estMer(t: in Type_TypeCase) return Boolean is
   begin
      return t = MER;
   end estMer;

end TypeCase;
