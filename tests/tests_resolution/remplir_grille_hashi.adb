-- E/S
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Affichage;           use Affichage;
-- TAD
with Grille;      use Grille;
with Ile;         use Ile;
with Coordonnee;        use Coordonnee;
with Orientation; use Orientation;
with CaseHashi;   use CaseHashi;
with TypeCase;    use TypeCase;

package body Remplir_Grille_Hashi is

   --------------------------
   -- Construire_Grille_V1 --
   --------------------------

   function Construire_Grille_V1 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (5, 5);
      -- 1ère ile
      Co := ConstruireCoordonnees (1, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (3, 1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (3, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (7);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 4ème ile
      Co := ConstruireCoordonnees (3, 5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (5, 3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- grille complète
      return (G);
   end Construire_Grille_V1;

   --------------------------
   -- Construire_Grille_V2 --
   --------------------------

   function Construire_Grille_V2 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (11,7);
      -- 1ère ligne
      -- 1ère ile
      Co := ConstruireCoordonnees (1, 2);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1, 5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1, 7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ligne
      -- 4ème ile
      Co := ConstruireCoordonnees (3, 1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 5ème ile
      Co := ConstruireCoordonnees (3, 4);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ligne
       -- 6ème ile
      Co := ConstruireCoordonnees (5, 5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 7ème ligne
      -- 7ème ile
      Co := ConstruireCoordonnees (7,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 8ème ile
      Co := ConstruireCoordonnees (7,4);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (8);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 9ème ile
      Co := ConstruireCoordonnees (7,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 9ème ligne
      -- 10ème ile
      Co := ConstruireCoordonnees (9,2);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (9,4);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 12ème ile
      Co := ConstruireCoordonnees (9,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 11ème ligne
      -- 13ème ile
      Co := ConstruireCoordonnees (11,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 14ème ile
      Co := ConstruireCoordonnees (11,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 15ème ile
      Co := ConstruireCoordonnees (11,6);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- grille a complèter
      return (G);
   end Construire_Grille_V2;

   --------------------------
   -- Construire_Grille_V3 --
   --------------------------

   function Construire_Grille_V3 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (19,19);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 4ème ile
      Co := ConstruireCoordonnees (1,15);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (1,19);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 3
      -- 6ème ile
      Co := ConstruireCoordonnees (3,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 7ème ile
      Co := ConstruireCoordonnees (3,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (6);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 8ème ile
      Co := ConstruireCoordonnees (3,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (6);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 9ème ile
      Co := ConstruireCoordonnees (3,17);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 5
       -- 10ème ile
      Co := ConstruireCoordonnees (5,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (5,19);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 7
      -- 12ème ile
      Co := ConstruireCoordonnees (7,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 13ème ile
      Co := ConstruireCoordonnees (7,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (5);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 9
       -- 14ème ile
      Co := ConstruireCoordonnees (9,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 15ème ile
      Co := ConstruireCoordonnees (9,17);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 11
       -- 16ème ile
      Co := ConstruireCoordonnees (11,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 17ème ile
      Co := ConstruireCoordonnees (11,19);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 13
       -- 18ème ile
      Co := ConstruireCoordonnees (13,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 19ème ile
      Co := ConstruireCoordonnees (13,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 15
      -- 20ème ile
      Co := ConstruireCoordonnees (15,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 21ème ile
      Co := ConstruireCoordonnees (15,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 22ème ile
      Co := ConstruireCoordonnees (15,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 23ème ile
      Co := ConstruireCoordonnees (15,17);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne19
      -- 24ème ile
      Co := ConstruireCoordonnees (19,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 25ème ile
      Co := ConstruireCoordonnees (19,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 26ème ile
      Co := ConstruireCoordonnees (19,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 27ème ile
      Co := ConstruireCoordonnees (19,15);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 28ème ile
      Co := ConstruireCoordonnees (19,19);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- grille complète
      return (G);
   end Construire_Grille_V3;

   --------------------------
   -- Construire_Grille_V4 --
   --------------------------

   function Construire_Grille_V4 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (13,13);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- Ligne 3
      -- 4ème ile
      Co := ConstruireCoordonnees (3,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (3,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (5);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 6ème ile
      Co := ConstruireCoordonnees (3,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 5
      -- 7ème ile
      Co := ConstruireCoordonnees (5,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 8ème ile
      Co := ConstruireCoordonnees (5,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 7
      -- 9ème ile
      Co := ConstruireCoordonnees (7,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 10ème ile
      Co := ConstruireCoordonnees (7,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (5);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (7,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 9
      -- 12ème ile
      Co := ConstruireCoordonnees (9,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 11
      -- 13ème ile
      Co := ConstruireCoordonnees (11,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 14ème ile
      Co := ConstruireCoordonnees (11,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 15ème ile
      Co := ConstruireCoordonnees (11,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- ligne 13
       -- 16ème ile
      Co := ConstruireCoordonnees (13,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 17ème ile
      Co := ConstruireCoordonnees (13,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
        -- 18ème ile
      Co := ConstruireCoordonnees (13,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- grille complète
      return (G);
   end Construire_Grille_V4;

    --------------------------
   -- Construire_Grille_V5 --
   --------------------------

   function Construire_Grille_V5 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (11,11);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- Ligne 3
      -- 4ème ile
      Co := ConstruireCoordonnees (3,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (3,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 6ème ile
      Co := ConstruireCoordonnees (3,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (6);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 7ème ile
      Co := ConstruireCoordonnees (3,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
            -- ligne 5
            -- 8ème ile
      Co := ConstruireCoordonnees (5,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 7
      -- 9ème ile
      Co := ConstruireCoordonnees (7,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 10ème ile
      Co := ConstruireCoordonnees (7,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (7,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 12ème ile
      Co := ConstruireCoordonnees (7,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);      -- ligne 9
      -- 13ème ile
      Co := ConstruireCoordonnees (9,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 14ème ile
      Co := ConstruireCoordonnees (9,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 11
      -- 15ème ile
      Co := ConstruireCoordonnees (11,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 16ème ile
      Co := ConstruireCoordonnees (11,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 17ème ile
      Co := ConstruireCoordonnees (11,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- grille complète
      return (G);
   end Construire_Grille_V5;

   --------------------------
   -- Construire_Grille_V6 --
   --------------------------

   function Construire_Grille_V6 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (11,13);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- Ligne 3
      -- 4ème ile
      Co := ConstruireCoordonnees (3,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (3,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (6);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 6ème ile
      Co := ConstruireCoordonnees (3,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 5
      -- 7ème ile
      Co := ConstruireCoordonnees (5,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 8ème ile
      Co := ConstruireCoordonnees (5,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 9ème ile
      Co := ConstruireCoordonnees (5,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (5);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 10ème ile
      Co := ConstruireCoordonnees (5,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 7
      -- 11ème ile
      Co := ConstruireCoordonnees (7,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 9
      -- 12ème ile
      Co := ConstruireCoordonnees (9,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 13ème ile
      Co := ConstruireCoordonnees (9,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 14ème ile
      Co := ConstruireCoordonnees (9,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- ligne 11
      -- 15ème ile
      Co := ConstruireCoordonnees (11,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 16ème ile
      Co := ConstruireCoordonnees (11,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 17ème ile
      Co := ConstruireCoordonnees (11,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- grille complète
      return (G);
   end Construire_Grille_V6;

   --------------------------
   -- Construire_Grille_V7 --
   --------------------------

   function Construire_Grille_V7 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (13,13);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- Ligne 3
      -- 4ème ile
      Co := ConstruireCoordonnees (3,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 5
      -- 5ème ile
      Co := ConstruireCoordonnees (5,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 6ème ile
      Co := ConstruireCoordonnees (5,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 7ème ile
      Co := ConstruireCoordonnees (5,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);


      -- ligne 7
      -- 8ème ile
      Co := ConstruireCoordonnees (7,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 9ème ile
      Co := ConstruireCoordonnees (7,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 10ème ile
      Co := ConstruireCoordonnees (7,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (7,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 9
      -- 12ème ile
      Co := ConstruireCoordonnees (9,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 13ème ile
      Co := ConstruireCoordonnees (9,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (6);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 14ème ile
      Co := ConstruireCoordonnees (9,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 11
      -- 15ème ile
      Co := ConstruireCoordonnees (11,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

     -- ligne 13
       -- 16ème ile
      Co := ConstruireCoordonnees (13,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 17ème ile
      Co := ConstruireCoordonnees (13,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
        -- 18ème ile
      Co := ConstruireCoordonnees (13,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
     -- grille complète
      return (G);
   end Construire_Grille_V7;

   --------------------------
   -- Construire_Grille_V8 --
   --------------------------

   function Construire_Grille_V8 return Type_Grille is
      G : Type_Grille;
      Co : Type_Coordonnee;
      C : Type_CaseHashi;
      I : Type_Ile;
   begin
      G := ConstruireGrille (11,13);
      -- ligne 1
      -- 1ère ile
      Co := ConstruireCoordonnees (1,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 2nde ile
      Co := ConstruireCoordonnees (1,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 3ème ile
      Co := ConstruireCoordonnees (1,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- Ligne 3
      -- 4ème ile
      Co := ConstruireCoordonnees (3,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 5ème ile
      Co := ConstruireCoordonnees (3,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

            -- ligne 5
      -- 6ème ile
      Co := ConstruireCoordonnees (5,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 7ème ile
      Co := ConstruireCoordonnees (5,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (4);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 8ème ile
      Co := ConstruireCoordonnees (5,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 7
      -- 9ème ile
      Co := ConstruireCoordonnees (7,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 10ème ile
      Co := ConstruireCoordonnees (7,9);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 11ème ile
      Co := ConstruireCoordonnees (7,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 9
      -- 12ème ile
      Co := ConstruireCoordonnees (9,1);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 13ème ile
      Co := ConstruireCoordonnees (9,5);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
       -- 14ème ile
      Co := ConstruireCoordonnees (9,11);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (1);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

      -- ligne 11
      -- 15ème ile
      Co := ConstruireCoordonnees (11,3);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
        -- 16ème ile
      Co := ConstruireCoordonnees (11,7);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (3);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);
      -- 17ème ile
      Co := ConstruireCoordonnees (11,13);
      C  := ConstruireCase (Co);
      I  := ConstruireIle (2);
      C  := modifierIle (C, I);
      G :=  modifierCase (G, C);

     -- grille complète
      return (G);
   end Construire_Grille_V8;

end Remplir_Grille_Hashi;
