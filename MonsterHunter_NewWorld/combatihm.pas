unit combatIHM;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

procedure introduction(num : integer);
procedure combatQFQ();
procedure creationInterface();
procedure viderBarre();
procedure victoireDefaite();
procedure barreHP();

implementation
uses
  Classes, SysUtils,bestiaireLogic,gestionEcran,GestionTexte,Personnage,combatLogic,chasseIHM,crtPerso,inventaireLogic,VillageIHM;

var monstreactuelle : Integer = 1;
    effet : boolean = False;
    tour : integer = 0;



procedure introduction(num : integer);
begin
    monstreactuelle := num;
    effacerEcran();
    attendre(500);
    texteFade(60-15,15,'Vous entendez un rugissement...',100,1500);
    deplacerCurseurXY(60-13,15);
    texteAtemps('Vous vous approchez',100,LightRed);
    deplacerCurseurXY(66,15);
    texteAtemps('......',150,Red);
    effacerEcran();
    attendre(800);
    texteFade(60-(Length(envoyerMonstre(num).nom) div 2),15,envoyerMonstre(num).nom,100,2000);
    texteFade(60-(Length(envoyerMonstre(num).description) div 2),15,envoyerMonstre(num).description,100,3000);
    initStat(monstreactuelle);
    combatQFQ();
end;



procedure animationSlash(val : integer);
begin
    if (val = 1) then
        begin
             ColorierZoneXY(white,black,60,1,60,1);
             attendre(10);
             ColorierZoneXY(white,black,59,2,59,2);
             attendre(10);
             ColorierZoneXY(white,black,58,3,58,5);
             attendre(10);
             ColorierZoneXY(white,black,59,5,59,7);
             attendre(10);
             ColorierZoneXY(white,black,58,7,58,9);
             attendre(10);
             ColorierZoneXY(black,black,60,1,60,1);
             attendre(10);
             ColorierZoneXY(black,black,59,2,59,2);
             attendre(10);
             ColorierZoneXY(black,black,58,3,58,5);
             attendre(10);
             ColorierZoneXY(black,black,59,5,59,7);
             attendre(10);
             ColorierZoneXY(black,black,58,7,58,9);
        end
    else
        begin
            ColorierZoneXY(red,black,59,1,59,1);
            ColorierZoneXY(red,black,60,2,60,2);
            ColorierZoneXY(red,black,61,3,61,3);
            attendre(30);
            ColorierZoneXY(red,black,58,2,58,2);
            ColorierZoneXY(red,black,59,3,59,3);
            ColorierZoneXY(red,black,60,4,60,4);
            attendre(30);
            ColorierZoneXY(red,black,57,3,57,3);
            ColorierZoneXY(red,black,58,4,58,4);
            ColorierZoneXY(red,black,59,5,59,5);
            attendre(30);
            ColorierZoneXY(red,black,56,4,56,4);
            ColorierZoneXY(red,black,57,5,57,5);
            ColorierZoneXY(red,black,58,6,58,6);
            attendre(10);
            ColorierZoneXY(black,black,59,1,59,1);
            ColorierZoneXY(black,black,60,2,60,2);
            ColorierZoneXY(black,black,61,3,61,3);
            attendre(10);
            ColorierZoneXY(black,black,58,2,58,2);
            ColorierZoneXY(black,black,59,3,59,3);
            ColorierZoneXY(black,black,60,4,60,4);
            attendre(30);
            ColorierZoneXY(black,black,57,3,57,3);
            ColorierZoneXY(black,black,58,4,58,4);
            ColorierZoneXY(black,black,59,5,59,5);
            attendre(30);
            ColorierZoneXY(black,black,56,4,56,4);
            ColorierZoneXY(black,black,57,5,57,5);
            ColorierZoneXY(black,black,58,6,58,6);
        end;
end;

procedure AttaqueMonstre();
var m : Integer;
    sHPJoueur : Real;
