unit gestionTexte;

{$mode objfpc}{$H+}

interface

{Créer un texte qui s'affiche lettre par lettre en fonction d'un intervalle de temps
en millisecondes}
procedure texteAtemps(texte : string; temps : integer; couleur : integer);

implementation

uses
  Classes, SysUtils,GestionEcran;



procedure texteAtemps(texte : string; temps : Integer; couleur : integer);
var i : integer;

begin
     // On écrit lettre par lettre en fonction de la longueur du texte
     for i := 1 to Length(texte) do
         begin

             couleurTexte(couleur);
             write(texte[i]);
             // On met en pause le programme pour avoir l'impression que les lettres s'écrivent une par une
             attendre(temps);

         end;
end;

end.
