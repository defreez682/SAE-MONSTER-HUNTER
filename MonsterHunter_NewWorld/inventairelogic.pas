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
    invPotion : array[1..10] of potion;   // A CHANGER ( coordonnées )
    invBombe : array[1..10] of bombe;     // A CHANGER ( coordonnées )
    invCuisine : array[1..10] of cuisine;  // A CHANGER ( coordonnées )
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

procedure initialisationItemDisponibles();

//-------------------- AFFICHAGE INVENTAIRES -----------------------------------


// Affichage de l'inventaire d'un joueur
procedure affichageInventaire(personnage:typePersonnage);

// Affichage de l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);

// Affichage de l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage);

// Affichage de l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage);

// Affichage de l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage);


//--------------------- POSITION DANS INVENTAIRE ------------------------------


// Renvoie les coordonnées actuelles dans l'inventaire après un déplacement z
procedure calculerCoordsApresDeplacement(z:Integer;var position:typePosition);

// Appelle la procédure relative à l'endroit ou la touche entrée est pressée
procedure entreePressee(var position:typePosition;var personnage:typePersonnage);


//--------------------- FONCTIONNALITE INVENTAIRE ------------------------------

// Drop une armure/arme
procedure dropEquipement(var personnage:typePersonnage;x,y:integer);

// Permet de déséquipper un équipement
procedure unequipEquipement(var personnage:typePersonnage;i,j:integer);

// Actualise l'equipement d'après la valeur du boolean estEquipe   INUTILE POUR INSTANT
procedure actualisationEquipement(var personnage:typePersonnage);

// Ajoute un item à l'inventaire du personnage
//procedure ajoutItemToPersonnage(stuffDispo:typeStuffDisponible;ou;var personnage:typePersonnage);








implementation
uses
    SysUtils,inventaireihm;

// Remplis un tableau de tous les items disponibles - BASE DE DONNEE A NE PAS OUVRIR
procedure initialisationItemDisponibles();
var
   i:integer;