begin
   if (dataJoueur(6) = 0) then
      begin
           viderBarre();
           sHPJoueur := HPJoueur;
           animationSlash(2);
           m := monstreAttaque();

           deplacerCurseurXY(11,14);

           if (m = 1) then
              texteAtemps(envoyerMonstre(monstreActuelle).attaque1Desc,5,White)
           else if (m = 2) then
              texteAtemps(envoyerMonstre(monstreActuelle).attaque2Desc,5,White)
           else if (m = 3) then
              texteAtemps(envoyerMonstre(monstreActuelle).attaque3Desc,5,White)
           else if (m = 4) then
              texteAtemps(envoyerMonstre(monstreActuelle).attaque4Desc,5,White);

           deplacerCurseurXY(11,15);
           if (HPJoueur = sHPJoueur) then
              texteATemps('Vous avez esquive son attaque !',10,White)
           else
               begin
                     if (m = 1) and (monstreactuelle = 7)
                     or (m = 1) and (monstreactuelle = 3)
                     or (m = 4) and (monstreactuelle = 3)
                     or (m = 2) and (monstreactuelle = 4)
                     or (m = 4) and (monstreactuelle = 4)
                     or (m = 3) and (monstreactuelle = 6)
                     or (m = 1) and (monstreactuelle = 13)
                     or (m = 3) and (monstreactuelle = 13)
                     or (m = 4) and (monstreactuelle = 13) then
                         effet := True;
               end;

           deplacerCurseurXY(11,16);
           texteATemps('Le monstre vous inflige ',5,White);
           texteAtemps(FloatToStrF((sHPJoueur-HPJoueur),fffixed,1,0),10,Red);
           texteAtemps(' de degats !',5,White);
           barreHP();
           readKey;
           victoireDefaite();
           modificationDataJoueur(Trunc(HPJoueur),13);
      end
   else
       begin
            viderBarre();
            deplacerCurseurXY(11,14);
            texteAtemps('Le monstre est incapable d''attaquer !',5,white);
            deplacerCurseurXY(11,15);
            texteAtemps('Votre prochaine attaque a 100% de chance de toucher.',5,red);
            readKey;
            combatQFQ();
       end;
end;

procedure barreHP();
begin
    ColorierZoneXY(lightgreen,black,62,26,72,26);
    texteXY(46,26,'HP : ',white);
    texteXY(51,26,'   ',white);
    texteXY(51,26,FloatToStrF(HPJoueur,fffixed,1,0),white);
    texteEnCouleur('/',white);
    texteEnCouleur(IntToStr(calculHpMaxBase()),white);

    if (HPJoueur <= calculHpMaxBase()*0.9) then
       begin
            ColorierZoneXY(red,black,72,26,72,26);
       end;

    if (HPJoueur <= calculHpMaxBase()*0.8) then
       begin
            ColorierZoneXY(red,black,71,26,71,26);
       end;

    if (HPJoueur <= calculHpMaxBase()*0.7) then
       begin
            ColorierZoneXY(red,black,71,26,71,26);
       end;

    if (HPJoueur <= calculHpMaxBase()*0.6) then
       begin
            ColorierZoneXY(red,black,70,26,70,26);
       end;                                  
    if (HPJoueur <= calculHpMaxBase()*0.5) then
       begin
            ColorierZoneXY(red,black,69,26,69,26);
       end;
    if (HPJoueur <= calculHpMaxBase()*0.4) then
       begin
            ColorierZoneXY(red,black,68,26,68,26);
       end;
    if (HPJoueur <= calculHpMaxBase()*0.3) then
       begin
            ColorierZoneXY(red,black,67,26,67,26);
       end;                                  
    if (HPJoueur <= calculHpMaxBase()*0.2) then
       begin
            ColorierZoneXY(red,black,66,26,66,26);
       end;
    if (HPJoueur <= calculHpMaxBase()*0.1) then
       begin
            ColorierZoneXY(red,black,64,26,65,26);
       end;
    if (HPJoueur <= 0) then
       begin
            ColorierZoneXY(red,black,62,26,72,26);
       end;


end;

procedure barreHPMonstre();
begin
    ColorierZoneXY(brown,black,50,10,70,10);

    if (HPMonstre <= (HPMonstreMax*0.9)) then
       begin
            ColorierZoneXY(red,black,68,10,70,10);
       end;

    if (HPMonstre <= (HPMonstreMax*0.8)) then
       begin
            ColorierZoneXY(red,black,65,10,67,10);
       end;

    if (HPMonstre <= (HPMonstreMax*0.7)) then
       begin
            ColorierZoneXY(red,black,62,10,64,10);
       end;

    if (HPMonstre <= (HPMonstreMax*0.6)) then
       begin
            ColorierZoneXY(red,black,59,10,61,10);
       end;
    if (HPMonstre <= (HPMonstreMax*0.5)) then
       begin
            ColorierZoneXY(red,black,56,10,58,10);
       end;
    if (HPMonstre <= (HPMonstreMax*0.4)) then
       begin
            ColorierZoneXY(red,black,54,10,55,10);
       end;
    if (HPMonstre <= (HPMonstreMax*0.3)) then
       begin
            ColorierZoneXY(red,black,52,10,53,10);
       end;
    if (HPMonstre <= (HPMonstreMax*0.2)) then
       begin
            ColorierZoneXY(red,black,51,10,52,10);
       end;
    if (HPMonstre <= (HPMonstreMax*0.1)) then
       begin
            ColorierZoneXY(red,black,51,10,51,10);
       end;
    if (HPMonstre <= 0) then
       begin
            ColorierZoneXY(red,black,50,10,50,10);
       end;
