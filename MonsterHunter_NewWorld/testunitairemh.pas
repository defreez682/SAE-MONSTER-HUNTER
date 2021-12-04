unit testUnitaireMH;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,inventaireLogic,Personnage,MarchandLogic,TestUnitaire;

// Démarre le testunitaire
procedure demarrageTestUnitaire();

// Commence le testunitaire de l'inventaire
procedure testInventaire();

//test de la cantine, la chambre et la forge
procedure testCantine();
procedure testChambre();
procedure testForge();

implementation

// Démarre le testunitaire
procedure demarrageTestUnitaire();
begin
  testInventaire();
  testCantine();
  testChambre();
  testForge();
  
  Summary();
  readln;
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


//----------Test Cantine-----------//
procedure testCantine();
var
  solde : integer;
begin
    newTestsSeries('Test cantine: ');

  //Crée un nouveau test dans la série de tests
    newTest('Test cantine: ', 'Achat d''un repas ');

    //je copie la valeur de l'or actuelle pour la comparer aprés
    solde := getOrActuelle();

    //modifier Or actuelle (procedure utilisé dans l'achat des repas)
    miseAjourOr(getOrActuelle() - 50) ;


    //Test d'égalité entre deux entiers
    testIsEqual(getOrActuelle(),solde - 50);


  end;

//----------Test Forge-------------//
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

//--------Test Chambre------------//
procedure testChambre();
begin
     newTestsSeries('Test Chambre: ');
     //Crée un nouveau test dans la série de tests
     newTest('Test Chambre: ', 'Controle si les hp se sont restaurés');

     //procedure permet de ripristiner les hp quand il repose
     modificationDataJoueur(calculHpMaxBase(),13);

     testIsEqual(dataJoueur(13), calculHpMaxBase());

end; 


end.

