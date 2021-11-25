unit Personnage;

{$mode objfpc}{$H+}
{$I-}
interface
uses
    inventaireLogic;


var
personnage1:typePersonnage;
// Lvl

{Modifie le fichier LVL ce qui permet de mettre à jour le lvl du joueur.}
procedure miseAjourLVL(var personnageAct:typePersonnage;valeur : Integer);
{Renvoie le niveau actuelle du joueur contenu dans son fichier}
function getlvlActuelle(personnageAct:typePersonnage) : Integer;

// Exp

{Modifie le fichier exp ce qui permet de mettre à jour l’EXP du joueur.}
procedure miseAjourExp(var personnageAct:typePersonnage;valeur : Integer);
{Renvoie l’exp actuelle du joueur contenu dans son fichier}
function getExpActuelle(personnageAct:typePersonnage) : Integer;
{Vérifie si le joueur à passer un niveau, s’il a passé un niveau, le passe automatiquement}
procedure verifLvlUp();
{Calcule l’exp nécessaire pour le niveau suivant}
function calculLvlSuivant() : Integer;

// Or

{Modifie le fichier or ce qui permet de mettre à jour l’or du joueur. }
procedure miseAjourOr(var personnageAct:typePersonnage;valeur : Integer);
{Renvoie l’or actuelle du joueur contenu dans son fichier}
function getOrActuelle(personnageAct:typePersonnage) : Integer;

// Stats de base

