unit combatIHM;

{$mode objfpc}{$H+}

interface

procedure introduction(num : integer);

implementation
uses
  Classes, SysUtils,chasseIHM,bestiaireLogic,gestionEcran,GestionTexte,Personnage;

var monstreactuelle : Integer;

procedure introduction(num : integer);
begin
    monstreactuelle := num;
    effacerEcran();
    attendre(500);
    texteFade(60-15,15,'Vous entendez un rugissement...',100,1500);
    deplacerCurseurXY(60-13,15);
    texteAtemps('Vous vous approchez',100,LightRed);
    deplacerCurseurXY(66,15);
    texteAtemps('......',500,Red);
    effacerEcran();
    attendre(1000);
    texteFade(60-(Length(envoyerMonstre(num).nom) div 2),15,envoyerMonstre(num).nom,100,2000);
    texteFade(60-(Length(envoyerMonstre(num).description) div 2),15,envoyerMonstre(num).description,100,3000);
    readln();
end;

end.
