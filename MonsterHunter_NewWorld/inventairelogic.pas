unit inventaireLogic;

{$mode objfpc}{$H+}

interface



type

//------------- Arme -------------------

  arme = record
    nomArme:String;
    poids:Integer;
    ratioAD:Real;
    prix:integer;
    estEquipee:Boolean;
    end;

 //------------ Armure -----------------

  armure = record
    typeArmure:String;
    nomArmure:String;
    poids:Integer;
    defense:Integer;
    estEquipee:Boolean;
    prix:integer;
    end;

 //----------- Consommables ------------
  potion = record
    nomPotion:String;
    healHP:Integer;
    prix:integer;
    end;

  bombe = record
    nomBombe:String;
    degat:Integer;
    prix:integer;
    end;

  cuisine = record
    nomPlat:String;
    bonusEffet:String;
    bonusValeur:Integer;
    end;

//----------- Drops ------------------
  drop = record
    nomDrop:String;
    end;


//----------- Inventaires ------------
  typeInventaire = record
    invArme : array[0..3,0..3] of arme;
    invArmure : array[0..3,0..3] of armure;
    invPotion : array[0..1,0..3] of potion;   // A CHANGER ( coordonnées )
    invBombe : array[0..1,0..3] of bombe;     // A CHANGER ( coordonnées )
    invDrop : array[0..3,0..3] of drop;
    ArmureEquipee : array[1..2,0..2] of armure;
    ArmeEquipee : arme;
    end;
typeStuffDisponible = record
    invArmeDispo : array[1..20] of arme;    // 20 ARMES DISPO
    invArmureDispo : array[1..20] of armure;  // 20 ARMURES
    invPotionDispo : array[1..3] of potion;   // 3 POTIONS
    invBombeDispo : array[1..3] of bombe;     // 3 BOMBES
    invCuisineDispo : array[1..6] of cuisine;  // 6 PLATS
    invDropDispo : array[1..20] of drop;   // 20 DROPS
    end;


  typeCoordsInventaire=record
   xA:Integer;
   yA:Integer;
   end;
  typePosition=record
      equipement:boolean;
      cadreInventaires:boolean;
      infoItem:boolean;
      armes:boolean;
      armures:boolean;
      drops:boolean;
      consommables:boolean;
      precedPos:string;
      coordsActuelsInventaire:typeCoordsInventaire;
      coordsActuelsItem:typeCoordsInventaire;
  end;
  typePersonnage=record
    pseudo:Text;
    Sexe:Text;
    inventaire:typeInventaire;
    orActuel:Text;
    lvlglobal : Text;
    lvlexp : Text;
    Taille:Text;
    existe:Text;
  end;
var
   stuffDispo:typeStuffDisponible;



//-------------------- AFFICHAGE INVENTAIRES -----------------------------------


// Affichage de l'inventaire d'un joueur
procedure affichageInventaire(personnage:typePersonnage);

// Affichage de l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);

// Affichage de l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage;position:typePosition);

// Affichage de l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage;position:typePosition);

// Affichage de l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage;position:typePosition);


//--------------------- POSITION DANS INVENTAIRE ------------------------------


// Renvoie les coordonnées actuelles dans l'inventaire après un déplacement z
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition);

// Appelle la procédure relative à l'endroit ou la touche entrée est pressée
procedure entreePressee(var position:typePosition;var personnage:typePersonnage);

// Renvoie les coordonnées du premier emplacement vide de l'inventaire ou -1 si l'inventaire est plein
function isInventairePlein(typeItem:string;personnage:typePersonnage):typeCoordsInventaire;


//--------------------- FONCTIONNALITE INVENTAIRE ------------------------------

// Permet de drop une armure/arme
procedure dropEquipement(var personnage:typePersonnage;x,y:integer);

// Permet de déséquipper un équipement
procedure unequipEquipement(var personnage:typePersonnage;i,j:integer);

// Actualise l'equipement d'après la valeur du boolean estEquipe   INUTILE POUR INSTANT
procedure actualisationEquipement(var personnage:typePersonnage);

// Ajoute un item à l'inventaire du personnage
procedure ajoutItemToPersonnage(typeItem:string;numItem:integer;var personnage:typePersonnage);






