unit villageIHM;

{$mode objfpc}{$H+}

interface

{On créer l’interface}
procedure creationMenuVillage();
{On initialise les choix de l’interface}
procedure choixMenuVillage();
{Vide le cadre}
procedure viderCadre();
{Décrit la chasse dans le cadre}
procedure descriptionChasse();
{Décrit la chambre dans le cadre}
procedure descriptionChambre();
{Décrit le marchand dans le cadre}
procedure descriptionMarchand();
{Décrit la forge dans le cadre}
procedure descriptionForge();
{Décrit la cantine dans le cadre}
procedure descriptionCantine();
{Décrit ce que fait le bouton menu}
procedure descriptionMenu();

procedure afficheStat();




implementation

uses
  Classes, SysUtils,GestionEcran,gestionTexte,crtPerso,menu,chasseIHM,chambreIHM,marchandLogic,inventaireLogic,cantineIHM,forgeronLogic,personnage;


procedure afficheStat();
var AJ : Integer;
    ADJ : Integer;
    MJ : Integer;

begin
    texteXY(90,2,getNomActuelle(personnage1),white);
    texteXY(90,3,'_________________',white);
    texteXY(90,4,'LVL : ',white);
    texteEnCouleur(IntToStr(getLvlActuelle()),Cyan);
    texteXY(90,5,'EXP : ',white);
    texteEnCouleur(IntToStr(getEXPActuelle()),LightCyan);
    texteEnCouleur('/',LightCyan);
    texteEnCouleur(IntToStr(calculLvlSuivant()),LightCyan);
    texteXY(90,6,'Or : ',white);
    texteEnCouleur(IntToStr(getOrActuelle()),Brown);
    texteXY(90,7,'HP : ',white);
    texteEnCouleur(IntToStr(dataJoueur(13)),Red);
    texteEnCouleur('/',Red);
    texteEnCouleur(IntToStr(calculHpMaxBase()),red);

    AJ := (calculArmureBase() + stuffDispo.invArmureDispo[ItemSlot(66)].defense + stuffDispo.invArmureDispo[ItemSlot(65)].defense + stuffDispo.invArmureDispo[ItemSlot(68)].defense + stuffDispo.invArmureDispo[ItemSlot(69)].defense+ stuffDispo.invArmureDispo[ItemSlot(70)].defense) + (dataJoueur(7)+dataJoueur(11));
    ADJ := calculADBase() + (dataJoueur(8)+dataJoueur(9));
    MJ := 100 - trunc(((stuffDispo.invArmureDispo[ItemSlot(66)].poids + stuffDispo.invArmureDispo[ItemSlot(65)].poids + stuffDispo.invArmureDispo[ItemSlot(68)].poids + stuffDispo.invArmureDispo[ItemSlot(69)].poids+ stuffDispo.invArmureDispo[ItemSlot(70)].poids + stuffDispo.invArmeDispo[ItemSlot(67)].poids) - (dataJoueur(10)+dataJoueur(12))) div 2);    texteXY(90,8,'AD : ',white);

    texteEnCouleur(IntToStr(AJ),lightRed);
    texteXY(90,9,'Armure : ',white);
    texteEnCouleur(IntToStr(ADJ),green);
    texteXY(90,10,'Mobilite : ',white);
    texteEnCouleur(IntToStr(MJ),LightMagenta);
end;


procedure descriptionChasse();
begin
     viderCadre();
     texteXY(48,2,'Part en chasse dans les contrees',White);
     texteXY(48,3,'d''Aternum.',Cyan);
     texteXY(48,5,'Vous decouvrirez tout type de monstre',White);
     texteXY(48,6,'plus ',White);
     texteEnCouleur('impressionnant ',Yellow);
     texteEnCouleur('et ',White);
     texteEnCouleur('dangereux',Red);
     texteXY(48,7,'les uns que les autres.',White);
     texteXY(48,9,'N''oublie pas de bien ',White);
     texteEnCouleur('t''equiper ',Magenta);
     texteEnCouleur('et ',White);
     texteXY(48,10,'d''etre en forme car en dehors du ',White);
     texteXY(48,11,'village, le ',White);
     texteEnCouleur('danger ',Red);
     texteEncouleur('est partout.',White);
end;
procedure descriptionChambre();
begin
     viderCadre();
     texteXY(48,2,'Apres une chasse, rien de mieux que',White);
     texteXY(48,3,'le repos !',White);
     texteXY(48,5,'Ici c''est ta chambre, tu peux venir',White);
     texteXY(48,6,'quand tu veux',White);
     texteXY(48,7,'Pour ',White);
     texteEnCouleur('soigner ',Green);
     texteEnCouleur('tes blessures apres une ',White);
     texteXY(48,8,'chasse.',Cyan);
     texteXY(48,10,'Tu peux aussi gerer tes ',White);
     texteEnCouleur('affaires ',Yellow);
     texteEnCouleur('dans',White);
     texteXY(48,11,'ton coffre.',White);
     texteXY(48,13,'Un peu de rangement de temps en temps,',White);
     texteXY(48,14,'ca fait pas de mal !',White);
end;
procedure descriptionMarchand();
begin
     viderCadre();
     texteXY(48,2,'Bienvenue ',White);
     texteEnCouleur('chez Marc le Marchand !',LightRed);
     texteXY(48,4,'Ici vous pouvez achete toute sorte',White);
     texteXY(48,5,'d''equipement.',Magenta);
     texteXY(48,7,'Les articles du magasin change ',White);
     texteXY(48,8,'a chaque ',White);
     texteEnCouleur('chasse.',Cyan);

