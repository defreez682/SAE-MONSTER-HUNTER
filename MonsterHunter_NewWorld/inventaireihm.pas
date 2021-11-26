unit inventaireihm;

{$mode objfpc}{$H+}

interface
uses
    SysUtils,GestionEcran,inventaireLogic,dessinBaton,crt,personnage;
//----------- AFFICHAGE INVENTAIRE --------------------------------------

// Affiche l'inventaire
procedure affichageInventaireIHM(personnage:typePersonnage);

// Affiche l'inventaire des armes
procedure affichageInventaireArmesIHM(personnage:typePersonnage);

// Affiche l'inventaire des armures
procedure affichageInventaireArmuresIHM(personnage:typePersonnage);

// Affiche l'inventaire des drops
procedure affichageInventaireDropsIHM(personnage:typePersonnage);

// Affiche l'inventaire des consommables
procedure affichageInventaireConsoIHM(personnage:typePersonnage);


//---------- DEPLACEMENT / COORDONNE INVENTAIRE / POSITION ---------------------

// Permet de se déplacer dans l'inventaire à l'aide des flèches directionnelles
procedure deplacementInventaireIHM(var position:typePosition;personnage:typePersonnage;q:integer);

// Créer un cadre qui permet de se déplacer entre les différents inventaires
procedure deplacementEntreInventaires(position:typePosition);

// Affiche sur les coordonnées ou l'utilisateur est, un cadre gris
procedure dessinCadreCoords(position:typePosition;q:integer);


//--------- CORRECTION GRAPHIQUES ----------------------------------------------

// Reinitialise certains éléments de l'inventaire à son origine
procedure reinitialisationInventaireGeneral();

procedure reinitilisationMur();

procedure reinitialisationArmes();

procedure reinitialisationArmures();

procedure reinitialisationDrops();

procedure reinitialisationConso();

//--------- INFORMATION INVENTAIRE --------------------------------------------

 // Affiche les infos de l'item sur lequel le curseur se trouve
procedure affichageInfoItem(personnage:typePersonnage;var position:typePosition);

// Affiche les infos du perso
procedure affichageInfoPerso(position:typePosition;personnage:typePersonnage);

// Affiche les items de l'inventaire des armes
procedure affichageArme(personnage:typePersonnage);

procedure affichageArmure(personnage:typePersonnage);

procedure affichageDrops(personnage:typePersonnage);

procedure affichageConso(personnage:typePersonnage);

//--------- DECO  -----------------------------------------------------

// Créer les graphismes de l'inventaire principal
procedure cadresPrincipauxInventaire(personnage:typePersonnage);


//procedure dropEquipementIHM();



implementation

// Affiche l'inventaire
procedure affichageInventaireIHM(personnage:typePersonnage);

begin


//----------- Cadres Principaux ---------------------
effacerecran();
cadresPrincipauxInventaire(personnage);

//----------- DessinBaton ---------------------------------------------
     dessinPersonnage(20,40);
     dessinEpee(70,33);
     dessinPlastron(96,40);
     dessinJambiere(97,50);
     dessinBotte(78,49);
     dessinCasque(99,32);
     dessinGants(76,39);

//---------------------------------------




end;

// Affiche l'inventaire des armes
procedure affichageInventaireArmesIHM(personnage:typePersonnage);
begin
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(56,1);
     write('Armes');
     ColorierZoneRemix(15,15,20,95,29);

     affichageArme(personnage);


end;

// Affiche l'inventaire des armures
procedure affichageInventaireArmuresIHM(personnage:typePersonnage);
begin
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(56,1);
     write('Armures');
     ColorierZoneRemix(15,15,20,95,29);

     affichageArmure(personnage);
end;

// Affiche l'inventaire des drops
procedure affichageInventaireDropsIHM(personnage:typePersonnage);
begin
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(56,1);
     write('Drops');
     ColorierZoneRemix(15,15,20,95,29);

     affichageDrops(personnage);
end;

// Affiche l'inventaire des consommables
procedure affichageInventaireConsoIHM(personnage:typePersonnage);
begin
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(54,1);
     write('Consommables');
     ColorierZoneRemix(15,15,20,95,29);

     affichageConso(personnage);
