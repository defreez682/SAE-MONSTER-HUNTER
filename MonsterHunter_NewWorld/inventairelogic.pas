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
    invArmeDispo : array[0..20] of arme;    // 20 ARMES DISPO
    invArmureDispo : array[0..20] of armure;  // 20 ARMURES
    invPotionDispo : array[0..3] of potion;   // 3 POTIONS
    invBombeDispo : array[0..3] of bombe;     // 3 BOMBES
    invCuisineDispo : array[1..6] of cuisine;  // 6 PLATS
    invDropDispo : array[0..20] of drop;   // 20 DROPS
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
   invItem : file of Integer;




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
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition;var personnage:typePersonnage);

// Appelle la procédure relative à l'endroit ou la touche entrée est pressée
procedure entreePressee(var position:typePosition;var personnage:typePersonnage);

// Renvoie les coordonnées du premier emplacement vide de l'inventaire ou -1 si l'inventaire est plein
function isInventairePlein(typeItem:string;personnage:typePersonnage):typeCoordsInventaire;


//--------------------- FONCTIONNALITE INVENTAIRE ------------------------------

procedure recupArmeArmureEquipee(var personnage:typePersonnage);

procedure recupInventaire(var personnage:typePersonnage);

// Permet de drop une armure/arme
procedure dropEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);

// Permet d'équipper un équipement
procedure equipEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);

// Actualise l'equipement d'après la valeur du boolean estEquipe   INUTILE POUR INSTANT
procedure actualisationEquipement(var personnage:typePersonnage);

// Ajoute un item à l'inventaire du personnage
procedure ajoutItemToPersonnage(typeItem:string;numItem:integer;var personnage:typePersonnage);



// Sauvegarde

{On créer le fichier et le slot utiliser}
procedure creationInventaireItem(idItem,Slot : Integer);
{Modifie le slot de l'inventaire avec l'id de l'arme}
procedure modificationInventaireItem(idItem,Slot : Integer);
{Renvoie l'id de l'arme sur le slot indiqué}
function itemSlot(Slot : Integer) : Integer;

implementation
uses
    SysUtils,inventaireihm,personnage,chambreIHM;



//-------------------Sauvegarde inventaire

{Principe : Il y a 16 slots pour les armes, 16 pour les armures, 8 pour les potions et 8 pour les bombes (16 pour les drops je suppose?)
ce qui nous fait 64 slots (un stack, comme dans  minecraft)
- 1-16 première ligne : Armes
- 17-32 : Armure
- 33 à 40 : Potion
- 41 à 48 : Bombes
- 49 à 64 : Drops
- 67 : arme equipee
- 65 66 68 69 70 ( armure equippe )}

procedure creationInventaireItem(idItem,Slot : Integer);
begin
     assign(invItem, 'C:/MHNewWorld/data.bin');
     rewrite(invItem);
     seek(invItem,Slot);
     write(invItem,idItem);
     close(invItem);
end;


procedure modificationInventaireItem(idItem,Slot : Integer);
begin
     assign(invItem, 'C:/MHNewWorld/data.bin');
     reset(invItem);
     seek(invItem,Slot);
     write(invItem,idItem);
     close(invItem);
end;

function itemSlot(Slot : Integer) : Integer;
var val : Integer;
begin
     assign(invItem, 'C:/MHNewWorld/data.bin');
     reset(invItem);
     seek(invItem, slot);
     read(invItem,val);
     itemSlot := val;
     close(invItem);
end;




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
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition;var personnage:typePersonnage);


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

                     reinitialisationArmes(personnage);
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

                     reinitialisationDrops(personnage);
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

                     reinitialisationArmures(personnage);
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

                     reinitialisationConso(personnage);
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
var
  q:integer;
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
         if (position.precedPos='equipement') then
         begin
         reinitilisationMur();
         position.equipement:=true;
         q:=58;
         end
         else if (position.precedPos='arme') then
         begin
         reinitialisationArmes(personnage);
         position.armes:=true;
         q:=27;
         end
         else if (position.precedPos='armure') then
         begin
         reinitialisationArmures(personnage);
         position.armures:=true;
         q:=27;
         end
         else if (position.precedPos='potion') or (position.precedPos='bombe') then
         begin
         reinitialisationConso(personnage);
         position.consommables:=true;
         q:=27;
         end
         else if (position.precedPos='drop') then
         begin
         reinitialisationDrops(personnage);
         position.drops:=true;
         q:=27;



         end;

        case position.coordsActuelsInventaire.yA of
        0:
          begin
               position.infoItem:=false;
               position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
               position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
               deplacementInventaireIHM(position,personnage,q);

          end;
        1:
          begin
          dropEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,position.precedPos);
          if (position.precedPos='arme') then
          affichageArme(personnage)
          else if (position.precedPos='armure') then
          affichageArmure(personnage)
          else if (position.precedPos='potion') or (position.precedPos='bombe')  then
          affichageConso(personnage)
          else if (position.precedPos='drop') then
          affichageDrops(personnage);

          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaireIHM(position,personnage,q);

          end;
        2:
          begin
          if (position.precedPos='arme') then
          begin
          equipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,'arme');
          AffichageArme(personnage);
          end
          else if (position.precedPos='armure') then
          begin
          equipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,'armure');
          AffichageArmure(personnage);
          end;

          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaireIHM(position,personnage,q);
          end;


        end;

     end
     else if (position.armes) then
     begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);

     end
     else if (position.armures) then
     begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);

     end
     else if (position.consommables) then
     begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);

     end
     else if (position.drops) then
     begin
                     position.infoItem:=true;
                     affichageInfoItem(personnage,position);

     end;
