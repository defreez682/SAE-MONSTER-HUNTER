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

//----------- Drops ------------------
  drop = record
    nomDrop:String;
    end;

//----------- Inventaires du joueur ------------
  typeInventaire = record
    invArme : array[0..3,0..3] of arme;
    invArmure : array[0..3,0..3] of armure;
    invPotion : array[0..1,0..3] of potion;
    invBombe : array[0..1,0..3] of bombe;
    invDrop : array[0..3,0..3] of drop;
    ArmureEquipee : array[1..2,0..2] of armure;
    ArmeEquipee : arme;
    end;

//----------- Base de donnée de stuff disponibles ------------
typeStuffDisponible = record
    invArmeDispo : array[0..20] of arme;      // 20 ARMES
    invArmureDispo : array[0..20] of armure;  // 20 ARMURES
    invPotionDispo : array[0..3] of potion;   // 3 POTIONS
    invBombeDispo : array[0..3] of bombe;     // 3 BOMBES
    invDropDispo : array[0..20] of drop;      // 20 DROPS
    end;

//------------ Type Coordonnée --------------------------
  typeCoords=record
   xA:Integer;
   yA:Integer;
   end;

//---- Permet de savoir la position de l'utilisateur dans l'inventaire ---------

  typePosition=record
      equipement:boolean;
      cadreInventaires:boolean;
      infoItem:boolean;
      armes:boolean;
      armures:boolean;
      drops:boolean;
      consommables:boolean;
      precedPos:string;               // Stocke la position de l'inventaire ou l'utilisateur se trouvait

      coordsActuelsInventaire:typeCoords; // Représente les coordonnées de l'utilisateur
      coordsActuelsItem:typeCoords;   // Stocke les coordonnées ou l'utilisateur se trouvait
  end;

//---- Informations du personnage ---------
  typePersonnage=record
    pseudo:Text;
    Sexe:Text;
    inventaire:typeInventaire;
    orActuel:Text;
    lvlglobal : Text;
    lvlexp : Text;
    Taille:Text;
    existe:Text;  // 0 si le personnage n'existe pas , 1 si il existe
  end;


var
   stuffDispo:typeStuffDisponible; // Variable contenant la base de donnée
   invItem : file of Integer;      // Fichier contenant l'inventaire du joueur




//-------------------- SAUVEGARDE INVENTAIRE -----------------------------------


{Principe : Il y a 16 slots pour les armes, 16 pour les armures, 8 pour les potions et 8 pour les bombes , 16 pour les drops,1 pour l'arme équipée et 5 pour l'armure équipée
ce qui nous fait 70 slots.
- 1-16 premières lignes : Armes
- 17-32 : Armure
- 33 à 40 : Potion
- 41 à 48 : Bombes
- 49 à 64 : Drops
- 67 : Arme Equipee
- 65 66 68 69 70 ( Armure Equipee )}



// Crée un fichier avec un nombre de ligne donné en paramètre avec pour chaque ligne un IDItem donné (ici 0 car vide ) |  Représente l'inventaire du personnage sauvegardé
procedure creationInventaireItem(idItem,Slot : Integer);

// Modifie à la ligne donnée , l'ID de l'item  | Quand il y a un changement d'inventaire on change l'ID de l'item à l'emplacement voulu
procedure modificationInventaireItem(idItem,Slot : Integer);

// Renvoie l'ID de l'item à la ligne voulue
function itemSlot(Slot : Integer) : Integer;

// Recupère les ID des items dans le fichier contenant l'inventaire,les associe à la base de donnée, et les affecte à l'inventaire du personnage en fonction du slot
procedure recupInventaire(var personnage:typePersonnage);

// Change estEquipee à true pour les armes et armures équipées après avoir récuper les items dans les fichiers
procedure recupArmeArmureEquipee(var personnage:typePersonnage);


//-------------------- AFFICHAGE INVENTAIRES -----------------------------------