end;

procedure viderBarre();
var i : Integer;
begin
   for i := 1 to 7 do
       begin
           texteXY(11,13+i,'                                                    ',white);
       end;
end;

procedure creationInterface();
begin
   effacerEcran;
   dessinerCadreXY(10,12,110,22,simple,White,Black);
   dessinerCadreXY(50,11,70,13,simple,White,Black);
   dessinerCadreXY(20,24,39,28,simple,White,Black);
   dessinerCadreXY(80,24,99,28,simple,White,Black);
   texteXY(60-(Length(envoyerMonstre(monstreactuelle).nom) div 2),12,envoyerMonstre(monstreactuelle).nom,white);
end;

procedure victoireDefaite();
var slvl : Integer = 0;
    i :integer;
    l1 : boolean = False;
    l2 : boolean = False;
    l3 : boolean = False;
begin
   if (HPJoueur <= 0) then
      begin
           effacerEcran();
           texteFade(60-12,15,'Vous vous etes evanouie.',100,3000);
           texteFade(60-22,15,'Une groupe de palico vous ramènes au village.',100,3000);
           texteFade(60-16,15,'Vous avez perdu 50% de votre or.',100,3000);
           miseAjourOr(getOrActuelle() div 2);
           for i:= 7 to 12 do
               modificationDataJoueur(0,i);

           choixMenuVillage();
      end;
   if (HPMonstre <= 0) then
      begin
           effacerEcran();
           dessinerCadreXY(54,7,67,11,double,white,black);
           texteXY(56,9,'Victoire !',LightGreen);
           deplacerCurseurXY(50,13);
           texteATemps('Experience :',10,white);
           texteATemps(IntToStr(envoyerMonstre(monstreactuelle).xpgagne),10,Cyan);
           miseAjourExp(envoyerMonstre(monstreactuelle).xpgagne);
           while not (slvl = getLvlActuelle()) do
           begin
               slvl := getLvlActuelle();
               verifLvlUp();
           end;
           deplacerCurseurXY(50,14);
           texteATemps('Votre niveau : ',10,white);
           texteEnCouleur(IntToStr(getLvlActuelle()),Cyan);
           deplacerCurseurXY(50,15);
           texteATemps('Or :',10,white);
           texteATemps(IntToStr(envoyerMonstre(monstreactuelle).orgagne),10,Brown);
           miseAjourOr(getOrActuelle()+envoyerMonstre(monstreactuelle).orgagne);
           deplacerCurseurXY(50,16);
           texteATemps('Items :',10,white);
           for i := 1 to 16 do
               begin
                     if (itemSlot(48 + i) = 0) then
                        begin
                             if (l1 = False) then
                                begin
                                     modificationInventaireItem(envoyerMonstre(monstreactuelle).loot1,48+i);
                                     l1 := True;
                                     deplacerCurseurXY(50,17);
                                     texteATemps('- ',5,white);
                                     texteATemps(stuffDispo.invDropDispo[(envoyerMonstre(monstreactuelle).loot1)].nomDrop,10,green);
                                end
                             else;
                        end;
               end;
           for i := 1 to 16 do
               begin
                     if (itemSlot(48 + i) = 0) then
                        begin
                             if (l2 = False) and (l1 = True) then
                                   begin
                                        modificationInventaireItem(envoyerMonstre(monstreactuelle).loot2,48+i);
                                        l2 := True;
                                        deplacerCurseurXY(50,18);
                                        texteATemps('- ',5,white);
                                        texteATemps(stuffDispo.invDropDispo[(envoyerMonstre(monstreactuelle).loot2)].nomDrop,10,green);
                                   end
                             else;
                        end;
               end;
           for i := 1 to 16 do
               begin
                     if (itemSlot(48 + i) = 0) then
                        begin
                             if (l3 = False) and (l2 = True) and (l1 = True) then
                                   begin
                                        modificationInventaireItem(envoyerMonstre(monstreactuelle).loot3,48+i);
                                        l3 := True;
                                        deplacerCurseurXY(50,19);
                                        texteATemps('- ',5,white);
                                        texteATemps(stuffDispo.invDropDispo[(envoyerMonstre(monstreactuelle).loot3)].nomDrop,10,green);
                                   end
                             else;
                        end;
               end;
           if not (l1 = true) and not (l2 = true) and not (l3 = true) then
               begin
                    deplacerCurseurXY(50,20);
                    texteAtemps('Vous n''avez plus de place dans votre inventaire.',5,Red);
               end;
           modificationDataJoueur(dataJoueur(5)+1,5);
           for i:= 7 to 12 do
               modificationDataJoueur(0,i);

           readkey;
           choixMenuVillage();
      end;
