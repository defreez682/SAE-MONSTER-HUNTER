unit inventaireihm;

{$mode objfpc}{$H+}

interface
uses
    SysUtils,GestionEcran,inventaireLogic,dessinBaton,crtPerso,personnage;
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
procedure deplacementInventaireIHM(var position:typePosition;var personnage:typePersonnage;q:integer);

// Créer un cadre qui permet de se déplacer entre les différents inventaires
procedure deplacementEntreInventaires(position:typePosition);

// Affiche sur les coordonnées ou l'utilisateur est, un cadre gris
procedure dessinCadreCoords(position:typePosition;q:integer;var personnage:typePersonnage);


//--------- CORRECTION GRAPHIQUES ----------------------------------------------

// Reinitialise certains éléments de l'inventaire à son origine
procedure reinitialisationInventaireGeneral();

procedure reinitialisationCadreBlanc();

procedure reinitilisationInfoItem();

procedure reinitialisationArmes(personnage:typePersonnage);

procedure reinitialisationArmures(personnage:typePersonnage);

procedure reinitialisationDrops(personnage:typePersonnage);

procedure reinitialisationConso(personnage:typePersonnage);

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
     dessin3D(15,38);
     dessinPersonnage(20,40);

     dessinEpee(70,34);
     dessinPlastron(96,41);
     dessinJambiere(97,51);
     dessinBotte(77,50);
     dessinCasque(99,33);
     dessinGants(75,40);
     dessinerCadreXYRemix(67,32,113,57,double,3,0);
//---------------------------------------

deplacerCurseurXY(97,60);


end;

// Affiche l'inventaire des armes
procedure affichageInventaireArmesIHM(personnage:typePersonnage);
begin
     effacerecran();

     ColorierZoneRemix(15,15,20,95,29);

     affichageArme(personnage);


end;

// Affiche l'inventaire des armures
procedure affichageInventaireArmuresIHM(personnage:typePersonnage);
begin
     effacerecran();
     ColorierZoneRemix(15,15,20,95,29);
     affichageArmure(personnage);
end;

// Affiche l'inventaire des drops
procedure affichageInventaireDropsIHM(personnage:typePersonnage);
begin
     effacerecran();
     ColorierZoneRemix(15,15,20,95,29);

     affichageDrops(personnage);
end;

// Affiche l'inventaire des consommables
procedure affichageInventaireConsoIHM(personnage:typePersonnage);
begin
     effacerecran();
     ColorierZoneRemix(15,15,20,95,29);

     affichageConso(personnage);
end;

// Permet de se déplacer dans l'inventaire à l'aide des flèches directionnelles
procedure deplacementInventaireIHM(var position:typePosition;var personnage:typePersonnage;q:integer);

var
  Ch : Char;

Begin

   position.precedPos:='';
  repeat
    Ch := ReadKey;
    case Ch of
    #0: case ReadKey of    { Le code est #0, on appelle à nouveau ReadKey }
        #72:    begin
                     calculerCoordsApresDeplacement(1,position,personnage);      // Haut
                     dessinCadreCoords(position,q,personnage);

                end;

        #80:    begin
                     calculerCoordsApresDeplacement(2,position,personnage);    // Bas
                     dessinCadreCoords(position,q,personnage);
                end;
        #77:    begin
                     calculerCoordsApresDeplacement(3,position,personnage);   // Droite
                     dessinCadreCoords(position,q,personnage);
                end;
        #75:    begin
                     calculerCoordsApresDeplacement(4,position,personnage);   // Gauche
                     dessinCadreCoords(position,q,personnage);
                end;

        end;
    end;
  until Ch = #13; { On quitte avec Entrée }
  EntreePressee(position,personnage);
end;

// Affiche sur les coordonnées ou l'utilisateur est, un cadre gris
procedure dessinCadreCoords(position:typePosition;q:integer;var personnage:typePersonnage);
var
  y:Integer;
