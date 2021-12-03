{Partie logique de la forge}
unit forgeronLogic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, crtPerso, villageIHM, gestionTexte, forgeronIHM, inventaireLogic, personnage;

procedure ForgeronDesign();                           
procedure ForgeronCadre();                            //Choix entre forger arme ou forger armure
procedure DemarrageForgeron();                        //Procedure principale pour entrer dans la forge 
procedure ForgerArme();                               //Partie specialisé dans la forge des armes
procedure ForgerArmure();                             //Partie specialisé dans la forge des armures
function dropExist(drop1, drop2 : string ) : boolean; //Renvoi vrai si les deux drop existent dans l'inventaire, si non faux

implementation

procedure ForgeronDesign();
begin
  ForgeronDesignIHM();
end;

procedure ForgeronCadre();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
    effacerEcran();
    ForgeronDesignIHM();
    ForgeronCadreIHM();
    deplacerCurseurXY(32,25);
    write('>>');

    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 :   //Indique la fleche en haut
                      begin
                          if (rep < 3) then
                             rep := rep + 1
                          else
                             rep := 1;
                      end;
                  #72 :  //Indique la felche en bas
                       begin
                            if (rep > 1) then
                               rep := rep - 1
                            else
                               rep := 3;
                       end;
                  #13 : cho := False;  //la touche entrer
              end;

              if (rep = 1) then
                 begin
                     texteXY(32,25,'>>',White);
                     texteXY(32,26,'  ',White);
                     texteXY(32,27,'  ',White);
                     deplacerCurseurXY(1,11);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(32,25,'  ',White);
                     texteXY(32,26,'>>',White);
                     texteXY(32,27,'  ',White);
                     deplacerCurseurXY(1,16);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(32,25,'  ',White);
                     texteXY(32,26,'  ',White);
                     texteXY(32,27,'>>',White);
                     deplacerCurseurXY(1,21);
                 end;
          end;
    case rep of
        1 : ForgerArme();
        2 : ForgerArmure();
        3 : ChoixMenuVillage();
    end;

end;