begin

     stuffDispo.invArmeDispo[1].nomArme:='Grande epee';
     stuffDispo.invArmeDispo[1].poids:=60;
     stuffDispo.invArmeDispo[1].ratioAD:=0.25;
     stuffDispo.invArmeDispo[1].prix:=70;
     stuffDispo.invArmeDispo[2].nomArme:='Rapiere du ktulu';
     stuffDispo.invArmeDispo[2].poids:=20;
     stuffDispo.invArmeDispo[2].ratioAD:=0.05;
     stuffDispo.invArmeDispo[2].prix:=35;
     stuffDispo.invArmeDispo[3].nomArme:='Epee de Sasuke';
     stuffDispo.invArmeDispo[3].poids:=40;
     stuffDispo.invArmeDispo[3].ratioAD:=0.13;
     stuffDispo.invArmeDispo[3].prix:=42;
     stuffDispo.invArmeDispo[4].nomArme:='Epee simple';
     stuffDispo.invArmeDispo[4].poids:=50;
     stuffDispo.invArmeDispo[4].ratioAD:=0.15;
     stuffDispo.invArmeDispo[4].prix:=38;
     stuffDispo.invArmeDispo[5].nomArme:='Machoire d os';
     stuffDispo.invArmeDispo[5].poids:=80;
     stuffDispo.invArmeDispo[5].ratioAD:=0.43;
     stuffDispo.invArmeDispo[5].prix:=130;
     stuffDispo.invArmeDispo[6].nomArme:='Faucheur jagras';
     stuffDispo.invArmeDispo[6].poids:=65;
     stuffDispo.invArmeDispo[6].ratioAD:=0.33;
     stuffDispo.invArmeDispo[6].prix:=96;
     stuffDispo.invArmeDispo[7].nomArme:='Decapiteur Girros';
     stuffDispo.invArmeDispo[7].poids:=30;
     stuffDispo.invArmeDispo[7].ratioAD:=0.30;
     stuffDispo.invArmeDispo[7].prix:=70;
     stuffDispo.invArmeDispo[8].nomArme:='Furie du leviathan';
     stuffDispo.invArmeDispo[8].poids:=70;
     stuffDispo.invArmeDispo[8].ratioAD:=0.60;
     stuffDispo.invArmeDispo[8].prix:=180;
     stuffDispo.invArmeDispo[9].nomArme:='Foudre hurlante';
     stuffDispo.invArmeDispo[9].poids:=23;
     stuffDispo.invArmeDispo[9].ratioAD:=0.40;
     stuffDispo.invArmeDispo[9].prix:=110;
     stuffDispo.invArmeDispo[10].nomArme:='Magda';
     stuffDispo.invArmeDispo[10].poids:=43;
     stuffDispo.invArmeDispo[10].ratioAD:=0.50;
     stuffDispo.invArmeDispo[10].prix:=140;
     stuffDispo.invArmeDispo[11].nomArme:='Lame de glace';
     stuffDispo.invArmeDispo[11].poids:=21;
     stuffDispo.invArmeDispo[11].ratioAD:=0.30;
     stuffDispo.invArmeDispo[11].prix:=83;
     stuffDispo.invArmeDispo[12].nomArme:='Angoisse';
     stuffDispo.invArmeDispo[12].poids:=30;
     stuffDispo.invArmeDispo[12].ratioAD:=0.45;
     stuffDispo.invArmeDispo[12].prix:=150;
     stuffDispo.invArmeDispo[13].nomArme:='Argent';
     stuffDispo.invArmeDispo[13].poids:=60;
     stuffDispo.invArmeDispo[13].ratioAD:=0.70;
     stuffDispo.invArmeDispo[13].prix:=280;
     stuffDispo.invArmeDispo[14].nomArme:='Lame occulte';
     stuffDispo.invArmeDispo[14].poids:=35;
     stuffDispo.invArmeDispo[14].ratioAD:=0.50;
     stuffDispo.invArmeDispo[14].prix:=130;
     stuffDispo.invArmeDispo[15].nomArme:='Agito';
     stuffDispo.invArmeDispo[15].poids:=25;
     stuffDispo.invArmeDispo[15].ratioAD:=0.40;
     stuffDispo.invArmeDispo[15].prix:=97;
     stuffDispo.invArmeDispo[16].nomArme:='Rasoir';
     stuffDispo.invArmeDispo[16].poids:=15;
     stuffDispo.invArmeDispo[16].ratioAD:=0.20;
     stuffDispo.invArmeDispo[16].prix:=70;
     stuffDispo.invArmeDispo[17].nomArme:='Revolution';
     stuffDispo.invArmeDispo[17].poids:=30;
     stuffDispo.invArmeDispo[17].ratioAD:=0.55;
     stuffDispo.invArmeDispo[17].prix:=140;
     stuffDispo.invArmeDispo[18].nomArme:='Makaire Xiph';
     stuffDispo.invArmeDispo[18].poids:=60;
     stuffDispo.invArmeDispo[18].ratioAD:=0.50;
     stuffDispo.invArmeDispo[18].prix:=110;
     stuffDispo.invArmeDispo[19].nomArme:='Espadon d or';
     stuffDispo.invArmeDispo[19].poids:=70;
     stuffDispo.invArmeDispo[19].ratioAD:=0.40;
     stuffDispo.invArmeDispo[19].prix:=500;
     stuffDispo.invArmeDispo[20].nomArme:='Espadon Kjaar';
     stuffDispo.invArmeDispo[20].poids:=35;
     stuffDispo.invArmeDispo[20].ratioAD:=0.25;
     stuffDispo.invArmeDispo[20].prix:=200;

     stuffDispo.invArmureDispo[1].nomArmure:='Casque d os';
     stuffDispo.invArmureDispo[1].poids:=3;
     stuffDispo.invArmureDispo[1].defense:=2;
     stuffDispo.invArmureDispo[1].prix:=10;
     stuffDispo.invArmureDispo[1].typeArmure:='Casque';
     stuffDispo.invArmureDispo[2].nomArmure:='Gants d os';
     stuffDispo.invArmureDispo[2].poids:=4;
     stuffDispo.invArmureDispo[2].defense:=2;
     stuffDispo.invArmureDispo[2].prix:=15;
     stuffDispo.invArmureDispo[2].typeArmure:='Gants';
     stuffDispo.invArmureDispo[3].nomArmure:='Plastron d os';
     stuffDispo.invArmureDispo[3].poids:=13;
     stuffDispo.invArmureDispo[3].defense:=6;
     stuffDispo.invArmureDispo[3].prix:=35;
     stuffDispo.invArmureDispo[3].typeArmure:='Plastron';
     stuffDispo.invArmureDispo[4].nomArmure:='Jambiere d os';
     stuffDispo.invArmureDispo[4].poids:=8;
     stuffDispo.invArmureDispo[4].defense:=4;
     stuffDispo.invArmureDispo[4].prix:=25;
     stuffDispo.invArmureDispo[4].typeArmure:='Jambiere';
     stuffDispo.invArmureDispo[5].nomArmure:='Bottes d os';
     stuffDispo.invArmureDispo[5].poids:=3;
     stuffDispo.invArmureDispo[5].defense:=2;
     stuffDispo.invArmureDispo[5].prix:=130;
     stuffDispo.invArmureDispo[5].typeArmure:='Bottes';
     stuffDispo.invArmureDispo[6].nomArmure:='Casque de Vespoid';
     stuffDispo.invArmureDispo[6].poids:=5;
     stuffDispo.invArmureDispo[6].defense:=4;
     stuffDispo.invArmureDispo[6].prix:=15;
     stuffDispo.invArmureDispo[6].typeArmure:='Casque';
     stuffDispo.invArmureDispo[7].nomArmure:='Gants de Vespoid';
     stuffDispo.invArmureDispo[7].poids:=3;
     stuffDispo.invArmureDispo[7].defense:=3;
     stuffDispo.invArmureDispo[7].prix:=10;
     stuffDispo.invArmureDispo[7].typeArmure:='Gants';
     stuffDispo.invArmureDispo[8].nomArmure:='Plastron de Vespoid';
     stuffDispo.invArmureDispo[8].poids:=10;
     stuffDispo.invArmureDispo[8].defense:=9;
     stuffDispo.invArmureDispo[8].prix:=15;
     stuffDispo.invArmureDispo[8].typeArmure:='Plastron';
     stuffDispo.invArmureDispo[9].nomArmure:='Jambiere de Vespoid';
     stuffDispo.invArmureDispo[9].poids:=6;
     stuffDispo.invArmureDispo[9].defense:=6;
     stuffDispo.invArmureDispo[9].prix:=10;
     stuffDispo.invArmureDispo[9].typeArmure:='Jambiere';
     stuffDispo.invArmureDispo[10].nomArmure:='Bottes de Vespoid';
     stuffDispo.invArmureDispo[10].poids:=3;
     stuffDispo.invArmureDispo[10].defense:=3;
     stuffDispo.invArmureDispo[10].prix:=5;
     stuffDispo.invArmureDispo[10].typeArmure:='Bottes';
     stuffDispo.invArmureDispo[11].nomArmure:='Casque Hornetaur';
     stuffDispo.invArmureDispo[11].poids:=5;
     stuffDispo.invArmureDispo[11].defense:=10;
     stuffDispo.invArmureDispo[11].prix:=20;
     stuffDispo.invArmureDispo[11].typeArmure:='Casque';
     stuffDispo.invArmureDispo[12].nomArmure:='Plastron Hornetaur';
     stuffDispo.invArmureDispo[12].poids:=20;
     stuffDispo.invArmureDispo[12].defense:=20;
     stuffDispo.invArmureDispo[12].prix:=80;
     stuffDispo.invArmureDispo[12].typeArmure:='Plastron';
     stuffDispo.invArmureDispo[13].nomArmure:='Jambiere Hornetaur';
     stuffDispo.invArmureDispo[13].poids:=10;
     stuffDispo.invArmureDispo[13].defense:=10;
     stuffDispo.invArmureDispo[13].prix:=60;
     stuffDispo.invArmureDispo[13].typeArmure:='Jambiere';
     stuffDispo.invArmureDispo[14].nomArmure:='Botte Hornetaur';
     stuffDispo.invArmureDispo[14].poids:=5;
     stuffDispo.invArmureDispo[14].defense:=5;
     stuffDispo.invArmureDispo[14].prix:=50;
     stuffDispo.invArmureDispo[14].typeArmure:='Bottes';
     stuffDispo.invArmureDispo[15].nomArmure:='Gants Hornetaur';
     stuffDispo.invArmureDispo[15].poids:=5;
     stuffDispo.invArmureDispo[15].defense:=5;
     stuffDispo.invArmureDispo[15].prix:=15;
     stuffDispo.invArmureDispo[15].typeArmure:='Gants';
     stuffDispo.invArmureDispo[16].nomArmure:='Casque de guerre';
     stuffDispo.invArmureDispo[16].poids:=15;
     stuffDispo.invArmureDispo[16].defense:=15;
     stuffDispo.invArmureDispo[16].prix:=150;
     stuffDispo.invArmureDispo[16].typeArmure:='Casque';
     stuffDispo.invArmureDispo[17].nomArmure:='Plastron de guerre';
     stuffDispo.invArmureDispo[17].poids:=40;
     stuffDispo.invArmureDispo[17].defense:=40;
     stuffDispo.invArmureDispo[17].prix:=500;
     stuffDispo.invArmureDispo[17].typeArmure:='Plastron';
     stuffDispo.invArmureDispo[18].nomArmure:='Jambiere de guerre';
     stuffDispo.invArmureDispo[18].poids:=20;
     stuffDispo.invArmureDispo[18].defense:=20;
     stuffDispo.invArmureDispo[18].prix:=300;
     stuffDispo.invArmureDispo[18].typeArmure:='Jambiere';
     stuffDispo.invArmureDispo[19].nomArmure:='Bottes de guerre';
     stuffDispo.invArmureDispo[19].poids:=15;
     stuffDispo.invArmureDispo[19].defense:=15;
     stuffDispo.invArmureDispo[19].prix:=150;
     stuffDispo.invArmureDispo[19].typeArmure:='Bottes';
     stuffDispo.invArmureDispo[20].nomArmure:='Gants de guerre';
     stuffDispo.invArmureDispo[20].poids:=10;
     stuffDispo.invArmureDispo[20].defense:=15;
     stuffDispo.invArmureDispo[20].prix:=150;
     stuffDispo.invArmureDispo[20].typeArmure:='Gants';

     stuffDispo.invPotionDispo[1].nomPotion:='Potion';
     stuffDispo.invPotionDispo[1].HealHP:=30;
     stuffDispo.invPotionDispo[1].prix:=66;
     stuffDispo.invPotionDispo[2].nomPotion:='Mega Potion';
     stuffDispo.invPotionDispo[2].HealHP:=40;
     stuffDispo.invPotionDispo[2].prix:=77;
     stuffDispo.invPotionDispo[3].nomPotion:='Guerison';
     stuffDispo.invPotionDispo[3].HealHP:=70;
     stuffDispo.invPotionDispo[3].prix:=100;

     stuffDispo.invBombeDispo[1].nomBombe:='Bombe Barile';
     stuffDispo.invBombeDispo[1].degat:=30;
     stuffDispo.invBombeDispo[1].prix:=130;
     stuffDispo.invBombeDispo[2].nomBombe:='Mega Bombe Barile';
     stuffDispo.invBombeDispo[2].degat:=60;
     stuffDispo.invBombeDispo[2].prix:=200;
     stuffDispo.invBombeDispo[3].nomBombe:='Destruction';
     stuffDispo.invBombeDispo[3].degat:=200;
     stuffDispo.invBombeDispo[3].prix:=500;

     stuffDispo.invDropDispo[1].nomDrop:='Ecaille';
     stuffDispo.invDropDispo[2].nomDrop:='Oeil de Monstre';
     stuffDispo.invDropDispo[3].nomDrop:='Cuir de Cheval';
     stuffDispo.invDropDispo[4].nomDrop:='Queue de limpantin';
     stuffDispo.invDropDispo[5].nomDrop:='Pattes brullées';
     stuffDispo.invDropDispo[6].nomDrop:='Os de squelette';
     stuffDispo.invDropDispo[7].nomDrop:='Sang fibreux';
     stuffDispo.invDropDispo[8].nomDrop:='Salive de hornetaur';
     stuffDispo.invDropDispo[9].nomDrop:='Minerais d or';
     stuffDispo.invDropDispo[10].nomDrop:='Poils du vespoid';
     stuffDispo.invDropDispo[11].nomDrop:='Cornes de taureau';
     stuffDispo.invDropDispo[12].nomDrop:='Langue de chat';
     stuffDispo.invDropDispo[13].nomDrop:='Carapace de tortue';
     stuffDispo.invDropDispo[14].nomDrop:='Plumes';
     stuffDispo.invDropDispo[15].nomDrop:='Crocs de crocodile';
     stuffDispo.invDropDispo[16].nomDrop:='Cristal';
     stuffDispo.invDropDispo[17].nomDrop:='Glandes de venin';
     stuffDispo.invDropDispo[18].nomDrop:='Perle rare';
     stuffDispo.invDropDispo[19].nomDrop:='Bec à pointes';
     stuffDispo.invDropDispo[20].nomDrop:='Larme de phoenix';











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
     affichageInventaireIHM(personnage,position);
     deplacementInventaireIHM(position,personnage,58);