begin
     if (position.equipement) then
        begin


        if ((position.coordsActuelsInventaire.xA=1) and (position.coordsActuelsInventaire.yA=2)) then     // Cadre Epee
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=33 to 36 do
                    ColorierZoneRemix(0,12,69,92,y);
                   end
        else if ((position.coordsActuelsInventaire.xA=2) and (position.coordsActuelsInventaire.yA=2)) then // Cadre Casque
                   begin
                   reinitialisationInventaireGeneral();
                   for y:=33 to 36 do
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
                   for y:=39 to 51 do
                    ColorierZoneRemix(0,12,19,30,y);
                   end;
                   ColorierZoneRemix(0,15,19,30,41);
                   ColorierZoneRemix(0,15,28,31,49);
                   ColorierZoneRemix(0,15,19,21,49);
        deplacerCurseurXY(97,60);
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
          deplacerCurseurXY(49,q);
          write('  ');
          deplacerCurseurXY(49,q-2);
          write('  ');
          deplacerCurseurXY(49,q-4);
          write('  ');
          if (position.coordsActuelsInventaire.yA=0) then
               begin
               deplacerCurseurXY(49,q);
               write('>>');
               end
          else if (position.coordsActuelsInventaire.yA=1) then
               begin
               deplacerCurseurXY(49,q-2);
               write('>>');
               end
          else if (position.coordsActuelsInventaire.yA=2) then
               begin
               deplacerCurseurXY(49,q-4);
               write('>>');
               end;
          end
     else if (position.armes) or (position.armures) or (position.drops) or (position.consommables) then                                        // Cadre changement d'inventaire
                   begin
                   if (position.armes) then
                   reinitialisationArmes(personnage)
                   else if (position.armures) then
                   reinitialisationArmures(personnage)
                   else if (position.drops) then
                   reinitialisationDrops(personnage)
                   else if (position.consommables) then
                   reinitialisationConso(personnage);

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


     dessinerCadreXY(0,31,25,33,simple,15,0);
     deplacerCurseurXY(1,32);
     write('Inventaire de ', getNomActuelle(personnage));
     ColorierZoneRemix(15,15,20,95,60);

end;

// Reinitialise certains éléments de l'inventaire à son origine
procedure reinitialisationInventaireGeneral();
var
  y:Integer;
begin
     for y:=33 to 55 do
         ColorierZoneRemix(0,15,69,110,y);
     for y:=39 to 55 do
         ColorierZoneRemix(0,15,19,33,y);

end;
procedure reinitialisationCadreBlanc();
var
   y:integer;
begin

     for y:=56 to 60 do
     ColorierZoneRemix(0,0,20,100,y);

     couleurFond(0);
     deplacerCurseurXY(25,32);
     ColorierZoneRemix(15,15,20,95,60);
     dessinerCadreXYRemix(67,32,113,57,double,3,0);
end;

procedure reinitialisationArmes(personnage:typePersonnage);
var
  y,i,j:integer;

begin

     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage.inventaire.invArme[i][j].nomArme='VIDE') then
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

          else if (personnage.inventaire.invArme[i][j].nomArme<>'VIDE') then
          begin
               if (i<=1) then
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,22-5*j);
               end
               else if (i>1) then
               begin
                    ColorierZoneRemix(0,15,28+23*i,47+23*i,20-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,21-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,22-5*j);
               end;
          end;




          end;
     end;


     for y:=4 to 22 do
     ColorierZoneRemix(0,0,47,68,y);

     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationArmures(personnage:typePersonnage);
var
  y,i,j:integer;

begin

     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage.inventaire.invArmure[i][j].nomArmure='VIDE') then
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

          else if (personnage.inventaire.invArmure[i][j].nomArmure<>'VIDE') then
          begin
               if (i<=1) then
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,22-5*j);
               end
               else if (i>1) then
               begin
                    ColorierZoneRemix(0,15,28+23*i,47+23*i,20-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,21-5*j);
                    ColorierZoneRemix(0,12,28+23*i,47+23*i,22-5*j);
               end;
          end;




          end;
     end;


     for y:=4 to 22 do
     ColorierZoneRemix(0,0,47,68,y);

     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationDrops(personnage:typePersonnage);
var
  y,i,j:integer;

begin

     for i:=0 to 3 do
     begin
          for j:=0 to 3 do
          begin
          if (personnage.inventaire.invDrop[i][j].nomDrop='VIDE') then
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

          else if (personnage.inventaire.invDrop[i][j].nomDrop<>'VIDE') then
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


     for y:=4 to 22 do
     ColorierZoneRemix(0,0,47,68,y);

     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;

