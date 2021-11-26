unit forgeronIHM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, GestionTexte, crtPerso, villageIHM, inventaireLogic, personnage;

procedure ForgeronDesignIHM();
procedure ForgeronCadreIHM();
procedure ChoixForgeron();
procedure ForgerArmeIHM();
procedure ChoixForgerArme();
procedure ForgerArmureIHM();

implementation

// ------------------------------------------------------ Apparence du Forgeron
procedure ForgeronDesignIHM();
begin

    deplacerCurseurXY(40,3);
    writeln('=');
    deplacerCurseurXY(40,4);
    writeln('===');
    deplacerCurseurXY(40,5);
    writeln(' ===');
    deplacerCurseurXY(40,6);
    writeln('  ===');
    deplacerCurseurXY(40,7);
    writeln('   ===');
    deplacerCurseurXY(40,8);
    writeln('    ===                    :=<]');
    deplacerCurseurXY(40,9);
    writeln('     ===          *__       /');
    deplacerCurseurXY(40,10);
    writeln('     ===         (__/      e');
    deplacerCurseurXY(40,11);
    writeln('     ===         ("J)     /  ');
    deplacerCurseurXY(40,12);
    writeln(' -_-_-_-_-_-_     )))____/');
    deplacerCurseurXY(40,13);
    writeln('//  "  ,    \\   |   |');
    deplacerCurseurXY(40,14);
    writeln('||    "     ||    \____m=====\  ');
    deplacerCurseurXY(40,15);
    writeln('|E " ( ) )  ||    +()+       (")');
    deplacerCurseurXY(40,16);
    writeln('|J ( )  )") ||   ++vv++     ====== ');
    deplacerCurseurXY(40,17);
    writeln('|M(("( /(( )||  +++++++       \/  ');
    deplacerCurseurXY(40,18);
    writeln('||  /(\ "\\(|| ++++++++       /\');
    deplacerCurseurXY(40,19);
    writeln('|9"/\)\//)\\||   // ||       /  \ ');
    deplacerCurseurXY(40,19);
    writeln('|6/ \\\\ \  ||  (__D(__D    /    \ ');
    deplacerCurseurXY(40,20);
    writeln('!!==========!! ');

end;

// ------------------------------------ Cadre du forgeron avec choix et dialogue
procedure ForgeronCadreIHM();
begin
   // Cadre des armes
   dessinercadreXY(30,22,90,28,simple,15,0);
   deplacerCurseurXY(31,23);
   couleurTexte(4);
   writeln('Forgeron :');
   deplacerCurseurXY(31,24);
   texteAtemps('Bienvenue dans ma forge !! Vous faut-il quelque chose ?!!!',10,15);
   texteXY(32,25,'  Je veux forger une arme',15);
   texteXY(32,26,'  Je veux forger une armure',15);
   texteXY(32,27,'  Quitter',15);



end;

procedure ChoixForgeron();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
    effacerEcran();
    ForgeronDesignIHM();
    ForgeronCadreIHM();
    deplacerCurseurXY(32,25);
    write('>>');

    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 :   //Indique la fleche en haut
                      begin
                          if (rep < 3) then
                             rep := rep + 1
                          else
                             rep := 1;
                      end;
                  #72 :  //Indique la felche en bas
                       begin
                            if (rep > 1) then
                               rep := rep - 1
                            else
                               rep := 3;
                       end;
                  #13 : cho := False;  //la touche entrer
              end;

              if (rep = 1) then
                 begin
                     texteXY(32,25,'>>',White);
                     texteXY(32,26,'  ',White);
                     texteXY(32,27,'  ',White);
                     deplacerCurseurXY(1,11);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(32,25,'  ',White);
                     texteXY(32,26,'>>',White);
                     texteXY(32,27,'  ',White);
                     deplacerCurseurXY(1,16);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(32,25,'  ',White);
                     texteXY(32,26,'  ',White);
                     texteXY(32,27,'>>',White);
                     deplacerCurseurXY(1,21);
                 end;
          end;
    case rep of
        1 : ChoixForgerArme();
        2 : ForgerArmureIHM();
        3 : ChoixMenuVillage();
    end;
end;

procedure ForgerArmeIHM();

var
    i,j,x : integer;

begin
    //Cadre des armes
    effacerEcran();
    dessinerCadreXY(2,2,70,23, double,15,0);
    j:=3;
    deplacerCurseurXY(3,j);
    for i:= 1 to 10 do
      begin
       writeln(stuffDispo.invArmeDispo[i].nomArme);
       j:= (j+2);
       deplacerCurseurXY(3,j);
     end;

    j:=3;
    deplacerCurseurXY(38,j);
    for i:= 11 to 20 do
      begin
       writeln(stuffDispo.invArmeDispo[i].nomArme);
       j:= (j+2);
       deplacerCurseurXY(38,j);
     end;

   // Cadre des loots possedés
   dessinercadreXY(75,2,115,20,double,15,0);
   x:=3;
   deplacerCurseurXY(76,x);
   for i:= 0 to 3 do
     begin
     for j:=0 to 3 do
       begin
            write(personnage1.inventaire.invDrop[i][j].nomDrop);
            x:=(x+1);
            deplacerCurseurXY(76,x);
       end;
     end;

   // Cadre des informations
   dessinerCadreXY(75,21,115,26,double,15,0);

   // Cadre pour quitter
   dessinerCadreXY(2,25,20,27,double,15,0);
   texteXY(8,26,'RETOUR',15);

end;

procedure ChoixForgerArme();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
    i : integer;
begin
     ForgerArmeIHM();
     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #72 :   //Indique la fleche en huat
                  begin
                      if (rep > 1) then
                         rep := rep - 1
                      else
                         rep := 21;
                  end;
              #80 :  //Indique la felche en bas
                   begin
                        if (rep < 21) then
                           rep := rep + 1
                        else
                           rep := 1;
                   end;
              #77 :  //Droite
                   begin
                       if (rep <= 10) then
                          rep := rep + 10
                       else
                           rep := (rep-10);
                   end;
              #75 :  //Gauche
                   begin
                       if (rep <= 10) then
                          rep := rep + 10
                       else
                           rep := (rep-10);
                   end;
              #13 : cho := False;  //la touche entrer
          end;

          case rep of
              1 :begin
                    // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,4);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              2 :begin
                    // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,4);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);;
                 end;
              3 :begin
                    // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,4);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              4:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,4);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              5:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,4);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              6:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,4);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              7:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,4);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              8:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,4);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                                 end;
              9:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,4);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              10:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,4);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
              end;
              11:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,4);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              12:
                   begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,4);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
              end;
              13:
                   begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,4);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
              end;
              14:
                   begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,4);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              15: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,4);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              16: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,4);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
              end;
              17: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,4);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
              end;
              18: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,4);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              19: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,4);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              20:begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,4);
                    // Affiche informations sur l'arme séléctionné
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                end;
              21: begin
                   // Affiche l'arme selectionné en rouge selon où est le "curseur"
                    texteXY(3,3,stuffDispo.invArmeDispo[1].nomArme,15);
                    texteXY(3,5,stuffDispo.invArmeDispo[2].nomArme,15);
                    texteXY(3,7,stuffDispo.invArmeDispo[3].nomArme,15);
                    texteXY(3,9,stuffDispo.invArmeDispo[4].nomArme,15);
                    texteXY(3,11,stuffDispo.invArmeDispo[5].nomArme,15);
                    texteXY(3,13,stuffDispo.invArmeDispo[6].nomArme,15);
                    texteXY(3,15,stuffDispo.invArmeDispo[7].nomArme,15);
                    texteXY(3,17,stuffDispo.invArmeDispo[8].nomArme,15);
                    texteXY(3,19,stuffDispo.invArmeDispo[9].nomArme,15);
                    texteXY(3,21,stuffDispo.invArmeDispo[10].nomArme,15);
                    texteXY(38,3,stuffDispo.invArmeDispo[11].nomArme,15);
                    texteXY(38,5,stuffDispo.invArmeDispo[12].nomArme,15);
                    texteXY(38,7,stuffDispo.invArmeDispo[13].nomArme,15);
                    texteXY(38,9,stuffDispo.invArmeDispo[14].nomArme,15);
                    texteXY(38,11,stuffDispo.invArmeDispo[15].nomArme,15);
                    texteXY(38,13,stuffDispo.invArmeDispo[16].nomArme,15);
                    texteXY(38,15,stuffDispo.invArmeDispo[17].nomArme,15);
                    texteXY(38,17,stuffDispo.invArmeDispo[18].nomArme,15);
                    texteXY(38,19,stuffDispo.invArmeDispo[19].nomArme,15);
                    texteXY(38,21,stuffDispo.invArmeDispo[20].nomArme,15);
                    // Affiche informations sur l'arme séléctionné
                    ColorierZone(0,4,3,19,26);
                    // Enleve cadre information
                    for i := 22 to 25 do
                      begin
                           texteXY(76,i,'                                      ',0);
                      end;
              end;
          end;
      end;
     if rep=21 then
     ChoixForgeron();

end;

procedure ForgerArmureIHM();
begin
  effacerEcran();
end;

end.

