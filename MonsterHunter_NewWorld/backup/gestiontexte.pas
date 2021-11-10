unit gestionTexte;

{$mode objfpc}{$H+}

interface

{Créer un texte qui s'affiche lettre par lettre en fonction d'un intervalle de temps
en millisecondes}
procedure texteAtemps(text : string; temps : integer);

implementation

uses
  Classes, SysUtils, GestionEcran;



procedure texteAtemps(text : string; temps : Integer);
var i : integer;

begin
     // On écrit lettre par lettre en fonction de la longueur du texte
     for i := 1 to Length(text) do
         begin

             write(text[i]);
             // On met en pause le programme pour avoir l'impression que les lettres s'écrivent une par une
             attendre(temps);

         end;
end;

end.

