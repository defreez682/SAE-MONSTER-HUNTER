unit gestionTexte;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

{Créer un texte avec un délai entre chaque lettre (minimum : 1), ne pas oublier de préciser la couleur}
procedure texteAtemps(texte : string; temps : integer; couleur : integer);
{Créer un texte en couleur}
procedure texteEnCouleur(texte : string; couleur : integer);
{Créer un texte sur les coordonnées XY,  ne pas oublier de préciser la couleur.}
procedure texteXY(x,y : Integer; texte : string; couleur : integer);
{On colorie une zone d'une oculeut spécifié et des coordonnées que l'on veut}
procedure ColorierZoneXY(couleur : Byte ;couleurT : Byte; xStart,yStart,xEnd,yEnd:Integer);
{On créer un texte qui apparait de façon de façon douce et qui disparait de façon douce en fonction du temps donné}
procedure texteFade(x,y : integer; texte : string; temps,temps2 : integer);
implementation

uses
  Classes, SysUtils,GestionEcran;

procedure texteEnCouleur(texte :string; couleur : integer);
begin
     //On ajoute la couleur et on écrit
     couleurTexte(couleur);
     write(texte);
end;


procedure texteAtemps(texte : string; temps : Integer; couleur : integer);
var i : integer;

begin
     // On écrit lettre par lettre en fonction de la longueur du texte
     for i := 1 to Length(texte) do
         begin

             texteEnCouleur(texte[i],couleur);
             // On met en pause le programme pour avoir l'impression que les lettres s'écrivent une par une
             attendre(temps);

         end;
end;



procedure texteXY(x,y : Integer; texte : string; couleur : integer);
begin
     // On ajoute la couleur, on déplace le curseur et on écrit
     couleurTexte(couleur);
     deplacerCurseurXY(x,y);
     write(texte);
end;



procedure texteFade(x,y : integer; texte : string; temps,temps2 : integer);
begin
     texteXY(x,y,texte,darkGray); // On écrit le texte en gris foncé
     attendre(temps); // On attend
     texteXY(x,y,texte,LightGray); // On écrit en gris clair
     attendre(temps); // On attend
     texteXY(x,y,texte,White); // On écrit en blanc
     attendre(temps2); // On attend avant de faire disparaitre
     texteXY(x,y,texte,LightGray); // On écrit en gris clair
     attendre(temps);
     texteXY(x,y,texte,darkGray); // On écrit le texte en gris foncé
     attendre(temps);
     texteXY(x,y,texte,Black); // On le fait disparaitre en écrivant en noir
     attendre(temps);
end;
procedure ColorierZoneXY(couleur : Byte ;couleurT : Byte; xStart,yStart,xEnd,yEnd:Integer);
var
   i: integer;
begin
  // On trace la zone en fonction de ystart et yend
  for i := yStart to yEnd do
      ColorierZone(couleur, couleurT, xStart,xEnd,i);
end;

end.
