unit gestionFichier;

{$mode objfpc}{$H+}
{$codepage UTF8}


{Cette unité sert surtout à créer les fichiers au premier démarage}



interface

{}
procedure checkUp();


implementation
uses
  Classes, SysUtils, Personnage,inventaireLogic;

procedure checkUp ();
var i : Integer;
begin
     if not DirectoryExists('C:\MHNewWorld') then
        begin
             MkDir('C:\MHNewWorld');
             creationDataJoueur(0,20);
             miseAjourLVL(1);
             miseAjourExp(1);
             miseAjourOr(500);
             miseAjourTaille(personnage1,0);
             miseAjourPersonnage(personnage1,0);
             creationInventaireItem(0,65); // En rajouter si on ajoute des slots
        end;

end;


end.