// Affiche l'inventaire d'un joueur
procedure affichageInventaire(personnage:typePersonnage);

// Affiche l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);

// Affiche l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage;position:typePosition);

// Affiche l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage;position:typePosition);

// Affiche l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage;position:typePosition);


//--------------------- POSITION DANS INVENTAIRE ------------------------------


// Detecte les touches directionnelles et appelle les procédure calculerCoordsApresDeplacement et dessinCadreCoords
procedure deplacementInventaire(var position:typePosition;var personnage:typePersonnage;q:integer);

// Modifie les coordonnées actuelles dans l'inventaire après un déplacement z
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition;var personnage:typePersonnage);

// Appelle la procédure relative à l'endroit ou la touche entrée est pressée
procedure entreePressee(var position:typePosition;var personnage:typePersonnage);

// Renvoie les coordonnées du premier emplacement VIDE de l'inventaire donné en paramètre ou -1 si l'inventaire est plein
function isInventairePlein(typeItem:string;personnage:typePersonnage):typeCoords;


//--------------------- SUPPRIMER UN OBJET -------------------------------------


// Permet de supprimer l'item aux coordoonnées données en paramètres
procedure dropInventaire(var personnage:typePersonnage;x,y:integer;typeItem:string);

// Permet de supprimer l'équipement aux coordonnées données en paramètres
procedure dropEquipement(var personnage:typePersonnage;x,y:integer);

// Permet de supprimer 2 loots données en paramètres ( FORGE )
procedure drop2Loots(numeroItem,numeroItem2:integer);


//--------------------- AJOUTER UN OBJET ---------------------------------------


// Ajoute l'item donné en paramètre à l'inventaire du personnage si il y a de la place
procedure ajoutItemToPersonnage(typeItem:string;numItem:integer;var personnage:typePersonnage);


//--------------------- EQUIPEMENT ---------------------------------------------


// Permet d'équiper l'arme ou l'armure aux coordonnées données en paramètres
procedure equipEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);

// Permet de déséquiper l'arme ou l'armure aux coordonnées données en paramètres
procedure desequipEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);


//---------- TRADUCTION    COORDONNEES  >>>>   SLOTS DU FICHIERS  --------------


// Renvoie le slot correspondant aux coordonnées et à la position de l'inventaire données en paramètre
function slotFromCoordonne(x,y:integer;typeItem:string): integer;

// Renvoie le slot correspondant de l'IDitem de drop donnés en paramètres si le joueur le possède ou -1 si il n'en possède pas
function slotDropsForge(numeroItem:integer):integer;




implementation
uses
    SysUtils,inventaireihm,personnage,chambreIHM,crtPerso;








//-------------------- SAUVEGARDE INVENTAIRE -----------------------------------


// Crée un fichier avec un nombre de ligne donné en paramètre avec pour chaque ligne un IDItem donné (ici 0 car vide ) |  Représente l'inventaire du personnage sauvegardé
procedure creationInventaireItem(idItem,Slot : Integer);
begin
     assign(invItem, 'C:/MHNewWorld/data.bin');
     rewrite(invItem);
     seek(invItem,Slot);
     write(invItem,idItem);
     close(invItem);
end;

// Modifie à la ligne donnée , l'ID de l'item  | Quand il y a un changement d'inventaire on change l'ID de l'item à l'emplacement voulu
procedure modificationInventaireItem(idItem,Slot : Integer);
begin
     assign(invItem, 'C:/MHNewWorld/data.bin');
     reset(invItem);
     seek(invItem,Slot);
     write(invItem,idItem);
     close(invItem);
end;

// Renvoie l'ID de l'item à la ligne voulue
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

// Recupère les ID des items dans le fichier contenant l'inventaire,les associe à la base de donnée, et les affecte à l'inventaire du personnage en fonction du slot
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

