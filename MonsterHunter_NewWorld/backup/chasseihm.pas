unit chasseIHM;

{$mode objfpc}{$H+}

interface

var Orange : Integer = 150;


procedure creationFuiteInterface();
procedure deplacementJoueur();

implementation

uses
  Classes, SysUtils,gestionTexte,GestionEcran,crtPerso,chasseFuiteLogic;



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
     texteXY(66,20,'****',Orange);
     texteXY(65,21,'*',Orange);
     texteXY(62,22,'*',Orange);
     texteXY(61,23,'*',Orange);
     texteXY(60,24,'*',Orange);
end;

procedure creationZone4();
begin
     texteXY(62,11,'*',Orange);
     texteEnCouleur('.........',DarkGray);
     texteXY(61,12,'*',Orange);
     texteEnCouleur('...',DarkGray);
     texteEnCouleur('4',LightRed);
     texteEnCouleur('.......',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(60,13,'*',Orange);
     texteEnCouleur('..........',DarkGray);
     texteEnCouleur('*',Orange);
     texteXY(59,14,'************',Orange);
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
var Jaune : Integer = 38;
begin
     texteXY(55,6,'XXXXX',Jaune);
     texteXY(54,7,'XXXXXXX',Jaune);
     texteXY(39,12,'XX',Jaune); 
     texteXY(38,13,'XXX',Jaune);
     texteXY(37,14,'XXXX',Jaune);
     texteXY(36,15,'XXXXX',Jaune);
     texteXY(37,16,'XXXX',Jaune); 
     texteXY(38,17,'XXX',Jaune);
     texteXY(39,18,'XX',Jaune);
     texteXY(40,19,'X',Jaune);
     texteXY(78,15,'X',Jaune);
     texteXY(78,16,'X',Jaune);
     texteXY(78,17,'X',Jaune);
     texteXY(78,18,'XX',Jaune);
     texteXY(78,19,'XXX',Jaune); 
     texteXY(78,20,'XXXX',Jaune);
     texteXY(78,21,'XXXX',Jaune);
     texteXY(78,22,'XXXX',Jaune);
     texteXY(78,23,'XX',Jaune);	 
     texteXY(78,24,'X',Jaune);
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
      dessinerCadreXY(33,3,85,27,double, White,Black);

end;


procedure deplacementJoueur();
var x : integer = 45;
    y : integer = 15;
    cho : boolean = True;
    ch : Char;
    zone : Integer = 1;

begin
     creationFuiteInterface();
     creationBordure();
     creationFrontiere();

     texteXY(x,y,'X',LightBlue);
     deplacerCurseurXY(x,y);
     while (cho= True) do
           begin
               ch := ReadKey;
               case ch of
                   #80 :
                     begin // Bas
                         y := gestionBas(x,y);
                     end;
                   #72 :
                     begin // Haut
                         y := gestionHaut(x,y);
                     end;
                   #77 :
                     begin // Droite
                         x := gestionDroite(x,y);
                     end;
                   #75 : // Gauche
                     begin
                         x := gestionGauche(x,y);
                     end;
               end;

               if (x = 49) and (y = 20) then
                  zone := 1
               else if (x = 50) and (y = 19) then
                  zone := 1
               else if (x = 51) and (y = 18) then
                  zone := 1
               else if (x = 52) and (y = 17) then
                  zone := 1
               else if (x = 53) and (y = 16) then
                  zone := 1
               else if (x = 52) and (y = 15) then
                  zone := 1
               else if (x = 51) and (y = 14) then
                  zone := 1
               else if (x = 50) and (y = 13) then
                  zone := 1
               else if (x = 49) and (y = 12) then
                  zone := 1
               else if (x = 49) and (y = 11) then
                  zone := 1
               else if (x = 48) and (y = 10) then
                  zone := 1
               else if (x = 50) and (y = 9) then
                  zone := 2
               else if (x = 50) and (y = 10) then
                  zone := 2
               else if (x = 51) and (y = 11) then
                  zone := 2
               else if (x = 51) and (y = 12) then
                  zone := 2
               else if (x = 52) and (y = 13) then
                  zone := 2 
               else if (x = 53) and (y = 14) then
                  zone := 2               
               else if (x = 54) and (y = 14) then
                  zone := 2 
               else if (x = 55) and (y = 14) then
                  zone := 2             
               else if (x = 56) and (y = 14) then
                  zone := 2   
               else if (x = 57) and (y = 13) then
                  zone := 2             
               else if (x = 58) and (y = 13) then
                  zone := 2   
               else if (x = 59) and (y = 13) then
                  zone := 2               
               else if (x = 60) and (y = 12) then
                  zone := 2  
               else if (x = 61) and (y = 11) then
                  zone := 2  
               else if (x = 62) and (y = 10) then
                  zone := 2;

               if (zone = 1) then
                  creationZone1()
               else if (zone = 2) then
                  creationZone2();

               texteXY(1,1,IntToStr(x),Red);
               texteXY(1,2,'  ',White);
               texteXY(1,2,IntToStr(y),LightRed);
               texteXY(1,3,'Zone : ',LightGreen);
               texteEnCouleur(IntToStr(zone),LightGreen);
               creationZone2();
               texteXY(x,y,'X',LightBlue);
               deplacerCurseurXY(x,y);
           end;
end;

end.