end;
// Permet de se déplacer dans l'inventaire à l'aide des flèches directionnelles
procedure deplacementInventaireIHM(var position:typePosition;personnage:typePersonnage;q:integer);

var
  Ch : Char;

Begin

   position.precedPos:='';
  repeat
    Ch := ReadKey;
    case Ch of
    #0: case ReadKey of    { Le code est #0, on appelle à nouveau ReadKey }
        #72:    begin
                     calculerCoordsApresDeplacement(1,position);      // Haut
                     dessinCadreCoords(position,q);

                end;

        #80:    begin
                     calculerCoordsApresDeplacement(2,position);    // Bas
                     dessinCadreCoords(position,q);
                end;
        #77:    begin
                     calculerCoordsApresDeplacement(3,position);   // Droite
                     dessinCadreCoords(position,q);
                end;
        #75:    begin
                     calculerCoordsApresDeplacement(4,position);   // Gauche
                     dessinCadreCoords(position,q);
                end;

        end;
    end;
  until Ch = #13; { On quitte avec Entrée }
  EntreePressee(position,personnage);
end;

// Affiche sur les coordonnées ou l'utilisateur est, un cadre gris
procedure dessinCadreCoords(position:typePosition;q:integer);
var
  y:Integer;
begin
     if (position.equipement) then
        begin


        if ((position.coordsActuelsInventaire.xA=1) and (position.coordsActuelsInventaire.yA=2)) then     // Cadre Epee
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=32 to 36 do
                    ColorierZoneRemix(0,12,69,92,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=2) and (position.coordsActuelsInventaire.yA=2)) then // Cadre Casque
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=32 to 36 do
                    ColorierZoneRemix(0,12,98,109,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=1) and (position.coordsActuelsInventaire.yA=1)) then // Cadre Gant
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=39 to 45 do
                    ColorierZoneRemix(0,12,75,91,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=1) and (position.coordsActuelsInventaire.yA=0)) then // Cadre Bottes
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=49 to 55 do
                    ColorierZoneRemix(0,12,77,90,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=2) and (position.coordsActuelsInventaire.yA=1)) then // Cadre Plastron
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=40 to 46 do
                    ColorierZoneRemix(0,12,98,110,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=2) and (position.coordsActuelsInventaire.yA=0)) then // Cadre Jambière
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=49 to 55 do
                    ColorierZoneRemix(0,12,99,109,y);
                   end
        else if (position.coordsActuelsInventaire.xA=0) then
                   begin
                   reinitialisationInventaireGeneral();
                   position.coordsActuelsInventaire.yA:=0;                                   // Cadre Personnage
                   for y:=39 to 52 do
                    ColorierZoneRemix(0,12,19,30,y);
                   end;
        end

     else if (position.cadreInventaires) then                                        // Cadre changement d'inventaire
                   begin
                   deplacerCurseurXY(38,q);
                   write('  ');
                   deplacerCurseurXY(23,q);
                   write('  ');
                   deplacerCurseurXY(49,q);
                   write('  ');
                   deplacerCurseurXY(61,q);
                   write('  ');
                   deplacerCurseurXY(78,q);
                   write('  ');
                   deplacerCurseurXY(88,q);
                   write('  ');


                        if (position.coordsActuelsInventaire.xA=0) then
                           begin                                                 // Fleche Equipement
                           deplacerCurseurXY(23,q);
                           write('>>');
                           end
                        else if (position.coordsActuelsInventaire.xA=1) then
                           begin                                              // Fleche Arme
                           deplacerCurseurXY(38,q);
                           write('>>');
                           end
                        else if (position.coordsActuelsInventaire.xA=2) then
                           begin
                           deplacerCurseurXY(49,q);                      // Fleche Armure
                           write('>>');
                           end
                        else if (position.coordsActuelsInventaire.xA=3) then
                           begin
                           deplacerCurseurXY(61,q);                     // Fleche  Consommables
                           write('>>');
                           end
                        else if (position.coordsActuelsInventaire.xA=4) then
                           begin
                           deplacerCurseurXY(78,q);                     // Fleche  Drops
                           write('>>');
                           end
                        else
                           begin
                           deplacerCurseurXY(88,q);                     // Fleche  Close
                           write('>>');
                           end;
                        deplacerCurseurXY(101,q);

                   end
     else if (position.infoItem) then
          begin
          deplacerCurseurXY(49,44);
          write('  ');
          deplacerCurseurXY(49,46);
          write('  ');
          deplacerCurseurXY(49,48);
          write('  ');
          if (position.coordsActuelsInventaire.yA=0) then
               begin
               deplacerCurseurXY(49,48);
               write('>>');
               end
          else if (position.coordsActuelsInventaire.yA=1) then
               begin
               deplacerCurseurXY(49,46);
               write('>>');
               end
          else if (position.coordsActuelsInventaire.yA=2) then
               begin
               deplacerCurseurXY(49,44);
               write('>>');
               end;
          end
     else if (position.armes) or (position.armures) or (position.drops) or (position.consommables) then                                        // Cadre changement d'inventaire
                   begin
                   if (position.armes) then
                   reinitialisationArmes()
                   else if (position.armures) then
                   reinitialisationArmures()
                   else if (position.drops) then
                   reinitialisationDrops()
                   else if (position.consommables) then
                   reinitialisationConso();

                   if (position.coordsActuelsInventaire.xA<=1) then
                   begin
                    for y:=(20-5*position.coordsActuelsInventaire.yA) to (23-5*position.coordsActuelsInventaire.yA) do
                    ColorierZoneRemix(0,11,4+22*position.coordsActuelsInventaire.xA,23+22*position.coordsActuelsInventaire.xA,y);
                   end
                   else
                   begin
                       for y:=(20-5*position.coordsActuelsInventaire.yA) to (23-5*position.coordsActuelsInventaire.yA) do
                    ColorierZoneRemix(0,11,28+23*position.coordsActuelsInventaire.xA,47+23*position.coordsActuelsInventaire.xA,y);
                   end;
                   end;