procedure reinitialisationConso(personnage:typePersonnage);
var
  y,i,j:integer;

begin

     for i:=0 to 1 do
     begin
          for j:=0 to 3 do
          begin
               if (personnage.inventaire.invPotion[i][j].nomPotion='VIDE') then
               begin
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,8,4+22*i,23+22*i,21-5*j);
               end
               else
               begin
                    ColorierZoneRemix(0,15,4+22*i,23+22*i,20-5*j);
                    ColorierZoneRemix(0,12,4+22*i,23+22*i,21-5*j);
               end;

               if (personnage.inventaire.invBombe[i][j].nomBombe='VIDE') then
               begin
                    ColorierZoneRemix(0,8,75+23*i,91+23*i,20-5*j);
                    ColorierZoneRemix(0,8,75+23*i,91+23*i,21-5*j);
               end
               else
               begin
                    ColorierZoneRemix(0,15,75+23*i,91+23*i,20-5*j);
                    ColorierZoneRemix(0,12,75+23*i,91+23*i,21-5*j);
               end;

          end;
     end;


     for y:=4 to 22 do
     ColorierZoneRemix(0,0,47,68,y);

     for y:=25 to 29 do
     ColorierZoneRemix(0,0,20,100,y);

     ColorierZoneRemix(15,15,20,95,29);


end;


procedure reinitilisationInfoItem();
var
  y:Integer;
begin
  for y:=34 to 50 do
         ColorierZoneRemix(0,0,36,57,y);
  for y:=34 to 50 do
         ColorierZoneRemix(0,0,47,68,y);

  dessinerCadreXYRemix(67,32,113,57,double,3,0);






end;

// Affiche les infos de l'item sur lequel le curseur se trouve
procedure affichageInfoItem(personnage:typePersonnage;var position:typePosition);
var
  deplacer,deplacer2:boolean;
  q:integer;
begin