end;



//-------------------FONCTIONNALITE INVENTAIRE ------------------------------


// Renvoie le slot correspondant aux coordonnées données en paramètre
function slotFromCoordonne(x,y:integer;typeItem:string): integer;
begin

     if (typeItem='arme') then
     begin
          if x=0 then
          x:=1
          else if x=1 then
          x:=5
          else if x=2 then
          x:=9
          else if x=3 then
          x:=13;
          slotFromCoordonne:=x+y;
     end
     else if (typeItem='armure') then
     begin
          if x=0 then
          x:=1
          else if x=1 then
          x:=5
          else if x=2 then
          x:=9
          else if x=3 then
          x:=13;
          slotFromCoordonne:=16+x+y;
     end
     else if (typeItem='potion') then
     begin
          if x=0 then
          x:=1
          else if x=1 then
          x:=5;

          slotFromCoordonne:=32+x+y;

     end
     else if (typeItem='bombe') then
     begin
          if x=2 then
          x:=9
          else if x=3 then
          x:=13;

          slotFromCoordonne:=32+x+y;
     end
     else if (typeItem='drop') then
     begin
          if x=0 then
          x:=1
          else if x=1 then
          x:=5
          else if x=2 then
          x:=9
          else if x=3 then
          x:=13;

          slotFromCoordonne:=48+x+y;
     end;
end;

// Permet de récuperer la sauvegarde de l'inventaire
procedure recupInventaire(var personnage:typePersonnage);
var
  s:integer; // Représente le slot dans le fichier data.bin
  i,j:integer;

// Ajoute pour chaque cellule de l'inventaire, l'ID de l'item stocké dans le fichier data.bin
begin
     s:=0;
     for i:=0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
          s:=s+1;
          personnage.inventaire.invArme[i][j]:=stuffDispo.invArmeDispo[ItemSlot(s)];
          end;
     end;

     s:=16;
     for i:=0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
          s:=s+1;
          personnage.inventaire.invArmure[i][j]:=stuffDispo.invArmureDispo[ItemSlot(s)];
          end;
     end;

     s:=32;
     for i:=0 to 1 do
     begin
          for j:= 0 to 3 do
          begin
          s:=s+1;
          personnage.inventaire.invPotion[i][j]:=stuffDispo.invPotionDispo[ItemSlot(s)];
          end;
     end;

     s:=40;
     for i:=0 to 1 do
     begin
          for j:= 0 to 3 do
          begin
          s:=s+1;
          personnage.inventaire.invBombe[i][j]:=stuffDispo.invBombeDispo[ItemSlot(s)];
          end;
     end;

     s:=48;
     for i:=0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
          s:=s+1;
          personnage.inventaire.invDrop[i][j]:=stuffDispo.invDropDispo[ItemSlot(s)];
          end;
     end;

     s:=64;
     for i:=1 to 2 do
     begin
          for j:= 0 to 2 do
          begin
          s:=s+1;
          if ((i=1) and (j=2)) then
             begin
             personnage.inventaire.ArmeEquipee:=stuffDispo.invArmeDispo[ItemSlot(s)];
             personnage.inventaire.ArmeEquipee.estEquipee:=true;
             end
          else
             begin
              personnage.inventaire.ArmureEquipee[i][j]:=stuffDispo.invArmureDispo[ItemSlot(s)];
              personnage.inventaire.ArmureEquipee[i][j].estEquipee:=true;
             end;
          end;
     end;
     recupArmeArmureEquipee(personnage);

