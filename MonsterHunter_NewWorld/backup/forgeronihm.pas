unit forgeronIHM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, GestionTexte, inventaireLogic, personnage,crtPerso;

procedure ForgeronDesignIHM();
procedure ForgeronDesignIHM2();
procedure ForgeronCadreIHM();

procedure ForgerArmeIHM();

procedure ForgerArmureIHM();

procedure listerArmes(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);
procedure listerArmures(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);
procedure listerDrop();
procedure animationForgeron(objet : string);
procedure messageForgeImpo();

implementation

// ------------------------------------------------------ Apparence du Forgeron
procedure ForgeronDesignIHM();
begin
        TexteXY(40,3,'=', 15);
    TexteXY(40,4,'===', 15);
    TexteXY(40,5,' ===', 15);
    TexteXY(40,6,'  ===', 15);
    TexteXY(40,7,'   ===', 15);
    TexteXY(40,8,'    ===                    :=<]     ', 15);
    TexteXY(40,9,'     ===          *__       /       ', 15);
    TexteXY(40,10,'     ===         (__/      e       ', 15);
    TexteXY(40,11,'     ===         ("J)     /         ', 15);
    TexteXY(40,12,' -_-_-_-_-_-_     )))____/          ', 15);
    TexteXY(40,13,'//  "  ,    \\   |   |             ', 15);
    TexteXY(40,14,'||    "     ||    \____m=====\     ', 15);
    TexteXY(40,15,'|E " ( ) )  ||    +()+       (")   ', 15);
    TexteXY(40,16,'|J ( )  )") ||   ++vv++     ====== ', 15);
    TexteXY(40,17,'|M(("( /(( )||  +++++++       \/   ', 15);
    TexteXY(40,18,'||  /(\ "\\(|| ++++++++       /\   ',15 );
    TexteXY(40,19,'|9"/\)\//)\\||   // ||       /  \  ', 15);
    TexteXY(40,19,'|6/ \\\\ \  ||  (__D(__D    /    \ ', 15);
    TexteXY(40,20,'!!==========!! ', 15);

end;

procedure ForgeronDesignIHM2();
begin

    TexteXY(40,3,'=', 15);
    TexteXY(40,4,'===', 15);
    TexteXY(40,5,' ===', 15);
    TexteXY(40,6,'  ===', 15);
    TexteXY(40,7,'   ===', 15);
    TexteXY(40,8,'    ===                             ', 15);
    TexteXY(40,9,'     ===          *__               ', 15);
    TexteXY(40,10,'     ===         (__/              ', 15);
    TexteXY(40,11,'     ===         ("J)               ', 15);
    TexteXY(40,12,' -_-_-_-_-_-_     )))____   . *     ', 15);
    TexteXY(40,13,'//  "  ,    \\   |   |  \:=<] *    ', 15);
    TexteXY(40,14,'||    "     ||    \____m=====\     ', 15);
    TexteXY(40,15,'|E " ( ) )  ||    +()+       (")   ', 15);
    TexteXY(40,16,'|J ( )  )") ||   ++vv++     ====== ', 15);
    TexteXY(40,17,'|M(("( /(( )||  +++++++       \/   ', 15);
    TexteXY(40,18,'||  /(\ "\\(|| ++++++++       /\   ', 15 );
    TexteXY(40,19,'|9"/\)\//)\\||   // ||       /  \  ', 15);
    TexteXY(40,19,'|6/ \\\\ \  ||  (__D(__D    /    \ ', 15);
    TexteXY(40,20,'!!==========!! ', 15);

end;



// ------------------------------------ Cadre du forgeron avec choix et dialogue
procedure ForgeronCadreIHM();
begin
   // Cadre des armes
   dessinercadreXY(30,22,90,28,simple,15,0);
   deplacerCurseurXY(31,23);
   couleurTexte(4);
   writeln('Forgeron :');
   deplacerCurseurXY(31,24);
   texteAtemps('Bienvenue dans ma forge !! Vous faut-il quelque chose ?',10,15);
   texteXY(32,25,'  Je veux forger une arme',15);
   texteXY(32,26,'  Je veux forger une armure',15);
   texteXY(32,27,'  Quitter',15);
end;

//___________________________________________________________IHM et choix forgeur Armes
procedure ForgerArmeIHM();
begin
    //Cadre des armes
    effacerEcran();
    dessinerCadreXY(2,2,70,23, double,15,0);
    listerArmes(3,38, stuffDispo,1);


   // Cadre des loots possdés
   dessinercadreXY(75,2,115,20,double,15,0);
   listerDrop();

   // Cadre des informations
   dessinerCadreXY(75,21,115,27,double,15,0);
   texteXY(77,22,'Poids:' ,10); write(stuffDispo.invArmeDispo[1].poids);
   texteXY(77,23,'Ratio A/D: ',10); write(stuffDispo.invArmeDispo[1].ratioAD*100:0:0, '%');
   texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[11].nomDrop,'             ');
   texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[14].nomDrop,'             ');

   // Cadre pour quitter
   dessinerCadreXY(2,25,20,27,double,15,0);
   texteXY(8,26,'RETOUR',15);