end;

// Créer un cadre qui permet de se déplacer entre les différents inventaires
procedure deplacementEntreInventaires(position:typePosition);

begin
     if (position.precedPos='equipement') then
     begin
        dessinerCadreXY(20,56,100,60,double,0,15);
        deplacerCurseurXY(24,58);

        write('  Equipement     Armes      Armures     Consommables     Drops     Close');
     end
     else
     begin
          dessinerCadreXY(20,25,100,29,double,0,15);
          deplacerCurseurXY(24,27);
          write('  Equipement     Armes      Armures     Consommables     Drops     Close');
     end;







end;

// Créer les graphismes de l'inventaire principal
procedure cadresPrincipauxInventaire(personnage:typePersonnage);
begin
     dessinMur();

     dessinerCadreXY(0,31,25,33,simple,15,0);
     deplacerCurseurXY(1,32);
     write('Inventaire de ', getNomActuelle(personnage1));
     ColorierZoneRemix(15,15,20,95,60);

end;

// Reinitialise certains éléments de l'inventaire à son origine
procedure reinitialisationInventaireGeneral();
var
  y:Integer;
  x:integer;
  z:Integer;
begin
     for y:=0 to 55 do
         ColorierZoneRemix(0,15,69,110,y);
     for y:=39 to 55 do
         ColorierZoneRemix(0,15,19,33,y);





     for y:=56 to 60 do
     ColorierZoneRemix(0,0,20,100,y);
                                             // CADRE
     couleurFond(0);
     couleurTexte(6);
     for y:=55 to 60 do
     begin
          deplacerCurseurXY(65,y);
          write('|');

     end;
     x:=64;
     y:=60;
     for z:=5 downto 1 do
         begin
         deplacerCurseurXY(x,y);
         write('\');
         x:=x-1;
         y:=y-1;

         end;

     deplacerCurseurXY(25,32);
     ColorierZoneRemix(15,15,20,95,60);
end;

procedure reinitialisationArmes();
var
  y,i,j:integer;

begin
     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage1.inventaire.invArme[i][j].nomArme='EMPTY') then
          begin
               if (i<=1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,y);
               end
               else if (i>1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,28+23*i,47+23*i,y);
               end;
          end

          else if (personnage1.inventaire.invArme[i][j].nomArme<>'EMPTY') then
          begin
               if (i<=1) then
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
               end
               else if (i>1) then
               begin
                    ColorierZoneRemix(0,15,28+23*i,47+23*i,20-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,20-5*j);
               end;
          end;




          end;
     end;




     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationArmures();
