program MonsterHunter_NewWorld;


uses sysutils, menu, personnage, gestionFichier, combatLogic,gestionEcran;


begin
   initialisationItemDisponibles(); // Crée la base de données des items

   checkUp();
   //creationChoix();
   initStat(1);
   writeln('HPJoueur : ',Int(HPJoueur):2:0);
   writeln('ArmureJoueur : ',ArmureJoueur);
   writeln('AdJoueur : ',AdJoueur);
   writeln('MobiliteJoueur : ',MobiliteJoueur);
   writeln('____________________________');
   // Monstre
   writeln('HPMonstre : ',Int(HPMonstre):2:0);
   writeln('ArmureMonstre : ',Int(ArmureMonstre):2:0);
   writeln('AdMonstre : ',AdMonstre);
   readln();

end.

