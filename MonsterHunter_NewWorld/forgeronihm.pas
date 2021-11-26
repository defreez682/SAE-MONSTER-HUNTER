unit forgeronIHM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, GestionTexte, crtPerso, villageIHM;

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
begin
    //Cadre des armes
    effacerEcran();
   dessinerCadreXY(2,2,70,23, double,15,0);
   texteXY(3,3,'Conbustion wywerne Argent',4);
   texteXY(3,5,'X',15);
   texteXY(3,7,'X',15);
   texteXY(3,9,'X',15);
   texteXY(3,11,'X',15);
   texteXY(3,13,'X',15);
   texteXY(3,15,'X',15);
   texteXY(3,17,'X',15);
   texteXY(3,19,'X',15);
   texteXY(3,21,'X',15);

   texteXY(38,3,'X',15);
   texteXY(38,5,'X',15);
   texteXY(38,7,'X',15);
   texteXY(38,9,'X',15);
   texteXY(38,11,'X',15);
   texteXY(38,13,'X',15);
   texteXY(38,15,'X',15);
   texteXY(38,17,'X',15);
   texteXY(38,19,'X',15);
   texteXY(38,21,'X',15);

   // Cadre des loots possdés
   dessinercadreXY(75,2,115,20,double,15,0);
   //faire appel à une fonction contenu de l'inventaire(loots)

   // Cadre des informations
   dessinerCadreXY(75,21,115,26,double,15,0);
   texteXY(77,22,'Poids',10);
   texteXY(77,23,'Ratio A/D',10);
   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);

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
                    texteXY(3,3,'Conbustion wywerne Argent',4);
                    texteXY(3,5,'X',15);
                    texteXY(3,7,'X',15);
                    texteXY(3,9,'X',15);
                    texteXY(3,11,'X',15);
                    texteXY(3,13,'X',15);
                    texteXY(3,15,'X',15);
                    texteXY(3,17,'X',15);
                    texteXY(3,19,'X',15);
                    texteXY(3,21,'X',15);
                    texteXY(38,3,'X',15);
                    texteXY(38,5,'X',15);
                    texteXY(38,7,'X',15);
                    texteXY(38,9,'X',15);
                    texteXY(38,11,'X',15);
                    texteXY(38,13,'X',15);
                    texteXY(38,15,'X',15);
                    texteXY(38,17,'X',15);
                    texteXY(38,19,'X',15);
                    texteXY(38,21,'X',15);
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              2 :begin
                    texteXY(3,3,'Conbustion wywerne Argent',15);
                    texteXY(3,5,'X',4);
                    texteXY(3,7,'X',15);
                    texteXY(3,9,'X',15);
                    texteXY(3,11,'X',15);
                    texteXY(3,13,'X',15);
                    texteXY(3,15,'X',15);
                    texteXY(3,17,'X',15);
                    texteXY(3,19,'X',15);
                    texteXY(3,21,'X',15);
                    texteXY(38,3,'X',15);
                    texteXY(38,5,'X',15);
                    texteXY(38,7,'X',15);
                    texteXY(38,9,'X',15);
                    texteXY(38,11,'X',15);
                    texteXY(38,13,'X',15);
                    texteXY(38,15,'X',15);
                    texteXY(38,17,'X',15);
                    texteXY(38,19,'X',15);
                    texteXY(38,21,'X',15);
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              3 :begin
                    texteXY(3,3,'Conbustion wywerne Argent',15);
                    texteXY(3,5,'X',15);
                    texteXY(3,7,'X',4);
                    texteXY(3,9,'X',15);
                    texteXY(3,11,'X',15);
                    texteXY(3,13,'X',15);
                    texteXY(3,15,'X',15);
                    texteXY(3,17,'X',15);
                    texteXY(3,19,'X',15);
                    texteXY(3,21,'X',15);
                    texteXY(38,3,'X',15);
                    texteXY(38,5,'X',15);
                    texteXY(38,7,'X',15);
                    texteXY(38,9,'X',15);
                    texteXY(38,11,'X',15);
                    texteXY(38,13,'X',15);
                    texteXY(38,15,'X',15);
                    texteXY(38,17,'X',15);
                    texteXY(38,19,'X',15);
                    texteXY(38,21,'X',15);
                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              4:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',4);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              5:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',4);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              6:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',4);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              7:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',4);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :  ZZZZZZ   Loot 2 :      ',4);
                 end;
              8:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',4);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);

                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                                 end;
              9:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',4);
                   texteXY(3,21,'X',15);

                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              10:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',4);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              11:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',4);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              12:
                   begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',4);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              13:
                   begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',4);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              14:
                   begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',4);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              15: begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',4);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              16: begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',4);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              17: begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',4);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              18: begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',4);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              19: begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',4);
                   texteXY(38,21,'X',15);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              20:begin
                   texteXY(3,3,'Conbustion wywerne Argent',15);
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);
                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',4);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                   ColorierZone(0,15,3,19,26);
                end;
              21: begin
                   texteXY(3,5,'X',15);
                   texteXY(3,7,'X',15);
                   texteXY(3,9,'X',15);
                   texteXY(3,11,'X',15);
                   texteXY(3,13,'X',15);
                   texteXY(3,15,'X',15);
                   texteXY(3,17,'X',15);
                   texteXY(3,19,'X',15);
                   texteXY(3,21,'X',15);

                   texteXY(38,3,'X',15);
                   texteXY(38,5,'X',15);
                   texteXY(38,7,'X',15);
                   texteXY(38,9,'X',15);
                   texteXY(38,11,'X',15);
                   texteXY(38,13,'X',15);
                   texteXY(38,15,'X',15);
                   texteXY(38,17,'X',15);
                   texteXY(38,19,'X',15);
                   texteXY(38,21,'X',15);
                   ColorierZone(4,15,3,19,26);
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