procedure ForgerArme();
var
      cho : boolean;
      rep : integer = 1;
      ch  : char;
  begin
       ForgerArmeIHM();

       cho := True;
       //---------------debut while---------------//
       while (cho= True) do
        begin
            ch := ReadKey;
            case ch of
                #72 :   //Indique la fleche en huat
                    begin
                        if (rep > 1) then
                           rep := rep - 1
                        else
                           rep := 21;
                    end;
                #80 :  //Indique la felche en bas
                     begin
                          if (rep < 21) then
                             rep := rep + 1
                          else
                             rep := 1;
                     end;
                #77 :  //Droite
                     begin
                         if (rep <= 10) then
                            rep := rep + 10
                         else
                             rep := (rep-10);
                     end;
                #75 :  //Gauche
                     begin
                         if (rep <= 10) then
                            rep := rep + 10
                         else
                             rep := (rep-10);
                     end;
                #13 : cho := False;  //la touche entrer
            end;

               case rep of
                1 :begin

                      listerArmes(3,38, stuffDispo,rep);

                      texteXY(77,22,'Poids:' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                      texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                      texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'             ');
                      texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'             ');
                      ColorierZone(0,15,3,19,26);
                   end;
                2 :begin

                      listerArmes(3,38, stuffDispo,rep);

                      texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                      texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                      texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[20].nomDrop,'             ');
                      texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'             ');
                   end;
                3 :begin
                      listerArmes(3,38, stuffDispo,rep);

                      texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                      texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                      texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'         ');
                      texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'             ');
                   end;
                4:begin
                     listerArmes(3,38, stuffDispo,4);

                      texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                      texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'         ');
                   end;
                5:begin
                     listerArmes(3,38, stuffDispo,rep);

                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[13].nomDrop,'         ');
                   end;
                6:begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10);     write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10);  write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[4].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[5].nomDrop,'         ');
                 end;
                7:begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[4].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'          ');
                   end;
                8:begin
                     listerArmes(3,38, stuffDispo,rep);

                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[4].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'          ');
                   end;
                9:begin
                     listerArmes(3,38, stuffDispo,rep);

                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[12].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[13].nomDrop,'         ');
                   end;
                10:begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[2].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'         ');
                   end;
                11:begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[20].nomDrop,'         ');
                  end;
                12:
                     begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[13].nomDrop,'         ');
                end;
                13:
                     begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[17].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'         ');
                end;
                14:
                     begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[18].nomDrop,'         ');
                   end;
                15: begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'           ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[15].nomDrop,'         ');
                  end;
                16: begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[18].nomDrop,'         ');
                end;
                17: begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[7].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[8].nomDrop,'          ');
                end;
                18: begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'         ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'         ');
                  end;
                19: begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[9].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[18].nomDrop,'         ');
                   end;
                20:begin
                     listerArmes(3,38, stuffDispo,rep);
                     texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmeDispo[rep].poids);
                     texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[rep].ratioAD*100:0:0, '%');
                     texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[4].nomDrop,'          ');
                     texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'         ');
                     ColorierZone(0,15,3,19,26);
                  end;
                21: begin
                     listerArmes(3,38, stuffDispo,0);
                     texteXY(77,22,'                 ' ,10);
                     texteXY(77,23,'                 ',10);
                     texteXY(77,25,'                               ',4);
                     texteXY(77,26,'                               ',4);
                     ColorierZone(4,15,3,19,26);
                end;
            end;
        end;
       //------------------------fini de while----------------------//
           //Ici selon le choix du joueur soit on forge ou dans le cas 21 on retourne
           case rep of
              1 :begin
                    //Controle si je possede le deux drop
                    if (dropExist(stuffDispo.invDropDispo[11].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(11,14);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();

                 end;
              2 :begin

                    if (dropExist(stuffDispo.invDropDispo[20].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(20,14);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              3 :begin

                    if (dropExist(stuffDispo.invDropDispo[3].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(3,14);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              4:begin

                   if (dropExist(stuffDispo.invDropDispo[19].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(19,14);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              5:begin

                   if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[13].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(6,13);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              6:begin
                   if (dropExist(stuffDispo.invDropDispo[4].nomDrop ,stuffDispo.invDropDispo[5].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(4,5);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              7:begin
                   if (dropExist(stuffDispo.invDropDispo[4].nomDrop ,stuffDispo.invDropDispo[11].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(4,11);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              8:begin
                   if (dropExist(stuffDispo.invDropDispo[4].nomDrop ,stuffDispo.invDropDispo[6].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(4,6);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
               end;
              9:begin
                   if (dropExist(stuffDispo.invDropDispo[12].nomDrop ,stuffDispo.invDropDispo[13].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(12,13);
                              //ajouter l'Arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                 end;
              10:begin
                   if (dropExist(stuffDispo.invDropDispo[2].nomDrop ,stuffDispo.invDropDispo[11].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(2,11);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
              end;
              11:begin
                   if (dropExist(stuffDispo.invDropDispo[16].nomDrop ,stuffDispo.invDropDispo[20].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(16,20);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              12:
                   begin
                   if (dropExist(stuffDispo.invDropDispo[11].nomDrop ,stuffDispo.invDropDispo[13].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(11,13);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
              end;
              13:
                   begin
                   if (dropExist(stuffDispo.invDropDispo[17].nomDrop ,stuffDispo.invDropDispo[19].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(17,19);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
              end;
              14:begin
                   if (dropExist(stuffDispo.invDropDispo[3].nomDrop ,stuffDispo.invDropDispo[18].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(3,18);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              15: begin
                   if (dropExist(stuffDispo.invDropDispo[14].nomDrop ,stuffDispo.invDropDispo[15].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(14,15);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              16: begin
                   if (dropExist(stuffDispo.invDropDispo[11].nomDrop ,stuffDispo.invDropDispo[18].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(11,18);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
              end;
              17: begin
                   if (dropExist(stuffDispo.invDropDispo[7].nomDrop ,stuffDispo.invDropDispo[8].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(7,8);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
              end;
              18: begin
                   if (dropExist(stuffDispo.invDropDispo[16].nomDrop ,stuffDispo.invDropDispo[19].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(16,19);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              19: begin
                   if (dropExist(stuffDispo.invDropDispo[9].nomDrop ,stuffDispo.invDropDispo[18].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(9,18);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              20:begin
                   if (dropExist(stuffDispo.invDropDispo[4].nomDrop ,stuffDispo.invDropDispo[16].nomDrop)) then
                         begin
                              //supprimer deux loots
                              drop2Loots(4,16);
                              //ajouter l'arme
                              ajoutItemToPersonnage('arme', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmeDispo[rep].nomArme);
                         end
                    else
                         messageForgeImpo();

                    forgerArme();
                end;
              21: begin
                   ForgeronCadre();
              end;
          end;
      end;


procedure ForgerArmure();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
     ForgerArmureIHM();
     cho := True;

     //debut du While
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #72 :   //Indique la fleche en huat
                  begin
                      if (rep > 1) then
                         rep := rep - 1
                      else
                         rep := 21;
                  end;
              #80 :  //Indique la felche en bas
                   begin
                        if (rep < 21) then
                           rep := rep + 1
                        else
                           rep := 1;
                   end;
              #77 :  //Droite
                   begin
                       if (rep <= 10) then
                          rep := rep + 10
                       else
                           rep := (rep-10);
                   end;
              #75 :  //Gauche
                   begin
                       if (rep <= 10) then
                          rep := rep + 10
                       else
                           rep := (rep-10);
                   end;
              #13 : cho := False;  //la touche entrer
          end;
         case rep of
              1 :begin

                    listerArmures(3,38, stuffDispo,rep);

                    texteXY(77,22,'Poids:' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                    texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                    texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[1].nomDrop,'            ');
                    ColorierZone(0,15,3,19,26);
                 end;
              2 :begin

                    listerArmures(3,38, stuffDispo,rep);

                    texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                    texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                    texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'            ');
                 end;
              3 :begin
                    listerArmures(3,38, stuffDispo,rep);

                    texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                    texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                    texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[5].nomDrop,'            ');
                 end;
              4:begin
                   listerArmures(3,38, stuffDispo,4);

                    texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                    texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[10].nomDrop,'            ');
                 end;
              5:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'            ');
                 end;
              6:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'            ');
                 end;
              7:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[10].nomDrop,'            ');
                 end;
              8:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'            ');
                                 end;
              9:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[4].nomDrop,'            ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'            ');
                 end;
              10:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[1].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[5].nomDrop,'            ');
              end;
              11:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[1].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'            ');
                end;
              12:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[3].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[19].nomDrop,'            ');
              end;
              13:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[15].nomDrop,'            ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'            ');
              end;
              14:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[5].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[10].nomDrop,'            ');
                end;
              15: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[1].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[18].nomDrop,'            ');
                end;
              16: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[9].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'            ');
              end;
              17: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[9].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'            ');
              end;
              18: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[13].nomDrop,'            ');
                end;
              19: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[9].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[16].nomDrop,'            ');
                end;
              20:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids: ' ,10); write(stuffDispo.invArmureDispo[rep].poids);
                   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[rep].Defense);
                   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[5].nomDrop,'             ');
                   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[9].nomDrop,'            ');
                   ColorierZone(0,15,3,19,26);
                end;
              21: begin
                   listerArmures(3,38, stuffDispo,0);
                   texteXY(77,22,'                 ' ,10);
                   texteXY(77,23,'                 ',10);
                   texteXY(77,25,'                               ',4);
                   texteXY(77,26,'                               ',4);
                   ColorierZone(4,15,3,19,26);
              end;
          end;
      end;
     //Fin du while

     //Selon le choix de l'utilisateur on fait quelque chose
          case rep of
              1 :begin

                    if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[1].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,1);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();

                 end;
              2 :begin

                    if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[3].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,3);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              3 :begin

                    if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[5].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,5);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              4:begin

                   if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[10].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,10);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              5:begin

                   if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[11].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,11);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              6:begin
                   if (dropExist(stuffDispo.invDropDispo[3].nomDrop ,stuffDispo.invDropDispo[11].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(3,11);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              7:begin
                   if (dropExist(stuffDispo.invDropDispo[3].nomDrop ,stuffDispo.invDropDispo[10].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(3,10);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              8:begin
                   if (dropExist(stuffDispo.invDropDispo[6].nomDrop ,stuffDispo.invDropDispo[19].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(6,19);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
               end;
              9:begin
                   if (dropExist(stuffDispo.invDropDispo[4].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                              drop2Loots(4,14);
                              //ajouter l'armures
                              ajoutItemToPersonnage('armure', rep ,personnage1);
                              animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                 end;
              10:begin
                   if (dropExist(stuffDispo.invDropDispo[1].nomDrop ,stuffDispo.invDropDispo[5].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(1,5);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
              end;
              11:begin
                   if (dropExist(stuffDispo.invDropDispo[1].nomDrop ,stuffDispo.invDropDispo[4].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(1,4);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              12:
                   begin
                   if (dropExist(stuffDispo.invDropDispo[3].nomDrop ,stuffDispo.invDropDispo[19].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(3,19);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
              end;
              13:
                   begin
                   if (dropExist(stuffDispo.invDropDispo[15].nomDrop ,stuffDispo.invDropDispo[16].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(15,16);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
              end;
              14:begin
                   if (dropExist(stuffDispo.invDropDispo[5].nomDrop ,stuffDispo.invDropDispo[10].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(5,10);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              15: begin
                   if (dropExist(stuffDispo.invDropDispo[1].nomDrop ,stuffDispo.invDropDispo[18].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(1,18);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              16: begin
                   if (dropExist(stuffDispo.invDropDispo[9].nomDrop ,stuffDispo.invDropDispo[11].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(9,11);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
              end;
              17: begin
                   if (dropExist(stuffDispo.invDropDispo[9].nomDrop ,stuffDispo.invDropDispo[14].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(9,14);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
              end;
              18: begin
                   if (dropExist(stuffDispo.invDropDispo[13].nomDrop ,stuffDispo.invDropDispo[16].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(13,16);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              19: begin
                   if (dropExist(stuffDispo.invDropDispo[16].nomDrop ,stuffDispo.invDropDispo[9].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(16,9);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              20:begin
                   if (dropExist(stuffDispo.invDropDispo[9].nomDrop ,stuffDispo.invDropDispo[5].nomDrop)) then
                         begin
                            //supprimer deux loots
                            drop2Loots(9,5);
                            //ajouter l'armure
                            ajoutItemToPersonnage('armure', rep ,personnage1);
                            animationForgeron(stuffDispo.invArmureDispo[rep].nomArmure);
                         end
                    else
                         messageForgeImpo();

                    forgerArmure();
                end;
              21: begin
                   ForgeronCadre();
              end;
          end;
      end;




procedure DemarrageForgeron();
begin

  effacerEcran();
  ForgeronCadre();

end;

//Function pour verifier si le drop existe ou non
function dropExist(drop1, drop2 : string ) : boolean;
var
    res1 : boolean = false;
    res2 : boolean = false;
    i, j : integer;
begin
  for i:= 0 to 3 do
     begin
     for j:=0 to 3 do
       begin
            if(personnage1.inventaire.invDrop[i][j].nomDrop = drop1) then
                  res1 := true;
            if(personnage1.inventaire.invDrop[i][j].nomDrop = drop2) then
                  res2 := true;
       end;
      end;
  dropExist := (res1 and res2);
end;

end.