// Change estEquipee à true pour les armes et armures équipées après avoir récuper les items dans les fichiers
procedure recupArmeArmureEquipee(var personnage:typePersonnage);
var
  i,j:integer;
  boucle,boucle1,boucle2,boucle3,boucle4,boucle5:boolean;
begin
     j:=0;
     i:=0;
     boucle:=true;
     for i:= 0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
                if (personnage.inventaire.invArme[i][j].nomArme=personnage.inventaire.ArmeEquipee.nomArme) and  (personnage.inventaire.invArme[i][j].nomArme <>'VIDE') and (boucle=true)  then
                    begin

                    personnage.inventaire.invArme[i][j].estEquipee:=true;

                    boucle:=false;
                    end
               else
               begin
                  personnage.inventaire.invArme[i][j].estEquipee:=false;

               end;


          end;

     end;


     boucle1:=true;
     boucle2:=true;
     boucle3:=true;
     boucle4:=true;
     boucle5:=true;
     for i:= 0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
            if (i>3) then

            else
            begin
                 if (personnage.inventaire.invArmure[i][j].typeArmure='Gants') and (boucle1=true) then
                 begin
                      if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[1][1].nomArmure) then
                      begin
                      personnage.inventaire.invArmure[i][j].estEquipee:=true;
                      boucle1:=false;
                      end;
                 end


                 else if (personnage.inventaire.invArmure[i][j].typeArmure='Bottes') and (boucle2=true) then
                 begin
                      if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[1][0].nomArmure) then
                      begin
                      personnage.inventaire.invArmure[i][j].estEquipee:=true;
                      boucle2:=false;
                      end;
                 end

                 else if (personnage.inventaire.invArmure[i][j].typeArmure='Jambiere') and (boucle3=true) then
                 begin
                      if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[2][0].nomArmure) then
                      begin
                      personnage.inventaire.invArmure[i][j].estEquipee:=true;
                      boucle3:=false;
                      end;
                 end

                 else if (personnage.inventaire.invArmure[i][j].typeArmure='Plastron') and (boucle4=true) then
                 begin
                      if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[2][1].nomArmure) then
                      begin
                      personnage.inventaire.invArmure[i][j].estEquipee:=true;
                      boucle4:=false;
                      end;
                 end

                 else if (personnage.inventaire.invArmure[i][j].typeArmure='Casque') and (boucle5=true) then
                 begin
                      if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[2][2].nomArmure) then
                      begin
                      personnage.inventaire.invArmure[i][j].estEquipee:=true;
                      boucle5:=false;
                      end;
                 end;

            end;

     end;


     end;

end;


//-------------------AFFICHAGE INVENTAIRES------------------------------


// Affiche l'inventaire d'un joueur
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
     deplacementInventaire(position,personnage,58);


end;

// Affiche l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.armes:=true;
     affichageInventaireArmesIHM(personnage);
     deplacementInventaire(position,personnage,27);
end;

// Affiche l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.armures:=true;
     affichageInventaireArmuresIHM(personnage);
     deplacementInventaire(position,personnage,27);
end;

// Affiche l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.consommables:=true;
     affichageInventaireConsoIHM(personnage);
     deplacementInventaire(position,personnage,27);
end;

// Affiche l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.drops:=true;
     affichageInventaireDropsIHM(personnage);
     deplacementInventaire(position,personnage,27);
end;


//--------------------- POSITION DANS INVENTAIRE ------------------------------


// Detecte les touches directionnelles et appelle les procédure calculerCoordsApresDeplacement et dessinCadreCoords
procedure deplacementInventaire(var position:typePosition;var personnage:typePersonnage;q:integer);

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

