unit testUnitaireMH;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,inventaireLogic,Personnage,MarchandLogic,TestUnitaire;

// Démarre le testunitaire
procedure demarrageTestUnitaire();

// Commence le testunitaire de l'inventaire
procedure testInventaire();

implementation

// Démarre le testunitaire
procedure demarrageTestUnitaire();
begin
  testInventaire();
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







Summary();
end;


end.

