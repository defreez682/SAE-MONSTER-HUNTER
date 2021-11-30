unit combatIHM;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

procedure introduction(num : integer);
procedure combatQFQ();
procedure creationInterface();
procedure viderBarre();

implementation
uses
  Classes, SysUtils,bestiaireLogic,gestionEcran,GestionTexte,Personnage,combatLogic,chasseIHM,crtPerso,inventaireLogic;

var monstreactuelle : Integer = 1;



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

procedure combatQFQ();

var cho: boolean = True;
    choInf: boolean = True;
    choComb : boolean = True;
    choPot : boolean = True;
    choBombe : boolean = True;
    ch : char;
    rep : integer = 1;

    //

    fuitechasse : Integer;
    cmb : Boolean = False;
    a : Integer;
    effet : boolean = false;
    skipTour : Boolean = false;
    tour : Integer = 0;

    //



begin
   creationInterface();
   initStat(monstreactuelle);
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
            if (rep = 1) then;
            if (rep = 2) then
                begin
                     viderBarre();
                     texteXY(11,14,'>>',White);

                     texteXY(13,14,stuffDispo.invPotionDispo[itemSlot(33)].nomPotion,White);
                     texteXY(13,16,stuffDispo.invPotionDispo[itemSlot(34)].nomPotion,White);
                     texteXY(13,18,stuffDispo.invPotionDispo[itemSlot(35)].nomPotion,White);
                     texteXY(13,20,stuffDispo.invPotionDispo[itemSlot(36)].nomPotion,White);
                     texteXY(33,14,stuffDispo.invPotionDispo[itemSlot(37)].nomPotion,White);
                     texteXY(33,16,stuffDispo.invPotionDispo[itemSlot(38)].nomPotion,White);
                     texteXY(33,18,stuffDispo.invPotionDispo[itemSlot(39)].nomPotion,White);
                     texteXY(33,20,stuffDispo.invPotionDispo[itemSlot(40)].nomPotion,White);
                     texteXY(53,14,'Retour',White);
                     deplacerCurseurXY(13,14);

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
                                      #13 : choPot := False;
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
                                       modificationInventaireItem(0,33);
                                       readKey;
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
                                       modificationInventaireItem(0,34);
                                       readKey;
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
                                       modificationInventaireItem(0,35);
                                       readKey;
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
                                       modificationInventaireItem(0,36);
                                       readKey;
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
                                       modificationInventaireItem(0,37);
                                       readKey;
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
                                       modificationInventaireItem(0,40);
                                       readKey;
                                  end;
                         end;
                     if (rep = 9) then
                         combatQFQ;

                end;
            if (rep = 3) then;
            begin
                 viderBarre();
                 texteXY(11,14,'>>',White);

                 texteXY(13,14,stuffDispo.invBombeDispo[itemSlot(41)].nomBombe,White);
                 texteXY(13,16,stuffDispo.invBombeDispo[itemSlot(42)].nomBombe,White);
                 texteXY(13,18,stuffDispo.invBombeDispo[itemSlot(43)].nomBombe,White);
                 texteXY(13,20,stuffDispo.invBombeDispo[itemSlot(44)].nomBombe,White);
                 texteXY(33,14,stuffDispo.invBombeDispo[itemSlot(45)].nomBombe,White);
                 texteXY(33,16,stuffDispo.invBombeDispo[itemSlot(46)].nomBombe,White);
                 texteXY(33,18,stuffDispo.invBombeDispo[itemSlot(47)].nomBombe,White);
                 texteXY(33,20,stuffDispo.invBombeDispo[itemSlot(48)].nomBombe,White);
                 texteXY(53,14,'Retour',White);
                 deplacerCurseurXY(13,14);

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
                                  #13 : choPot := False;
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
                                   modificationInventaireItem(0,41);
                                   readKey;
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
                                   modificationInventaireItem(0,42);
                                   readKey;
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
                                   modificationInventaireItem(0,43);
                                   readKey;
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
                                   modificationInventaireItem(0,44);
                                   readKey;
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
                                   modificationInventaireItem(0,45);
                                   readKey;
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
                                   modificationInventaireItem(0,46);
                                   readKey;
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
                                   modificationInventaireItem(0,47);
                                   readKey;
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
                                   modificationInventaireItem(0,48);
                                   readKey;
                              end;
                     end;
                 if (rep = 9) then
                     combatQFQ;
            end;
            if (rep = 4) then
               combatQFQ();


       end
   else
       begin
               viderBarre();
               deplacerCurseurXY(11,14);
               texteATemps(envoyerMonstre(monstreactuelle).nom,10,red);
               texteATemps(' : ',10,red);
               texteATemps(envoyerMonstre(monstreactuelle).description,10,red);


               deplacerCurseurXY(11,16);
               texteAtemps('HPMonstre : ',10,Green);
               texteAtemps(FloatToStrF(HPMonstre,fffixed,1,0),10,Green);
               deplacerCurseurXY(11,18);
               texteAtemps('ArmureMonstre : ',10,Orange);
               texteAtemps(FloatToStrF(ArmureMonstre,fffixed,1,0),10,Orange);
               deplacerCurseurXY(11,20);
               texteAtemps('AdMonstre : ',10,LightRed);
               texteAtemps(IntToStr(AdMonstre),10,LightRed);
               deplacerCurseurXY(11,21);
               texteAtemps('*echap pour quitter*',10,DarkGray);
               while (choInf = True) do
                     begin
                         ch := ReadKey;
                         case ch of
                              #27 : begin
                                         choInf := False;
                                         combatQFQ();
                                    end;
                         end;
                     end;

       end;



   //randomize;
   {texteXY(0,1,'HPJoueur : ',White);
   texteEnCouleur(FloatToStrF(HPJoueur,fffixed,1,0),White);
   texteXY(0,2,'ArmureJoueur : ',White);
   texteEnCouleur(IntToStr(ArmureJoueur),White);
   texteXY(0,3,'AdJoueur : ',White);
   texteEnCouleur(IntToStr(AdJoueur),White);
   texteXY(0,4,'MobiliteJoueur : ',White);
   texteEnCouleur(IntToStr(MobiliteJoueur),White);
   texteXY(0,5,'____________________________',White);
   // Monstre
   texteXY(0,6,'HPMonstre : ',White);
   texteEnCouleur(FloatToStrF(HPMonstre,fffixed,1,0),White);
   texteXY(0,7,'ArmureMonstre : ',White);
   texteEnCouleur(FloatToStrF(ArmureMonstre,fffixed,1,0),White);
   texteXY(0,8,'AdMonstre : ',White);
   texteEnCouleur(IntToStr(AdMonstre),White);

   cmb := True;
   while (cmb = True) do
         begin
             writeln();
             write('Votre choix : ');
             readln(cho);

             if (effet = True) then
                 begin

                       tour := tour + 1;
                       degatDebutTour(0.05);
                       if (monstreactuelle = 7) then
                          writeln('Vous subissez des degats de poison !');
                       if (monstreactuelle = 3)
                       or (monstreactuelle = 4)
                       or (monstreactuelle = 6)
                       or (monstreactuelle = 12) then
                          writeln('Vous etes en feu !');


                       if (tour = 2) then
                          effet := False;
                 end;

             if (cho = 1) then
                 begin
                      fuitechasse := random(100)+1;
                      if (fuitechasse >= chancefuite) then
                          begin
                               joueurAttaque();
                               writeln('HPMonstre : ',Int(HPMonstre):2:0);
                               writeln('_____________________________')
                          end
                      else
                          begin
                               fuite := True;
                               deplacementJoueur();
                          end;
                 end
             else if (cho = 2) then
                     rendreVie(calculHpMaxBase() div 2)
             else if (cho = 3) then
                     begin
                          utiliserBombeExplo(500);
                          writeln('HPMonstre : ',Int(HPMonstre):2:0);
                          writeln('_____________________________')
                     end
             else if (cho = 4) then
                  begin
                     if (bombeFlash() = True) then
                         skiptour := True
                     else
                         skiptour := False;
                  end;


             if (skiptour = False) then
                begin
                     a := monstreAttaque();

                     if (a = 1) and (monstreactuelle = 7)
                     or (a = 1) and (monstreactuelle = 3)
                     or (a = 4) and (monstreactuelle = 3)
                     or (a = 2) and (monstreactuelle = 4)
                     or (a = 4) and (monstreactuelle = 4)
                     or (a = 3) and (monstreactuelle = 6)
                     or (a = 1) and (monstreactuelle = 12)
                     or (a = 3) and (monstreactuelle = 12)
                     or (a = 4) and (monstreactuelle = 12) then
                         effet := True;


                     writeln('Attaque : ',a);
                     writeln('HPJoueur : ',Int(HPJoueur):2:0);
                     writeln('_____________________________');

                     if (Int(HPJoueur) <= 0) or (Int(HPMonstre) <= 0) then
                     begin
                         if (Int(HPJoueur) <= 0) then
                             writeln('Perdu !')
                         else
                             writeln('Gagne !');
                         readln();
                         cmb := False;
                     end;
                end
             else writeln('Le monstre est aveugle !');skipTour := False;

         end;}
end;



end.