implementation
uses
    SysUtils,inventaireihm,personnage,chambreIHM;


 //-------------------AFFICHAGE INVENTAIRES------------------------------


// Affichage de l'inventaire d'un joueur
procedure affichageInventaire(personnage:typePersonnage);
var
  Position:typePosition;
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     position.equipement:=true;
     Position.cadreInventaires:=false;
     position.infoItem:=false;
     position.Armes:=false;
     affichageInventaireIHM(personnage);
     deplacementInventaireIHM(position,personnage,58);


end;

// Affichage de l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.armes:=true;
     affichageInventaireArmesIHM(personnage);
     deplacementInventaireIHM(position,personnage,27);
end;

// Affichage de l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.armures:=true;
     affichageInventaireArmuresIHM(personnage);
     deplacementInventaireIHM(position,personnage,27);
end;

// Affichage de l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.consommables:=true;
     affichageInventaireConsoIHM(personnage);
     deplacementInventaireIHM(position,personnage,27);
end;

// Affichage de l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.drops:=true;
     affichageInventaireDropsIHM(personnage);
     deplacementInventaireIHM(position,personnage,27);
end;



//--------------------- POSITION DANS INVENTAIRE ------------------------------


// Renvoie les coordonnées actuelles dans l'inventaire après un déplacement z
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition);


begin

     if (z=4) then // Si Deplacement Gauche
          begin
                  if  (position.coordsActuelsInventaire.xA <> 0) then
                      begin
                           position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA-1;
                           if ((position.equipement) and (position.coordsActuelsInventaire.xA=0)) then
                              position.coordsActuelsInventaire.yA:=0;
                      end;

          end

//------- Si l'utilisateur se trouve dans l'inventaire principal ( equipement ) ---------------------

     else if (Position.equipement) then
     begin
          if (z=1) then      // Si Déplacement Haut
          begin
               if (position.coordsActuelsInventaire.yA <> 2) and (position.coordsActuelsInventaire.xA <> 0) then
                  position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end
          else if (z=2) then  // Si Déplacement Bas
               begin
                     if (position.coordsActuelsInventaire.yA > 0) then
                            position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1


                     else if (position.coordsActuelsInventaire.yA = 0) then
                          begin
                               position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;

                               position.precedPos:='equipement';
                               position.cadreInventaires:=true;
                               position.Equipement:=false;

                               reinitialisationInventaireGeneral();
                               deplacementEntreInventaires(position);

                          end;
               end

     else if (z=3) then  // Si Déplacement Droite
          begin
               if (position.coordsActuelsInventaire.xA <> 2) then
                  position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
          end

     end

