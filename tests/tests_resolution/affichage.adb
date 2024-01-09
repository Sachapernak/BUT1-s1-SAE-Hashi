pragma Ada_2012;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Affichage is

   ------------------
   -- AfficherPont --
   ------------------

   procedure AfficherPont (a : in Type_Pont ; Sens : in Character) is
   begin
      --Put ("  ");
      if a = POTENTIEL then
         -- Put (0, NB_POSITIONS);
         Put (" ? ");
      elsif a = UN and Sens = 'V' then
         -- Put (1, NB_POSITIONS);
         Put (" | ");
      elsif a = UN and Sens = 'H' then
         -- Put (1, NB_POSITIONS);
         Put ("---");
      elsif a = DEUX and Sens = 'V'then
         -- Put (2, NB_POSITIONS);
         Put (" ||");
      elsif a = DEUX and Sens = 'H'then
         -- Put (2, NB_POSITIONS);
         Put ("===");
      else -- A est IMPOSSIBLe
         Put ("PB");
      end if;
      --Put ("  ");
   end AfficherPont;

   -------------------------
   -- AfficherOrientation --
   -------------------------

   procedure AfficherOrientation (o : in Type_Orientation) is
   begin
      Put ("  ");
      if o = NORD then
         -- Put (0, NB_POSITIONS);
         Put ('N');
      elsif o = SUD then
         -- Put (1, NB_POSITIONS);
         Put ('S');
      elsif o = EST then
         -- Put (2, NB_POSITIONS);
         Put ('E');
      else
         --Put (3, NB_POSITIONS);
         Put ('O');
      end if;
      Put ("  ");
   end AfficherOrientation;

   ------------------------
   -- AfficherCoordonnee --
   ------------------------

   procedure AfficherCoordonnee (C : in Type_Coordonnee) is
   begin
      Put ("(");
      Put (ObtenirLigne (C), 0);
      Put (",");
      Put (ObtenirColonne (C), 0);
      Put (")");
   end AfficherCoordonnee;

   -----------------
   -- AfficherIle --
   -----------------

   procedure AfficherIle (n : in Type_Ile) is
   begin
      Put (ObtenirValeur (n), 2);
      Put(" ");
   end AfficherIle;

   ----------------------
   -- AfficherTypeCase --
   ----------------------

   procedure AfficherTypeCase (t : Type_TypeCase) is
   begin
      if estMer (t) then
         Put ("MER");
      elsif estIle (t) then
         Put ("ILE");
      else
         Put ("PONT");
      end if;
   end AfficherTypeCase;

   ------------------
   -- AfficherCase --
   ------------------
   procedure AfficherCase (c : Type_CaseHashi) is
      T : Type_TypeCase;
   begin
      T := ObtenirTypeCase (c);
      if estMer (T) then
         Put (" . ");
      elsif estIle (T) then
         AfficherIle (ObtenirIle (c));
      --  elsif (ObtenirLigne(ObtenirCoordonnee(C)) mod 2) = 0 then
      --           AfficherPont (ObtenirPont (c),'V');
      else
               AfficherPont (ObtenirPont (c),'H');
      end if;
   end AfficherCase;

   --------------------
   -- AfficherGrille --
   --------------------

   procedure AfficherGrille (g : Type_Grille) is
      Co : Type_Coordonnee;
      C  : Type_CaseHashi;
   begin
      -- afficher les colonnes
      Put ("   ");
      for I in 1 .. nbColonnes (g) loop
         Put(" ");
        Put (I, 3);
         Put(" ");
      end loop;
      New_Line;
      -- afficher les valeur
      for I in 1 .. nbLignes (g) loop
         Put (I, 3);
         Put (" ");
         for J in 1 .. nbColonnes (g) loop
            Co := ConstruireCoordonnees (I, J);
            C  := ObtenirCase (g, Co);
            Put (" ");
            AfficherCase (C);
            Put (" ");
         end loop;
         New_Line;
      end loop;
      New_Line;
   end AfficherGrille;

   --------------------
   -- AfficherGraphe --
   --------------------

   procedure AfficherTableauSuccesseurs (G : in Type_Grille ;
                                         C : in Type_CaseHashi ;
                                         S : in Type_Tab_Successeurs;
                                         NbPonts : in Integer;
                                        NbNoeuds : in Integer) is
   begin
      Put (" **** Successeurs de la case "); AfficherCoordonnee(ObtenirCoordonnee(C));
      AfficherCase(C); New_Line;
      put("Nord  "); AfficherCoordonnee(ObtenirCoordonnee(S.NORD)); AfficherCase(S.NORD); New_Line;
      put("Sud   "); AfficherCoordonnee(ObtenirCoordonnee(S.SUD)); AfficherCase(S.SUD); New_Line;
      put("Est   "); AfficherCoordonnee(ObtenirCoordonnee(S.EST)); AfficherCase(S.EST); New_Line;
      put("Ouest "); AfficherCoordonnee(ObtenirCoordonnee(S.OUEST)); AfficherCase(S.OUEST); New_Line;
      put("nbPonts "); Put(NbPonts, 0); New_Line;
      put("nbNoeud "); Put(NbNoeuds, 0); New_Line;
      New_Line;
   end AfficherTableauSuccesseurs;

   ----------------------
   -- AfficherResultat --
   ----------------------

   procedure AfficherResultat (G : in Type_Grille; Trouve : in Boolean) is
   begin
      if Trouve then
         Put_Line ("==> Grille résolue");
      else
         Put_Line ("==> Grille non résolue");
         Put ("Il y a ");
         Put (nbIle (g) - nbIleCompletes (g), 0);
         Put (" iles sur ");
         Put (nbIle (g), 0);
         Put_Line (" qui n'ont pas tous leurs pont");
      end if;
   end AfficherResultat;

end Affichage;
