program MonsterHunter_NewWorld;


uses sysutils, menu, personnage, gestionFichier, combatLogic,gestionEcran;


begin
   initialisationItemDisponibles(); // Crée la base de données des items

   checkUp();
   creationChoix();

end.

