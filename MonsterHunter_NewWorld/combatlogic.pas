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


// On initialise les stats du monstre et du joueur
procedure initStat(num : Integer);

// On fait attaquer le monstre
function monstreAttaque() : Integer;
// On fait attaque le joueur
procedure joueurAttaque();

// Principalement utiliser pour les effets de poison ou autre
procedure degatDebutTour(num : Real);

// Procedure qui rend de la vie,  utiliser pour les potions
procedure rendreVie(valeur : integer);

// Procedure qui fonctionne comme une attaque mais qui ignore l'armure du monstre
// et qui a une valeur fixe. Utiliser par les bombes de l'inventaire.
procedure utiliserBombeExplo(valeur : integer);

var monstreEnCours : Integer;


    // ----------- Combat -------------

    // Joueur
    HPJoueur : Real;  // La vie du joeur
    ArmureJoueur : Integer; // L'armure du joueur
    AdJoueur : Integer; // Les dégats du joueur
    MobiliteJoueur : Integer; // La mobilité du joueur
    ratioArme : Real; // ratio qui augmente les dégats du joueur en fonction de l'arme
    // Monstre
    HPMonstre : Real; // points de vie du monstre
    ArmureMonstre : Real; //  Armure du monstre
    AdMonstre : Integer; // Dégat du monstre
    HPMonstreMax : Real; // Point de vie maximum du monstre

    //fuite
    chancefuite : Integer = 0;

implementation

uses
  Classes, SysUtils,personnage,bestiaireLogic,gestionEcran,gestionTexte,inventaireLogic;


procedure utiliserBombeExplo(valeur : integer);
var esquive,cesquive : integer;
begin
    randomize;
    esquive := random(100) + 1;
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2;  // On calcule la chance d'esquive en fonction de la mobilite du joueur et du monstre

    if (dataJoueur(6) = 1) then
       cesquive := 200;   // Si la bombe flash est activé, la prochaine attaque touche.

    if (esquive <= cesquive) then
       HPMonstre := HPMonstre - valeur  // retire les hp au monstre si l'attaque passe
    else
        begin
             deplacerCurseurXY(11,15);
             texteAtemps('Le monstre l''esquive !',5,white);   // sinon on annonce l'esquive
        end;

end;

procedure rendreVie(valeur : integer);
begin
    HPJoueur := HPJoueur + valeur;  // On rend la vie
    if (HPJoueur > calculHpMaxBase()) then  // Si les hp sont supérieur à ceux maximum autorisé, alors on les maintients au maximum
       HPJoueur := calculHpMaxBase();
end;

procedure initStat(num : Integer);
var i : Integer;  // Compteur
    difficulte : Integer; // On ajoute une difficulte
    facilerand : Integer; // On regarde si la difficulte sera plus facile ou plus dur
begin
    randomize;
    monstreEnCours := num;
    facilerand := random(2)+1;

  if (facilerand = 1) then
       facilerand := 1 // Le combat sera plus simple
    else
        facilerand := -1; // Le combat sera normal ou plus dur

    difficulte := random(2); // On choisis une variable pour savoir le nombre de lvl qu'aura le monstre
    //Joueur
    // On calcule les différents stats du joueur
    HPJoueur := dataJoueur(13);
    ArmureJoueur := (calculArmureBase() + stuffDispo.invArmureDispo[ItemSlot(66)].defense + stuffDispo.invArmureDispo[ItemSlot(65)].defense + stuffDispo.invArmureDispo[ItemSlot(68)].defense + stuffDispo.invArmureDispo[ItemSlot(69)].defense+ stuffDispo.invArmureDispo[ItemSlot(70)].defense) + (dataJoueur(7)+dataJoueur(11));
    AdJoueur := calculADBase() + (dataJoueur(8)+dataJoueur(9));
    MobiliteJoueur := 100 - trunc(((stuffDispo.invArmureDispo[ItemSlot(66)].poids + stuffDispo.invArmureDispo[ItemSlot(65)].poids + stuffDispo.invArmureDispo[ItemSlot(68)].poids + stuffDispo.invArmureDispo[ItemSlot(69)].poids+ stuffDispo.invArmureDispo[ItemSlot(70)].poids + stuffDispo.invArmeDispo[ItemSlot(67)].poids) - (dataJoueur(10)+dataJoueur(12))) div 2);
    ratioArme := stuffDispo.invArmeDispo[ItemSlot(67)].ratioAD;


    // Monstre

    // On calcul les stats du monstre en fonction du level du joueur et de la difficulté
    for i:= 1 to (getlvlActuelle()) +(difficulte*facilerand) do
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
    HPJoueur := HPJoueur - Int(num*calculHpMaxBase()); // On enlève des dégats en fonction des HP max
end;

function monstreAttaque() : Integer;

var attaque : Integer; // Permet de choisir au hasard l'attaque du monstre
    nattaque : Integer = 0; // Contient l'attaque du monstre
    esquive : Integer; // Permet de savoir la chance d'esquiver
    cesquive : Integer; // Chance d'esquive en fonction de la mobilite du monstre et du joueur
begin
    randomize;
    esquive := random(100) + 1;
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2; // On calcul la chance d'equiver
    attaque := random(100) + 1;

    if (attaque < EnvoyerMonstre(monstreEnCours).attaque1Chance) then  // en fonction du % de chance de l'attaque et du resultat de attaque, on choisit l'attaque du monstre
       nattaque := 1
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque1Chance) and (attaque < EnvoyerMonstre(monstreEnCours).attaque2Chance) then
       nattaque := 2
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque2Chance) and (attaque < EnvoyerMonstre(monstreEnCours).attaque3Chance) then
       nattaque := 3
    else if (attaque >= EnvoyerMonstre(monstreEnCours).attaque3Chance) then
       nattaque := 4;


    if (esquive <= cesquive) then
       begin
            // On applique les dégats en fonction de l'attaque.
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
    cesquive := (EnvoyerMonstre(monstreEnCours).mobilite + (MobiliteJoueur div 2)) div 2;  // On regarde la chance d'equive

    if (dataJoueur(6) = 1) then  // Si la bombe flash est utilisé, la prochaine attaque touche
       cesquive := 0;

    if (esquive >= cesquive) then
       begin
            // On applique les dégats au monstre
            HPMonstre := HPMonstre - Int((adJoueur + (adJoueur * ratioArme)) / (1+(Int(EnvoyerMonstre(monstreEnCours).armureBase))/500)) + random(10)+1;
            if not (chancefuite >= 20) then // On augmente les chances de fuite du monstre à chaque attaque, on la maintient
               chancefuite := chancefuite + 2;
       end

    else
        begin
             deplacerCurseurXY(11,14);
             texteATemps('Le monstre a esquive votre attaque !',10,white) // Si l'attaque n'atteint pas on l'annonce
        end;

end;



end.

