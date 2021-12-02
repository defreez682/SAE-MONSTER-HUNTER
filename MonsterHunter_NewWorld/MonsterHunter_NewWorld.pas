program MonsterHunter_NewWorld;


uses Windows,sysutils,menu,personnage,gestionFichier, chasseIHM,inventaireLogic,combatIHM;


begin
   initialisationItemDisponibles(); // Crée la base de données des items
   checkUp();
   miseAjourOr(5000);
   miseAjourLvl(1);
   creationChoix();
   //combatQFQ();



end.

