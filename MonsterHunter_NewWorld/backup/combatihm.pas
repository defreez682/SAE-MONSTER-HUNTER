unit combatIHM;

{$mode objfpc}{$H+}

interface

procedure introduction(num : integer);
procedure combatQFQ();

implementation
uses
  Classes, SysUtils,bestiaireLogic,gestionEcran,GestionTexte,Personnage,combatLogic,chasseIHM;

var monstreactuelle : Integer = 1;



procedure introduction(num : integer);
begin
    monstreactuelle := num;
    effacerEcran();
    attendre(500);
    texteFade(60-15,15,'Vous entendez un rugissement...',100,1500);
    deplacerCurseurXY(60-13,15);
    texteAtemps('Vous vous approchez',100,LightRed);
    deplacerCurseurXY(66,15);
    texteAtemps('......',150,Red);
    effacerEcran();
    attendre(800);
    texteFade(60-(Length(envoyerMonstre(num).nom) div 2),15,envoyerMonstre(num).nom,100,2000);
    texteFade(60-(Length(envoyerMonstre(num).description) div 2),15,envoyerMonstre(num).description,100,3000);
    initStat(monstreactuelle);
    combatQFQ();
end;


procedure combatQFQ();
var cho: Integer;
    fuitechasse : Integer;
    cmb : Boolean = False;
    a : Integer;
begin
   effacerEcran();
   //randomize;
   texteXY(0,1,'HPJoueur : ',White);
   texteEnCouleur(FloatToStrF(HPJoueur,fffixed,1,0),White);
   texteXY(0,2,'ArmureJoueur : ',White);
   texteEnCouleur(IntToStr(ArmureJoueur),White);
   texteXY(0,3,'AdJoueur : ',White);
   texteEnCouleur(IntToStr(AdJoueur),White);
   texteXY(0,4,'MobiliteJoueur : ',White);
   texteEnCouleur(IntToStr(MobiliteJoueur),White);
   texteXY(0,5,'____________________________',White);
   // Monstre
   texteXY(0,6,'HPMonstre : ',White);
   texteEnCouleur(FloatToStrF(HPMonstre,fffixed,1,0),White);
   texteXY(0,7,'ArmureMonstre : ',White);
   texteEnCouleur(FloatToStrF(ArmureMonstre,fffixed,1,0),White);
   texteXY(0,8,'AdMonstre : ',White);
   texteEnCouleur(IntToStr(AdMonstre),White);

   cmb := True;
   while (cmb = True) do
         begin
             writeln();
             write('Votre choix : ');
             readln(cho);
             if (cho = 1) then
             begin
                  fuitechasse := random(100)+1;
                  if (fuitechasse >= chancefuite) then
                      begin
                           joueurAttaque();
                           writeln('HPMonstre : ',Int(HPMonstre):2:0);
                           writeln('_____________________________')
                      end
                  else
                      begin
                           fuite := True;
                           deplacementJoueur();
                      end;
             end;

             a := monstreAttaque();
             writeln('Attaque : ',a);
             writeln('HPJoueur : ',Int(HPJoueur):2:0);
             writeln('_____________________________');

             if (Int(HPJoueur) <= 0) or (Int(HPMonstre) <= 0) then
             begin
                 if (Int(HPJoueur) <= 0) then
                     writeln('Gagne !')
                 else
                     writeln('Perdu !');
                 readln();
                 cmb := False;
             end;

         end;
end;



end.

