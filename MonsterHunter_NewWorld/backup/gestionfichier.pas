unit gestionFichier;

{$mode objfpc}{$H+}



{Cette unité sert surtout à créer les fichiers au premier démarage}



interface
procedure checkUp();


implementation
uses
  Classes, SysUtils, Personnage;

procedure checkUp ();
begin
     if not DirectoryExists('C:\MHNewWorld') then
        begin
             MkDir('C:\MHNewWorld');
             miseAjourLVL(1);
             miseAjourExp(0);
             miseAjourOr(0);
             miseAjourPersonnage(0)
        end;

end;

end.

