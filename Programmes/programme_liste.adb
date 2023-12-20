with Ada.Text_IO; use Ada.Text_IO;

procedure Programme_Liste is

   -- Déclaration d'un type enregistrement pour les éléments de la liste
   type Element is record
      Valeur : Integer;
      Suivant : access Element;
   end record;

   -- Déclaration du type pointeur pour l'enregistrement
   type Ptr_Element is access Element;

   -- Fonction pour afficher les éléments de la liste
   procedure Afficher_Liste(L : Ptr_Element) is
   begin
      while L /= null loop
         Put(L.Valeur'Image & " ");
         L := L.Suivant;
      end loop;
      New_Line;
   end Afficher_Liste;

   -- Procédure pour multiplier chaque élément de la liste par un facteur
   procedure Multiplier_Liste(L : in out Ptr_Element; Facteur : Integer) is
      Actuel : Ptr_Element := L;
   begin
      while Actuel /= null loop
         Actuel.Valeur := Actuel.Valeur * Facteur;
         Actuel := Actuel.Suivant;
      end loop;
   end Multiplier_Liste;

   -- Fonction pour calculer la somme des éléments de la liste
   function Somme_Liste(L : Ptr_Element) return Integer is
      Total : Integer := 0;
   begin
      while L /= null loop
         Total := Total + L.Valeur;
         L := L.Suivant;
      end loop;
      return Total;
   end Somme_Liste;

   -- Programme principal
   Liste : Ptr_Element := new Element'(Valeur => 1, Suivant => new Element'(Valeur => 2, Suivant => new Element'(Valeur => 3, Suivant => new Element'(Valeur => 4, Suivant => new Element'(Valeur => 5, Suivant => null)))));
   Facteur : constant Integer := 2;
   Total : Integer;

begin
   Put_Line("Liste originale :");
   Afficher_Liste(Liste);

   Put_Line("Liste multipliée par " & Facteur'Image & " :");
   Multiplier_Liste(Liste, Facteur);
   Afficher_Liste(Liste);

   Total := Somme_Liste(Liste);
   Put_Line("Somme des éléments de la liste : " & Total'Image);
end Programme_Liste;
