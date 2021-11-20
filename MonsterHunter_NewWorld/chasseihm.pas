unit chasseIHM;

{$mode objfpc}{$H+}

interface

procedure creationFuiteInterface();
procedure deplacementJoueur();

implementation

uses
  Classes, SysUtils,gestionTexte,GestionEcran,crtPerso;




procedure creationFuiteInterface();
var Orange : Integer = 150;
begin
      dessinerCadreXY(33,3,85,27,double, White,Black);
      texteXY(35,5,'                    _____',White);
      texteXY(35,6,'                   /.....\',White);
      texteXY(35,7,'               ___|.......\',White);
      texteXY(35,8,'              /............\',White);
      texteXY(35,9,'          ___/',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('.............\',White);
      texteXY(35,10,'        /.....',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('......',White);
      texteEnCouleur('2',LightRed);
      texteEnCouleur('......|________',White);
      texteXY(35,11,'    ___/.......',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('.........\___',White);
      texteXY(35,12,'   /...........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...',White);
      texteEnCouleur('4',LightRed);
      texteEnCouleur('......',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...\',White);
      texteXY(35,13,'  /.............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('.....\',White);
      texteXY(35,14,' /...............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('....',White);
      texteEnCouleur('**************',Orange);
      texteEnCouleur('.......\',White);
      texteXY(35,15,'|.................',White);
      texteEnCouleur('****',Orange);
      texteEncouleur('...........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..........\',White);
      texteXY(35,16,' \.......',White);
      texteEnCouleur('1',LightRed);
      texteEnCouleur('.........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('.............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('....',White);
      texteEnCouleur('5',LightRed);
      texteEnCouleur('...../',White);
      texteXY(35,17,'  \...............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..........\',White);
      texteXY(35,18,'   |.............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...........\',White);
      texteXY(35,19,'    \...........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('........',White);
      texteEnCouleur('3',LightRed);
      texteEnCouleur('........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('....',White);
      texteEnCouleur('*******',Orange);
      texteEnCouleur('\',White);
      texteXY(35,20,'     |.........',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('...............',White);
      texteEnCouleur('********',Orange);
      texteEnCouleur('........\',White);
      texteXY(35,21,'      \_______|___............',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('................/',White);
      texteXY(35,22,'                  \........',White);
      texteEnCouleur('***',Orange);
      texteEnCouleur('................ \',White);
      texteXY(35,23,'                   \......',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('..........',White);
      texteEnCouleur('6',LightRed);
      texteEnCouleur('.......__/',White);
      texteXY(35,24,'                    \____',White);
      texteEnCouleur('*',Orange);
      texteEnCouleur('................../',White);
      texteXY(35,25,'                         \_________________/',White);
end;


procedure deplacementJoueur();
var x : integer = 60;
    y : integer = 15;
    ox : integer = 61;
    oy : integer = 16;
    cho : boolean = True;
    ch : Char;

begin
     creationFuiteInterface();
     while (cho= True) do
           begin
               ch := ReadKey;
               case ch of
                   #80 :
                     begin // Haut
                         y := y + 1;
                     end;
                   #72 :
                     begin // Bas
                         y := y - 1;
                     end;
                   #77 :
                     begin // Droite
                         x := x + 1;
                     end;
                   #75 : // Gauche
                     begin
                         x := x - 1;

                     end;
               end;

               texteXY(x,y,'X',LightBlue)
           end;
end;

end.

