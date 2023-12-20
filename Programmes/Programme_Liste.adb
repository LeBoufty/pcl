with Ada.Text_IO;use Ada.Text_IO;

procedure Programme_Liste is

   -- Déclaration d'un type tableau (liste) d'entiers
   type Liste_Entiers is array (Positive range <>) of Integer;

   -- Fonction pour afficher les éléments de la liste
   procedure Afficher_Liste(L : Liste_Entiers) is
   begin
      for I in L'Range loop
         Put(L(I)'Image & " ");
      end loop;
      New_Line;
   end Afficher_Liste;

   -- Fonction pour multiplier chaque élément de la liste par un facteur
   function Multiplier_Liste(L : Liste_Entiers; Facteur : Integer) return Liste_Entiers is
      Resultat : Liste_Entiers := L;
   begin
      for I in Resultat'Range loop
         Resultat(I) := Resultat(I) * Facteur;
      end loop;
      return Resultat;
   end Multiplier_Liste;

   -- Fonction pour calculer la somme des éléments de la liste
   function Somme_Liste(L : Liste_Entiers) return Integer is
      Total : Integer := 0;
   begin
      for I in L'Range loop
         Total := Total + L(I);
      end loop;
      return Total;
   end Somme_Liste;

   -- Programme principal
   Liste : Liste_Entiers := (1, 2, 3, 4, 5);
   Facteur : constant Integer := 2;
   Total : Integer;

begin
   Put_Line("Liste originale :");
   Afficher_Liste(Liste);

   Put_Line("Liste multipliée par " & Facteur'Image & " :");
   Liste := Multiplier_Liste(Liste, Facteur);
   Afficher_Liste(Liste);

   Total := Somme_Liste(Liste);
   Put_Line("Somme des éléments de la liste : " & Total'Image);
end Programme_Liste;
