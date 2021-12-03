program MonsterHunter_NewWorld;

{$codepage UTF8}

uses Windows, sysutils, menu, personnage, gestionFichier, chasseIHM,
  inventaireLogic, combatIHM, testUnitaireMH;



begin
   initialisationItemDisponibles(); // Crée la base de données des items
   checkUp();
   creationChoix();



end.