// Modifie les coordonnées actuelles dans l'inventaire après un déplacement z
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
               reinitialisationCadreBlanc();
               end
               else if (position.precedPos='armes') then
               position.armes:=true
               else if (position.precedPos='armures') then
               position.armures:=true
               else if (position.precedPos='drops') then
               position.drops:=true
               else if (position.precedPos='conso') then
               position.consommables:=true;

               position.precedPos:='';

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
         reinitilisationInfoItem();
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
               deplacementInventaire(position,personnage,q);

          end;
        1:
          begin
          dropInventaire(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,position.precedPos);
          if (position.precedPos='arme') then
          affichageInventaireArmesIHM(personnage)
          else if (position.precedPos='armure') then
          affichageInventaireArmuresIHM(personnage)
          else if (position.precedPos='potion') or (position.precedPos='bombe')  then
          affichageInventaireConsoIHM(personnage)
          else if (position.precedPos='drop') then
          affichageInventaireDropsIHM(personnage);


          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaire(position,personnage,q);

          end;
        2:
          begin
          if (position.precedPos='arme') then
          begin
          equipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,'arme');
          affichageInventaireArmesIHM(personnage);
          end
          else if (position.precedPos='armure') then
          begin
          equipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,'armure');
          affichageInventaireArmuresIHM(personnage);
          end
          else if (position.precedPos='equipement') then
          begin
          desequipEquipement(personnage,position.coordsActuelsItem.xA,position.coordsActuelsItem.yA,'equipement');
          reinitilisationInfoItem();
          end;

          position.infoItem:=false;
          position.coordsActuelsInventaire.xA:=position.coordsActuelsItem.xA;
          position.coordsActuelsInventaire.yA:=position.coordsActuelsItem.yA;
          deplacementInventaire(position,personnage,q);
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

// Renvoie les coordonnées du premier emplacement VIDE de l'inventaire donné en paramètre ou -1 si l'inventaire est plein
function isInventairePlein(typeItem:string;personnage:typePersonnage):typeCoords;
var
   i,j:integer;
   res:typeCoords;
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
              if ((personnage.inventaire.invArme[i][j].nomArme='VIDE') and (boucle<>true)) then
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
              if ((personnage.inventaire.invArmure[i][j].nomArmure='VIDE') and (boucle<>true)) then
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
              if ((personnage.inventaire.invDrop[i][j].nomDrop='VIDE') and (boucle<>true)) then
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
              if ((personnage.inventaire.invPotion[i][j].nomPotion='VIDE') and (boucle<>true)) then
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
              if ((personnage.inventaire.invBombe[i][j].nomBombe='VIDE') and (boucle<>true)) then
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


//--------------------- SUPPRIMER UN OBJET -------------------------------------

// Permet de supprimer l'item aux coordoonnées données en paramètres
procedure dropInventaire(var personnage:typePersonnage;x,y:integer;typeItem:string);

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
     else if typeItem='equipement' then
     begin
     modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));
     dropEquipement(personnage,x,y);
     end
     else if typeItem='bombe' then
     modificationInventaireItem(0,slotFromCoordonne(x-2,y,typeItem))
     else
     modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));

     recupInventaire(personnage);
end;

// Permet de supprimer l'équipement aux coordonnées données en paramètres
procedure dropEquipement(var personnage:typePersonnage;x,y:integer);
var
   i,j:integer;
   boucle,boucle1,boucle2,boucle3,boucle4,boucle5:boolean;
