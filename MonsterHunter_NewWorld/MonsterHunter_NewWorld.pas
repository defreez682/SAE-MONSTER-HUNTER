program MonsterHunter_NewWorld;


uses Windows,sysutils,menu,personnage,gestionFichier, chasseIHM,inventaireLogic;

var j : Integer;

begin
   initialisationItemDisponibles(); // Crée la base de données des items
   checkUp();
   creationChoix();
   {modificationInventaireArme(5,7);
   modificationInventaireArme(15,9);
   modificationInventaireArme(5,4);
   modificationInventaireArme(12,13);


   for j := 1 to 20 do
       writeln('L''arme au slot ',j,' possede l''identifiant : ',armeSlot(j));

   readln();}

end.

