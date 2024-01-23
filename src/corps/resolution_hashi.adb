pragma Ada_2012;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with TypeCase;            use TypeCase;
with Ile;                 use Ile;
with Coordonnee;          use Coordonnee;
use Coordonnee;
with Affichage; use Affichage;

package body Resolution_Hashi is

   ---------------------------
   -- rechercherUneIleCible --
   ---------------------------

   procedure RechercherUneIleCible
     (G      : in Type_Grille; C : in Type_CaseHashi; O : in Type_Orientation;
      Trouve :    out Boolean; Ile : out Type_CaseHashi)
   is
      Case_Hashi : Type_CaseHashi := C;
   begin

      Trouve := False;
      if not estIle (ObtenirTypeCase (C)) then
         raise N_EST_PAS_UNE_ILE;
      end if;

      while aUnSuivant (G, Case_Hashi, O) loop

         if estPont (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O))) then
            Case_Hashi := obtenirSuivant (G, Case_Hashi, O);

            if obtenirValeur (ObtenirPont (Case_Hashi)) = 2 then

               Trouve := False;

               exit;
            end if;
            if aUnSuivant (G, Case_Hashi, O)
              and then estMer
                (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O)))
            then
               Trouve := False;
               exit;
            end if;
         elsif estIle (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O)))
         then

            if estIleComplete (ObtenirIle (obtenirSuivant (G, Case_Hashi, O)))
            then

               Trouve := False;
               exit;
            else

               Trouve := True;
               Ile    := obtenirSuivant (G, Case_Hashi, O);
               exit;
            end if;
         else

            Case_Hashi := obtenirSuivant (G, Case_Hashi, O);
         end if;

      end loop;

   end RechercherUneIleCible;

   ----------------------------------
   -- construireTableauSuccesseurs --
   ----------------------------------

   procedure ConstruireTableauSuccesseurs
     (G : in     Type_Grille; C : Type_CaseHashi; S : out Type_Tab_Successeurs;
      NbPonts :    out Integer; NbNoeuds : out Integer)
   is
      Nombre_Pont  : Integer;
      Nombre_Noeud : Integer;
      Trouver      : Boolean;
      Mer_Coord    : Type_Coordonnee;
   begin
      Mer_Coord    := ConstruireCoordonnees (0, 0);
      Nombre_Noeud := 0;
      Nombre_Pont  := 0;

      if not estIleComplete (ObtenirIle (C)) then

         RechercherUneIleCible (G, C, NORD, Trouver, S.NORD);

         if Trouver then

            Nombre_Noeud := Nombre_Noeud + 1;
            if ObtenirValeur (ObtenirIle (S.NORD)) = 1 or
              ObtenirValeur (ObtenirIle (C)) = 1
            then
               Nombre_Pont := Nombre_Pont + 1;
            else
               Nombre_Pont := Nombre_Pont + 2;
            end if;
         else
            S.NORD := ConstruireCase (Mer_Coord);
         end if;

         RechercherUneIleCible (G, C, SUD, Trouver, S.SUD);
         if Trouver then

            Nombre_Noeud := Nombre_Noeud + 1;
            if ObtenirValeur (ObtenirIle (S.SUD)) = 1 or
              ObtenirValeur (ObtenirIle (C)) = 1
            then
               Nombre_Pont := Nombre_Pont + 1;
            else

               Nombre_Pont := Nombre_Pont + 2;
            end if;
         else
            S.SUD := ConstruireCase (Mer_Coord);
         end if;

         RechercherUneIleCible (G, C, EST, Trouver, S.EST);
         if Trouver then

            Nombre_Noeud := Nombre_Noeud + 1;
            if ObtenirValeur (ObtenirIle (S.EST)) = 1 or
              ObtenirValeur (ObtenirIle (C)) = 1
            then
               Nombre_Pont := Nombre_Pont + 1;
            else

               Nombre_Pont := Nombre_Pont + 2;
            end if;
         else
            S.EST := ConstruireCase (Mer_Coord);
         end if;

         RechercherUneIleCible (G, C, OUEST, Trouver, S.OUEST);
         if Trouver then

            Nombre_Noeud := Nombre_Noeud + 1;
            if ObtenirValeur (ObtenirIle (S.OUEST)) = 1 or
              ObtenirValeur (ObtenirIle (C)) = 1
            then
               Nombre_Pont := Nombre_Pont + 1;
            else
               Nombre_Pont := Nombre_Pont + 2;
            end if;
         else
            S.OUEST := ConstruireCase (Mer_Coord);
         end if;

         NbPonts  := Nombre_Pont;
         NbNoeuds := Nombre_Noeud;

      end if;
   end ConstruireTableauSuccesseurs;

   ------------------------
   -- construireLeChemin --
   ------------------------

   procedure ConstruireLeChemin
     (G     : in out Type_Grille; Source : in out Type_CaseHashi;
      Cible : in out Type_CaseHashi; Pont : in Type_Pont;
      O     : in     Type_Orientation)
   is

   begin

      if ValeurOrientation (O) mod 2 = 0 then

         if ValeurOrientation (O) < 0 then
            for J in
              1 + ObtenirColonne (ObtenirCoordonnee (Source)) ..
                ObtenirColonne (ObtenirCoordonnee (Cible)) - 1
            loop

               G :=
                 modifierCase
                   (G,
                    modifierPont
                      (ObtenirCase
                         (G,
                          ConstruireCoordonnees
                            (ObtenirLigne (ObtenirCoordonnee (Source)), J)),
                       Pont));

            end loop;
         else

            for J in
              1 + ObtenirColonne (ObtenirCoordonnee (Cible)) ..
                ObtenirColonne (ObtenirCoordonnee (Source)) - 1
            loop

               G :=
                 modifierCase
                   (G,
                    modifierPont
                      (ObtenirCase
                         (G,
                          ConstruireCoordonnees
                            (ObtenirLigne (ObtenirCoordonnee (Source)), J)),
                       Pont));

            end loop;

         end if;

      else

         if ValeurOrientation (O) > 0 then

            for I in
              1 + ObtenirLigne (ObtenirCoordonnee (Source)) ..
                ObtenirLigne (ObtenirCoordonnee (Cible)) - 1
            loop

               G :=
                 modifierCase
                   (G,
                    modifierPont
                      (ObtenirCase
                         (G,
                          ConstruireCoordonnees
                            (I, ObtenirColonne (ObtenirCoordonnee (Source)))),
                       Pont));

            end loop;
         else

            for I in
              1 + ObtenirLigne (ObtenirCoordonnee (Cible)) ..
                ObtenirLigne (ObtenirCoordonnee (Source)) - 1
            loop

               G :=
                 modifierCase
                   (G,
                    modifierPont
                      (ObtenirCase
                         (G,
                          ConstruireCoordonnees
                            (I, ObtenirColonne (ObtenirCoordonnee (Source)))),
                       Pont));

            end loop;
         end if;
      end if;

   end ConstruireLeChemin;

   -------------------
   -- ResoudreHashi --
   -------------------

   procedure ResoudreHashi (G : in out Type_Grille; Trouve : out Boolean) is
      Compteur_Pont  : Integer;
      Compteur_Noeud : Integer;

      C  : Type_CaseHashi;
      C2 : Type_CaseHashi;

      S  : Type_Tab_Successeurs;
      S2 : Type_Tab_Successeurs;

      Ile            : Type_Ile;
      Ile_Principal  : Type_Ile;
      Ile_Principal2 : Type_Ile;

      Compteur     : Integer := 0;
      Grille_Comp  : Type_Grille;
      Grille_Comp2 : Type_Grille;
      Possible     : Boolean;
      Possible2    : Boolean;

      type Tableau is array (1 .. 50) of Type_CaseHashi;
      Table  : Tableau;
      Indice : Integer := 0;

      Table_1  : Tableau;
      Indice_1 : Integer := 0;

      type Tableau_Grille is array (1 .. 50) of Type_Grille;
      Table2  : Tableau_Grille;
      Indice2 : Integer := 0;

      -- renvoie vrai si la
      function Rechercher_Tab
        (Tab : in Tableau; Indice : in Integer; Ch : in Type_CaseHashi)
         return Boolean
      is

      begin

         for I in 1 .. Indice loop
            if Tab (I) = Ch then
               return True;
            end if;
         end loop;
         return False;

      end Rechercher_Tab;

      procedure Rechercher_Pont
        (G     : in     Type_Grille; Source : in Type_CaseHashi;
         O     : in     Type_Orientation; Trouve : out Boolean;
         Cible :    out Type_CaseHashi)
      is
         Case_Hashi : Type_CaseHashi := Source;
      begin

         Trouve := False;

         while aUnSuivant (G, Case_Hashi, O) loop

            if estMer (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O)))
            then

               exit;

            elsif estPont (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O)))
            then
               Case_Hashi := obtenirSuivant (G, Case_Hashi, O);

            elsif estIle (ObtenirTypeCase (obtenirSuivant (G, Case_Hashi, O)))
            then

               if estIleComplete
                   (ObtenirIle (obtenirSuivant (G, Case_Hashi, O)))
               then

                  Trouve := True;
                  Cible  := obtenirSuivant (G, Case_Hashi, O);
                  exit;

               end if;
            else

               Case_Hashi := obtenirSuivant (G, Case_Hashi, O);
            end if;

         end loop;

      end Rechercher_Pont;

      procedure Graphe_Connexe
        (G1, G2 : in Type_Grille; Tab : in out Tableau; Indi : in out Integer;
         C      : in Type_CaseHashi)
      is

         Trouve               : Boolean;
         S                    : Type_Tab_Successeurs;
         Compteur1, Compteur2 : Integer;

      begin

         if not Rechercher_Tab (Tab, Indi, C) then

            Indi       := Indi + 1;
            Tab (Indi) := C;

            ConstruireTableauSuccesseurs (G2, C, S, Compteur1, Compteur2);

            Rechercher_Pont (G1, C, NORD, Trouve, S.NORD);
            if Trouve then

               Graphe_Connexe (G1, G2, Tab, Indi, S.NORD);

            end if;

            Rechercher_Pont (G1, C, EST, Trouve, S.EST);
            if Trouve then

               Graphe_Connexe (G1, G2, Tab, Indi, S.EST);

            end if;

            Rechercher_Pont (G1, C, SUD, Trouve, S.SUD);
            if Trouve then

               Graphe_Connexe (G1, G2, Tab, Indi, S.SUD);

            end if;

            Rechercher_Pont (G1, C, OUEST, Trouve, S.OUEST);
            if Trouve then

               Graphe_Connexe (G1, G2, Tab, Indi, S.OUEST);

            end if;

         end if;

      end Graphe_Connexe;

      type Direction is record
         Nord, Est, Sud, Ouest : Boolean := True;
      end record;
      Dir        : Direction;
      Compteurdd : Integer := 0;
      type Tableau_Dir is array (1 .. 50) of Direction;
      Tab3    : Tableau_Dir;
      Indice3 : Integer := 0;
      procedure Algoback
        (G1, G2 : in out Type_Grille; Tab2 : in out Tableau_Grille;
         Tab3 : in out Tableau_Dir; Tab1 : in out Tableau;
         Indi1, Indi2, Indi3, Compteur : in out Integer;
         Dir : in out Direction; Noconnexe : in out Boolean)
      is
         S                         : Type_Tab_Successeurs;
         Compteur1, Compteur_Noeud : Integer;

         Ile_Principal : Type_Ile;
      begin
         Dir.Est   := True;
         Dir.Sud   := True;
         Dir.Ouest := True;
         Dir.Nord  := True;
         Compteur  := Compteur + 1;

         if Noconnexe then

            if G1 /= Tab2 (Indi2) and Indi2 > 2 then
               Indi1 := Indi1 - 2;
               Indi2 := Indi2 - 2;
               Indi3 := Indi3 - 2;

               G1  := Tab2 (Indi2);
               Dir := Tab3 (Indi3);
               C   := Tab1 (Indi1);
            else

               Indi1 := Indi1 - 1;
               Indi2 := Indi2 - 1;
               Indi3 := Indi3 - 1;

               G1  := Tab2 (Indi2);
               Dir := Tab3 (Indi3);
               C   := Tab1 (Indi1);

            end if;
            while not Dir.Nord loop

               Indi1 := Indi1 - 1;
               Indi2 := Indi2 - 1;
               Indi3 := Indi3 - 1;
               G1    := Tab2 (Indi2);
               Dir   := Tab3 (Indi3);
               C     := Tab1 (Indi1);

            end loop;
         end if;

         for I in 1 .. nbLignes (G1) loop
            for J in 1 .. nbColonnes (G1) loop
               if estIle
                   (ObtenirTypeCase
                      (ObtenirCase (G1, ConstruireCoordonnees (I, J))))
                 and then not estIleComplete
                   (ObtenirIle
                      (ObtenirCase (G1, ConstruireCoordonnees (I, J))))
               then
                  C := ObtenirCase (G1, ConstruireCoordonnees (I, J));

               end if;
            end loop;
         end loop;

         ConstruireTableauSuccesseurs (G1, C, S, Compteur1, Compteur_Noeud);

         while Compteur_Noeud = 0 loop

            Indi1 := Indi1 - 1;
            Indi2 := Indi2 - 1;
            Indi3 := Indi3 - 1;
            G1    := Tab2 (Indi2);
            Dir   := Tab3 (Indi3);
            C     := Tab1 (Indi1);

            while not Dir.Nord loop

               Indi1 := Indi1 - 1;
               Indi2 := Indi2 - 1;
               Indi3 := Indi3 - 1;
               G1    := Tab2 (Indi2);
               Dir   := Tab3 (Indi3);
               C     := Tab1 (Indi1);

            end loop;
            ConstruireTableauSuccesseurs (G1, C, S, Compteur1, Compteur_Noeud);
         end loop;

         if Compteur = 1 then
            Indi1        := Indi1 + 1;
            Tab1 (Indi1) := C;
            Indi2        := Indi2 + 1;
            Tab2 (Indi2) := G1;
            Indi3        := Indi3 + 1;
            Tab3 (Indi3) := Dir;
         end if;
         Ile_Principal := ConstruireIle (ObtenirValeur (ObtenirIle (C)));

         if estIle (ObtenirTypeCase (S.EST)) and Dir.Est and Dir.Sud and
           Dir.Ouest and Dir.Nord
         then

            Ile := ConstruireIle (ObtenirValeur (ObtenirIle (S.EST)));
            Ile           := modifierIle (Ile, 1);
            Ile_Principal := modifierIle (Ile_Principal, 1);
            S.EST         := modifierIle (S.EST, Ile);

            ConstruireLeChemin (G1, C, S.EST, UN, EST);
            Dir.Est   := False;
            Dir.Sud   := True;
            Dir.Ouest := True;
            Dir.Nord  := True;
            C         := modifierIle (C, Ile_Principal);

            G1 := modifierCase (G1, S.EST);
            G1 := modifierCase (G1, C);

            Indi1        := Indi1 + 1;
            Tab1 (Indi1) := C;
            Indi2        := Indi2 + 1;
            Tab2 (Indi2) := G1;
            Indi3        := Indi3 + 1;
            Tab3 (Indi3) := Dir;

         elsif estIle (ObtenirTypeCase (S.SUD)) and Dir.Sud and Dir.Ouest and
           Dir.Nord
         then

            Ile := ConstruireIle (ObtenirValeur (ObtenirIle (S.SUD)));
            Ile           := modifierIle (Ile, 1);
            Ile_Principal := modifierIle (Ile_Principal, 1);
            S.SUD         := modifierIle (S.SUD, Ile);

            ConstruireLeChemin (G1, C, S.SUD, UN, SUD);

            C            := modifierIle (C, Ile_Principal);
            G1           := modifierCase (G1, S.SUD);
            G1           := modifierCase (G1, C);
            Dir.Est      := False;
            Dir.Sud      := False;
            Dir.Ouest    := True;
            Dir.Nord     := True;
            Indi1        := Indi1 + 1;
            Tab1 (Indi1) := C;
            Indi2        := Indi2 + 1;
            Tab2 (Indi2) := G1;
            Indi3        := Indi3 + 1;
            Tab3 (Indi3) := Dir;

         elsif estIle (ObtenirTypeCase (S.OUEST)) and Dir.Ouest and Dir.Nord
         then

            Ile := ConstruireIle (ObtenirValeur (ObtenirIle (S.OUEST)));
            Ile           := modifierIle (Ile, 1);
            Ile_Principal := modifierIle (Ile_Principal, 1);
            S.OUEST       := modifierIle (S.OUEST, Ile);

            Dir.Est   := False;
            Dir.Sud   := False;
            Dir.Ouest := False;
            Dir.Nord  := True;
            ConstruireLeChemin (G1, C, S.OUEST, UN, OUEST);
            Dir.Ouest    := False;
            C            := modifierIle (C, Ile_Principal);
            G1           := modifierCase (G1, S.OUEST);
            G1           := modifierCase (G1, C);
            Indi1        := Indi1 + 1;
            Tab1 (Indi1) := C;
            Indi2        := Indi2 + 1;
            Tab2 (Indi2) := G1;
            Indi3        := Indi3 + 1;
            Tab3 (Indi3) := Dir;

         elsif estIle (ObtenirTypeCase (S.NORD)) and Dir.Nord then

            Ile := ConstruireIle (ObtenirValeur (ObtenirIle (S.NORD)));
            Ile           := modifierIle (Ile, 1);
            Ile_Principal := modifierIle (Ile_Principal, 1);
            S.NORD        := modifierIle (S.NORD, Ile);

            Dir.Est   := False;
            Dir.Sud   := False;
            Dir.Ouest := False;
            Dir.Nord  := False;
            ConstruireLeChemin (G1, C, S.NORD, UN, NORD);

            C            := modifierIle (C, Ile_Principal);
            G1           := modifierCase (G1, S.NORD);
            G1           := modifierCase (G1, C);
            Indi1        := Indi1 + 1;
            Tab1 (Indi1) := C;
            Indi2        := Indi2 + 1;
            Tab2 (Indi2) := G1;
            Indi3        := Indi3 + 1;
            Tab3 (Indi3) := Dir;

         end if;

         Tab3 (1) := Tab3 (2);

      end Algoback;

      Noconnexe : Boolean := False;

   begin
      Trouve := False;

      Possible     := False;
      Grille_Comp  := G;
      Grille_Comp2 := G;
      Possible2    := True;
      while not estComplete (G) and Compteur < 30 loop

         for I in 1 .. nbLignes (G) loop
            for J in 1 .. nbColonnes (G) loop

               if estIle
                   (ObtenirTypeCase
                      (ObtenirCase (G, ConstruireCoordonnees (I, J))))
                 and then not estIleComplete
                   (ObtenirIle (ObtenirCase (G, ConstruireCoordonnees (I, J))))
               then

                  C  := ObtenirCase (G, ConstruireCoordonnees (I, J));
                  C2 :=
                    ObtenirCase (Grille_Comp2, ConstruireCoordonnees (I, J));

                  ConstruireTableauSuccesseurs
                    (Grille_Comp2, C2, S2, Compteur_Pont, Compteur_Noeud);

                  ConstruireTableauSuccesseurs
                    (G, C, S, Compteur_Pont, Compteur_Noeud);

                  -- on enlève les cas impossibles (1 - 1 )
                  if ObtenirValeur (ObtenirIle (C2)) = 1 then

                     if estIle (ObtenirTypeCase (S.NORD)) then

                        if ObtenirValeur (ObtenirIle (C2)) = 1 and
                          ObtenirValeur (ObtenirIle (S2.NORD)) = 1 and
                          ObtenirValeur (ObtenirIle (S.NORD)) = 1
                        then

                           S.NORD :=
                             ConstruireCase (ConstruireCoordonnees (0, 0));

                           Compteur_Pont := Compteur_Pont - 1;

                        end if;
                     end if;
                     if estIle (ObtenirTypeCase (S.SUD)) then

                        if ObtenirValeur (ObtenirIle (C2)) = 1 and
                          ObtenirValeur (ObtenirIle (S2.SUD)) = 1 and
                          ObtenirValeur (ObtenirIle (S.SUD)) = 1
                        then
                           S.SUD :=
                             ConstruireCase (ConstruireCoordonnees (0, 0));

                           Compteur_Pont := Compteur_Pont - 1;

                        end if;
                     end if;

                     if estIle (ObtenirTypeCase (S.EST)) then

                        if ObtenirValeur (ObtenirIle (C2)) = 1 and
                          ObtenirValeur (ObtenirIle (S2.EST)) = 1 and
                          ObtenirValeur (ObtenirIle (S.EST)) = 1
                        then
                           S.EST :=
                             ConstruireCase (ConstruireCoordonnees (0, 0));

                           Compteur_Pont := Compteur_Pont - 1;

                        end if;
                     end if;

                     if estIle (ObtenirTypeCase (S.OUEST)) then

                        if ObtenirValeur (ObtenirIle (C2)) = 1 and
                          ObtenirValeur (ObtenirIle (S2.OUEST)) = 1 and
                          ObtenirValeur (ObtenirIle (S.OUEST)) = 1
                        then

                           S.OUEST :=
                             ConstruireCase (ConstruireCoordonnees (0, 0));

                           Compteur_Pont := Compteur_Pont - 1;

                        end if;
                     end if;

                  end if;

                  if Compteur_Pont = ObtenirValeur (ObtenirIle (C)) then

                     Ile_Principal :=
                       ConstruireIle (ObtenirValeur (ObtenirIle (C)));

                     -- NORD
                     if estIle (ObtenirTypeCase (S.NORD)) then

                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.NORD)));
                        if ObtenirValeur (ObtenirIle (S.NORD)) = 1 or
                          ObtenirValeur (ObtenirIle (C)) = 1
                        then

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.NORD        := modifierIle (S.NORD, Ile);

                           ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                        else

                           Ile           := modifierIle (Ile, 2);
                           Ile_Principal := modifierIle (Ile_Principal, 2);
                           S.NORD        := modifierIle (S.NORD, Ile);

                           ConstruireLeChemin (G, C, S.NORD, DEUX, NORD);
                        end if;
                        G := modifierCase (G, S.NORD);
                     end if;

                     -- SUD
                     if estIle (ObtenirTypeCase (S.SUD)) then

                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.SUD)));
                        if ObtenirValeur (ObtenirIle (S.SUD)) = 1 or
                          ObtenirValeur (ObtenirIle (C)) = 1
                        then

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.SUD         := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, UN, SUD);
                        else

                           Ile           := modifierIle (Ile, 2);
                           Ile_Principal := modifierIle (Ile_Principal, 2);
                           S.SUD         := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, DEUX, SUD);

                        end if;

                        G := modifierCase (G, S.SUD);
                     end if;

                     -- EST
                     if estIle (ObtenirTypeCase (S.EST)) then

                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.EST)));

                        if ObtenirValeur (ObtenirIle (S.EST)) = 1 or
                          ObtenirValeur (ObtenirIle (C)) = 1
                        then

                           Ile := modifierIle (Ile, 1);

                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.EST         := modifierIle (S.EST, Ile);

                           ConstruireLeChemin (G, C, S.EST, UN, EST);
                        else

                           Ile := modifierIle (Ile, 2);

                           Ile_Principal := modifierIle (Ile_Principal, 2);

                           S.EST := modifierIle (S.EST, Ile);

                           ConstruireLeChemin (G, C, S.EST, DEUX, EST);
                        end if;
                        G := modifierCase (G, S.EST);
                     end if;

                     -- OUEST
                     if estIle (ObtenirTypeCase (S.OUEST)) then
                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.OUEST)));
                        if ObtenirValeur (ObtenirIle (S.OUEST)) = 1 or
                          ObtenirValeur (ObtenirIle (C)) = 1
                        then

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.OUEST       := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);
                        else

                           Ile           := modifierIle (Ile, 2);
                           Ile_Principal := modifierIle (Ile_Principal, 2);
                           S.OUEST       := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, DEUX, OUEST);
                        end if;
                        G := modifierCase (G, S.OUEST);
                     end if;

                     C := modifierIle (C, Ile_Principal);
                     G := modifierCase (G, C);

                  elsif
                    (ObtenirValeur (ObtenirIle (C)) + 1 =
                     Compteur_Noeud * 2) or
                    (ObtenirValeur (ObtenirIle (C)) + 1 = Compteur_Pont and
                     ObtenirValeur (ObtenirIle (C)) = Compteur_Noeud and
                     Possible)
                  then

                     Ile_Principal :=
                       ConstruireIle (ObtenirValeur (ObtenirIle (C)));

                     -- NORD
                     if estIle (ObtenirTypeCase (S.NORD)) then
                        if ObtenirValeur (ObtenirIle (S.NORD)) = 1 and Possible
                        then
                           null;
                        else
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.NORD)));

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.NORD        := modifierIle (S.NORD, Ile);

                           ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                           G := modifierCase (G, S.NORD);
                        end if;
                     end if;

                     -- SUD
                     if estIle (ObtenirTypeCase (S.SUD)) then
                        if ObtenirValeur (ObtenirIle (S.SUD)) = 1 and Possible
                        then
                           null;
                        else
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.SUD)));

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.SUD         := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, UN, SUD);
                           G := modifierCase (G, S.SUD);
                        end if;
                     end if;

                     -- EST
                     if estIle (ObtenirTypeCase (S.EST)) then
                        if ObtenirValeur (ObtenirIle (S.EST)) = 1 and Possible
                        then
                           null;
                        else
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.EST)));

                           Ile := modifierIle (Ile, 1);

                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.EST         := modifierIle (S.EST, Ile);

                           ConstruireLeChemin (G, C, S.EST, UN, EST);

                           G := modifierCase (G, S.EST);
                        end if;
                     end if;

                     -- OUEST
                     if estIle (ObtenirTypeCase (S.OUEST)) then
                        if ObtenirValeur (ObtenirIle (S.OUEST)) = 1 and
                          Possible
                        then
                           null;
                        else
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.OUEST)));

                           Ile           := modifierIle (Ile, 1);
                           Ile_Principal := modifierIle (Ile_Principal, 1);
                           S.OUEST       := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);

                           G := modifierCase (G, S.OUEST);
                        end if;
                     end if;

                     C := modifierIle (C, Ile_Principal);
                     G := modifierCase (G, C);

                  elsif ObtenirValeur (ObtenirIle (C2)) = 2 and
                    Compteur_Noeud = 2
                  then

                     Ile_Principal :=
                       ConstruireIle (ObtenirValeur (ObtenirIle (C)));
                     Ile_Principal2 :=
                       ConstruireIle (ObtenirValeur (ObtenirIle (C2)));

                     if estIle (ObtenirTypeCase (S2.NORD))
                       and then ObtenirValeur (ObtenirIle (S2.NORD)) = 2
                     then

                        Compteur_Pont := Compteur_Pont - 1;
                        if estIle (ObtenirTypeCase (S.SUD)) then

                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.SUD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.SUD          := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, UN, SUD);

                           G := modifierCase (G, S.SUD);
                        elsif estIle (ObtenirTypeCase (S.EST)) then

                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.EST)));

                           Ile := modifierIle (Ile, 1);

                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.EST          := modifierIle (S.EST, Ile);

                           ConstruireLeChemin (G, C, S.EST, UN, EST);

                           G := modifierCase (G, S.EST);

                        elsif estIle (ObtenirTypeCase (S.OUEST)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.OUEST)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.OUEST        := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);

                           G := modifierCase (G, S.OUEST);
                        end if;

                     elsif estIle (ObtenirTypeCase (S2.SUD))
                       and then ObtenirValeur (ObtenirIle (S2.SUD)) = 2
                     then

                        Compteur_Pont := Compteur_Pont - 1;
                        if estIle (ObtenirTypeCase (S.NORD)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.NORD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.NORD         := modifierIle (S.NORD, Ile);
                           ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                           G := modifierCase (G, S.NORD);
                        elsif estIle (ObtenirTypeCase (S.EST)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.EST)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.EST          := modifierIle (S.EST, Ile);
                           ConstruireLeChemin (G, C, S.EST, UN, EST);

                           G := modifierCase (G, S.EST);

                        elsif estIle (ObtenirTypeCase (S.OUEST)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.OUEST)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.OUEST        := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);

                           G := modifierCase (G, S.OUEST);
                        end if;

                     elsif estIle (ObtenirTypeCase (S2.EST))
                       and then ObtenirValeur (ObtenirIle (S2.EST)) = 2
                     then

                        Compteur_Pont := Compteur_Pont - 1;
                        if estIle (ObtenirTypeCase (S.SUD)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.SUD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.SUD          := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, UN, SUD);

                           G := modifierCase (G, S.SUD);
                        elsif estIle (ObtenirTypeCase (S.NORD)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.NORD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.NORD         := modifierIle (S.NORD, Ile);
                           ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                           G := modifierCase (G, S.NORD);

                        elsif estIle (ObtenirTypeCase (S.OUEST)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.OUEST)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.OUEST        := modifierIle (S.OUEST, Ile);
                           ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);

                           G := modifierCase (G, S.OUEST);
                        end if;

                     elsif estIle (ObtenirTypeCase (S2.OUEST))
                       and then ObtenirValeur (ObtenirIle (S2.OUEST)) = 2
                     then

                        Compteur_Pont := Compteur_Pont - 1;
                        if estIle (ObtenirTypeCase (S.SUD)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.SUD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.SUD          := modifierIle (S.SUD, Ile);
                           ConstruireLeChemin (G, C, S.SUD, UN, SUD);

                           G := modifierCase (G, S.SUD);
                        elsif estIle (ObtenirTypeCase (S.NORD)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.NORD)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.NORD         := modifierIle (S.NORD, Ile);
                           ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                           G := modifierCase (G, S.NORD);

                        elsif estIle (ObtenirTypeCase (S.EST)) then
                           Ile :=
                             ConstruireIle
                               (ObtenirValeur (ObtenirIle (S.EST)));

                           Ile            := modifierIle (Ile, 1);
                           Ile_Principal  := modifierIle (Ile_Principal, 1);
                           Ile_Principal2 := modifierIle (Ile_Principal2, 1);
                           S.EST          := modifierIle (S.EST, Ile);
                           ConstruireLeChemin (G, C, S.EST, UN, EST);

                           G := modifierCase (G, S.EST);
                        end if;
                     end if;

                     C            := modifierIle (C, Ile_Principal);
                     G            := modifierCase (G, C);
                     C2           := modifierIle (C, Ile_Principal2);
                     Grille_Comp2 := modifierCase (Grille_Comp2, C2);
                  end if;

               end if;
            end loop;
         end loop;

         Possible2 := False;

         if estComplete (G) then
            Trouve := True;
            Indice := 0;

            Graphe_Connexe (G, Grille_Comp2, Table, Indice, C);

            if nbIle (G) /= Indice then
               Noconnexe := True;

               Trouve := False;
               Algoback
                 (G, Grille_Comp2, Table2, Tab3, Table_1, Indice_1, Indice2,
                  Indice3, Compteurdd, Dir, Noconnexe);

            end if;

         elsif Possible and Grille_Comp = G then

            Noconnexe := False;
            Algoback
              (G, Grille_Comp2, Table2, Tab3, Table_1, Indice_1, Indice2,
               Indice3, Compteurdd, Dir, Noconnexe);
         end if;

         if Grille_Comp = G then

            Possible := True;

         else
            Possible    := False;
            Grille_Comp := G;
         end if;

         Compteur := Compteur + 1;
      end loop;
      if estComplete (G) then

         Trouve := True;
      end if;

   end ResoudreHashi;

end Resolution_Hashi;