var
  y,i,j:integer;

begin
     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage1.inventaire.invArmure[i][j].nomArmure='EMPTY') then
          begin
               if (i<=1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,y);
               end
               else if (i>1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,28+23*i,47+23*i,y);
               end;
          end

          else if (personnage1.inventaire.invArmure[i][j].nomArmure<>'EMPTY') then
          begin
               if (i<=1) then
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
               end
               else if (i>1) then
               begin
                    ColorierZoneRemix(0,15,28+23*i,47+23*i,20-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,20-5*j);
               end;
          end;




          end;
     end;




     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationDrops();
var
  y,i,j:integer;

begin
     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage1.inventaire.invDrop[i][j].nomDrop='EMPTY') then
          begin
               if (i<=1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,y);
               end
               else if (i>1) then
               begin
               for y:=(20-5*j) to (23-5*j) do
                    ColorierZoneRemix(0,8,28+23*i,47+23*i,y);
               end;
          end

          else if (personnage1.inventaire.invDrop[i][j].nomDrop<>'EMPTY') then
          begin
               if (i<=1) then
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
               end
               else if (i>1) then
               begin
                    ColorierZoneRemix(0,15,28+23*i,47+23*i,20-5*j);
               end;
          end;




          end;
     end;




     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationConso();
var
  y,i,j:integer;

begin
     for i:=0 to 1 do
     begin
          for j:=0 to 3 do
          begin
               if (personnage1.inventaire.invPotion[i][j].nomPotion='EMPTY') then
               begin
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,21-5*j);
               end
               else
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
               end;

               if (personnage1.inventaire.invBombe[i][j].nomBombe='EMPTY') then
               begin
                    ColorierZoneRemix(0,8,75+23*i,85+23*i,20-5*j);
                    ColorierZoneRemix(0,8,75+23*i,85+23*i,21-5*j);
               end
               else
               begin
                    ColorierZoneRemix(0,15,75+23*i,85+23*i,20-5*j);
                    ColorierZoneRemix(0,12,75+23*i,85+23*i,21-5*j);
               end;

          end;
     end;




     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

// Reinitialise les murs à l'endroit ou les infos items apparaissent
procedure reinitilisationMur();
var
  y:Integer;
begin
  for y:=34 to 50 do
         ColorierZoneRemix(0,0,35,56,y);
  for y:=34 to 50 do
         ColorierZoneRemix(0,0,47,68,y);
  dessinMur();
end;

// Affiche les infos de l'item sur lequel le curseur se trouve
procedure affichageInfoItem(personnage:typePersonnage;var position:typePosition);

begin

// ----- Affichage des infos de l'item dans l'équipement -------------------------

  position.coordsActuelsItem.xA:=position.coordsActuelsInventaire.xA;    // Avoir une Backup des coordonées de l'item
  position.coordsActuelsItem.yA:=position.coordsActuelsInventaire.yA;
  if (Position.equipement) then
     begin
     dessinerCadreXY(47,34,68,50,double,15,0);
     couleurTexte(20);
     if ((position.coordsActuelsInventaire.xA=1) and (position.coordsActuelsInventaire.yA=2)) then
        begin

        if (personnage.inventaire.ArmeEquipee.nomArme<>'EMPTY' ) then
        begin
             deplacerCurseurXY(48,37);
             write(personnage.inventaire.ArmeEquipee.nomArme);
             deplacerCurseurXY(48,39);
             write('Attaque : ',personnage.inventaire.ArmeEquipee.ratioAD);
             deplacerCurseurXY(48,41);
             write('Poids : ',personnage.inventaire.ArmeEquipee.poids);
             couleurTexte(15);
             deplacerCurseurXY(52,44);
             write('Unequip');
             deplacerCurseurXY(52,46);
             write('Drop');
             deplacerCurseurXY(52,48);
             write('Close');
        end
        else
            begin
             deplacerCurseurXY(48,37);
             write(personnage.inventaire.ArmeEquipee.nomArme);
             deplacerCurseurXY(52,48);
             write('Close');
             end;
        end

     else
         begin
         if (personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].nomArmure<>'EMPTY') then
         begin
         deplacerCurseurXY(48,35);
         write(personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].typeArmure);
         deplacerCurseurXY(48,37);
         write(personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].nomArmure);
         deplacerCurseurXY(48,39);
         write('Defense : ',personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].defense);
         deplacerCurseurXY(48,41);
         write('Poids : ',personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].poids);
         couleurTexte(15);
         deplacerCurseurXY(52,44);
         write('Unequip');
         deplacerCurseurXY(52,46);
         write('Drop');
         deplacerCurseurXY(52,48);
         write('Close');
         end
         else
             begin
             deplacerCurseurXY(48,37);
             write(personnage.inventaire.ArmureEquipee[position.coordsActuelsInventaire.xA][position.coordsActuelsInventaire.yA].nomArmure);
             deplacerCurseurXY(52,48);
             write('Close');
             end;
             end;
     position.Equipement:=false;
     end