end;

// Affichage de l'inventaire des armes d'un joueur
procedure affichageInventaireArmes(var personnage:typePersonnage;position:typePosition);
begin
     position.coordsActuelsInventaire.yA:=0;
     position.coordsActuelsInventaire.xA:=0;
     Position.cadreInventaires:=false;
     position.armes:=true;
     affichageInventaireArmesIHM(personnage,position);
     deplacementInventaireIHM(position,personnage,27);
end;

// Affichage de l'inventaire des armures d'un joueur
procedure affichageInventaireArmures(var personnage:typePersonnage);
begin

end;

// Affichage de l'inventaire des consommables d'un joueur
procedure affichageInventaireConsommables(var personnage:typePersonnage);
begin

end;

// Affichage de l'inventaire des drops d'un joueur
procedure affichageInventaireDrops(var personnage:typePersonnage);
begin

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
               position.armes:=true;



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
        2:affichageInventaireArmures(personnage);
        3:affichageInventaireConsommables(personnage);
        4:affichageInventaireDrops(personnage);
        5:;//closeInventaire()
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


//----------------------------------------------------------------------------
// Ajoute un item à l'inventaire du personnage
procedure ajoutItemToPersonnage(stuffDispo:typeStuffDisponible;var personnage:typePersonnage);
begin

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

