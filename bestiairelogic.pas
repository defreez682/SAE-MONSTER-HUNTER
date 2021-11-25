unit bestiaireLogic;

{$mode objfpc}{$H+}

interface


type
  bestiaire = RECORD
            nom : string;
            description : String;
            hpBase : Integer;
            armureBase : Integer;
            mobilite : Integer;
            ratioHP : Real;
            ratioArmure : Real;
            // loot
            xpgagne : Integer;
            attaque1 : Real;
            attaque1Chance : Integer;
            attaque1Desc : string;
            attaque2 : Real;
            attaque2Chance : Integer;
            attaque2Desc : string;
            attaque3 : Real;
            attaque3Chance : Integer;
            attaque3Desc : string;
            attaque4 : Real;
            attaque4Chance : Integer;
            attaque4Desc : string;

  end;

function envoyerMonstre(num : integer) : bestiaire;


implementation
uses
  Classes, SysUtils;


function envoyerMonstre(num : integer) : bestiaire;

var monstre : bestiaire;

begin
     randomize;
     if (num = 1) then
        begin
            monstre.nom := 'Tigrex';
            monstre.description := 'Un monstre violent et sans pitie. physiquement, un melange d''un tigre et d''un t-rex';
            monstre.hpBase := 800;
            monstre.armureBase := 70;
            monstre.mobilite := 40;
            monstre.ratioHP := 0.1;
            monstre.ratioArmure := 0.2;
            monstre.xpgagne := random(2500) + 2000;

            monstre.attaque1 := 0.9;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Tigrex rugit avec une puissance phénoménal !';

            monstre.attaque2 := 0.6;
            monstre.attaque1Chance := 60; // 20 % de chance
            monstre.attaque2Desc := 'Le Tigrex charge sur vous !';

            monstre.attaque3 := 0.7;
            monstre.attaque3Chance := 80; // 30 % de chance
            monstre.attaque3Desc := 'Le Tigrex vous donne un coup de griffe !';

            monstre.attaque4 := 0.6;
            monstre.attaque4 := 100; // 20% de chance
            monstre.attaque4Desc := 'Le Tigrex plante ses griffes dans un rocher et le lance sur vous !';


            envoyerMonstre := monstre;
        end
     else if (num = 2) then
        begin
            monstre.nom := 'Nargacuga';
            monstre.description := 'Une enorme panthere noire infernale avec ses rugissements et son agilite incroyable pour sa taille';
            monstre.hpBase := 600;
            monstre.armureBase := 40;
            monstre.mobilite := 80;
            monstre.ratioHP := 0.2;
            monstre.ratioArmure := 0.2;
            monstre.xpgagne := random(4000) + 3000;

            monstre.attaque1 := 0.8;
            monstre.attaque1Chance := 30; // 30 % de chance
            monstre.attaque1Desc := 'Le Nargacuga vous met un coup de queue !';

            monstre.attaque2 := 0.9;
            monstre.attaque2Chance := 60; // 30 % de chance
            monstre.attaque2Desc := 'Le Nargacuga vous donne un coup de griffe !';

            monstre.attaque3 := 0.8;
            monstre.attaque3Chance := 80; // 20 % de chance
            monstre.attaque3Desc := 'Le Nargacuga balyage le sol !';

            monstre.attaque4 := 0.7;
            monstre.attaque4Chance := 80; // 20 % de chance
            monstre.attaque4Desc := 'Le Nargacuga projette une pluie d''eccaille !';


            envoyerMonstre := monstre;
        end
     else if (num = 3) then
        begin
            monstre.nom := 'Rathalos';
            monstre.description := 'Surnomme le roi des cieux, ce dragon est un combattant aerien redoutable.';
            monstre.hpBase := 600;
            monstre.armureBase := 30;
            monstre.mobilite := 90;
            monstre.ratioHP := 0.2;
            monstre.ratioArmure := 0.05;
            monstre.xpgagne := random(2000) + 5000;

            monstre.attaque1 := 0.7;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Rathalos vous envoie une boule de feu !';

            monstre.attaque2 := 0.8;
            monstre.attaque2Chance := 60; // 20 % de chance
            monstre.attaque2Desc := 'Le Rathalos plante ses griffes en vous !';

            monstre.attaque3 := 0.8;
            monstre.attaque3Chance := 80; // 20 % de chance
            monstre.attaque3Desc := 'Le Rathalos balyage le sol !';

            monstre.attaque4 := 0.7 ;
            monstre.attaque4Chance := 100; // 20 % de chance
            monstre.attaque4Desc := 'Le Rathalos projette un souffle de flamme !';


            envoyerMonstre := monstre;
        end
     else if (num = 4) then
        begin
            monstre.nom := 'Glavenus';
            monstre.description := 'Colosse particulierement redoutable. Il utilise sa gigantesque queue affutee pour tout trancher';
            monstre.hpBase := 800;
            monstre.armureBase := 60;
            monstre.mobilite := 30;
            monstre.ratioHP := 0.1;
            monstre.ratioArmure := 0.1;
            monstre.xpgagne := random(2000) + 7000;

            monstre.attaque1 := 0.6;
            monstre.attaque1Chance := 20; // 20 % de chance
            monstre.attaque1Desc := 'Le Glavenus balaye la zone !';

            monstre.attaque2 := 0.55;
            monstre.attaque2Chance := 30; // 10 % de chance
            monstre.attaque2Desc := 'Le Glavenus balaye la zone avec des flames !';

            monstre.attaque3 := 0.7;
            monstre.attaque3Chance := 70; // 40 % de chance
            monstre.attaque3Desc := 'Le Glavenus vous donne un coup de queue !';

            monstre.attaque4 := 0.7 ;
            monstre.attaque4Chance := 100; // 30 % de chance
            monstre.attaque4Desc := 'Le Glavenus crache une boule de lave !';


            envoyerMonstre := monstre;
        end
     else if (num = 5) then
        begin
            monstre.nom := 'Banbaro';
            monstre.description := 'Elan geant et enorme herbivore tres territorial. Il ne vous mange pas, mais ne vous tolere pas non plus.';
            monstre.hpBase := 800;
            monstre.armureBase := 40;
            monstre.mobilite := 40;
            monstre.ratioHP := 0.2;
            monstre.ratioArmure := 0.1;
            monstre.xpgagne := random(2000) + 6000;

            monstre.attaque1 := 0.7;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Banbaro vous charge dessus !';

            monstre.attaque2 := 0.7;
            monstre.attaque2Chance := 70; // 30 % de chance
            monstre.attaque2Desc := 'Le Bandaro vous met un coup de tete !';

            monstre.attaque3 := 0.6;
            monstre.attaque3Chance := 90; // 20 % de chance
            monstre.attaque3Desc := 'Le Banbaro vous charge dessus avec un tronc !';

            monstre.attaque4 := 0.5 ;
            monstre.attaque4Chance := 100; // 10 % de chance
            monstre.attaque4Desc := 'Le Banbaro vous charge dessus avec un rocher !';


            envoyerMonstre := monstre;
        end
     else if (num = 6) then
        begin
        end
     else if (num = 7) then
        begin
        end
     else if (num = 8) then
        begin
        end
     else if (num = 9) then
        begin
        end
     else if (num = 10) then
        begin
        end
     else if (num = 11) then
        begin
        end
     else if (num = 12) then
        begin
        end
     else if (num = 13) then
        begin
        end
     else if (num = 14) then
        begin
        end;


end;


end.

