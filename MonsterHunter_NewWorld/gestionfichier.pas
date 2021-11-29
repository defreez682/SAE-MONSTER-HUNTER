unit gestionFichier;

{$mode objfpc}{$H+}



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
             miseAjourLVL(personnage1,1);
             miseAjourExp(personnage1,0);
             miseAjourOr(personnage1,0);
             miseAjourPersonnage(personnage1,0);
             creationInventaireItem(0,65); // En rajouter si on ajoute des slots
        end;

end;


end.

