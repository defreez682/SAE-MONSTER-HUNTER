unit Personnage;

{$mode objfpc}{$H+}
{$I-}
interface

procedure miseAjourLVL(valeur : Integer);
function getlvlActuelle() : Integer;

implementation

uses
  Crt, Dos, Classes, SysUtils;

var lvlglobal : Text;


procedure miseAjourLVL(valeur : Integer);
begin
  Assign(lvlglobal,'C:\MHNewWorld\lvl.txt');
  Rewrite(lvlglobal);
  Writeln(lvlglobal,valeur) ;
  Close(lvlglobal);
end;

function getlvlActuelle() : Integer;
var lvl : string;
begin
     Assign(lvlglobal,'C:\MHNewWorld\lvl.txt');
     reset(lvlglobal);
     Readln(lvlglobal,lvl);
     getlvlActuelle := StrToInt(lvl);
     Close(lvlglobal);
end;



end.

