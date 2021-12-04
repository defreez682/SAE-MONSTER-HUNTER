unit testUnitaireMH;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,inventaireLogic,Personnage,MarchandLogic,forgeronlogic,combatLogic,TestUnitaire;

// Démarre le testunitaire
procedure demarrageTestUnitaire();

// Commence le testunitaire de l'inventaire
procedure testInventaire();
// Commence le test unitaire du combat
procedure testCombat();
// commence le test unitaire de datajoueur
procedure testDataJoueur();
// commence le test unitaire de la cantine
procedure testCantine();
// commence le test unitaire du marchand
procedure testMarchand();
// Commande le test unitaire de la chambre
procedure testChambre();
// commence le test unitaire de la forge
procedure testForge();

implementation

// Démarre le testunitaire
procedure demarrageTestUnitaire();
begin
  testInventaire();
  testCombat();
  testDataJoueur();
  testCantine();
  testMarchand();
  testforge();
  Summary();
  readln();
end;

// Commence le testunitaire de l'inventaire
procedure testInventaire();
var
  i,j:integer;
  reussite:boolean;    // Variable qui permet de valider un testunitaire
  personnagetest:typePersonnage; // personnage de test à qui on fera les test
begin

initialisationItemDisponibles();

newTestsSeries('Creation_Inventaire');

newTest('Creation_Inventaire','Initialisation_Armes');
initialisationInventaireVide(personnagetest);

reussite:=true;
for i:=0 to 3 do
begin
     for j:=0 to 3 do
     begin
          if personnagetest.inventaire.invArme[i][j].nomArme<>'VIDE' then
          reussite:=false;
     end;
end;
testIsEqual(reussite);


newTest('Creation_Inventaire','Initialisation_Armures');
reussite:=true;
for i:=0 to 3 do
begin
     for j:=0 to 3 do
     begin
          if personnagetest.inventaire.invArmure[i][j].nomArmure<>'VIDE' then
          reussite:=false;
     end;
end;
testIsEqual(reussite);

newTest('Creation_Inventaire','Initialisation_Loots');
reussite:=true;
for i:=0 to 3 do
begin
     for j:=0 to 3 do
     begin
          if personnagetest.inventaire.invDrop[i][j].nomDrop<>'VIDE' then
          reussite:=false;
     end;
end;
testIsEqual(reussite);

newTest('Creation_Inventaire','Initialisation_Consommables');

reussite:=true;
for i:=0 to 1 do
begin
     for j:=0 to 3 do
     begin
          if (personnagetest.inventaire.invPotion[i][j].nomPotion<>'VIDE') and (personnagetest.inventaire.invBombe[i][j].nomBombe<>'VIDE') then
          reussite:=false;
     end;
end;
testIsEqual(reussite);

//------------------------------------
newTestsSeries('Position_Inventaire');

newTest('Position_Inventaire','Localisation_Emplacement_Vide');
reussite:=true;
if (isInventairePlein('armure',personnagetest).xA <> -1) then
testIsEqual(reussite);

//---------------------------------

newTestsSeries('Modification_Item');
reussite:=false;

newTest('Modification_Item','Ajout_Item');
ajoutItemToPersonnage('armure',5,personnagetest);

if itemSlot(slotFromCoordonne(0,0,'armure')) = 5 then
reussite:=true;

testisEqual(reussite);


reussite:=false;
newTest('Modification_Item','Equipe_Item');
equipEquipement(personnagetest,0,0,'armure');
if itemSlot(65) = 5 then
reussite:=true;

testisEqual(reussite);


reussite:=false;
newTest('Modification_Item','Desequipe_Item');
desequipEquipement(personnagetest,1,0,'equipement');
if itemSlot(65) = 0 then
reussite:=true;

testisEqual(reussite);



reussite:=false;
newTest('Modification_Item','Supprime_Item');
dropInventaire(personnagetest,0,0,'armure');

if itemSlot(slotFromCoordonne(0,0,'armure')) = 0 then
reussite:=true;

testisEqual(reussite);

//------------------------------------




end;


// Commence le testunitaire de la cantine
procedure testCantine();
var
  solde : integer;
begin
    newTestsSeries('Cantine');

  //Crée un nouveau test dans la série de tests
    newTest('Cantine', 'Achat d''un repas ');

    //je copie la valeur de l'or actuelle pour la comparer aprés
    solde := getOrActuelle();

    //modifier Or actuelle (procedure utilisé dans l'achat des repas)
    miseAjourOr(getOrActuelle() - 50) ;


    //Test d'égalité entre deux entiers
    testIsEqual(getOrActuelle(),solde - 50);

  end;

// Commence le testunitaire de la forge
procedure testForge();
begin
    newTestsSeries('Test Forge: ');

    //Crée un nouveau test dans la série de tests
    newTest('Test Forge: ', 'Controle si deux loots existe');

    initialisationItemDisponibles();

    //Je supprime duex loots pour le test
    drop2Loots(1,2);

    //Test d'un booléen
    testIsEqual(not(dropExist(stuffDispo.invDropDispo[1].nomDrop, stuffDispo.invDropDispo[2].nomDrop)));
end;

// Commence le testunitaire du marchand
procedure testMarchand();

var
  orStockeBase : integer; // entier qui prend la valeur de GetOrActuelle