//-- Si l'utilisateur se trouve dans le cadre permettant d'acceder aux autres inventaires---------------------

     else if (Position.cadreInventaires) then
     begin
          if (z=1) then      // Si Déplacement Haut
          begin
               position.coordsActuelsInventaire.xA:=2;
               position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
               position.cadreInventaires:=false;
               if (position.precedPos='equipement') then
               begin
               position.equipement:=true;
               position.precedPos:='';
               end
               else if (position.precedPos='armes') then
               position.armes:=true
               else if (position.precedPos='armures') then
               position.armures:=true
               else if (position.precedPos='drops') then
               position.drops:=true
               else if (position.precedPos='conso') then
               position.consommables:=true;


          end
          else if (z=3) then // Si Déplacement Droite
          begin
               if (position.coordsActuelsInventaire.xA <> 5) then
                   position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
          end;
     end

 //------- Si l'utilisateur se trouve dans l'inventaire des armes ---------------------

     else if (Position.Armes) then
     begin
          if (z=1) then       // Si Déplacement Haut
          begin
               if (position.coordsActuelsInventaire.yA<>3) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end
          else if (z=2) then  // Si Déplacement Bas
          begin
               if (position.coordsActuelsInventaire.yA>0) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1
               else
                   begin
                     position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;

                     position.precedPos:='armes';
                     position.cadreInventaires:=true;
                     position.armes:=false;

                     reinitialisationArmes();
                     deplacementEntreInventaires(position);

                   end;
          end
          else if (z=3) then  // Si Déplacement Droite
               begin
                    if (position.coordsActuelsInventaire.xA <> 3) then
                       position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
               end;
     end

 //------- Si l'utilisateur se trouve dans l'inventaire des drops ---------------------

     else if (Position.Drops) then
     begin
          if (z=1) then       // Si Déplacement Haut
          begin
               if (position.coordsActuelsInventaire.yA<>3) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end
          else if (z=2) then  // Si Déplacement Bas
          begin
               if (position.coordsActuelsInventaire.yA>0) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1
               else
                   begin
                     position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;

                     position.precedPos:='drops';
                     position.cadreInventaires:=true;
                     position.drops:=false;

                     reinitialisationDrops();
                     deplacementEntreInventaires(position);

                   end;
          end
          else if (z=3) then  // Si Déplacement Droite
               begin
                    if (position.coordsActuelsInventaire.xA <> 3) then
                       position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
               end;
     end

 //------- Si l'utilisateur se trouve dans l'inventaire des armures ---------------------

     else if (Position.Armures) then
     begin
          if (z=1) then       // Si Déplacement Haut
          begin
               if (position.coordsActuelsInventaire.yA<>3) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end
          else if (z=2) then  // Si Déplacement Bas
          begin
               if (position.coordsActuelsInventaire.yA>0) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1
               else
                   begin
                     position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;

                     position.precedPos:='armures';
                     position.cadreInventaires:=true;
                     position.armures:=false;

                     reinitialisationArmures();
                     deplacementEntreInventaires(position);

                   end;
          end
          else if (z=3) then  // Si Déplacement Droite
               begin
                    if (position.coordsActuelsInventaire.xA <> 3) then
                       position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
               end;
     end
 //------- Si l'utilisateur se trouve dans l'inventaire des consommables ---------------------

     else if (Position.Consommables) then
     begin
          if (z=1) then       // Si Déplacement Haut
          begin
               if (position.coordsActuelsInventaire.yA<>3) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end
          else if (z=2) then  // Si Déplacement Bas
          begin
               if (position.coordsActuelsInventaire.yA>0) then
                    position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1
               else
                   begin
                     position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;

                     position.precedPos:='conso';
                     position.cadreInventaires:=true;
                     position.consommables:=false;

                     reinitialisationConso();
                     deplacementEntreInventaires(position);

                   end;
          end
          else if (z=3) then  // Si Déplacement Droite
               begin
                    if (position.coordsActuelsInventaire.xA <> 3) then
                       position.coordsActuelsInventaire.xA:=position.coordsActuelsInventaire.xA+1;
               end;
     end
 //------- Si l'utilisateur se trouve dans la fiche information de l'item ------------

     else if (position.infoItem) then
     begin

          if (z=1) then  // Si Déplacement Haut
          begin
          if (position.coordsActuelsInventaire.yA <> 2) then
             position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA+1;
          end

          else if (z=2) then // Si Déplacement Bas
          begin
          if (position.coordsActuelsInventaire.yA <> 0) then
             position.coordsActuelsInventaire.yA:=position.coordsActuelsInventaire.yA-1;
          end;

     end


end;


// Appelle la procédure relative à l'endroit ou la touche entrée est pressée
procedure entreePressee(var position:typePosition;var personnage:typePersonnage);
begin
     if (Position.equipement)then
        begin
            if (position.coordsActuelsInventaire.xA=0) then
               begin
                 affichageInfoPerso(position,personnage);
               end
            else
                begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);


                 end;

        end

     else if (Position.cadreInventaires) then              // DANS CADRE INVENTAIRE
          begin
        case position.coordsActuelsInventaire.xA of
        0:affichageInventaire(personnage);
        1:affichageInventaireArmes(personnage,position);
        2:affichageInventaireArmures(personnage,position);
        3:affichageInventaireConsommables(personnage,position);
        4:affichageInventaireDrops(personnage,position);
        5:chambre();
        end;
          end

     else if (position.infoItem) then
     begin
        case position.coordsActuelsInventaire.yA of
        0:
          begin
               reinitilisationMur();
               position.equipement:=true;
               position.infoItem:=false;
               position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
               position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
               deplacementInventaireIHM(position,personnage,58);

          end;
        1:
          begin
          dropEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA);
          reinitilisationMur();
          position.equipement:=true;
          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaireIHM(position,personnage,58);

          end;
        2:
          begin
          unequipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA);
          reinitilisationMur();
          position.equipement:=true;
          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaireIHM(position,personnage,58);
          end;


        end;

     end
     else if (position.armes) then
     begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);

     end;