begin
     j:=0;
     i:=0;
     boucle:=true;

     if (x=1) and (y=2) then
     begin
        for i:= 0 to 3 do
        begin
             for j:= 0 to 3 do
             begin
                  if (personnage.inventaire.invArme[i][j].nomArme=personnage.inventaire.ArmeEquipee.nomArme) and  (personnage.inventaire.ArmeEquipee.nomArme <>'EMPTY') and (boucle=true)  then
                  begin
                  dropInventaire(personnage,i,j,'arme');
                  boucle:=false;
                  end
             end;

        end;
     end
     else

     begin
     boucle1:=true;
     boucle2:=true;
     boucle3:=true;
     boucle4:=true;
     boucle5:=true;

     for i:= 0 to 3 do
     begin
          for j:= 0 to 3 do
          begin
               if (personnage.inventaire.invArmure[i][j].typeArmure='Gants') and (boucle1=true) then
               begin
                    if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[x][y].nomArmure) then
                    begin
                    dropInventaire(personnage,i,j,'armure');
                    boucle1:=false;
                    end;
               end

               else if (personnage.inventaire.invArmure[i][j].typeArmure='Bottes') and (boucle2=true) then
                    begin
                         if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[x][y].nomArmure) then
                         begin
                         dropInventaire(personnage,i,j,'armure');
                         boucle2:=false;
                         end;
                    end

               else if (personnage.inventaire.invArmure[i][j].typeArmure='Jambiere') and (boucle3=true) then
                    begin
                         if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[x][y].nomArmure) then
                         begin
                         dropInventaire(personnage,i,j,'armure');
                         boucle3:=false;
                         end;
                    end

               else if (personnage.inventaire.invArmure[i][j].typeArmure='Plastron') and (boucle4=true) then
                    begin
                         if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[x][y].nomArmure) then
                         begin
                         dropInventaire(personnage,i,j,'armure');
                         boucle4:=false;
                         end;
                    end

               else if (personnage.inventaire.invArmure[i][j].typeArmure='Casque') and (boucle5=true) then
                    begin
                         if (personnage.inventaire.invArmure[i][j].nomArmure=personnage.inventaire.ArmureEquipee[x][y].nomArmure) then
                         begin
                         dropInventaire(personnage,i,j,'armure');
                         boucle5:=false;
                         end;
                    end

               end;

        end;


        end;
end;

// Permet de supprimer 2 loots données en paramètres ( FORGE )
procedure drop2Loots(numeroItem,numeroItem2:integer);
begin
     modificationInventaireItem(0,slotDropsForge(numeroItem));
     modificationInventaireItem(0,slotDropsForge(numeroItem2));
     recupInventaire(personnage1);
end;


//--------------------- AJOUTER UN OBJET ---------------------------------------


// Ajoute l'item donné en paramètre à l'inventaire du personnage si il y a de la place
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
     begin

     modificationInventaireItem(numItem,slotFromCoordonne(dispoX,dispoY,typeItem)); // Modifie l'ID de l'item contenu au slot demandé

     end
     // Ici le slot est calculé en fonction des coordoonnées de l'item ajouté et son type


end;


//--------------------- EQUIPEMENT ---------------------------------------------


// Permet d'équiper l'arme ou l'armure aux coordonnées données en paramètres
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

          end;

end;


// Permet de déséquiper l'arme ou l'armure aux coordonnées données en paramètres
procedure desequipEquipement(var personnage:typePersonnage;x,y:integer;typeItem:string);
begin
   modificationInventaireItem(0,slotFromCoordonne(x,y,typeItem));
   recupInventaire(personnage);
end;



//---------- TRADUCTION    COORDONNEES  >>>>   SLOTS DU FICHIERS  --------------


// Renvoie le slot correspondant aux coordonnées et à la position de l'inventaire données en paramètre
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
          if x=0 then
          x:=9
          else if x=1 then
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
     end
     else if (typeItem='equipement') then
     begin
          if  (x=2) then
          x:=4;


          slotFromCoordonne:=64+x+y;
     end;
end;


// Renvoie le slot correspondant de l'IDitem de drop donnés en paramètres si le joueur le possède ou -1 si il n'en possède pas
function slotDropsForge(numeroItem:integer):integer;
var
   s,res:integer;
   boucle:boolean;
begin
     boucle:=true;
     for s:=49 to 64 do
     begin
          if (itemSlot(s)=numeroItem) and (boucle=true) then
          begin
          boucle:=false;
          res:=s;
          end;
     end;
     slotDropsForge:=res;
end;



end.

