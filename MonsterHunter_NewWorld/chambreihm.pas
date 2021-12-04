{Unité dans laquelle le jouer peut se reposer et gestir son equipement}
unit chambreIHM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran, gestiontexte, crtPerso,inventaireLogic,personnage,villageIHM;
  
  procedure chambreInterface(); //L'interface de la chambre
  procedure chambreChoix();     //Choix de l'option à faire soit se reposer ou gestir son equipement
  procedure repose();           //se reposer et ripristiner les HP 
  procedure chambre();          //regroupe les deux procedures chambreInterfaceIHM() et chambreChoix()

implementation

//Creation L'interface de la chambre
procedure chambreInterface();
begin
    effacerEcran();
    dessinerCadreXY(1,0,14,2, double, white, black);
     texteXY(4,1, 'CHAMBRE', 15);

    dessinerCadreXY(4,10,21,12, simple, 15, 0);
    texteXY(8,11, 'SE REPOSER', 15);

    dessinerCadreXY(4,15,21,17, simple, 15, 0);
    texteXY(10,16, 'COFFRE', 15);

    dessinerCadreXY(4,20,21,22, simple, 15, 0);
    texteXY(10,21, 'RETOUR', 15);



deplacerCurseurXY(25,1);
write('///////////////////////////|_________________________________________________');   deplacerCurseurXY(25,2);
write('///////////////////////////|_________________________________________________');   deplacerCurseurXY(25,3);
write('///////////////////////////|_________________________________________________');   deplacerCurseurXY(25,4);
write('///////////////////////////|_________________________________________________');   deplacerCurseurXY(25,5);
write('///////////////////////////|_________|=========|___________________/=======\_');   deplacerCurseurXY(25,6);
write('///////////////////////////|_________E         |___________________|Monster|_');   deplacerCurseurXY(25,7);
write('/////////////.''|///////////|_________|         |___________________|Hunted |_');  deplacerCurseurXY(25,8);
write('//////////.'' | |///////////|_________|         |___________________\=======/_');  deplacerCurseurXY(25,9);
write('/////////|   | |///////////|_________|       -6|_____________________________');   deplacerCurseurXY(25,10);
write('/////////|   |/|///////////|_________|         |_____________________________');   deplacerCurseurXY(25,11);
write('/////////|  /| |///////////|_________|         |____,-""___""-.''_____________');  deplacerCurseurXY(25,12);
write('/////////|/  | |///////////|_________E         |___.;""''''| |`"":_____________'); deplacerCurseurXY(25,13);
write('/////////|   |.''///////////|I________|_________|___|| | | | | ||   _________');   deplacerCurseurXY(25,14);
write('/////////|  .''/////////////                        ||_|_|_|_|_||  |____-____|');  deplacerCurseurXY(25,15);
write('/////////|.''//////////////                        //          /|  |____-____|');  deplacerCurseurXY(25,16);
write('/////////////////////////             		  /__         //|  |____-____|'); deplacerCurseurXY(25,17);
write('////////////////////////  		       ,-""___""-.   //||  |/       \|'); deplacerCurseurXY(25,18);
write('///////////////////////                     .;""''''| |`"":  //                 ');deplacerCurseurXY(25,19);
write('//////////////////////                      ||/| | | | || //                  ');  deplacerCurseurXY(25,20);
write('/////////////////////                       ||_|_|_|_|_||//                   ');  deplacerCurseurXY(25,21);
write('////////////////////                        ||_________||/                    ');  deplacerCurseurXY(25,22);
write('///////////////////                         ||         ||                     ');  deplacerCurseurXY(25,23);
write('//////////////////                                                            ');  deplacerCurseurXY(25,24);
write('/////////////////                                                             ');

end;
//Choisi l'option à faire dans la chambre
procedure chambreChoix();
var cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
    deplacerCurseurXY(2,11);
    write('>>');

    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 :   //Indique la fleche en huat
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
                     texteXY(2,11,'>>',White);
                     texteXY(2,16,'  ',White);
                     texteXY(2,21,'  ',White);
                     deplacerCurseurXY(1,11);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(2,11,'  ',White);
                     texteXY(2,16,'>>',White);
                     texteXY(2,21,'  ',White);
                     deplacerCurseurXY(1,16);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(2,11,'  ',White);
                     texteXY(2,16,'  ',White);
                     texteXY(2,21,'>>',White);
                     deplacerCurseurXY(1,21);
                 end;
          end;
    if (rep = 1) then
       repose()
    else if (rep = 2) then
       affichageInventaire(personnage1)
    else if (rep = 3) then
       choixMenuVillage();
end;

procedure repose();
begin
  dessinerCadreXY(20,9,100,16, double, black, blue);
  deplacerCurseurXY(48, 12);
  texteAtemps('C''est l''heure de dormir !', 20,15);
  deplacerCurseurXY(40, 13);
  texteAtemps('Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z Z', 30,15);
  readkey;
  modificationDataJoueur(calculHpMaxBase(),13);
  chambreInterface();
  chambreChoix();
end;

procedure chambre();
begin
    chambreInterface();
    chambreChoix();
end;

end.

