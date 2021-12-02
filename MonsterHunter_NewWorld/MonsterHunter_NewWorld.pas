program MonsterHunter_NewWorld;


uses Windows,sysutils,menu,personnage,gestionFichier, chasseIHM,inventaireLogic,combatIHM;



begin
   initialisationItemDisponibles(); // Crée la base de données des items
   checkUp();
   creationChoix();
   //çcombatQFQ();



end.

