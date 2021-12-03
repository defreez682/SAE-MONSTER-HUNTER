unit bestiaireLogic;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface


type
  bestiaire = RECORD
            nom : string;
            description : String;
            hpBase : Integer;
            armureBase : Integer;
            mobilite : Integer;
            ratioHP : Integer;
            ratioArmure : Real;
            ad : Integer;
            ratioAd : Integer;
            orgagne : Integer;
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
            loot1 : Integer;
            loot2 : Integer;
            loot3 : Integer;

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
            monstre.ratioHP := 150;
            monstre.ratioArmure := 0.5;
            monstre.ad := 115;
            monstre.ratioAd := 15;
            monstre.orgagne := random(250) + 250;
            monstre.xpgagne := random(2500) + 2000;

            monstre.attaque1 := 0.1;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Tigrex rugit avec une puissance phénoménal !';

            monstre.attaque2 := 0.4;
            monstre.attaque2Chance := 60; // 20 % de chance
            monstre.attaque2Desc := 'Le Tigrex charge sur vous !';

            monstre.attaque3 := 0.3;
            monstre.attaque3Chance := 80; // 30 % de chance
            monstre.attaque3Desc := 'Le Tigrex vous donne un coup de griffe !';

            monstre.attaque4 := 0.4;
            monstre.attaque4Chance := 100; // 20% de chance
            monstre.attaque4Desc := 'Le Tigrex plante ses griffes dans un rocher et le lance sur vous !';

            monstre.loot1 := 2;
            monstre.loot2 := 5;
            monstre.loot3 := 10;

            envoyerMonstre := monstre;
        end
     else if (num = 2) then
        begin
            monstre.nom := 'Nargacuga';
            monstre.description := 'Une enorme panthere noire infernale avec ses rugissements et son agilite incroyable pour sa taille';
            monstre.hpBase := 850;
            monstre.armureBase := 40;
            monstre.mobilite := 85;
            monstre.ratioHP := 100;
            monstre.ratioArmure := 0.5;
            monstre.ad := 60;
            monstre.ratioAd := 20;
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(4000) + 3000;

            monstre.attaque1 := 0.2;
            monstre.attaque1Chance := 30; // 30 % de chance
            monstre.attaque1Desc := 'Le Nargacuga vous met un coup de queue !';

            monstre.attaque2 := 0.1;
            monstre.attaque2Chance := 60; // 30 % de chance
            monstre.attaque2Desc := 'Le Nargacuga vous donne un coup de griffe !';

            monstre.attaque3 := 0.2;
            monstre.attaque3Chance := 80; // 20 % de chance
            monstre.attaque3Desc := 'Le Nargacuga balyage le sol !';

            monstre.attaque4 := 0.3;
            monstre.attaque4Chance := 80; // 20 % de chance
            monstre.attaque4Desc := 'Le Nargacuga projette une pluie d''eccaille !';

            monstre.loot1 := 12;
            monstre.loot2 := 4;
            monstre.loot3 := 6;

            envoyerMonstre := monstre;
        end
     else if (num = 3) then
        begin
            monstre.nom := 'Rathalos';
            monstre.description := 'Surnomme le roi des cieux, ce dragon est un combattant aerien redoutable.';
            monstre.hpBase := 600;
            monstre.armureBase := 30;
            monstre.mobilite := 90;
            monstre.ratioHP := 110;
            monstre.ratioArmure := 0.55;
            monstre.ad := 75;
            monstre.ratioAd := 15;
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(2000) + 5000;

            monstre.attaque1 := 0.3;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Rathalos vous envoie une boule de feu !'; // enflamme

            monstre.attaque2 := 0.2;
            monstre.attaque2Chance := 60; // 20 % de chance
            monstre.attaque2Desc := 'Le Rathalos plante ses griffes en vous !';

            monstre.attaque3 := 0.2;
            monstre.attaque3Chance := 80; // 20 % de chance
            monstre.attaque3Desc := 'Le Rathalos balyage le sol !';

            monstre.attaque4 := 0.3 ;
            monstre.attaque4Chance := 100; // 20 % de chance
            monstre.attaque4Desc := 'Le Rathalos projette un souffle de flamme !'; // enflamme

            monstre.loot1 := 3;
            monstre.loot2 := 1;
            monstre.loot3 := 7;

            envoyerMonstre := monstre;
        end
     else if (num = 4) then
        begin
            monstre.nom := 'Glavenus';
            monstre.description := 'Colosse particulierement redoutable. Il utilise sa gigantesque queue affutee pour tout trancher';
            monstre.hpBase := 800;
            monstre.armureBase := 60;
            monstre.mobilite := 30;
            monstre.ratioHP := 180;
            monstre.ratioArmure := 0.7;
            monstre.ad := 125;
            monstre.ratioAd := 10; 
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(2000) + 7000;

            monstre.attaque1 := 0.4;
            monstre.attaque1Chance := 20; // 20 % de chance
            monstre.attaque1Desc := 'Le Glavenus balaye la zone !';

            monstre.attaque2 := 0.45;
            monstre.attaque2Chance := 30; // 10 % de chance
            monstre.attaque2Desc := 'Le Glavenus balaye la zone avec des flames !'; // enflamme

            monstre.attaque3 := 0.3;
            monstre.attaque3Chance := 70; // 40 % de chance
            monstre.attaque3Desc := 'Le Glavenus vous donne un coup de queue !';

            monstre.attaque4 := 0.3 ;
            monstre.attaque4Chance := 100; // 30 % de chance
            monstre.attaque4Desc := 'Le Glavenus crache une boule de lave !'; // enflamme

            monstre.loot1 := 9;
            monstre.loot2 := 16;
            monstre.loot3 := 18;

            envoyerMonstre := monstre;
        end
     else if (num = 5) then
        begin
            monstre.nom := 'Banbaro';
            monstre.description := 'Elan geant et enorme herbivore tres territorial. Il ne vous mange pas, mais ne vous tolere pas non plus.';
            monstre.hpBase := 800;
            monstre.armureBase := 40;
            monstre.mobilite := 40;
            monstre.ratioHP := 160;
            monstre.ratioArmure := 0.85; 
            monstre.ad := 115;
            monstre.ratioAd := 12;
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(2000) + 6000;

            monstre.attaque1 := 0.3;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Banbaro vous charge dessus !';

            monstre.attaque2 := 0.3;
            monstre.attaque2Chance := 70; // 30 % de chance
            monstre.attaque2Desc := 'Le Bandaro vous met un coup de tete !';

            monstre.attaque3 := 0.4;
            monstre.attaque3Chance := 90; // 20 % de chance
            monstre.attaque3Desc := 'Le Banbaro vous charge dessus avec un tronc !';

            monstre.attaque4 := 0.5 ;
            monstre.attaque4Chance := 100; // 10 % de chance
            monstre.attaque4Desc := 'Le Banbaro vous charge dessus avec un rocher !';

            monstre.loot1 := 3;
            monstre.loot2 := 8;
            monstre.loot3 := 11;

            envoyerMonstre := monstre;
        end
     else if (num = 6) then
        begin
            monstre.nom := 'Anjanath';
            monstre.description := 'Enorme creature violante et imposante ressemblant a un T-Rex';
            monstre.hpBase := 800;
            monstre.armureBase := 25;
            monstre.mobilite := 30;
            monstre.ratioHP := 165;
            monstre.ratioArmure := 0.9;
            monstre.ad := 100;
            monstre.ratioAd := 15;
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(2000) + 4000;

            monstre.attaque1 := 0.3;
            monstre.attaque1Chance := 30; // 30 % de chance
            monstre.attaque1Desc := 'Le Anjanath vous charge dessus !';

            monstre.attaque2 := 0.3;
            monstre.attaque2Chance := 60; // 30 % de chance
            monstre.attaque2Desc := 'Le Anjanath vous met un coup de queue !';

            monstre.attaque3 := 0.25;
            monstre.attaque3Chance := 80; // 20 % de chance
            monstre.attaque3Desc := 'Le Anjanath crache une boule de feu ! '; // enflamme

            monstre.attaque4 := 0.4 ;
            monstre.attaque4Chance := 100; // 20 % de chance
            monstre.attaque4Desc := 'Le Anjanath essaye de vous ecraser !';

            monstre.loot1 := 1;
            monstre.loot2 := 14;
            monstre.loot3 := 4;

            envoyerMonstre := monstre;
        end
     else if (num = 7) then
        begin
            monstre.nom := 'Pukei-Pukei';
            monstre.description := 'Creature volante physiquement ressemblant a un dragon et fan de poison';
            monstre.hpBase := 600;
            monstre.armureBase := 50;
            monstre.mobilite := 70;
            monstre.ratioHP := 115;
            monstre.ratioArmure := 1;
            monstre.ad := 85;
            monstre.ratioAd := 10;
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(4000) + 3000;

            monstre.attaque1 := 0.1;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Pukei-Pukei crache dessus !'; // Applique poison

            monstre.attaque2 := 0.2;
            monstre.attaque2Chance := 70; // 30 % de chance
            monstre.attaque2Desc := 'Le Pukei-Pukei vous met un coup de queue !';

            monstre.attaque3 := 0.3;
            monstre.attaque3Chance := 90; // 20 % de chance
            monstre.attaque3Desc := 'Le Pukei-Pukei vous charge dessus !';

            monstre.attaque4 := 0.5 ;
            monstre.attaque4Chance := 100; // 10 % de chance
            monstre.attaque4Desc := 'Le Pukei-Pukei essaye de vous ecraser !';

            monstre.loot1 := 17;
            monstre.loot2 := 14;
            monstre.loot3 := 19;

            envoyerMonstre := monstre;
        end
     else if (num = 8) then
        begin
            monstre.nom := 'Bazelgeuse';
            monstre.description := 'Creature volante physiquement très lourd à l''ecaille rocheuse et explosive';
            monstre.hpBase := 950;
            monstre.armureBase := 50;
            monstre.mobilite := 35;
            monstre.ratioHP := 140;
            monstre.ratioArmure := 1;
            monstre.ad := 125;
            monstre.ratioAd := 15; 
            monstre.orgagne := random(250) + 250;
            monstre.xpgagne := random(8000) + 10000;

            monstre.attaque1 := 0.4;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Bazelgeuse vous lance des écailles bombes!';

            monstre.attaque2 := 0.5;
            monstre.attaque2Chance := 70; // 30 % de chance
            monstre.attaque2Desc := 'Le Bazelgeuse vous met un coup de queue, ce qui vous fait exploser !';

            monstre.attaque3 := 0.4;
            monstre.attaque3Chance := 95; // 25 % de chance
            monstre.attaque3Desc := 'Le Bazelgeuse vous charge dessus !';

            monstre.attaque4 := 0.6 ;
            monstre.attaque4Chance := 100; // 5 % de chance
            monstre.attaque4Desc := 'Le Bazelgeuse essaye de vous ecraser !';

            monstre.loot1 := 1;
            monstre.loot2 := 9;
            monstre.loot3 := 7;

            envoyerMonstre := monstre;
        end
     else if (num = 9) then
        begin
            monstre.nom := 'Deviljho';
            monstre.description := 'Surnomme le grand devoreur, physiquement un croisement entre un crocodile et un T-rex';
            monstre.hpBase := 750;
            monstre.armureBase := 40;
            monstre.mobilite := 40;
            monstre.ratioHP := 165;
            monstre.ratioArmure := 0.7;
            monstre.ad := 130;
            monstre.ratioAd := 13;  
            monstre.orgagne := random(500) + 500;
            monstre.xpgagne := random(8000) + 6000;

            monstre.attaque1 := 0.35;
            monstre.attaque1Chance := 40; // 40 % de chance
            monstre.attaque1Desc := 'Le Deviljho essaye de vous croque !';

            monstre.attaque2 := 0.4;
            monstre.attaque2Chance := 70; // 30 % de chance
            monstre.attaque2Desc := 'Le Deviljho essaye de vous pietinne !';

            monstre.attaque3 := 0.4;
            monstre.attaque3Chance := 90; // 20 % de chance
            monstre.attaque3Desc := 'Le Deviljho vous met un coup de queue !';

            monstre.attaque4 := 0.3 ;
            monstre.attaque4Chance := 10; // 10 % de chance
            monstre.attaque4Desc := 'Le Deviljho utilise son souffle draconique !';

            monstre.loot1 := 15;
            monstre.loot2 := 5;
            monstre.loot3 := 13;

            envoyerMonstre := monstre;
        end
     else if (num = 10) then
        begin
             monstre.nom := 'Barroth';
             monstre.description := 'Animal imposant et tres resistant a l''image d''un rhinoceros... mais rocheux';
             monstre.hpBase := 900;
             monstre.armureBase := 60;
             monstre.mobilite := 40;
             monstre.ratioHP := 220;
             monstre.ratioArmure := 0.5;
             monstre.ad := 115;
             monstre.ratioAd := 11;
             monstre.orgagne := random(500) + 500;
             monstre.xpgagne := random(8000) + 4500;

             monstre.attaque1 := 0.15;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Barroth vous charge dessus !';

             monstre.attaque2 := 0.1;
             monstre.attaque2Chance := 30; // 30 % de chance
             monstre.attaque2Desc := 'Le Barroth vous met un coup de queue !';

             monstre.attaque3 := 0.2;
             monstre.attaque3Chance := 30; // 30 % de chance
             monstre.attaque3Desc := 'Le Barroth vous pietinne !';

             monstre.attaque4 := 0.1 ;
             monstre.attaque4Chance := 30; // 30 % de chance
             monstre.attaque4Desc := 'Le Barroth rugit !';

             monstre.loot1 := 18;
             monstre.loot2 := 9;
             monstre.loot3 := 3;

             envoyerMonstre := monstre;
        end
     else if (num = 11) then
        begin
             monstre.nom := 'Legiana';
             monstre.description := 'Dragon de glace très agile et puissant';
             monstre.hpBase := 650;
             monstre.armureBase := 35;
             monstre.mobilite := 80;
             monstre.ratioHP := 130;
             monstre.ratioArmure := 0.6;
             monstre.ad := 65;
             monstre.ratioAd := 20;
            monstre.orgagne := random(500) + 500;
             monstre.xpgagne := random(8000) + 7500;

             monstre.attaque1 := 0.2;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Legiana vous charge dessus !';

             monstre.attaque2 := 0.2;
             monstre.attaque2Chance := 30; // 30 % de chance
             monstre.attaque2Desc := 'Le Legiana vous met un coup de queue !';

             monstre.attaque3 := 0.3;
             monstre.attaque3Chance := 30; // 30 % de chance
             monstre.attaque3Desc := 'Le Legiana vous met un coup de griffe !';

             monstre.attaque4 := 0.2 ;
             monstre.attaque4Chance := 30; // 30 % de chance
             monstre.attaque4Desc := 'Le Legiana glace le sol ou vous êtes !';

             monstre.loot1 := 20;
             monstre.loot2 := 2;
             monstre.loot3 := 16;

             envoyerMonstre := monstre;
        end
     else if (num = 12) then
        begin
             monstre.nom := 'Kirin';
             monstre.description := 'Licorne electrique et meurtriere';
             monstre.hpBase := 650;
             monstre.armureBase := 35;
             monstre.mobilite := 80;
             monstre.ratioHP := 150;
             monstre.ratioArmure := 0.6;
             monstre.ad := 80;
             monstre.ratioAd := 15;
             monstre.orgagne := random(250) + 250;
             monstre.xpgagne := random(8000) + 7500;

             monstre.attaque1 := 0.2;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Legiana vous charge dessus !';

             monstre.attaque2 := 0.2;
             monstre.attaque2Chance := 30; // 30 % de chance
             monstre.attaque2Desc := 'Le Legiana vous met un coup de queue !';

             monstre.attaque3 := 0.3;
             monstre.attaque3Chance := 30; // 30 % de chance
             monstre.attaque3Desc := 'Le Legiana vous met un coup de griffe !';

             monstre.attaque4 := 0.2 ;
             monstre.attaque4Chance := 30; // 30 % de chance
             monstre.attaque4Desc := 'Le Legiana glace le sol où vous êtes !';


             envoyerMonstre := monstre;
        end
     else if (num = 13) then   // Ces trois derniers sont des boss
        begin
             monstre.nom := 'Teostra'; // Premier boss
             monstre.description := 'Dragon surnomee l''empereur du feu et des explosions. Sa criniere de lion le rend encore plus majestueux';
             monstre.hpBase := 4200;
             monstre.armureBase := 100;
             monstre.mobilite := 50;
             monstre.ratioHP := 0; // Boss, pas de ratio
             monstre.ratioArmure := 0; // même chsoe
             monstre.ratioAd := 0;
             monstre.ad := 170;    
             monstre.orgagne := 3000;
             monstre.xpgagne := 30000;

             monstre.attaque1 := 0.4;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Teostra utilise son souffle de flame !'; // enflamme

             monstre.attaque2 := 0.4;
             monstre.attaque2Chance := 55; // 25 % de chance
             monstre.attaque2Desc := 'Le Teostra repend de la poudre et la fait exploser !';

             monstre.attaque3 := 0.5;
             monstre.attaque3Chance := 85; // 25 % de chance
             monstre.attaque3Desc := 'Le Teostra s''enflamme et fait une roulade sur vous !'; //enflamme

             monstre.attaque4 := 0.7 ;
             monstre.attaque4Chance := 90; // 15 % de chance
             monstre.attaque4Desc := 'Le Tesotra vous fouette avec sa queue enflammee ! '; //enflamme


             envoyerMonstre := monstre;
        end
     else if (num = 14) then
        begin
             monstre.nom := 'Kushala Daora'; // Deuxième boss
             monstre.description := 'Dragon d''acier capable de controler la meteo et les vents';
             monstre.hpBase := 6500;
             monstre.armureBase := 140;
             monstre.mobilite := 60;
             monstre.ratioHP := 0; // Boss, pas de ratio
             monstre.ratioArmure := 0; // même chsoe
             monstre.ratioAd := 0;
             monstre.ad := 290;   
             monstre.orgagne := 5000;
             monstre.xpgagne := 45000;

             monstre.attaque1 := 0.4;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Kushala Daora vous lance une tornade !';

             monstre.attaque2 := 0.5;
             monstre.attaque2Chance := 55; // 25 % de chance
             monstre.attaque2Desc := 'Le Kushala canalise un vent fort autour de lui puis le fait exploser !';

             monstre.attaque3 := 0.5;
             monstre.attaque3Chance := 85; // 25 % de chance
             monstre.attaque3Desc := 'Le Kushala Daora vous charge dessus !';

             monstre.attaque4 := 0.6 ;
             monstre.attaque4Chance := 90; // 15 % de chance
             monstre.attaque4Desc := 'Le Kushala Daora utilise un souffle invisble violent !';


             envoyerMonstre := monstre;
        end
     else if (num = 15) then
        begin
             monstre.nom := 'Nergigante'; // BOSS FINAL
             monstre.description := 'Dragon redoutable, blinde, rapide et fort. L''une des pires menace.';
             monstre.hpBase := 5240;
             monstre.armureBase := 180;
             monstre.mobilite := 60;
             monstre.ratioHP := 0; // Boss, pas de ratio
             monstre.ratioArmure := 0; // même chsoe
             monstre.ratioAd := 0;
             monstre.ad := 320;
             monstre.orgagne := 7000;
             monstre.xpgagne := 10000;

             monstre.attaque1 := 0.4;
             monstre.attaque1Chance := 30; // 30 % de chance
             monstre.attaque1Desc := 'Le Nergigante lance des piques ! !';

             monstre.attaque2 := 0.4;
             monstre.attaque2Chance := 60; // 30 % de chance
             monstre.attaque2Desc := 'Le Nergigante vous charge dessus !';

             monstre.attaque3 := 0.5;
             monstre.attaque3Chance := 90; // 30 % de chance
             monstre.attaque3Desc := 'Le Nergigante vous met un coup de queue !';

             monstre.attaque4 := 0.6 ;
             monstre.attaque4Chance := 100; // 10 % de chance
             monstre.attaque4Desc := 'Le Nergigante s''envolle et projette une pluie de pique !';


             envoyerMonstre := monstre;
        end;
end;


end.