end;

procedure combatQFQ();

var cho: boolean = True;
    choInf: boolean = False;
    choComb : boolean = False;
    choPot : boolean = False;
    choBombe : boolean = False;
    ch : char;
    rep : integer = 1;

    //

    fuitechasse : Integer;
    sHPMonstre : Real;

    //



begin
   creationInterface();
   //initStat(monstreactuelle);
   barreHP();
   barreHPMonstre();

   if (effet = True) then
      begin

           tour := tour + 1;
           degatDebutTour(0.05);
           if (monstreactuelle = 7) then
              texteXY(11,15,'Vous subissez des degats de poison !',Magenta);
           if (monstreactuelle = 3)
           or (monstreactuelle = 4)
           or (monstreactuelle = 6)
           or (monstreactuelle = 13) then
              texteXY(11,15,'Vous etes en feu !',LightRed);
           if (tour = 2) then
              effet := False;
      end;

   deplacerCurseurXY(11,14);
   texteAtemps('Le monstre vous fixe...',5,white);
   texteXY(27,26,'Action',Red);
   texteXY(88,26,'Info',White);
   deplacerCurseurXY(33,26);
   while (cho= True) do
         begin
              ch := ReadKey;
              case ch of
                   #75 : if (rep < 2) then
                           rep := rep + 1
                         else
                           rep := 1;
                   #77 : if (rep > 1) then
                           rep := rep - 1
                         else
                             rep := 2;
                   #13 : cho := False;
              end;
              if (rep = 1) then
                 begin
                      texteXY(27,26,'Action',Red);
                      texteXY(88,26,'Info',White);
                      deplacerCurseurXY(33,26);
                 end;
              if (rep = 2) then
                 begin
                      texteXY(27,26,'Action',White);
                      texteXY(88,26,'Info',Red);
                      deplacerCurseurXY(92,26);
                 end;
         end;

   if (rep = 1) then
       begin
            choComb := True;
            viderBarre();
            texteXY(14,14,'Attaquer',White);
            texteXY(14,16,'Potion',White);
            texteXY(14,18,'Bombe',White);
            texteXY(14,20,'Retour',White);
            texteXY(11,14,'>>',White);
            while (choComb = True) do
                  begin
                      ch := ReadKey;
                      case ch of
                          #80 : begin
                                     if (rep < 4) then
                                         rep := rep + 1
                                     else
                                         rep := 1;
                                end;
                          #72 : begin
                                     if (rep > 1) then
                                         rep := rep - 1
                                     else
                                         rep := 4;
                                end;
                          #13 : choComb := False;

                      end;

                      if (rep = 1) then
                          begin
                               texteXY(11,14,'>>',White);
                               texteXY(11,16,'  ',White);
                               texteXY(11,18,'  ',White);
                               texteXY(11,20,'  ',White);
                               deplacerCurseurXY(13,14);
                          end;                            
                      if (rep = 2) then
                          begin
                               texteXY(11,14,'  ',White);
                               texteXY(11,16,'>>',White);
                               texteXY(11,18,'  ',White);
                               texteXY(11,20,'  ',White);
                               deplacerCurseurXY(13,16);
                          end;
                      if (rep = 3) then
                          begin
                               texteXY(11,14,'  ',White);
                               texteXY(11,16,'  ',White);
                               texteXY(11,18,'>>',White);
                               texteXY(11,20,'  ',White);
                               deplacerCurseurXY(13,18);
                          end;
                      if (rep = 4) then
                          begin
                               texteXY(11,14,'  ',White);
                               texteXY(11,16,'  ',White);
                               texteXY(11,18,'  ',White);
                               texteXY(11,20,'>>',White);
                               deplacerCurseurXY(13,20);
                          end;

                  end;
            if (rep = 1) then
               begin
                      choComb := False;
                      fuitechasse := random(100)+1;
                      if (fuitechasse >= chancefuite) then
                          begin
                               viderBarre();
                               sHPMonstre := HPMonstre;
                               animationSlash(1);
                               joueurAttaque();
                               deplacerCurseurXY(11,15);
                               texteATemps('Vous attaquez le monstre et inflige ',5,white);
                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                               texteAtemps(' de degats !',10,white);
                               if (dataJoueur(6) = 1) then
                                   modificationDataJoueur(0,6);
                               barreHPMonstre();
                               readKey;
                               victoireDefaite();
                               AttaqueMonstre();
                               combatQFQ();
                          end
                      else
                          begin
                               victoireDefaite();
                               fuite := True;
                               deplacementJoueur();
                          end;
               end;
            if (rep = 2) then
                begin
                     viderBarre();
                     choComb := False;
                     choPot := True;
                     texteXY(11,14,'>>',White);

                     if not (itemSlot(33) = 0) then
                        texteXY(13,14,stuffDispo.invPotionDispo[itemSlot(33)].nomPotion,LightRed)
                     else
                        texteXY(13,14,stuffDispo.invPotionDispo[itemSlot(33)].nomPotion,White);
                                                                                            
                     if not (itemSlot(34) = 0) then
                        texteXY(13,16,stuffDispo.invPotionDispo[itemSlot(34)].nomPotion,LightRed)
                     else
                        texteXY(13,16,stuffDispo.invPotionDispo[itemSlot(34)].nomPotion,White);
                                                                           
                     if not (itemSlot(35) = 0) then
                        texteXY(13,18,stuffDispo.invPotionDispo[itemSlot(35)].nomPotion,LightRed)
                     else
                        texteXY(13,18,stuffDispo.invPotionDispo[itemSlot(35)].nomPotion,White);
                                                                           
                     if not (itemSlot(36) = 0) then
                        texteXY(13,20,stuffDispo.invPotionDispo[itemSlot(36)].nomPotion,LightRed)
                     else
                        texteXY(13,20,stuffDispo.invPotionDispo[itemSlot(36)].nomPotion,White);
                      
                     if not (itemSlot(37) = 0) then
                        texteXY(33,14,stuffDispo.invPotionDispo[itemSlot(37)].nomPotion,LightRed)
                     else
                        texteXY(33,14,stuffDispo.invPotionDispo[itemSlot(37)].nomPotion,White);
                                                                           
                     if not (itemSlot(38) = 0) then
                        texteXY(33,16,stuffDispo.invPotionDispo[itemSlot(38)].nomPotion,LightRed)
                     else
                        texteXY(33,16,stuffDispo.invPotionDispo[itemSlot(38)].nomPotion,White);
                     
                     if not (itemSlot(39) = 0) then
                        texteXY(33,18,stuffDispo.invPotionDispo[itemSlot(39)].nomPotion,LightRed)
                     else
                        texteXY(33,18,stuffDispo.invPotionDispo[itemSlot(39)].nomPotion,White);
                       
                     if not (itemSlot(40) = 0) then
                        texteXY(33,20,stuffDispo.invPotionDispo[itemSlot(40)].nomPotion,LightRed)
                     else
                        texteXY(33,20,stuffDispo.invPotionDispo[itemSlot(40)].nomPotion,White);

                     texteXY(53,14,'Retour',White);
                     deplacerCurseurXY(13,14);
                     rep := 1;
                     while (choPot = True) do
                           begin
                                ch := ReadKey;
                                case ch of
                                      #80 : begin
                                                 if (rep < 9) then
                                                     rep := rep + 1
                                                 else
                                                     rep := 1;
                                            end;
                                      #72 : begin
                                                 if (rep > 1) then
                                                     rep := rep - 1
                                                 else
                                                     rep := 9;
                                            end;
                                      #77 :begin
                                                if (rep < 9) then
                                                    begin
                                                         rep := rep + 4;
                                                         if (rep = 10) then
                                                            rep := 2;
                                                         if (rep = 11) then
                                                            rep := 3;
                                                         if (rep = 12) then
                                                               rep := 4;
                                                    end
                                                else
                                                    rep := 1;
                                           end;
                                      #75 :begin
                                                if (rep > 1) then
                                                    begin
                                                         rep := rep - 4;
                                                         if (rep = -2) then
                                                            rep := 6;
                                                         if (rep = -1) then
                                                            rep := 7;
                                                         if (rep = 0) then
                                                               rep := 8;
                                                    end
                                                else
                                                    rep := 9;
                                           end;
                                      #13 : choPot := False;
                                end;
                                texteXY(0,0,IntToStr(rep),white);
                                if (rep = 1) then
                                    begin
                                         texteXY(11,14,'>>',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,14);
                                    end;
                                if (rep = 2) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'>>',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White); 
                                         deplacerCurseurXY(13,16);
                                    end;
                                if (rep = 3) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'>>',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White); 
                                         deplacerCurseurXY(13,18);
                                    end;
                                if (rep = 4) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'>>',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,20);
                                    end;
                                if (rep = 5) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'>>',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,14);
                                    end;
                                if (rep = 6) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'>>',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,16);
                                    end;   
                                if (rep = 7) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'>>',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,18);
                                    end;   
                                if (rep = 8) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'>>',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,20);
                                    end;   
                                if (rep = 9) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'>>',White);
                                         deplacerCurseurXY(53,14);
                                    end;

                           end;
                     if (rep = 1) then
                         begin
                              if (itemSlot(33) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(33)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(33)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);
                                       barreHP();
                                       modificationInventaireItem(0,33);
                                       readKey;
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 2) then
                         begin
                               if (itemSlot(34) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(34)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(34)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green); 
                                       barreHP();
                                       modificationInventaireItem(0,34);
                                       readKey;  
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 3) then
                         begin
                              if (itemSlot(35) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(35)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(35)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green); 
                                       barreHP();
                                       modificationInventaireItem(0,35);
                                       readKey;  
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 4) then
                         begin
                              if (itemSlot(36) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(36)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(36)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);   
                                       barreHP();
                                       modificationInventaireItem(0,36);
                                       readKey;
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 5) then
                         begin
                              if (itemSlot(37) = 0) then
                                  begin 
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(37)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(37)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);
                                       barreHP();
                                       modificationInventaireItem(0,37);
                                       readKey;  
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 6) then
                         begin
                              if (itemSlot(38) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(38)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(38)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);
                                       modificationInventaireItem(0,38);
                                       readKey;
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 7) then
                         begin
                              if (itemSlot(39) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(39)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(39)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);
                                       barreHP();
                                       modificationInventaireItem(0,39);
                                       readKey;
                                  end;
                         end;
                     if (rep = 8) then
                         begin
                              if (itemSlot(40) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       rendreVie(stuffDispo.invPotionDispo[itemSlot(40)].HealHP);
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('Vous avez regagne : ',5,white);
                                       texteAtemps(IntToStr(stuffDispo.invPotionDispo[itemSlot(40)].HealHP),5,green);
                                       texteAtemps(' HP !',5,green);
                                       barreHP();
                                       modificationInventaireItem(0,40);
                                       readKey; 
                                       AttaqueMonstre();
                                       combatQFQ();
                                  end;
                         end;
                     if (rep = 9) then
                         combatQFQ;

                end;
            if (rep = 3) then;
                begin
                     if (rep = 4) then  // Pour je sais quel raison quand on appuie sur retour ça renvoie l'inventaire bombe
                         combatQFQ();   // donc bas on vérifie dans inventaire bombe si on est sur retour.

                     choComb := False;
                     choPot := False;
                     choBombe := True;
                     viderBarre();
                     rep := 1;
                     texteXY(11,14,'>>',White);

                     if not (itemSlot(41) = 0) then
                        texteXY(13,14,stuffDispo.invBombeDispo[itemSlot(41)].nomBombe,brown)
                     else
                        texteXY(13,14,stuffDispo.invBombeDispo[itemSlot(41)].nomBombe,white);
                     if not (itemSlot(42) = 0) then
                        texteXY(13,16,stuffDispo.invBombeDispo[itemSlot(42)].nomBombe,brown)
                     else
                        texteXY(13,16,stuffDispo.invBombeDispo[itemSlot(42)].nomBombe,white);
                     if not (itemSlot(43) = 0) then
                        texteXY(13,18,stuffDispo.invBombeDispo[itemSlot(43)].nomBombe,brown)
                     else
                        texteXY(13,18,stuffDispo.invBombeDispo[itemSlot(43)].nomBombe,white);
                     if not (itemSlot(44) = 0) then
                        texteXY(13,20,stuffDispo.invBombeDispo[itemSlot(44)].nomBombe,brown)
                     else
                        texteXY(13,20,stuffDispo.invBombeDispo[itemSlot(44)].nomBombe,white);
                     if not (itemSlot(45) = 0) then
                        texteXY(33,14,stuffDispo.invBombeDispo[itemSlot(45)].nomBombe,brown)
                     else
                        texteXY(33,14,stuffDispo.invBombeDispo[itemSlot(45)].nomBombe,white);
                     if not (itemSlot(46) = 0) then
                        texteXY(33,16,stuffDispo.invBombeDispo[itemSlot(46)].nomBombe,brown)
                     else
                        texteXY(33,16,stuffDispo.invBombeDispo[itemSlot(46)].nomBombe,white);
                     if not (itemSlot(47) = 0) then
                        texteXY(33,18,stuffDispo.invBombeDispo[itemSlot(47)].nomBombe,brown)
                     else
                        texteXY(33,18,stuffDispo.invBombeDispo[itemSlot(47)].nomBombe,white);
                     if not (itemSlot(48) = 0) then
                        texteXY(33,20,stuffDispo.invBombeDispo[itemSlot(48)].nomBombe,brown)
                     else
                        texteXY(33,20,stuffDispo.invBombeDispo[itemSlot(48)].nomBombe,white);

                     texteXY(53,14,'Retour',White);
                     deplacerCurseurXY(13,14);

                     while (choBombe = True) do
                           begin
                                ch := ReadKey;
                                case ch of
                                      #80 : begin
                                                 if (rep < 9) then
                                                     rep := rep + 1
                                                 else
                                                     rep := 1;
                                            end;
                                      #72 : begin
                                                 if (rep > 1) then
                                                     rep := rep - 1
                                                 else
                                                     rep := 9;
                                            end;
                                      #77 :begin
                                                if (rep < 9) then
                                                    begin
                                                         rep := rep + 4;
                                                         if (rep = 10) then
                                                            rep := 2;
                                                         if (rep = 11) then
                                                            rep := 3;
                                                         if (rep = 12) then
                                                               rep := 4;
                                                    end
                                                else
                                                    rep := 1;
                                           end;
                                      #75 :begin
                                                if (rep > 1) then
                                                    begin
                                                         rep := rep - 4;
                                                         if (rep = -2) then
                                                            rep := 6;
                                                         if (rep = -1) then
                                                            rep := 7;
                                                         if (rep = 0) then
                                                               rep := 8;
                                                    end
                                                else
                                                    rep := 9;
                                           end;
                                      #13 : choBombe := False;
                                end;

                                if (rep = 1) then
                                    begin
                                         texteXY(11,14,'>>',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,14);
                                    end;
                                if (rep = 2) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'>>',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,16);
                                    end;
                                if (rep = 3) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'>>',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,18);
                                    end;
                                if (rep = 4) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'>>',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(13,20);
                                    end;
                                if (rep = 5) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'>>',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,14);
                                    end;
                                if (rep = 6) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'>>',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,16);
                                    end;
                                if (rep = 7) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'>>',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,18);
                                    end;
                                if (rep = 8) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'>>',White);
                                         texteXY(51,14,'  ',White);
                                         deplacerCurseurXY(33,20);
                                    end;
                                if (rep = 9) then
                                    begin
                                         texteXY(11,14,'  ',White);
                                         texteXY(11,16,'  ',White);
                                         texteXY(11,18,'  ',White);
                                         texteXY(11,20,'  ',White);
                                         texteXY(31,14,'  ',White);
                                         texteXY(31,16,'  ',White);
                                         texteXY(31,18,'  ',White);
                                         texteXY(31,20,'  ',White);
                                         texteXY(51,14,'>>',White);
                                         deplacerCurseurXY(53,14);
                                    end;

                           end;
                     if (rep = 1) then
                         begin
                              if (itemSlot(41) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       if (itemSlot(41) = 2) then
                                           begin
                                                modificationDataJoueur(1,6);
                                                texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                           end
                                       else
                                           begin
                                                sHPMonstre := HPMonstre;
                                                utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(41)].degat);
                                                if (dataJoueur(6) = 1) then
                                                   modificationDataJoueur(0,6);
                                                deplacerCurseurXY(11,16);
                                                texteATemps('La bombe explose ! et fait ',5,white);
                                                texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                                texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                           end;

                                       modificationInventaireItem(0,41);
                                       readKey;
                                       victoireDefaite();
                                       AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 2) then
                         begin
                               if (itemSlot(42) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       if (itemSlot(42) = 2) then
                                           begin
                                                modificationDataJoueur(1,6);
                                                texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                           end
                                       else
                                           begin
                                                sHPMonstre := HPMonstre;
                                                utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(42)].degat);
                                                if (dataJoueur(6) = 1) then
                                                   modificationDataJoueur(0,6);
                                                deplacerCurseurXY(11,16);
                                                texteATemps('La bombe explose ! et fait ',5,white);
                                                texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                                texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                           end;

                                       modificationInventaireItem(0,42);
                                       readKey;
                                       AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 3) then
                         begin
                              if (itemSlot(43) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                      viderBarre();
                                      deplacerCurseurXY(11,14);
                                      if (itemSlot(43) = 2) then
                                          begin
                                               modificationDataJoueur(1,6);
                                               texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                          end
                                      else
                                          begin
                                               sHPMonstre := HPMonstre;
                                               utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(43)].degat);
                                              if (dataJoueur(6) = 1) then
                                                 modificationDataJoueur(0,6);
                                                deplacerCurseurXY(11,16);
                                               texteATemps('La bombe explose ! et fait ',5,white);
                                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                               texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                          end;

                                      modificationInventaireItem(0,43);
                                      readKey;
                                       victoireDefaite();
                                      AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 4) then
                         begin
                              if (itemSlot(44) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                      viderBarre();
                                      deplacerCurseurXY(11,14);
                                      if (itemSlot(44) = 2) then
                                          begin
                                               modificationDataJoueur(1,6);
                                               texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                          end
                                      else
                                          begin
                                               sHPMonstre := HPMonstre;
                                               utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(44)].degat);
                                               if (dataJoueur(6) = 1) then
                                                 modificationDataJoueur(0,6);
                                               deplacerCurseurXY(11,16);
                                               texteATemps('La bombe explose ! et fait ',5,white);
                                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                               texteATemps(' degats.',5,white);
                                               barreHPMonstre();

                                          end;

                                      modificationInventaireItem(0,44);
                                      readKey;
                                      victoireDefaite();
                                      AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 5) then
                         begin
                              if (itemSlot(45) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                      viderBarre();
                                      deplacerCurseurXY(11,14);
                                      if (itemSlot(45) = 2) then
                                          begin
                                               modificationDataJoueur(1,6);
                                               texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                          end
                                      else
                                          begin
                                               sHPMonstre := HPMonstre;
                                               utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(45)].degat);
                                               if (dataJoueur(6) = 1) then
                                                 modificationDataJoueur(0,6);
                                               deplacerCurseurXY(11,16);
                                               texteATemps('La bombe explose ! et fait ',5,white);
                                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                               texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                          end;

                                      modificationInventaireItem(0,45);
                                      readKey;
                                       victoireDefaite();
                                      AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 6) then
                         begin
                              if (itemSlot(46) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                      viderBarre();
                                      deplacerCurseurXY(11,14);
                                      if (itemSlot(46) = 2) then
                                          begin
                                               modificationDataJoueur(1,6);
                                               texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                          end
                                      else
                                          begin
                                               sHPMonstre := HPMonstre;
                                               utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(46)].degat);
                                               if (dataJoueur(6) = 1) then
                                                  modificationDataJoueur(0,6);
                                               deplacerCurseurXY(11,16);
                                               texteATemps('La bombe explose ! et fait ',5,white);
                                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                               texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                          end;

                                      modificationInventaireItem(0,46);
                                      readKey;
                                       victoireDefaite();
                                      AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 7) then
                         begin
                              if (itemSlot(47) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                      viderBarre();
                                      deplacerCurseurXY(11,14);
                                      if (itemSlot(47) = 2) then
                                          begin
                                               modificationDataJoueur(1,6);
                                               texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                          end
                                      else
                                          begin
                                               sHPMonstre := HPMonstre;
                                               utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(47)].degat);
                                               if (dataJoueur(6) = 1) then
                                                 modificationDataJoueur(0,6);
                                               deplacerCurseurXY(11,16);
                                               texteATemps('La bombe explose ! et fait ',5,white);
                                               texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                               texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                          end;

                                      modificationInventaireItem(0,47);
                                      readKey;
                                       victoireDefaite();
                                      AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 8) then
                         begin
                              if (itemSlot(48) = 0) then
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       texteAtemps('L''emplacement est vide.',5,white);
                                       readKey;
                                       combatQFQ();
                                  end
                              else
                                  begin
                                       viderBarre();
                                       deplacerCurseurXY(11,14);
                                       if (itemSlot(48) = 2) then
                                           begin
                                                modificationDataJoueur(1,6);
                                                texteATemps('Le flash etourdit tout les sens du monstre !',5,white);
                                           end
                                       else
                                           begin
                                                sHPMonstre := HPMonstre;
                                                utiliserBombeExplo(stuffDispo.invBombeDispo[itemSlot(48)].degat);
                                                if (dataJoueur(6) = 1) then
                                                   modificationDataJoueur(0,6);
                                                deplacerCurseurXY(11,16);
                                                texteATemps('La bombe explose ! et fait ',5,white);
                                                texteATemps(FloatToStrF((sHPMonstre-HPMonstre),fffixed,1,0),10,red);
                                                texteATemps(' degats.',5,white);
                                                barreHPMonstre();

                                           end;

                                       modificationInventaireItem(0,48);
                                       readKey;
                                       victoireDefaite();
                                       AttaqueMonstre();
                                  end;
                         end;
                     if (rep = 9) then
                         combatQFQ();
                end;
       end
   else
       begin
           choInf := True;
           viderBarre();
           deplacerCurseurXY(11,14);
           texteATemps(envoyerMonstre(monstreactuelle).nom,10,red);
           deplacerCurseurXY(11,16);
           texteAtemps('HPMonstre : ',10,Green);
           texteAtemps(FloatToStrF(HPMonstre,fffixed,1,0),10,Green);
           deplacerCurseurXY(11,18);
           texteAtemps('ArmureMonstre : ',10,Orange);
           texteAtemps(FloatToStrF(ArmureMonstre,fffixed,1,0),10,Orange);
           deplacerCurseurXY(11,20);
           texteAtemps('AdMonstre : ',10,LightRed);
           texteAtemps(IntToStr(AdMonstre),10,LightRed);
           while (choInf = True) do
                begin
                     ch := ReadKey;
                     case ch of
                     #13 : begin
                                choInf := False;
                                combatQFQ();
                           end;
                     end;
                end;

       end;

end;

end.