end;


procedure recupArmeArmureEquipee(var personnage:typePersonnage);
var
  i,j:integer;
  boucle:boolean;
begin
     j:=0;
     i:=0;
     boucle:=true;
     for i:= 0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
               if (j=3) and (i=3) then
               boucle:=false

               else if (personnage.inventaire.invArme[i][j].nomArme=personnage.inventaire.ArmeEquipee.nomArme) and  (personnage.inventaire.ArmeEquipee.nomArme <>'EMPTY') and (boucle=true)  then
                    begin
                    personnage.inventaire.invArme[i][j].estEquipee:=true;
                    boucle:=false;
                    end;

          end;

     end;

end;

// Ajoute un item à l'inventaire du personnage
procedure ajoutItemToPersonnage(typeItem:string;numItem:integer;var personnage:typePersonnage);
var
  dispoX:integer;
  dispoY:integer;

begin
     dispoX:=isInventairePlein(typeItem,personnage).xA;
     dispoY:=isInventairePlein(typeItem,personnage).yA;

     if (typeItem='arme') then
     begin
          if (dispoX <> -1) then
          begin
          personnage.inventaire.invArme[dispoX][dispoY]:=stuffDispo.invArmeDispo[numItem];
          end;


     end
     else if (typeItem='armure') then
     begin
     if (dispoX <> -1) then
          begin
          personnage.inventaire.invArmure[dispoX][dispoY]:=stuffDispo.invArmureDispo[numItem];
          end;
     end
     else if (typeItem='drop') then
     begin
     if (dispoX <> -1) then
          begin
          personnage.inventaire.invDrop[dispoX][dispoY]:=stuffDispo.invDropDispo[numItem];
          end;
     end
     else if (typeItem='bombe') then
     begin
     if (dispoX <> -1) then
          begin
          personnage.inventaire.invBombe[dispoX][dispoY]:=stuffDispo.invBombeDispo[numItem];
          end;
     end
     else if (typeItem='potion') then
     begin
     if (dispoX <> -1) then
          begin
          personnage.inventaire.invPotion[dispoX][dispoY]:=stuffDispo.invPotionDispo[numItem];

          end;
     end;
     if (dispoX <> -1) then
     modificationInventaireItem(numItem,slotFromCoordonne(dispoX,dispoY,typeItem)); // Modifie l'ID de l'item contenu au slot demandé
     // Ici le slot est calculé en fonction des coordoonnées de l'item ajouté et son type


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
procedure dropEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);

begin
     if typeItem='arme' then
     begin
          if personnage.inventaire.invArme[x][y].estEquipee=true then
          begin
          modificationInventaireItem(0,67);
          end;

          modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));
     end
     else if typeItem='armure' then
     begin
          if personnage.inventaire.invArmure[x][y].estEquipee=true then
          begin
            if personnage.inventaire.invArmure[x][y].typeArmure='Gants' then
            modificationInventaireItem(0,66)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Bottes' then
            modificationInventaireItem(0,65)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Jambiere' then
            modificationInventaireItem(0,68)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Plastron' then
            modificationInventaireItem(0,69)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Casque' then
            modificationInventaireItem(0,70);
          end;

          modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));

     end
     else
     modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));

     recupInventaire(personnage);
end;

// Permet d'équipper un équipement
procedure equipEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);
begin

   if typeItem='arme' then
   begin
   modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),67);
   recupInventaire(personnage);
   personnage.inventaire.invArme[x][y].estEquipee:=true;
   end
   else if typeItem='armure' then
   begin

            if personnage.inventaire.invArmure[x][y].typeArmure='Gants' then
            modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),66)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Bottes' then
            modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),65)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Jambiere' then
            modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),68)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Plastron' then
            modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),69)
            else if personnage.inventaire.invArmure[x][y].typeArmure='Casque' then
            modificationInventaireItem(itemSlot(slotFromCoordonne(x,y,typeItem)),70);
            recupInventaire(personnage);
            personnage.inventaire.invArmure[x][y].estEquipee:=true;
          end;

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