//-------------- INFO INVENTAIRE ARME
  else if (position.armes) then
  begin
  dessinerCadreXY(47,4,68,22,double,15,0);
  couleurTexte(20);
  if (personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme<>'EMPTY' ) then
        begin
             deplacerCurseurXY(48,6);
             write(personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme);
             deplacerCurseurXY(48,8);
             write('Attaque : ',personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].ratioAD);
             deplacerCurseurXY(48,10);
             write('Poids : ',personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].poids);
             couleurTexte(15);
             deplacerCurseurXY(52,13);
             write('Unequip');
             deplacerCurseurXY(52,15);
             write('Drop');
             deplacerCurseurXY(52,17);
             write('Close');
        end
        else
            begin
             deplacerCurseurXY(48,13);
             write(personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme);
             deplacerCurseurXY(52,22);
             write('Close');
             end;
        end;




  position.coordsActuelsInventaire.yA:=0;
  while (Readkey <> #13) do
        begin


        if ((personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure<>'EMPTY') or ((personnage.inventaire.ArmeEquipee.nomArme<>'EMPTY' ) and ((position.coordsActuelsItem.xA=1) and
        (position.coordsActuelsItem.yA=2))))  then
           begin
        case Readkey of
        #72:         begin

                     calculerCoordsApresDeplacement(1,position); // Haut
                     dessinCadreCoords(position,58);

                     end;

        #80:         begin

                     calculerCoordsApresDeplacement(2,position); // Bas

                     dessinCadreCoords(position,58);

                     end;
        end;
             end;

        end;

      entreePressee(position,personnage);

      end;

procedure affichageArme(personnage:typePersonnage);
var
  i:integer;
  j:integer;
  couleur:integer;
begin
     couleur:=12;
     for i:=0 to 3 do
         begin
         for j:=0 to 3 do
         begin
         couleurtexte(15);
         if (personnage.inventaire.invArme[i][j].nomArme='EMPTY') then
              begin
              couleur:=8;
              couleurtexte(8);
              end;
         if (i>1) then
         begin
              deplacerCurseurXY(28+23*i,20-5*j);
              write(personnage.inventaire.invArme[i][j].nomArme);
              couleurtexte(couleur);
              deplacerCurseurXY(28+23*i,21-5*j);
              write('Attaque : ',personnage.inventaire.invArme[i][j].ratioAD:2:2);
              if (personnage.inventaire.invArme[i][j].estEquipee=true) then
              begin
                   deplacerCurseurXY(28+23*i,22-5*j);
                   write('Equipee');
              end;
         end

         else
         begin

              deplacerCurseurXY(4+22*i,20-5*j);
              write(personnage.inventaire.invArme[i][j].nomArme);
              couleurtexte(couleur);
              deplacerCurseurXY(4+22*i,21-5*j);
              write('Attaque : ',personnage.inventaire.invArme[i][j].ratioAD:2:2);
              if (personnage.inventaire.invArme[i][j].estEquipee=true) then
              begin
                   deplacerCurseurXY(4+22*i,22-5*j);
                   write('Equipee');
              end;

         end;
         end;

         end;

end;

procedure affichageArmure(personnage:typePersonnage);
var
   i:integer;
   j:integer;
   couleur:integer;

begin
       couleur:=12;
       for i:=0 to 3 do
           begin
           for j:=0 to 3 do
           begin
           couleurtexte(15);
           if (personnage.inventaire.invArmure[i][j].nomArmure='EMPTY') then
              begin
              couleur:=8;
              couleurtexte(8);
              end;
           if (i>1) then
           begin
                deplacerCurseurXY(28+23*i,20-5*j);
                write(personnage.inventaire.invArmure[i][j].nomArmure);
                couleurtexte(couleur);
                deplacerCurseurXY(28+23*i,21-5*j);
                write('Defense : ',personnage.inventaire.invArmure[i][j].defense);
                if (personnage.inventaire.invArmure[i][j].estEquipee=true) then
                begin
                     deplacerCurseurXY(28+23*i,22-5*j);
                     write('Equipee');
                end;
           end

           else
           begin

                deplacerCurseurXY(4+22*i,20-5*j);
                write(personnage.inventaire.invArmure[i][j].nomArmure);
                couleurtexte(couleur);
                deplacerCurseurXY(4+22*i,21-5*j);
                write('Defense : ',personnage.inventaire.invArmure[i][j].defense);
                if (personnage.inventaire.invArmure[i][j].estEquipee=true) then
                begin
                     deplacerCurseurXY(4+22*i,22-5*j);
                     write('Equipee');
                end;

           end;
           end;

           end;
end;

procedure affichageDrops(personnage:typePersonnage);
var
   i:integer;
   j:integer;


begin

         for i:=0 to 3 do
         begin
             for j:=0 to 3 do
             begin

             if (personnage.inventaire.invDrop[i][j].nomDrop='EMPTY') then
              begin
              couleurtexte(8);
              end
             else
              couleurtexte(15);

              if (i>1) then
              begin
                  deplacerCurseurXY(28+23*i,20-5*j);
                  write(personnage.inventaire.invDrop[i][j].nomDrop);
              end
              else
              begin
                  deplacerCurseurXY(4+22*i,20-5*j);
                  write(personnage.inventaire.invDrop[i][j].nomDrop);
              end;
             end;

         end;
end;

procedure affichageConso(personnage:typePersonnage);
var
  i:integer;
  j:integer;
  couleur:integer;
begin
     couleur:=12;
     for i:=0 to 1 do
     begin
         for j:=0 to 3 do
         begin
         couleurtexte(15);
         if (personnage.inventaire.invPotion[i][j].nomPotion='EMPTY') then
              begin
              couleur:=8;
              couleurtexte(8);
              end;
              deplacerCurseurXY(4+22*i,20-5*j);
              write(personnage.inventaire.invPotion[i][j].nomPotion);
              couleurtexte(couleur);
              deplacerCurseurXY(4+22*i,21-5*j);
              write('Soin : ',personnage.inventaire.invPotion[i][j].healHP);
         end;
     end;

     couleur:=12;
     for i:=0 to 1 do
     begin
         for j:=0 to 3 do
         begin

         couleurtexte(15);
         if (personnage.inventaire.invBombe[i][j].nomBombe='EMPTY') then
              begin
              couleur:=8;
              couleurtexte(8);
              end;
         deplacerCurseurXY(75+23*i,20-5*j);
         write(personnage.inventaire.invBombe[i][j].nomBombe);
         couleurtexte(couleur);
         deplacerCurseurXY(75+23*i,21-5*j);
         write('Degats : ',personnage.inventaire.invBombe[i][j].degat);
         end;
     end;
end;
 // Affiche les infos du perso
procedure affichageInfoPerso(position:typePosition;personnage:typePersonnage);
begin
     dessinerCadreXY(35,34,56,50,double,15,0);
     deplacerCurseurXY(36,35);
     couleurTexte(20);
     write(getNomActuelle(personnage1));
     deplacerCurseurXY(36,37);
     write('Sexe : ',getSexeActuelle(personnage1));
     deplacerCurseurXY(36,39);
     write('Argent : ',getOrActuelle(personnage1));
     while (Readkey <> #13) do
           begin

           end;

      reinitilisationMur();
      deplacementInventaireIHM(position,personnage,58);


end;

procedure dropEquipementIHM();
begin

end;

end.