begin
   newTestsSeries('Marchand');


   newTest('Marchand','Achat_Consommable');

   orStockeBase:=getOrActuelle;
   MiseajourOr(getOrActuelle()-stuffDispo.invBombeDispo[1].prix);

   testisequal(getOrActuelle,orStockeBase-stuffDispo.invBombeDispo[1].prix);


   newTest('Marchand','Vente_Consommable');

   MiseajourOr(getOrActuelle()+stuffDispo.invBombeDispo[1].prix);
   testisequal(getOrActuelle,orStockeBase);


end;



// Commence le testunitaire de la chambre
procedure testChambre();
begin
     newTestsSeries('Chambre');
     //Crée un nouveau test dans la série de tests
     newTest('Chambre', 'Controle si les hp se sont restaures');

     //procedure permet de ripristiner les hp quand il repose
     modificationDataJoueur(calculHpMaxBase(),13);

     testIsEqual(dataJoueur(13), calculHpMaxBase());
     Summary();
end;

procedure testCombat();
var reussite : boolean;
    sHPMonstre : Integer;
    sHPJoueur : Integer;
begin
      newTestsSeries('Combat');
      newTest('Combat','Rendrevie');
      reussite := false;
      initStat(1);
      HPJoueur := 200;
      rendreVie(200);
      if not (HPJoueur = 200) then
         reussite := true;
      testisEqual(reussite);


      newTest('Combat','DegatJoueur');
      reussite := false;
      initStat(1);
      HPMonstre := 300;
      sHPMonstre := Trunc(HPMonstre);
      MobiliteJoueur := 5000;
      joueurAttaque();
      if not (HPMonstre = sHPMonstre) then
         reussite := true;
      testisEqual(reussite);



      newTest('Combat','Degatmonstre');
      reussite := false;
      initStat(1);
      HPJoueur := 300;
      MobiliteJoueur := 3000;
      sHPJoueur := trunc(HPJoueur);
      monstreAttaque();
      if not (sHPJoueur = HPJoueur) then
         reussite := True;
      testisEqual(reussite);


      newTest('Combat','DegatDebutTour');
      reussite := false;
      initStat(1);
      rendreVie(600);
      sHPJoueur := Trunc(HPJoueur);
      degatDebutTour(0.05);
      if not (sHPJoueur = HPJoueur) then
         reussite := True;
      testisEqual(reussite);

      newTest('Combat','DegatBombe');
      reussite := false;
      initStat(1);
      HPMonstre := 3000;
      MobiliteJoueur := 3000;
      sHPMonstre := Trunc(HPMonstre);
      utiliserBombeExplo(500);
      if not (sHPMonstre = HPMonstre) then
         reussite := True;
      testisEqual(reussite);



end;


procedure testDataJoueur();
var reussite : boolean;
    testi : integer = 0;
    i :integer;
begin

    newTestsSeries('dataJoueur');

    newTest('dataJoueur','creation');
    reussite := False;
    creationDataJoueur(0,17);
    for i := 1 to 17 do
        begin
             if (dataJoueur(i) = 0) then
                testi := testi + 1;
        end;

    if (testi = 17) then
       reussite := True;

    testisEqual(reussite);



    newTest('dataJoueur','lvl');
    reussite := False;

    miseAjourLvl(1);

    if (getLvlActuelle = 1) and (dataJoueur(1) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','EXP');
    reussite := False;

    miseAjourExp(50);

    if (getEXPActuelle = 50) and (dataJoueur(2) = 50) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','GOLD');
    reussite := False;

    miseAjourOr(50);

    if (getOrActuelle = 50) and (dataJoueur(3) = 50) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','PERSONNAGE');
    reussite := False;

    miseAjourPersonnage(1);

    if (getPersonnageActuelle = 1) and (dataJoueur(4) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','COMBATS');
    reussite := False;

    modificationDataJoueur(1,5);

    if (dataJoueur(5) = 1) then
       reussite := True;
    testisEqual(reussite);


    newTest('dataJoueur','skiptour');
    reussite := False;

    modificationDataJoueur(1,6);

    if (dataJoueur(6) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus1');
    reussite := False;

    modificationDataJoueur(1,7);

    if (dataJoueur(7) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus2');
    reussite := False;

    modificationDataJoueur(1,8);

    if (dataJoueur(8) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus3');
    reussite := False;

    modificationDataJoueur(1,9);

    if (dataJoueur(9) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus4');
    reussite := False;

    modificationDataJoueur(1,10);

    if (dataJoueur(10) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus5');
    reussite := False;

    modificationDataJoueur(1,11);

    if (dataJoueur(11) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Bonus6');
    reussite := False;

    modificationDataJoueur(1,12);

    if (dataJoueur(12) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','HPJoueur');
    reussite := False;

    modificationDataJoueur(200,13);

    if (dataJoueur(13) = 200) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Boss1');
    reussite := False;

    modificationDataJoueur(1,14);

    if (dataJoueur(14) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Boss2');
    reussite := False;

    modificationDataJoueur(1,15);

    if (dataJoueur(15) = 1) then
       reussite := True;
    testisEqual(reussite);

    newTest('dataJoueur','Boss3');
    reussite := False;

    modificationDataJoueur(1,16);

    if (dataJoueur(16) = 1) then
       reussite := True;
    testisEqual(reussite);

end;


end.