end;



//-------------------FONCTIONNALITE INVENTAIRE ------------------------------


// Ajoute un item à l'inventaire du personnage
procedure ajoutItemToPersonnage(typeItem:string;numItem:integer;var personnage:typePersonnage);
begin
     if (typeItem='arme') then
     begin
          if (isInventairePlein('arme',personnage).xA <> -1) then
          begin
          personnage.inventaire.invArme[isInventairePlein('arme',personnage).xA][isInventairePlein('arme',personnage).yA]:=stuffDispo.invArmeDispo[numItem];
          end;
     end
     else if (typeItem='armure') then
     begin
     if (isInventairePlein('armure',personnage1).xA <> -1) then
          begin
          personnage.inventaire.invArmure[isInventairePlein('armure',personnage).xA][isInventairePlein('armure',personnage).yA]:=stuffDispo.invArmureDispo[numItem];
          end;
     end
     else if (typeItem='drop') then
     begin
     if (isInventairePlein('drop',personnage1).xA <> -1) then
          begin
          personnage.inventaire.invDrop[isInventairePlein('drop',personnage).xA][isInventairePlein('drop',personnage).yA]:=stuffDispo.invDropDispo[numItem];
          end;
     end
     else if (typeItem='bombe') then
     begin
     if (isInventairePlein('bombe',personnage1).xA <> -1) then
          begin
          personnage.inventaire.invBombe[isInventairePlein('bombe',personnage).xA][isInventairePlein('bombe',personnage).yA]:=stuffDispo.invBombeDispo[numItem];
          end;
     end
     else if (typeItem='potion') then
     begin
     if (isInventairePlein('potion',personnage1).xA <> -1) then
          begin
          personnage.inventaire.invPotion[isInventairePlein('potion',personnage).xA][isInventairePlein('potion',personnage).yA]:=stuffDispo.invPotionDispo[numItem];
          end;
     end;
end;

// Renvoie les coordonnées du premier emplacement vide de l'inventaire ou -1 si l'inventaire est plein
function isInventairePlein(typeItem:string;personnage:typePersonnage):typeCoordsInventaire;
var
   i,j:integer;
   res:typeCoordsInventaire;
   boucle:boolean;
begin
     i:=0;
     j:=0;
     res.xA:=-1;
     boucle:=false;

     if (typeItem='arme') then
          begin
          for i:=0 to 3 do
          begin
              for j:=0 to 3 do
              begin
              if ((personnage.inventaire.invArme[i][j].nomArme='EMPTY') and (boucle<>true)) then
                  begin
                  boucle:=true;
                  res.xA:=i;
                  res.yA:=j;
                  end;

              end;
          end;
          end

     else if (typeItem='armure') then
        begin

          for i:=0 to 3 do
          begin
              for j:=0 to 3 do
              begin
              if ((personnage.inventaire.invArmure[i][j].nomArmure='EMPTY') and (boucle<>true)) then
                  begin
                  boucle:=true;
                  res.xA:=i;
                  res.yA:=j;
                  end;

              end;
          end;
        end

      else if (typeItem='drop') then
        begin

          for i:=0 to 3 do
          begin
              for j:=0 to 3 do
              begin
              if ((personnage.inventaire.invDrop[i][j].nomDrop='EMPTY') and (boucle<>true)) then
                  begin
                  boucle:=true;
                  res.xA:=i;
                  res.yA:=j;
                  end;

              end;
          end;
        end

       else if (typeItem='potion') then
        begin
          for i:=0 to 1 do
          begin
              for j:=0 to 3 do
              begin
              if ((personnage.inventaire.invPotion[i][j].nomPotion='EMPTY') and (boucle<>true)) then
                  begin
                  boucle:=true;
                  res.xA:=i;
                  res.yA:=j;
                  end;

              end;
          end;
        end

       else if (typeItem='bombe') then
        begin
          for i:=0 to 1 do
          begin
              for j:=0 to 3 do
              begin
              if ((personnage.inventaire.invBombe[i][j].nomBombe='EMPTY') and (boucle<>true)) then
                  begin
                  boucle:=true;
                  res.xA:=i;
                  res.yA:=j;
                  end;

              end;
          end;
        end;
     isInventairePlein.xA:=res.xA;
     isInventairePlein.yA:=res.yA;