// ----- Affichage des infos de l'item dans l'équipement -------------------------
  deplacer:=false;
  deplacer2:=false;
  position.coordsActuelsItem.xA:=position.coordsActuelsInventaire.xA;    // Avoir une Backup des coordonées de l'item
  position.coordsActuelsItem.yA:=position.coordsActuelsInventaire.yA;
  q:=19;
  if (Position.equipement) then
     begin
     position.equipement:=false;
     position.precedPos:='equipement';
     q:=48;
     dessinerCadreXY(47,34,68,50,double,15,0);
     couleurTexte(20);
     if ((position.coordsActuelsItem.xA=1) and (position.coordsActuelsItem.yA=2)) then
        begin

        if (itemSlot(67)<>0) then
        begin
             deplacer:=true;
             deplacerCurseurXY(48,37);
             write(personnage.inventaire.ArmeEquipee.nomArme);
             deplacerCurseurXY(48,39);
             write('Attaque : ',personnage.inventaire.ArmeEquipee.ratioAD:2:2);
             deplacerCurseurXY(48,41);
             write('Poids : ',personnage.inventaire.ArmeEquipee.poids);
             couleurTexte(15);
             deplacerCurseurXY(52,44);
             write('Desequipper');
             deplacerCurseurXY(52,46);
             write('Jeter');
             deplacerCurseurXY(52,48);
             write('Fermer');
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
         if (personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure<>'VIDE') then
         begin
         deplacer:=true;
         deplacerCurseurXY(48,37);
         write(personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure);
         deplacerCurseurXY(48,39);
         write('Defense : ',personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].defense);
         deplacerCurseurXY(48,41);
         write('Poids : ',personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].poids);
         couleurTexte(15);
         deplacerCurseurXY(52,44);
         write('Desequipper');
         deplacerCurseurXY(52,46);
         write('Jeter');
         deplacerCurseurXY(52,48);
         write('Fermer');
         end
         else
             begin
             deplacerCurseurXY(48,37);
             write(personnage.inventaire.ArmureEquipee[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure);
             deplacerCurseurXY(52,48);
             write('Fermer');
             end;
             end;

     end

//-------------- INFO INVENTAIRE ARME
  else if (position.armes) then
  begin
  position.armes:=false;
  position.precedPos:='arme';
  dessinerCadreXY(47,4,68,22,double,15,0);
  couleurTexte(20);
  if (personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme<>'VIDE' ) then
        begin
             deplacer:=true;
             deplacerCurseurXY(48,6);
             write(personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme);
             deplacerCurseurXY(48,8);
             write('Attaque : ',personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].ratioAD:2:2);
             deplacerCurseurXY(48,10);
             write('Poids : ',personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].poids);
             couleurTexte(15);
             deplacerCurseurXY(52,15);
             if (personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].estEquipee=false) then
             write('Equiper')
             else
             begin
             deplacer:=false;
             deplacer2:=true;
             end;


             deplacerCurseurXY(52,17);
             write('Jeter');
             deplacerCurseurXY(52,19);
             write('Fermer');
        end
        else
            begin
             deplacerCurseurXY(48,5);
             write(personnage.inventaire.invArme[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArme);
             deplacerCurseurXY(52,20);
             write('Fermer');
             end;
        end
  //-------------- INFO INVENTAIRE ARMURE
    else if (position.armures) then
    begin
    position.armures:=false;
    position.precedPos:='armure';
    dessinerCadreXY(47,4,68,22,double,15,0);
    couleurTexte(20);
    if (personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure<>'VIDE' ) then
          begin
               deplacer:=true;
               deplacerCurseurXY(48,6);
               write(personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure);
               deplacerCurseurXY(48,8);
               write('Defense : ',personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].defense);
               deplacerCurseurXY(48,10);
               write('Poids : ',personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].poids);
               couleurTexte(15);
               deplacerCurseurXY(52,15);
               if (personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].estEquipee=false) then
               write('Equiper')
               else
               begin
               deplacer:=false;
               deplacer2:=true;
               end;
               deplacerCurseurXY(52,17);
               write('Jeter');
               deplacerCurseurXY(52,19);
               write('Fermer');
          end
          else
              begin
               deplacerCurseurXY(48,5);
               write(personnage.inventaire.invArmure[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomArmure);
               deplacerCurseurXY(52,20);
               write('Fermer');
               end;
          end
 //-------------- INFO INVENTAIRE DROPS
  else if (position.drops) then
  begin
  position.drops:=false;
  position.precedPos:='drop';
  dessinerCadreXY(47,4,68,22,double,15,0);
  couleurTexte(20);
  if (personnage.inventaire.invDrop[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomDrop<>'VIDE' ) then
        begin
             deplacer2:=true;
             deplacerCurseurXY(48,6);
             write(personnage.inventaire.invDrop[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomDrop);

             couleurTexte(15);
             deplacerCurseurXY(52,17);
             write('Jeter');
             deplacerCurseurXY(52,19);
             write('Fermer');
        end
        else
            begin
             deplacerCurseurXY(48,5);
             write(personnage.inventaire.invDrop[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomDrop);
             deplacerCurseurXY(52,20);
             write('Fermer');
             end;
        end
 //-------------- INFO INVENTAIRE CONSOMMABLES
  else if (position.consommables) then
  begin
  position.consommables:=false;

  dessinerCadreXY(47,4,68,22,double,15,0);
  couleurTexte(20);
  if position.coordsActuelsItem.xA<=1 then
  begin
  position.precedPos:='potion';
     if (personnage.inventaire.invPotion[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomPotion<>'VIDE' ) then
        begin
             deplacer2:=true;
             deplacerCurseurXY(48,6);
             write(personnage.inventaire.invPotion[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomPotion);
             deplacerCurseurXY(48,8);
             write('Soin : ',personnage.inventaire.invPotion[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].healHP,' HP');
             couleurTexte(15);
             deplacerCurseurXY(52,17);
             write('Jeter');
             deplacerCurseurXY(52,19);
             write('Fermer');
        end
     else
         begin
             deplacerCurseurXY(48,5);
             write(personnage.inventaire.invPotion[position.coordsActuelsItem.xA][position.coordsActuelsItem.yA].nomPotion);
             deplacerCurseurXY(52,20);
             write('Fermer');
         end;
  end
  else
  begin
  position.precedPos:='bombe';
     if (personnage.inventaire.invBombe[position.coordsActuelsItem.xA-2][position.coordsActuelsItem.yA].nomBombe<>'VIDE' ) then
        begin
             deplacer2:=true;
             deplacerCurseurXY(48,6);
             write(personnage.inventaire.invBombe[position.coordsActuelsItem.xA-2][position.coordsActuelsItem.yA].nomBombe);
             deplacerCurseurXY(48,8);
             write('Degats : ',personnage.inventaire.invBombe[position.coordsActuelsItem.xA-2][position.coordsActuelsItem.yA].degat);
             couleurTexte(15);
             deplacerCurseurXY(52,17);
             write('Jeter');
             deplacerCurseurXY(52,19);
             write('Fermer');
        end
     else
         begin
             deplacerCurseurXY(48,5);
             write(personnage.inventaire.invBombe[position.coordsActuelsItem.xA-2][position.coordsActuelsItem.yA].nomBombe);
             deplacerCurseurXY(52,20);
             write('Fermer');
         end;
     end

  end;


  position.coordsActuelsInventaire.yA:=0;
  while (Readkey <> #13) do
        begin


        if (deplacer)  then
        begin

        case Readkey of
        #72:         begin

                     calculerCoordsApresDeplacement(1,position,personnage); // Haut
                     dessinCadreCoords(position,q,personnage);

                     end;

        #80:         begin

                     calculerCoordsApresDeplacement(2,position,personnage); // Bas

                     dessinCadreCoords(position,q,personnage);

                     end;
        end;
             end
        else if (deplacer2) then
        begin
        case Readkey of
        #72:         begin

                     position.coordsActuelsInventaire.yA:=1; // Haut
                     dessinCadreCoords(position,q,personnage);

                     end;

        #80:         begin

                     position.coordsActuelsInventaire.yA:=0; // Bas

                     dessinCadreCoords(position,q,personnage);

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
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(56,1);
     write('Armes');
     for i:=0 to 3 do
         begin
         for j:=0 to 3 do
         begin
         couleurtexte(15);
         if (personnage.inventaire.invArme[i][j].nomArme='VIDE') then
              begin
              couleur:=8;
              couleurtexte(8);
              end
         else
             couleur:=12;
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
       effacerecran();
       dessinerCadreXY(25,0,95,2,double,15,0);
       deplacerCurseurXY(56,1);
       write('Armures');

       for i:=0 to 3 do
           begin
           for j:=0 to 3 do
           begin
           couleurtexte(15);

           if (personnage.inventaire.invArmure[i][j].nomArmure='VIDE') then
              begin
              couleur:=8;
              couleurtexte(8);
              end
           else
               couleur:=12;
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
         effacerecran();
         dessinerCadreXY(25,0,95,2,double,15,0);
         deplacerCurseurXY(56,1);
         write('Drops');
         for i:=0 to 3 do
         begin
             for j:=0 to 3 do
             begin

             if (personnage.inventaire.invDrop[i][j].nomDrop='VIDE') then
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
     effacerecran();
     dessinerCadreXY(25,0,95,2,double,15,0);
     deplacerCurseurXY(54,1);
     write('Consommables');
     for i:=0 to 1 do
     begin
         for j:=0 to 3 do
         begin
         couleurtexte(15);
         if (personnage.inventaire.invPotion[i][j].nomPotion='VIDE') then
         begin
              couleur:=8;
              couleurtexte(8);
         end
         else
             couleur:=12;

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
         if (personnage.inventaire.invBombe[i][j].nomBombe='VIDE') then
              begin
              couleur:=8;
              couleurtexte(8);
              end
         else
             couleur:=12;

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
     dessinerCadreXY(36,34,57,50,double,15,0);
     deplacerCurseurXY(37,35);
     couleurTexte(20);
     write(getNomActuelle(personnage1));
     deplacerCurseurXY(37,37);
     write('Sexe : ',getSexeActuelle(personnage));
     deplacerCurseurXY(37,39);
     write('Argent : ',getOrActuelle(personnage));
     while (Readkey <> #13) do
           begin

           end;

      reinitilisationInfoItem();
      deplacementInventaireIHM(position,personnage,58);


end;



end.

