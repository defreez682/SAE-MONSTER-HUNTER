unit combatLogic;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

type joueurstat = RECORD
     hp : Integer;
     Armure : Integer;
     ad : Integer;
     mobilite : Integer;
     end;


// On initialise les dégats du monstre et du joueur
procedure initStat(num : Integer);

// On fait attaquer le monstre
function monstreAttaque() : Integer;
// On fait attaque le joueur
procedure joueurAttaque();

// Principalement utiliser pour les effets de poison ou autre
procedure degatDebutTour(num : Real);
procedure rendreVie(valeur : integer);
procedure utiliserBombeExplo(valeur : integer);

var monstreEnCours : Integer;


    // ----------- Combat -------------

    // Joueur
    HPJoueur : Real;
    ArmureJoueur : Integer;
    AdJoueur : Integer;
    MobiliteJoueur : Integer;
    defenseJoueur : Integer;
    ratioArme : Real;
    skiptour : boolean;
    // Monstre
    HPMonstre : Real;
    ArmureMonstre : Real;
    AdMonstre : Integer;
    HPMonstreMax : Real;

    //fuite
    chancefuite : Integer = 0;

implementation

uses
  Classes, SysUtils,personnage,bestiaireLogic,combatIHM,gestionEcran,gestionTexte,inventaireLogic;


procedure utiliserBombeExplo(valeur : integer);
var esquive,cesquive : integer;
begin
    randomize;
    esquive := random(100) + 1;
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2;

    if (dataJoueur(6) = 1) then
       cesquive := 200;

    if (esquive <= cesquive) then
       HPMonstre := HPMonstre - valeur
    else
        begin
             deplacerCurseurXY(11,15);
             texteAtemps('Le monstre l''esquive !',5,white);
        end;

end;

procedure rendreVie(valeur : integer);
begin
    HPJoueur := HPJoueur + valeur;
    if (HPJoueur > calculHpMaxBase()) then
       HPJoueur := calculHpMaxBase();
end;

procedure initStat(num : Integer);
var i : Integer;
    difficulte : Integer;
    facilerand : Integer;
begin
    randomize;
    monstreEnCours := num;
    facilerand := random(2)+1;

  if (facilerand = 1) then
       facilerand := 1
    else
        facilerand := -1;

    difficulte := random(2);
    //Joueur
    HPJoueur := calculHpMaxBase();
    ArmureJoueur := calculArmureBase() + stuffDispo.invArmureDispo[ItemSlot(66)].defense + stuffDispo.invArmureDispo[ItemSlot(65)].defense + stuffDispo.invArmureDispo[ItemSlot(68)].defense + stuffDispo.invArmureDispo[ItemSlot(69)].defense+ stuffDispo.invArmureDispo[ItemSlot(70)].defense;
    AdJoueur := calculADBase();
    MobiliteJoueur := 100 - (stuffDispo.invArmureDispo[ItemSlot(66)].poids + stuffDispo.invArmureDispo[ItemSlot(65)].poids + stuffDispo.invArmureDispo[ItemSlot(68)].poids + stuffDispo.invArmureDispo[ItemSlot(69)].poids+ stuffDispo.invArmureDispo[ItemSlot(70)].poids + stuffDispo.invArmeDispo[ItemSlot(67)].poids);
    ratioArme := stuffDispo.invArmeDispo[ItemSlot(67)].ratioAD;


    // Monstre


    for i:= 1 to (getlvlActuelle()) do//+(difficulte*facilerand)) do
        begin
          if (i = 1) then
             begin
                  HPMonstre := EnvoyerMonstre(num).hpBase;
                  ArmureMonstre := EnvoyerMonstre(num).armureBase;
                  AdMonstre := EnvoyerMonstre(num).ad;
             end
          else
             begin
                  HPMonstre := HPMonstre + EnvoyerMonstre(num).ratioHP;
                  ArmureMonstre := ArmureMonstre + EnvoyerMonstre(num).ratioArmure;
                  AdMonstre := AdMonstre + EnvoyerMonstre(num).ratioAd;
             end;
        end;
    HPMonstreMax := HPMonstre;

end;


procedure degatDebutTour(num : real);
begin
    HPJoueur := HPJoueur - Int(num*calculHpMaxBase());
end;

function monstreAttaque() : Integer;

var attaque : Integer;
    nattaque : Integer = 0;
    esquive : Integer;
    cesquive : Integer;
begin
    randomize;
    esquive := random(100) + 1;
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2;
    attaque := random(100) + 1;

    if (attaque < EnvoyerMonstre(monstreEnCours).attaque1Chance) then
       nattaque := 1
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque1Chance) and (attaque < EnvoyerMonstre(monstreEnCours).attaque2Chance) then
       nattaque := 2
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque2Chance) and (attaque < EnvoyerMonstre(monstreEnCours).attaque3Chance) then
       nattaque := 3
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque3Chance) then
       nattaque := 4;


    if (esquive <= cesquive) then
       begin

            if (nattaque = 1) then
               HPJoueur := HPJoueur - Int((adMonstre + (adMonstre * EnvoyerMonstre(monstreEnCours).attaque1)) / (1+(Int(ArmureJoueur)/500)));
            if (nattaque = 2) then
               HPJoueur := HPJoueur - Int((adMonstre + (adMonstre * EnvoyerMonstre(monstreEnCours).attaque2)) / (1+(Int(ArmureJoueur)/500)));
            if (nattaque = 3) then
               HPJoueur := HPJoueur - Int((adMonstre + (adMonstre * EnvoyerMonstre(monstreEnCours).attaque3)) / (1+(Int(ArmureJoueur)/500)));
            if (nattaque = 4) then
               HPJoueur := HPJoueur - Int((adMonstre + (adMonstre * EnvoyerMonstre(monstreEnCours).attaque4)) / (1+(Int(ArmureJoueur)/500)));
       end
    else;
    monstreAttaque := nattaque;
end;



procedure joueurAttaque();

var
    esquive : Integer;
    cesquive : Integer;
begin
    randomize;
    esquive := random(100) + 1;
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2;

    if (dataJoueur(6) = 1) then
       cesquive := 0;

    if (esquive >= cesquive) then
       begin
            HPMonstre := HPMonstre - Int((adJoueur + (adJoueur * ratioArme)) / (1+(Int(EnvoyerMonstre(monstreEnCours).armureBase))/500)) + random(10)+1;
            if not (chancefuite >= 40) then
               chancefuite := chancefuite + 4;
       end

    else
        begin
             deplacerCurseurXY(11,14);
             texteATemps('Le monstre a esquive votre attaque !',10,white)
        end;

end;



end.

