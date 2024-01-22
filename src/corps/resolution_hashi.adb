pragma Ada_2012;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with TypeCase;            use TypeCase;
with Ile;                 use Ile;
with Coordonnee;          use Coordonnee;
use Coordonnee;

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
      C              : Type_CaseHashi;
      S              : Type_Tab_Successeurs;
      Ile            : Type_Ile;
      Ile_Principal  : Type_Ile;
      Compteur       : Integer := 0;
      Grille_Comp    : Type_Grille;
      Possible       : Boolean;
   begin
      Trouve      := False;
      Possible    := False;
      Grille_Comp := G;
      while not estComplete (G) and Compteur < 200 loop
         for I in 1 .. nbLignes (G) loop
            for J in 1 .. nbColonnes (G) loop

               if estIle
                   (ObtenirTypeCase
                      (ObtenirCase (G, ConstruireCoordonnees (I, J))))
                 and then not estIleComplete
                   (ObtenirIle (ObtenirCase (G, ConstruireCoordonnees (I, J))))
               then
                  C := ObtenirCase (G, ConstruireCoordonnees (I, J));

                  ConstruireTableauSuccesseurs
                    (G, C, S, Compteur_Pont, Compteur_Noeud);

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

                  elsif ObtenirValeur (ObtenirIle (C)) + 1 =
                    Compteur_Noeud * 2 or
                    (ObtenirValeur (ObtenirIle (C)) + 1 = Compteur_Pont and
                     ObtenirValeur (ObtenirIle (C)) = Compteur_Noeud and
                     Possible)
                  then

                     Ile_Principal :=
                       ConstruireIle (ObtenirValeur (ObtenirIle (C)));

                     -- NORD
                     if estIle (ObtenirTypeCase (S.NORD)) then

                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.NORD)));

                        Ile           := modifierIle (Ile, 1);
                        Ile_Principal := modifierIle (Ile_Principal, 1);
                        S.NORD        := modifierIle (S.NORD, Ile);

                        ConstruireLeChemin (G, C, S.NORD, UN, NORD);

                        G := modifierCase (G, S.NORD);
                     end if;

                     -- SUD
                     if estIle (ObtenirTypeCase (S.SUD)) then
                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.SUD)));

                        Ile           := modifierIle (Ile, 1);
                        Ile_Principal := modifierIle (Ile_Principal, 1);
                        S.SUD         := modifierIle (S.SUD, Ile);
                        ConstruireLeChemin (G, C, S.SUD, UN, SUD);
                        G := modifierCase (G, S.SUD);

                     end if;

                     -- EST
                     if estIle (ObtenirTypeCase (S.EST)) then

                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.EST)));

                        Ile := modifierIle (Ile, 1);

                        Ile_Principal := modifierIle (Ile_Principal, 1);
                        S.EST         := modifierIle (S.EST, Ile);

                        ConstruireLeChemin (G, C, S.EST, UN, EST);

                        G := modifierCase (G, S.EST);
                     end if;

                     -- OUEST
                     if estIle (ObtenirTypeCase (S.OUEST)) then
                        Ile :=
                          ConstruireIle (ObtenirValeur (ObtenirIle (S.OUEST)));

                        Ile           := modifierIle (Ile, 1);
                        Ile_Principal := modifierIle (Ile_Principal, 1);
                        S.OUEST       := modifierIle (S.OUEST, Ile);
                        ConstruireLeChemin (G, C, S.OUEST, UN, OUEST);

                        G := modifierCase (G, S.OUEST);
                     end if;

                     C := modifierIle (C, Ile_Principal);
                     G := modifierCase (G, C);

                  end if;

               end if;

            end loop;
         end loop;
         if Grille_Comp = G then
            Possible := True;
         else
            Possible := False;
         end if;
         Grille_Comp := G;
         Compteur    := Compteur + 1;
      end loop;
      if estComplete (G) then
         Trouve := True;
      end if;
   end ResoudreHashi;



end Resolution_Hashi;
