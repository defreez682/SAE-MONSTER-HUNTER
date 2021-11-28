program MonsterHunter_NewWorld;


uses sysutils, menu, personnage, gestionFichier, combatLogic;

var tour : Integer = 0;
    b : Integer;

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
   writeln('HPMonstre : ',HPMonstre);
   writeln('ArmureMonstre : ',Int(ArmureMonstre):2:0);
   writeln('AdMonstre : ',AdMonstre);
   readln();


   b := monstreAttaque();
   writeln('Attaque : ',b);
   if (b = 0) then
      writeln('Esquive !');


   writeln('HPJoueur : ',Int(HPJoueur):2:0);
   writeln(calculHpMaxBase()-Int(HPJoueur):2:0,' de degats');
   tour := tour + 1;
   writeln('Tour ',tour);
   writeln('_________________________________________________');

   readln();
end.

