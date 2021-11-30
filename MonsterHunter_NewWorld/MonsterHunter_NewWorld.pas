program MonsterHunter_NewWorld;

{$codepage UTF8}


uses sysutils, menu, personnage, gestionFichier, combatLogic,combatIHM,gestionEcran;


begin
   initialisationItemDisponibles(); // Crée la base de données des items

   checkUp();
   creationChoix();
   //combatQFQ();
end.

