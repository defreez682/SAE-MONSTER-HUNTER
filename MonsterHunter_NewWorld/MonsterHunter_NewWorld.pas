program MonsterHunter_NewWorld;


uses Windows,sysutils,menu,personnage,gestionFichier, chasseIHM,inventaireLogic;


begin
   initialisationItemDisponibles(); // Crée la base de données des items
   checkUp();
   creationChoix();
   //deplacementJoueur();
end.