{Calcule les hpmax du joueur}
function calculHpMaxBase() : Integer;
{Calcule l’armure de base du joueur }
function calculArmureBase() : Integer;
{Calcule l'AD de base du joueur}
function calculADBase() : Integer;



// Création personnage

{Modifie le fichier personnage ce qui permet de vérifier si le joueur à un personnage.
On utilise 0 et 1 (0 -> il n’a pas de personnage, 1 ->  il a un personnage)}
procedure miseAjourPersonnage (var personnageAct:typePersonnage;valeur : integer);
{Renvoie si le joueur à un personnage (0 -> il n’a pas, 1 -> il a)}
function getPersonnageActuelle (personnageAct:typePersonnage) : String;
{Modifie le fichier nom qui contient le nom du joueur}
procedure miseAjourNom(var personnageAct:typePersonnage;valeur : String);
{Renvoie le nom actuelle du joueur contenu dans son fichier}
function getNomActuelle(personnageAct:typePersonnage) : String;
{Modifie le fichier sexe qui contient le sexe du joueur}
procedure miseAjourSexe(var personnageAct:typePersonnage;valeur : String);
{Renvoie le sexe actuelle du joueur contenu dans son fichier}
function getSexeActuelle(personnageAct:typePersonnage) : String;
{Modifie le fichier taille qui contient la taille du joueur}
procedure miseAjourTaille(var personnageAct:typePersonnage;valeur : integer);
{Renvoie la taille actuelle du joueur contenu dans son fichier}
function getTailleActuelle(personnageAct:typePersonnage) : Integer;

//--------------------------- CREATION INVENTAIRE ------------------------------

// Creation d'un inventaire pour un joueur
procedure creationInventaire(var personnage:typePersonnage);

// Remplie tout l'inventaire de '0'
procedure initialisationInventaireVide( var personnage:typePersonnage);

// Ajout du stuff de départ
procedure ajoutStuffDepart(var personnage:typePersonnage);




implementation

uses
    Dos, Classes, SysUtils;



//________________________________________________ Zone Lvl
procedure miseAjourLVL(var personnageAct:typePersonnage;valeur : Integer);
begin
  Assign(personnageAct.lvlglobal,'C:\MHNewWorld\lvl.txt');
  Rewrite(personnageAct.lvlglobal);
  Writeln(personnageAct.lvlglobal,valeur) ;
  Close(personnageAct.lvlglobal);
end;

function getlvlActuelle(personnageAct:typePersonnage) : Integer;
var lvl : string;
begin
     Assign(personnageAct.lvlglobal,'C:\MHNewWorld\lvl.txt');
     reset(personnageAct.lvlglobal);
     Readln(personnageAct.lvlglobal,lvl);
     getlvlActuelle := StrToInt(lvl);
     Close(personnageAct.lvlglobal);
end;


//________________________________________________ Zone EXP
procedure miseAjourExp(var personnageAct:typePersonnage;valeur : Integer);
begin
  Assign(personnageAct.lvlexp,'C:\MHNewWorld\lvlexp.txt');
  Rewrite(personnageAct.lvlexp);
  Writeln(personnageAct.lvlexp,valeur) ;
  Close(personnageAct.lvlexp);
end;

function getExpActuelle(personnageAct:typePersonnage) : Integer;
var exp : string;
begin
     Assign(personnageAct.lvlexp,'C:\MHNewWorld\lvlexp.txt');
     reset(personnageAct.lvlexp);
     Readln(personnageAct.lvlexp,exp);
     getExpActuelle := StrToInt(exp);
     Close(personnageAct.lvlexp);
end;

function calculLvlSuivant() : Integer;
begin
     calculLvlSuivant := 900+100*getlvlActuelle(personnage1);
end;

procedure verifLvlUp();
begin
     if (getExpActuelle(personnage1) >= calculLvlSuivant()) then
        begin
              miseAjourLVL(personnage1,getlvlActuelle(personnage1)+1);
              miseAjourExp(personnage1,0+getExpActuelle(personnage1)-(calculLvlSuivant()-100));
        end;
end;

//________________________________________________ Zone Or

procedure miseAjourOr(var personnageAct:typePersonnage;valeur : Integer);
begin
  Assign(personnageAct.orActuel,'C:\MHNewWorld\Or.txt');
  Rewrite(personnageAct.orActuel);
  Writeln(personnageAct.orActuel,valeur) ;
  Close(personnageAct.orActuel);
end;

function getOrActuelle(personnageAct:typePersonnage) : Integer;
var oract : string;
begin
     Assign(personnageAct.orActuel,'C:\MHNewWorld\Or.txt');
     reset(personnageAct.orActuel);
     Readln(personnageAct.orActuel,oract);
     getOrActuelle := StrToInt(oract);
     Close(personnageAct.orActuel);
end;


//_________________________________________________ Zone des stats de bas

function calculHpMaxBase() : Integer;
begin
    calculHpMaxBase := 300+(10*getlvlActuelle(personnage1));
end;

function calculArmureBase() : Integer;
begin
    calculArmureBase := 30+(4*getlvlActuelle(personnage1));
end;

function calculADBase() : Integer;
begin
    calculADBase := 75+(5*getlvlActuelle(personnage1));
end;

//__________________________________________________ Création personnage

procedure miseAjourPersonnage(var personnageAct:typePersonnage;valeur : integer);
begin
  Assign(personnageAct.existe,'C:\MHNewWorld\personnage.txt');
  Rewrite(personnageAct.existe);
  Writeln(personnageAct.existe,valeur) ;
  Close(personnageAct.existe);
end;

function getPersonnageActuelle(personnageAct:typePersonnage) : String;
var
  personnage : string;
begin
     Assign(personnageAct.existe,'C:\MHNewWorld\personnage.txt');
     reset(personnageAct.existe);
     Readln(personnageAct.existe,personnage);
     getPersonnageActuelle := personnage;
     Close(personnageAct.existe);
end;

procedure miseAjourNom(var personnageAct:typePersonnage;valeur : String);
begin
  Assign(personnageAct.pseudo,'C:\MHNewWorld\nom.txt');
  Rewrite(personnageAct.pseudo);
  Writeln(personnageAct.pseudo,valeur) ;
  Close(personnageAct.pseudo);
end;

function getNomActuelle(personnageAct:typePersonnage) : String;
var nom : string;
begin
     Assign(personnageAct.pseudo,'C:\MHNewWorld\nom.txt');
     reset(personnageAct.pseudo);
     Readln(personnageAct.pseudo,nom);
     getNomActuelle := nom;
     Close(personnageAct.pseudo);
end;

procedure miseAjourSexe(var personnageAct:typePersonnage;valeur : String);
begin
  Assign(personnageAct.sexe,'C:\MHNewWorld\sexe.txt');
  Rewrite(personnageAct.sexe);
  Writeln(personnageAct.sexe,valeur) ;
  Close(personnageAct.sexe);
end;

function getSexeActuelle(personnageAct:typePersonnage) : String;
var sexe : string;
begin
     Assign(personnageAct.sexe,'C:\MHNewWorld\sexe.txt');
     reset(personnageAct.sexe);
     Readln(personnageAct.sexe,sexe);
     getSexeActuelle := sexe;
     Close(personnageAct.sexe);
end;

procedure miseAjourTaille(var personnageAct:typePersonnage;valeur : integer);
begin
  Assign(personnageAct.taille,'C:\MHNewWorld\taille.txt');
  Rewrite(personnageAct.taille);
  Writeln(personnageAct.taille,valeur);
  Close(personnageAct.taille);
end;

function getTailleActuelle(personnageAct:typePersonnage) : Integer;
var taille : string;
begin
     Assign(personnageAct.taille,'C:\MHNewWorld\taille.txt');
     reset(personnageAct.taille);
     Readln(personnageAct.taille,taille);
     getTailleActuelle := StrToInt(taille);
     Close(personnageAct.taille);
end;

// Creation d'un inventaire pour un joueur
procedure creationInventaire(var personnage:typePersonnage);
begin
     initialisationInventaireVide(personnage);
end;

// Remplie tout l'inventaire de 'EMPTY'
procedure initialisationInventaireVide( var personnage:typePersonnage);
var
  i:Integer;
  j:integer;
begin

     for i:=0 to 4 do
         begin
         for j:=0 to 3 do
             begin
              personnage.inventaire.invArme[i][j].nomArme:='EMPTY';
              personnage.inventaire.invArmure[i][j].nomArmure:='EMPTY';
              personnage.inventaire.invDrop[i][j].nomDrop:='EMPTY';

             end;
         end;
     for i:= 1 to 10 do
         begin
              personnage.inventaire.invPotion[i].nomPotion:='EMPTY';
              personnage.inventaire.invBombe[i].nomBombe:='EMPTY';
              personnage.inventaire.invCuisine[i].nomPlat:='EMPTY';
         end;
     j:=0;
     for i:= 1 to 2 do
         begin
         for j:=0 to 2 do
             begin
              personnage.inventaire.ArmureEquipee[i][j].nomArmure:='EMPTY';

              end;
         end;
     personnage.inventaire.ArmeEquipee.nomArme:='EMPTY';



end;

// Ajout du stuff de départ
procedure ajoutStuffDepart(var personnage:typePersonnage);
begin
end;

end.

