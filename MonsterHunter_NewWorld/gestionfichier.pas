unit gestionFichier;

{$mode objfpc}{$H+}
{$codepage UTF8}


{Cette unité sert à créer les fichiers au premier démarage}



interface

{}
procedure checkUp();


implementation
uses
  Classes, SysUtils, Personnage,inventaireLogic;

procedure checkUp ();
begin
     if not DirectoryExists('C:\MHNewWorld') then // On vérifie que le repertoire existe
        begin
             MkDir('C:\MHNewWorld'); // On créer le repertoire
             creationDataJoueur(0,20);// On créer le fichier data
             miseAjourLVL(1); // initialise les stats
             miseAjourExp(1); // initialise les stats
             miseAjourOr(500); // initialise les stats
             miseAjourTaille(personnage1,0); // initialise les stats
             miseAjourPersonnage(0); // On indique que aucun porsonnage existe
        end;

end;


end.