end;

procedure descriptionForge();
begin
     viderCadre();
     texteXY(48,2,'Bienvenue ',White);
     texteEnCouleur('chez le forgeron !',LightRed);
     texteXY(48,4,'Ici vous pouvez utilise les',White);
     texteXY(48,5,'ressources ',LightBlue);
     texteEnCouleur('accumulee apres chaque',White);
     texteXY(48,6,'chasse pour forger des ',White);
     texteEnCouleur('armes ',Magenta);
     texteEnCouleur('et des ',White);
     texteXY(48,7,'armures ',Magenta);
     texteEnCouleur('surpuissantes.',White);
end;

procedure descriptionCantine();
begin
     viderCadre();
     texteXY(48,2,'Un peu de poulet pour donner un',White);
     texteXY(48,3,'peu de force !',Brown);
end;
procedure descriptionMenu();
begin
     viderCadre();
     texteXY(48,2,'Retourner au menu.',White);
end;

procedure viderCadre();
var i : integer;
begin
     for i := 2 to 29 do
         texteXY(48,i,'                                      ',White)
end;

procedure creationMenuVillage();
begin
     effacerEcran();
     dessinerCadreXY(10,1,31,5,double,White,Black);
     texteXY(13,3,'Partir en chasse',White);
     dessinerCadreXY(10,7,31,11,double,White,Black);
     texteXY(17,9,'Chambre',White);
     dessinerCadreXY(10,13,31,17,double,White,Black);
     texteXY(17,15,'Marchand',White);
     dessinerCadreXY(10,19,31,23,double,White,Black);
     texteXY(18,21,'Forge',White);
     dessinerCadreXY(10,25,31,29,double,White,Black);
     texteXY(17,27,'Cantine',White);

     dessinerCadreXY(42,1,44,30,double,White,Black);


     dessinerCadreXY(47,1,86,30,simple,White,Black);


     dessinerCadreXY(90,25,110,29,double,White,Black);
     texteXY(98,27,'Menu',White);
end;


procedure choixMenuVillage();
var cho : boolean = False;
    rep : integer = 1;
    ch  : char;

begin
     creationMenuVillage();
     afficheStat();
     recupInventaire(personnage1);
     cho := True;
     descriptionChasse();
     texteXY(8,3,'>>',White);
     deplacerCurseurXY(7,3);
     while (cho= True) do
           begin
               ch := ReadKey;
               case ch of
                   #80 : if (rep < 6) then
                            rep := rep + 1
                         else
                            rep := 1;

                   #72 : if (rep > 1) then
                            rep := rep - 1
                         else
                            rep := 6;
                   #13 : cho := False;
               end;

               if (rep = 1) then
                  begin
                      descriptionChasse();
                      texteXY(8,3,'>>',White);
                      texteXY(8,9,'  ',White);
                      texteXY(8,15,'  ',White);
                      texteXY(8,21,'  ',White);
                      texteXY(8,27,'  ',White);
                      texteXY(88,27,'  ',White);
                      deplacerCurseurXY(7,3);
                  end;
               if (rep = 2) then
                  begin
                      descriptionChambre();
                      texteXY(8,3,'  ',White);
                      texteXY(8,9,'>>',White);
                      texteXY(8,15,'  ',White);
                      texteXY(8,21,'  ',White);
                      texteXY(8,27,'  ',White);
                      texteXY(88,27,'  ',White);
                      deplacerCurseurXY(7,9);
                  end;
               if (rep = 3) then
                  begin
                      descriptionMarchand();
                      texteXY(8,3,'  ',White);
                      texteXY(8,9,'  ',White);
                      texteXY(8,15,'>>',White);
                      texteXY(8,21,'  ',White);
                      texteXY(8,27,'  ',White);
                      texteXY(88,27,'  ',White);
                      deplacerCurseurXY(7,15);
                  end;
               if (rep = 4) then
                  begin
                      descriptionForge();
                      texteXY(8,3,'  ',White);
                      texteXY(8,9,'  ',White);
                      texteXY(8,15,'  ',White);
                      texteXY(8,21,'>>',White);
                      texteXY(8,27,'  ',White);
                      texteXY(88,27,'  ',White);
                      deplacerCurseurXY(7,21);
                  end;
               if (rep = 5) then
                  begin
                      descriptionCantine();
                      texteXY(8,3,'  ',White);
                      texteXY(8,9,'  ',White);
                      texteXY(8,15,'  ',White);
                      texteXY(8,21,'  ',White);
                      texteXY(8,27,'>>',White);
                      texteXY(88,27,'  ',White);
                      deplacerCurseurXY(7,27);
                  end;
               if (rep = 6) then
                  begin
                      descriptionMenu();
                      texteXY(8,3,'  ',White);
                      texteXY(8,9,'  ',White);
                      texteXY(8,15,'  ',White);
                      texteXY(8,21,'  ',White);
                      texteXY(8,27,'  ',White);
                      texteXY(88,27,'>>',White);
                      deplacerCurseurXY(87,27);
                  end;
           end;
  if (rep = 1) then
     // On part en chasse
     deplacementJoueur()
  else if (rep = 2) then
     // On part dans la chambre
     chambre()
  else if (rep = 3) then
     DemarrageMarchand()

     // On part dans chez le marchand
  else if (rep = 4) then
     // On part dans la forge
     DemarrageForgeron()
  else if (rep = 5) then
     // On part dans la cantine
     cantine()
  else if (rep = 6) then
    creationChoix();
end;

end.

