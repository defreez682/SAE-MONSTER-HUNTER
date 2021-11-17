unit villageIHM;

{$mode objfpc}{$H+}

interface

procedure creationMenuVillage();
procedure choixMenuVillage();
procedure viderCadre();
procedure descriptionChasse();
procedure descriptionChambre();
procedure descriptionMarchand();
procedure descriptionForge();
procedure descriptionCantine();
procedure descriptionMenu();



implementation

uses
  Classes, SysUtils,GestionEcran,gestionTexte,crtPerso,menu;


procedure descriptionChasse();
begin
     viderCadre();
     texteXY(48,2,'Partir en chasse',White);
end;
procedure descriptionChambre();
begin
     viderCadre();
end;
procedure descriptionMarchand();
begin
     viderCadre();
end;

procedure descriptionForge();
begin
     viderCadre();
end;

procedure descriptionCantine();
begin
     viderCadre();
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
         texteXY(48,i,'                             ',White)
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
  if (rep = 1) then;
     // On part en chasse
  if (rep = 2) then;
     // On part dans la chambre
  if (rep = 3) then;
     // On part dans chez le marchand
  if (rep = 4) then;
     // On part dans la froge
  if (rep = 5) then;
     // On part dans la cantine
  if (rep = 6) then
    creationChoix();
end;

end.

