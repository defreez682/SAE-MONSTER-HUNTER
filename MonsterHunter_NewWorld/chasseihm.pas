unit chasseIHM;

{$mode objfpc}{$H+}

interface

var Orange : Integer = 150;
    fuite : Boolean = False;

procedure creationFuiteInterface();
procedure deplacementJoueur();
procedure creationBordure();
procedure creationFrontiere();
procedure creationZone1();
procedure creationZone2();
procedure creationZone3();
procedure creationZone4();
procedure creationZone6();
procedure creationZone5();

implementation

uses
  Classes, SysUtils,gestionTexte,GestionEcran,crtPerso,chasseFuiteLogic,villageIHM;



procedure creationZone1();
begin
     texteXY(44,10,'.....',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(43,11,'.......',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,12,'.........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,13,'..........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,14,'...........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,15,'............',DarkGray);
     texteEnCouleur('***',Orange);
     texteXY(41,16,'...',DarkGray);
     texteEnCouleur('1',LightRed);
     texteEnCouleur('.........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,17,'............',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,18,'...........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,19,'..........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(41,20,'.........',DarkGray);
     texteEnCouleur('*',Orange);
end;

procedure creationZone2();
begin
     texteXY(50,8,'............',DarkGray);
     texteXY(49,9,'*',Orange);
     texteEnCouleur('.............',DarkGray);
     texteXY(49,10,'*',Orange);
     texteEnCouleur('......',DarkGray);
     texteEnCouleur('2',LightRed);
     texteEnCouleur('......',DarkGray);
     texteXY(50,11,'*',Orange); 
     texteEnCouleur('...........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(50,12,'*',Orange);
     texteEnCouleur('..........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(51,13,'*',Orange);
     texteEnCouleur('........',DarkGray);
     texteEnCouleur('*',Orange);          
     texteXY(52,14,'*',Orange);
     texteEnCouleur('....',DarkGray);
     texteEnCouleur('***',Orange);
     texteXY(53,15,'****',Orange);
     texteXY(57,14,'**********',Orange);
end;

procedure creationZone3();
begin
     texteXY(55,15,'**',Orange);
     texteEncouleur('...........',DarkGray);
     texteXY(54,16,'*',Orange);
     texteEnCouleur('.............',DarkGray);
     texteXY(53,17,'*',Orange);
     texteEnCouleur('..............',DarkGray);
     texteXY(52,18,'*',Orange);
     texteEnCouleur('...............',DarkGray);
     texteXY(51,19,'*',Orange);
     texteEnCouleur('........',DarkGray);
     texteEnCouleur('3',LightRed);
     texteEnCouleur('........',DarkGray);
     texteXY(50,20,'*',Orange);
     texteEnCouleur('...............',DarkGray);
     texteXY(57,14,'************',Orange);
     texteXY(53,21,'............',DarkGray);
     texteXY(54,22,'........',DarkGray);
     texteXY(55,23,'......',DarkGray);
     texteXY(68,15,'*',Orange);
     texteXY(68,16,'*',Orange);
     texteXY(68,17,'*',Orange);
     texteXY(68,18,'*',Orange);
     texteXY(69,19,'*',Orange);
     texteXY(66,20,'*******',Orange);
     texteXY(65,21,'*',Orange);
     texteXY(62,22,'*',Orange);
     texteXY(61,23,'*',Orange);
     texteXY(60,24,'*',Orange);
     texteXY(63,22,'*',Orange);
     texteXY(64,22,'*',Orange);
end;

procedure creationZone4();
begin
     texteXY(62,11,'*',Orange);
     texteEnCouleur('.........',DarkGray);
     texteXY(61,12,'*',Orange);
     texteEnCouleur('...',DarkGray);
     texteEnCouleur('4',LightRed);
     texteEnCouleur('......',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(60,13,'*',Orange);
     texteEnCouleur('..........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(59,14,'************',Orange);
     texteXY(68,15,'*',Orange);
     texteXY(68,16,'*',Orange);
     texteXY(68,17,'*',Orange);
     texteXY(68,18,'*',Orange);
end;

procedure creationZone5();
begin
     texteXY(72,12,'*',Orange);
     texteEnCouleur('...',DarkGray);
     texteXY(71,13,'*',Orange);
     texteEnCouleur('.....',DarkGray);
     texteXY(68,14,'***',Orange);
     texteEnCouleur('.......',DarkGray);
     texteXY(68,15,'*',Orange);
     texteEnCouleur('.........',DarkGray);
     texteXY(68,16,'*',Orange);
     texteEnCouleur('....',DarkGray);
     texteEnCouleur('5',LightRed);
     texteEnCouleur('....',DarkGray);
     texteXY(68,17,'*',Orange);
     texteEnCouleur('.........',DarkGray);
     texteXY(68,18,'*',Orange);
     texteEnCouleur('.........',DarkGray);
     texteXY(69,19,'*',Orange);
     texteEnCouleur('....',DarkGray);
     texteXY(70,20,'****',Orange);
     texteXY(74,19,'****',Orange);
end;

procedure creationZone6();
begin
     texteXY(60,24,'*',Orange);
     texteEnCouleur('.................',DarkGray);
     texteXY(61,23,'*',Orange);
     texteEnCouleur('..........',DarkGray);
     texteEnCouleur('6',LightRed);
     texteEnCouleur('.....',DarkGray);
     texteXY(62,22,'***',Orange);
     texteEnCouleur('.............',DarkGray);
     texteXY(65,21,'*',Orange);
     texteEnCouleur('............',DarkGray);
     texteXY(66,20,'********',Orange);
     texteEnCouleur('....',DarkGray);
     texteXY(74,19,'****',Orange);
end;

procedure creationFrontiere();
begin
     creationZone1();
     creationZone2();
     creationZone3();
     creationZone4();
     creationZone5();
     creationZone6();
end;

procedure creationBordure();
begin
     texteXY(55,6,'XXXXX',Orange);
     texteXY(54,7,'XXXXXXX',Orange);
     texteXY(39,12,'XX',Orange);
     texteXY(38,13,'XXX',Orange);
     texteXY(37,14,'XXXX',Orange);
     texteXY(36,15,'XXXXX',Orange);
     texteXY(37,16,'XXXX',Orange);
     texteXY(38,17,'XXX',Orange);
     texteXY(39,18,'XX',Orange);
     texteXY(40,19,'X',Orange);
     texteXY(78,15,'X',Orange);
     texteXY(78,16,'X',Orange);
     texteXY(78,17,'X',Orange);
     texteXY(78,18,'XX',Orange);
     texteXY(78,19,'XXX',Orange);
     texteXY(78,20,'XXXX',Orange);
     texteXY(78,21,'XXXX',Orange);
     texteXY(78,22,'XXXX',Orange);
     texteXY(78,23,'XX',Orange);
     texteXY(78,24,'X',Orange);
     texteXY(55,5,'_____',White);
     texteXY(54,6,'/',White);
     texteXY(60,6,'\',White);
     texteXY(50,7,'___|',White);
     texteXY(61,7,'\',White);
     texteXY(49,8,'/',White);
     texteXY(62,8,'\',White);
     texteXY(45,9,'___/',White);
     texteXY(63,9,'\',White);
     texteXY(43,10,'/',White);
     texteXY(63,10,'|________',White);
     texteXY(39,11,'___/',White);
     texteXY(72,11,'\___',White);
     texteXY(38,12,'/',White);
     texteXY(76,12,'\',White);
     texteXY(37,13,'/',White);
     texteXY(77,13,'\',White);
     texteXY(36,14,'/',White);
     texteXY(78,14,'\',White);
     texteXY(35,15,'|',White);
     texteXY(79,15,'\',White);
     texteXY(36,16,'\',White);
     texteXY(79,16,'/',White);
     texteXY(37,17,'\',White);
     texteXY(79,17,'\',White);
     texteXY(38,18,'|',White);
     texteXY(80,18,'\',White);
     texteXY(39,19,'\',White);
     texteXY(81,19,'\',White);
     texteXY(40,20,'|',White);
     texteXY(82,20,'\',White);
     texteXY(41,21,'\_______|___',White);
     texteXY(82,21,'/',White);
     texteXY(53,22,'\',White);
     texteXY(82,22,'\',White);
     texteXY(54,23,'\',White);
     texteXY(80,23,'__/',White);
     texteXY(55,24,'\____',White);
     texteXY(79,24,'/',White);
     texteXY(60,25,'\_________________/',White);
end;

procedure creationFuiteInterface();
begin
     effacerEcran();
     dessinerCadreXY(33,3,85,27,double, White,Black);
end;

procedure legende();
begin
     texteXY(1,5,'X',LightMagenta);
     texteEnCouleur(' sont des ',White);
     texteEnCouleur('monstres',LightMagenta);

     texteXY(1,6,'X',LightBlue);
     texteEnCouleur(' c''est ',White);
     texteEnCouleur('vous',LightBlue);

     texteXY(1,7,'X',38);
     texteEnCouleur(' sont des ',White);
     texteEnCouleur('zones ',38);
     texteEnCouleur('inexplorable.',White);

     texteXY(1,8,'*',38);
     texteEnCouleur(' sont des ',White);
     texteEnCouleur('frontieres',38);
     if (fuite = False) then
        begin
             texteXY(1,9,'________________________________',DarkGray);
             texteXY(1,10,'*Appuyer sur echap pour quitter*',DarkGray);
        end;

end;

procedure deplacementJoueur();

type
    monstre = RECORD
      x : Integer;
      y : Integer;

    end;


var x : integer = 45;
    y : integer = 15;
    cho : boolean = True;
    ch : Char;
    zoneActuelle : Integer = 1;
    zoneMonstre : Integer;
    zoneMonstreC : RECORD
                 x : Integer;
                 y : Integer;
    end;
    i : Integer;
    nbmonstre : array[1..8] of monstre;
    mstr : Integer;
    choix : Boolean = False;
    rep : Integer = 1;
    ox : Integer = 0;
begin
     randomize;
     creationFuiteInterface();
     creationBordure();
     creationFrontiere();
     legende();
     if (fuite = True) then
        mstr := 1
     else
        mstr := random(7) + 1;

     // On créer les monstres dans chaque zone
     for i := 1 to mstr do
         begin
              zoneMonstre := random(5)+1;

              if (zoneMonstre = 1) then
                 begin
                      zoneMonstreC.x := random(9) + 41;
                      zoneMonstreC.y := random(10) + 10;
                 end;
              if (zoneMonstre = 2) then
                 begin
                      zoneMonstreC.x := random(7) + 52;
                      zoneMonstreC.y := random(5) + 8;
                 end;
              if (zoneMonstre = 3) then
                  begin
                       zoneMonstreC.x := random(9) + 55;
                       zoneMonstreC.y := random(5) + 16;
                  end;
              if (zoneMonstre = 4) then
                  begin
                       zoneMonstreC.x := random(7) + 63;
                       zoneMonstreC.y := random(2) + 11;
                  end;
              if (zoneMonstre = 5) then
                  begin
                       zoneMonstreC.x := random(6) + 71;
                       zoneMonstreC.y := random(4) + 14;
                  end;
              if (zoneMonstre = 6) then
                  begin
                       zoneMonstreC.x := random(11) + 66;
                       zoneMonstreC.y := random(3) + 21;
                  end;

               nbmonstre[i].x := zoneMonstreC.x;
               nbmonstre[i].y := zoneMonstreC.y;

               if (i > 1) then // Précaution, si deux monstre sont au même endroit, alors on en supprime un.
                  begin
                       if (nbmonstre[i].x = nbmonstre[i-1].x) and (nbmonstre[i].y = nbmonstre[i-1].y) then
                          begin
                               nbmonstre[i].x := NULL;
                               nbmonstre[i].y := NULL;
                          end;
                  end;
         end;


     texteXY(45,2,'Vous vous trouvez en zone : ',Green);
     texteEnCouleur(IntToStr(zoneActuelle),LightGreen);
     texteXY(x,y,'X',LightBlue);
     for i := 1 to mstr do
         texteXY(nbmonstre[i].x,nbmonstre[i].y,'X',LightMagenta);
     deplacerCurseurXY(x,y);
     while (cho= True) do
           begin
               ch := ReadKey;
               case ch of
                   #80 :
                     begin // Bas
                         if (choix = False) then
                            y := gestionBas(x,y);
                     end;
                   #72 :
                     begin // Haut
                         if (choix = False) then
                            y := gestionHaut(x,y);
                     end;
                   #77 :
                     begin // Droite
                         if (choix = False) then
                            x := gestionDroite(x,y)
                         else
                           begin
                                if (rep < 2) then
                                   rep := rep + 1
                                else
                                   rep := 1;
                           end;
                     end;
                   #75 : // Gauche
                     begin
                         if (choix = False) then
                            x := gestionGauche(x,y)
                         else
                             begin
                                  if (rep > 1) then
                                     rep := rep - 1
                                  else
                                     rep := 2;
                             end;
                     end;
                   #13 :
                     begin
                         if (choix = True) then
                            if (rep = 1) then
                               cho := False
                            else
                               begin
                                    effacerEcran();
                                    creationFuiteInterface();
                                    creationBordure();
                                    creationFrontiere();
                                    legende();
                                    texteXY(45,2,'Vous vous trouvez en zone : ',Green);
                                    texteEnCouleur(IntToStr(zoneActuelle),LightGreen);
                                    x := ox;
                                    texteXY(x,y,'X',LightBlue);
                                    for i := 1 to mstr do
                                        texteXY(nbmonstre[i].x,nbmonstre[i].y,'X',LightMagenta);
                                    deplacerCurseurXY(x,y);
                                    choix := False;
                               end ;
                     end;
                   #27 : begin
                              if (fuite = False) then
                                 begin
                                      rep := 3;
                                      cho := False;
                                 end;
                         end;
               end;

               if (x = 49) and (y = 20) then
                   zoneActuelle := 1
               else if (x = 50) and (y = 19) then
                   zoneActuelle := 1
               else if (x = 51) and (y = 18) then
                   zoneActuelle := 1
               else if (x = 52) and (y = 17) then
                   zoneActuelle := 1
               else if (x = 53) and (y = 16) then
                   zoneActuelle := 1
               else if (x = 52) and (y = 15) then
                   zoneActuelle := 1
               else if (x = 51) and (y = 14) then
                   zoneActuelle := 1
               else if (x = 50) and (y = 13) then
                   zoneActuelle := 1
               else if (x = 49) and (y = 12) then
                   zoneActuelle := 1
               else if (x = 49) and (y = 11) then
                   zoneActuelle := 1
               else if (x = 48) and (y = 10) then
                   zoneActuelle := 1
               else if (x = 50) and (y = 9) then
                   zoneActuelle := 2
               else if (x = 50) and (y = 10) then
                   zoneActuelle := 2
               else if (x = 51) and (y = 11) then
                   zoneActuelle := 2
               else if (x = 51) and (y = 12) then
                   zoneActuelle := 2
               else if (x = 52) and (y = 13) then
                   zoneActuelle := 2
               else if (x = 53) and (y = 14) then
                   zoneActuelle := 2
               else if (x = 54) and (y = 14) then
                   zoneActuelle := 2
               else if (x = 55) and (y = 14) then
                   zoneActuelle := 2
               else if (x = 56) and (y = 14) then
                   zoneActuelle := 2
               else if (x = 57) and (y = 13) then
                   zoneActuelle := 2
               else if (x = 58) and (y = 13) then
                   zoneActuelle := 2
               else if (x = 59) and (y = 13) then
                   zoneActuelle := 2
               else if (x = 60) and (y = 12) then
                   zoneActuelle := 2
               else if (x = 61) and (y = 11) then
                   zoneActuelle := 2
               else if (x = 62) and (y = 10) then
                   zoneActuelle := 2
               else if (x = 51) and (y = 20) then
                   zoneActuelle := 3
               else if (x = 52) and (y = 19) then
                   zoneActuelle := 3
               else if (x = 53) and (y = 18) then
                   zoneActuelle := 3
               else if (x = 54) and (y = 17) then
                   zoneActuelle := 3
               else if (x = 55) and (y = 16) then
                   zoneActuelle := 3
               else if (x = 57) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 58) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 59) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 60) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 61) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 62) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 63) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 64) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 66) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 67) and (y = 15) then
                   zoneActuelle := 3
               else if (x = 67) and (y = 16) then
                   zoneActuelle := 3
               else if (x = 67) and (y = 17) then
                   zoneActuelle := 3
               else if (x = 67) and (y = 18) then
                   zoneActuelle := 3
               else if (x = 67) and (y = 19) then
                   zoneActuelle := 3
               else if (x = 68) and (y = 19) then
                   zoneActuelle := 3
               else if (x = 66) and (y = 19) then
                   zoneActuelle := 3
               else if (x = 65) and (y = 20) then
                   zoneActuelle := 3
               else if (x = 64) and (y = 20) then
                   zoneActuelle := 3
               else if (x = 64) and (y = 21) then
                   zoneActuelle := 3
               else if (x = 63) and (y = 21) then
                   zoneActuelle := 3
               else if (x = 62) and (y = 21) then
                   zoneActuelle := 3
               else if (x = 61) and (y = 21) then
                   zoneActuelle := 3
               else if (x = 61) and (y = 22) then
                   zoneActuelle := 3
               else if (x = 60) and (y = 23) then
                   zoneActuelle := 3
               else if (x = 59) and (y = 23) then
                   zoneActuelle := 3
               else if (x = 56) and (y = 16) then
                   zoneActuelle := 3
               else if (x = 61) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 62) and (y = 12) then
                   zoneActuelle := 4
               else if (x = 63) and (y = 11) then
                   zoneActuelle := 4
               else if (x = 62) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 63) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 64) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 65) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 66) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 67) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 68) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 69) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 70) and (y = 13) then
                   zoneActuelle := 4
               else if (x = 69) and (y = 14) then
                   zoneActuelle := 4
               else if (x = 70) and (y = 14) then
                   zoneActuelle := 4
               else if (x = 77) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 76) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 75) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 74) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 73) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 73) and (y = 19) then
                   zoneActuelle := 5
               else if (x = 72) and (y = 19) then
                   zoneActuelle := 5
               else if (x = 71) and (y = 19) then
                   zoneActuelle := 5
               else if (x = 70) and (y = 19) then
                   zoneActuelle := 5
               else if (x = 70) and (y = 19) then
                   zoneActuelle := 5
               else if (x = 70) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 69) and (y = 18) then
                   zoneActuelle := 5
               else if (x = 69) and (y = 17) then
                   zoneActuelle := 5
               else if (x = 69) and (y = 16) then
                   zoneActuelle := 5
               else if (x = 69) and (y = 15) then
                   zoneActuelle := 5
               else if (x = 70) and (y = 15) then
                   zoneActuelle := 5
               else if (x = 71) and (y = 15) then
                   zoneActuelle := 5
               else if (x = 71) and (y = 14) then
                   zoneActuelle := 5
               else if (x = 72) and (y = 14) then
                   zoneActuelle := 5
               else if (x = 72) and (y = 13) then
                   zoneActuelle := 5
               else if (x = 73) and (y = 13) then
                   zoneActuelle := 5
               else if (x = 73) and (y = 12) then
                   zoneActuelle := 5
               else if (x = 61) and (y = 24) then
                   zoneActuelle := 6
               else if (x = 62) and (y = 24) then
                   zoneActuelle := 6
               else if (x = 62) and (y = 23) then
                   zoneActuelle := 6
               else if (x = 63) and (y = 23) then
                   zoneActuelle := 6
               else if (x = 64) and (y = 23) then
                   zoneActuelle := 6
               else if (x = 65) and (y = 23) then
                   zoneActuelle := 6
               else if (x = 65) and (y = 22) then
                   zoneActuelle := 6
               else if (x = 66) and (y = 22) then
                   zoneActuelle := 6
               else if (x = 66) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 67) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 68) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 69) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 70) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 71) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 72) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 73) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 74) and (y = 21) then
                   zoneActuelle := 6
               else if (x = 74) and (y = 20) then
                   zoneActuelle := 6
               else if (x = 75) and (y = 20) then
                   zoneActuelle := 6
               else if (x = 76) and (y = 20) then
                   zoneActuelle := 6
               else if (x = 77) and (y = 20) then
                   zoneActuelle := 6;


               if (zoneActuelle = 1) then
                  creationZone1()
               else if (zoneActuelle = 2) then
                  creationZone2()
               else if (zoneActuelle = 3) then
                  creationZone3()
               else if (zoneActuelle = 4) then
                  creationZone4()
               else if (zoneActuelle = 5) then
                  creationZone5()
               else if (zoneActuelle = 6) then
                  creationZone6();

                                                     ;
               texteXY(73,2,IntToStr(zoneActuelle),LightGreen);
               texteXY(x,y,'X',LightBlue);



               for i := 1 to mstr do
                   texteXY(nbmonstre[i].x,nbmonstre[i].y,'X',LightMagenta);


               if (choix = False) then
                  begin
                       for i := 1 to mstr do
                           begin
                               if (x = nbmonstre[i].x) and (y = nbmonstre[i].y) then
                                  begin
                                       if (x = 41) then
                                          ox := x + 1
                                       else
                                           ox := x-1;
                                       choix := True;
                                  end;
                           end;
                  end;

               if (choix = True) then
                  begin
                      dessinerCadreXY(35,13,84,16,simple,white,black);
                      if (fuite = False) then
                              texteXY(37,14,'Vous etes sur le point d''affronter un monstre.',White)
                         else                                                                          
                              texteXY(37,14,'Vous etes sur le point d''affronter le monstre.',White);


                      if (rep = 1) then
                         begin
                              texteXY(37,17,'Accepter',Red);
                              texteXY(76,17,'Refuser',White);

                         end
                      else
                          begin
                             texteXY(37,17,'Accepter',White);
                             texteXY(76,17,'Refuser',Red);
                          end;
                  end;

               deplacerCurseurXY(x,y);
           end;

     if (fuite = True) then
     else
        begin
             if (rep = 3) then
                choixMenuVillage();
        end;


end;

end.