end;



//___________________________________________________________IHM et choix forgeur Armures
procedure ForgerArmureIHM();
begin
    effacerEcran();
    dessinerCadreXY(2,2,70,23, double,15,0);
    listerArmures(3,38, stuffDispo,1);


   // Cadre des loots possdés
   dessinercadreXY(75,2,115,20,double,15,0);
   listerDrop();

   // Cadre des informations
   dessinerCadreXY(75,21,115,27,double,15,0);
   texteXY(77,22,'Poids:' ,10); write(stuffDispo.invArmureDispo[1].poids);
   texteXY(77,23,'Defense: ',10); write(stuffDispo.invArmureDispo[1].defense);
    texteXY(77,25,'Loot 1: ',4); write(stuffDispo.invDropDispo[6].nomDrop,'             ');
    texteXY(77,26,'Loot 2: ',4); write(stuffDispo.invDropDispo[1].nomDrop,'            ');

   // Cadre pour quitter
   dessinerCadreXY(2,25,20,27,double,15,0);
   texteXY(8,26,'RETOUR',15);
end;


//___________________________________________________________Procedure pour remplire la table des armes
procedure listerArmes(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);
   var
       i,y : integer;
   begin
        y := 3;
	for i:=1 to 10 do
          begin
            if ( indiceAcolorer <> i) then
		  texteXY(x1,y,stuffDispo.invArmeDispo[i].nomArme,15)
	    else
		  texteXY(x1,y,stuffDispo.invArmeDispo[i].nomArme,red);
	    y := y + 2;
          end;

	y := 3;
	for i:=11 to 20 do
         begin
          if ( indiceAcolorer <> i) then
		  texteXY(x2,y,stuffDispo.invArmeDispo[i].nomArme,15)
	  else
		  texteXY(x2,y,stuffDispo.invArmeDispo[i].nomArme,red);
	  y := y + 2;
         end;
    end;

//___________________________________________________________Procedure pour remplire la table des armures
procedure listerArmures(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);
   var
       i,y : integer;
   begin
        y := 3;
	for i:=1 to 10 do
          begin
            if ( indiceAcolorer <> i) then
		  texteXY(x1,y,stuffDispo.invArmureDispo[i].nomArmure,15)
	    else
		  texteXY(x1,y,stuffDispo.invArmureDispo[i].nomArmure,red);
	    y := y + 2;
          end;

	y := 3;
	for i:=11 to 20 do
         begin
          if ( indiceAcolorer <> i) then
		  texteXY(x2,y,stuffDispo.invArmureDispo[i].nomArmure,15)
	  else
		  texteXY(x2,y,stuffDispo.invArmureDispo[i].nomArmure,red);
	  y := y + 2;
         end;
    end;
//___________________________________________________________Procedure pour lister les drops
procedure listerDrop();
var
    x,i,j : Integer;
begin
    x:=3;
    deplacerCurseurXY(78,x);
    for i:= 0 to 3 do
     begin
     for j:=0 to 3 do
       begin
            if (personnage1.inventaire.invDrop[i][j].nomDrop <> 'VIDE') then
               begin
                   write(personnage1.inventaire.invDrop[i][j].nomDrop);
                   x:=(x+1);
                   deplacerCurseurXY(78,x);
               end;
       end;
     end;

end;

//____________________________________________________________Procedure pour l'animation du forgeron

{Dans le cas l'operation est reussi}
procedure animationForgeron(objet : string);
var
    i :integer;
begin
    effacerEcran();
    dessinerCadreXY(9,2,106,25, double,15,0);
    for i:=1 to 5 do
      begin
           ForgeronDesignIHM();
           texteAtemps('..',300, 0);
           ForgeronDesignIHM2();
           texteAtemps('..',300, 0);
      end;
      deplacerCurseurXY(40,23);
      texteAtemps('Felicitation pour votre ',10, 15);
      texteAtemps(objet,10, 1);
      readKey;
end;

//_____________________________________________________________Dans le cas l'operation est impossible}
procedure messageForgeImpo();
begin
   dessinerCadreXY(20,9,100,16, double, white, black);
   deplacerCurseurXY(50, 12);
   texteAtemps('Impossible de forger !', 70,15);
   deplacerCurseurXY(35, 13);
   texteAtemps('Malheuresement vous ne possedez les drops necessaires', 80,4);
end;

end.