end;

// Drop une armure/arme
procedure dropEquipement(var personnage:typePersonnage;x,y:integer);
var
  i:integer;
  j:integer;
begin
     if ((x=1) and (y=2)) then
     begin
     for i:=0 to 3 do
         begin
         for j:=0 to 3 do
             begin
             if (personnage.inventaire.ArmeEquipee.nomArme=personnage.inventaire.invArme[i][j].nomArme) then
             begin
                  personnage.inventaire.ArmeEquipee.nomArme:='EMPTY';
                  personnage.inventaire.invArme[i][j].nomArme:='EMPTY';

             end;
             end;

         end;

     end
     else
     begin
     for i:=0 to 3 do
         begin
         for j:=0 to 3 do
             begin
             if (personnage.inventaire.ArmureEquipee[x][y].nomArmure=personnage.inventaire.invArmure[i][j].nomArmure) then
             begin
                  personnage.inventaire.ArmureEquipee[x][y].nomArmure:='EMPTY';
                  personnage.inventaire.invArmure[i][j].nomArmure:='EMPTY';

             end;
             end;

         end;

     //dropEquipementIHM(); // Affichage ---- Drop de l'item -----
end;
end;

// Permet de déséquipper un équipement
procedure unequipEquipement(var personnage:typePersonnage;i,j:integer);
begin
     if ((i=1) and (j=2)) then
     begin
     personnage.inventaire.ArmeEquipee.estEquipee:=false;
     personnage.inventaire.ArmeEquipee.nomArme:='EMPTY';
     end
     else
     begin
          personnage.inventaire.ArmureEquipee[i][j].estEquipee:=false;
          personnage.inventaire.ArmureEquipee[i][j].nomArmure:='EMPTY';
     end;
     //unequipEquipementIHM();

end;

// Actualise l'equipement d'après la valeur du boolean estEquipe   INUTILE POUR INSTANT
procedure actualisationEquipement(var personnage:typePersonnage);
var
   i:integer;
   j:integer;
begin
//----------------------------- EQUIP
     for i:=0 to 3 do
     begin
         for j:=0 to 3 do
         begin
             if (personnage.inventaire.invArmure[i][j].estEquipee=true) then
             case personnage.inventaire.invArmure[i][j].typeArmure of
             'Gants':personnage.inventaire.ArmureEquipee[1][1]:=personnage.inventaire.invArmure[i][j];
             'Bottes':personnage.inventaire.ArmureEquipee[1][0]:=personnage.inventaire.invArmure[i][j];
             'Jambiere':personnage.inventaire.ArmureEquipee[2][0]:=personnage.inventaire.invArmure[i][j];
             'Plastron':personnage.inventaire.ArmureEquipee[2][1]:=personnage.inventaire.invArmure[i][j];
             'Casque':personnage.inventaire.ArmureEquipee[2][2]:=personnage.inventaire.invArmure[i][j];
             end;
         end;
     end;


     for i:=0 to 3 do
     begin
         for j:=0 to 3 do
         begin
             if (personnage.inventaire.invArme[i][j].estEquipee=true) then
                personnage.inventaire.ArmeEquipee:=personnage.inventaire.invArme[i][j];
         end;

      end;
     //----------------------------   UNEQUIP
     for i:=1 to 2 do
     begin
         for j:=0 to 2 do
         begin
             if ((personnage.inventaire.ArmureEquipee[i][j].estEquipee=false) and ((j<>2) or (i<>1))) then
             personnage.inventaire.ArmureEquipee[i][j].nomArmure:='EMPTY';

             end;
         end;

     if (personnage.inventaire.ArmeEquipee.estEquipee=false) then
        personnage.inventaire.ArmeEquipee.nomArme:='EMPTY';
end;
end.

