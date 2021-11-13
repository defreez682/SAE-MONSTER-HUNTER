unit Personnage;

{$mode objfpc}{$H+}
{$I-}
interface

// Lvl

procedure miseAjourLVL(valeur : Integer);

function getlvlActuelle() : Integer;

// Exp

procedure miseAjourExp(valeur : Integer);

function getExpActuelle() : Integer;

procedure verifLvlUp();

function calculLvlSuivant() : Integer;

// Or

procedure miseAjourOr(valeur : Integer);

function getOrActuelle() : Integer;

// Stats de base

function calculHpMaxBase() : Integer;

function calculArmureBase() : Integer;

function calculADBase() : Integer;



// Création personnage
procedure miseAjourPersonnage (valeur : integer);

function getPersonnageActuelle () : String;

procedure miseAjourNom(valeur : String);

function getNomActuelle() : String;

procedure miseAjourSexe(valeur : String);

function getSexeActuelle() : String;

procedure miseAjourTaille(valeur : integer);

function getTailleActuelle() : Integer;


implementation

uses
    Dos, Classes, SysUtils;

var lvlglobal : Text;
    lvlexp : Text;
    Orglobal : Text;
    Nomact  : Text;
    Sexeact : Text;
    Tailleact : Text;
    Personnageglobal : Text;


//________________________________________________ Zone Lvl
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


//________________________________________________ Zone EXP
procedure miseAjourExp(valeur : Integer);
begin
  Assign(lvlexp,'C:\MHNewWorld\lvlexp.txt');
  Rewrite(lvlexp);
  Writeln(lvlexp,valeur) ;
  Close(lvlexp);
end;

function getExpActuelle() : Integer;
var exp : string;
begin
     Assign(lvlexp,'C:\MHNewWorld\lvlexp.txt');
     reset(lvlexp);
     Readln(lvlexp,exp);
     getExpActuelle := StrToInt(exp);
     Close(lvlexp);
end;

function calculLvlSuivant() : Integer;
begin
     calculLvlSuivant := 900+100*getlvlActuelle();
end;

procedure verifLvlUp();
begin
     if (getExpActuelle() >= calculLvlSuivant()) then
        begin
              miseAjourLVL(getlvlActuelle()+1);
              miseAjourExp(0+getExpActuelle()-(calculLvlSuivant()-100));
        end;
end;

//________________________________________________ Zone Or

procedure miseAjourOr(valeur : Integer);
begin
  Assign(Orglobal,'C:\MHNewWorld\Or.txt');
  Rewrite(Orglobal);
  Writeln(Orglobal,valeur) ;
  Close(Orglobal);
end;

function getOrActuelle() : Integer;
var oract : string;
begin
     Assign(Orglobal,'C:\MHNewWorld\Or.txt');
     reset(Orglobal);
     Readln(Orglobal,oract);
     getOrActuelle := StrToInt(oract);
     Close(Orglobal);
end;


//_________________________________________________ Zone des stats de bas

function calculHpMaxBase() : Integer;
begin
    calculHpMaxBase := 300+(10*getlvlActuelle());
end;

function calculArmureBase() : Integer;
begin
    calculArmureBase := 30+(4*getlvlActuelle());
end;

function calculADBase() : Integer;
begin
    calculADBase := 75+(5*getlvlActuelle());
end;

//__________________________________________________ Création personnage

procedure miseAjourPersonnage(valeur : String);
begin
  Assign(Personnageglobal,'C:\MHNewWorld\personnage.txt');
  Rewrite(Personnageglobal);
  Writeln(Personnageglobal,valeur) ;
  Close(Personnageglobal);
end;

function getPersonnageActuelle() : String;
var personnage : string;
begin
     Assign(Personnageglobal,'C:\MHNewWorld\personnage.txt');
     reset(Personnageglobal);
     Readln(Personnageglobal,personnage);
     getPersonnageActuelle := personnage;
     Close(Personnageglobal);
end;

procedure miseAjourNom(valeur : String);
begin
  Assign(Nomact,'C:\MHNewWorld\nom.txt');
  Rewrite(Nomact);
  Writeln(Nomact,valeur) ;
  Close(Nomact);
end;

function getNomActuelle() : String;
var nom : string;
begin
     Assign(Nomact,'C:\MHNewWorld\nom.txt');
     reset(Nomact);
     Readln(Nomact,nom);
     getNomActuelle := nom;
     Close(Nomact);
end;

procedure miseAjourSexe(valeur : String);
begin
  Assign(Sexeact,'C:\MHNewWorld\sexe.txt');
  Rewrite(Sexeact);
  Writeln(Sexeact,valeur) ;
  Close(Sexeact);
end;

function getSexeActuelle() : String;
var sexe : string;
begin
     Assign(Sexeact,'C:\MHNewWorld\sexe.txt');
     reset(Sexeact);
     Readln(Sexeact,sexe);
     getSexeActuelle := sexe;
     Close(Sexeact);
end;

procedure miseAjourTaille(valeur : integer);
begin
  Assign(Tailleact,'C:\MHNewWorld\taille.txt');
  Rewrite(Tailleact);
  Writeln(Tailleact,valeur);
  Close(Tailleact);
end;

function getTailleActuelle() : Integer;
var taille : string;
begin
     Assign(Tailleact,'C:\MHNewWorld\taille.txt');
     reset(Tailleact);
     Readln(Tailleact,taille);
     getTailleActuelle := StrToInt(taille);
     Close(Tailleact);
end;

end.

