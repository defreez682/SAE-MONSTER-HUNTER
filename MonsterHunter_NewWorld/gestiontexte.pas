unit gestionTexte;

{$mode objfpc}{$H+}

interface

{Créer un texte avec un délai entre chaque lettre (minimum : 1), ne pas oublier de préciser la couleur}
procedure texteAtemps(texte : string; temps : integer; couleur : integer);
{Créer un texte en couleur}
procedure texteEnCouleur(texte : string; couleur : integer);
{Créer un texte sur les coordonnées XY,  ne pas oublier de préciser la couleur.}
procedure texteXY(x,y : Integer; texte : string; couleur : integer);

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

procedure texteEnCouleur(texte :string; couleur : integer);
begin
     couleurTexte(couleur);
     write(texte);
end;


procedure texteXY(x,y : Integer; texte : string; couleur : integer);
begin
     couleurTexte(couleur);
     deplacerCurseurXY(x,y);
     write(texte);
end;
end.
