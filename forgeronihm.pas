unit forgeronIHM;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, GestionTexte, crtPerso, villageIHM, inventaireLogic;

procedure ForgeronDesignIHM();
procedure ForgeronCadreIHM();
procedure ChoixForgeron();
procedure ForgerArmeIHM();
procedure ChoixForgerArme();
procedure ForgerArmureIHM();
procedure ChoixForgerArmure();
procedure listerArmes(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);
procedure listerArmures(x1,x2 : integer; stuffDispo:typeStuffDisponible; indiceAcolorer : integer);

implementation

// ------------------------------------------------------ Apparence du Forgeron
procedure ForgeronDesignIHM();
begin

    deplacerCurseurXY(40,3);
    writeln('=');
    deplacerCurseurXY(40,4);
    writeln('===');
    deplacerCurseurXY(40,5);
    writeln(' ===');
    deplacerCurseurXY(40,6);
    writeln('  ===');
    deplacerCurseurXY(40,7);
    writeln('   ===');
    deplacerCurseurXY(40,8);
    writeln('    ===                    :=<]');
    deplacerCurseurXY(40,9);
    writeln('     ===          *__       /');
    deplacerCurseurXY(40,10);
    writeln('     ===         (__/      e');
    deplacerCurseurXY(40,11);
    writeln('     ===         ("J)     /  ');
    deplacerCurseurXY(40,12);
    writeln(' -_-_-_-_-_-_     )))____/');
    deplacerCurseurXY(40,13);
    writeln('//  "  ,    \\   |   |');
    deplacerCurseurXY(40,14);
    writeln('||    "     ||    \____m=====\  ');
    deplacerCurseurXY(40,15);
    writeln('|E " ( ) )  ||    +()+       (")');
    deplacerCurseurXY(40,16);
    writeln('|J ( )  )") ||   ++vv++     ====== ');
    deplacerCurseurXY(40,17);
    writeln('|M(("( /(( )||  +++++++       \/  ');
    deplacerCurseurXY(40,18);
    writeln('||  /(\ "\\(|| ++++++++       /\');
    deplacerCurseurXY(40,19);
    writeln('|9"/\)\//)\\||   // ||       /  \ ');
    deplacerCurseurXY(40,19);
    writeln('|6/ \\\\ \  ||  (__D(__D    /    \ ');
    deplacerCurseurXY(40,20);
    writeln('!!==========!! ');

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
   texteAtemps('Bienvenue dans ma forge !! Vous faut-il quelque chose ?!!!',10,15);
   texteXY(32,25,'  Je veux forger une arme',15);
   texteXY(32,26,'  Je veux forger une armure',15);
   texteXY(32,27,'  Quitter',15);



end;

procedure ChoixForgeron();

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
        1 : ChoixForgerArme();
        2 : ChoixForgerArmure();
        3 : ChoixMenuVillage();
    end;
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
   //faire appel à une fonction contenu de l'inventaire(loots)

   // Cadre des informations
   dessinerCadreXY(75,21,115,26,double,15,0);
   texteXY(77,22,'Poids',10);
   texteXY(77,23,'Ratio A/D',10);
   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);

   // Cadre pour quitter
   dessinerCadreXY(2,25,20,27,double,15,0);
   texteXY(8,26,'RETOUR',15);

end;

procedure ChoixForgerArme();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
    i : integer;
begin
     ForgerArmeIHM();
     cho := True;
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

                    listerArmes(3,38, stuffDispo,1);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              2 :begin

                    listerArmes(3,38, stuffDispo,2);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              3 :begin
                    listerArmes(3,38, stuffDispo,3);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              4:begin
                   listerArmes(3,38, stuffDispo,4);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              5:begin
                   listerArmes(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              6:begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              7:begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :  ZZZZZZ   Loot 2 :      ',4);
                 end;
              8:begin
                   listerArmes(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                                 end;
              9:begin
                   listerArmes(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              10:begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              11:begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              12:
                   begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              13:
                   begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              14:
                   begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              15: begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              16: begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              17: begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              18: begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              19: begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              20:begin
                   listerArmes(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                   ColorierZone(0,15,3,19,26);
                end;
              21: begin
                   listerArmes(3,38, stuffDispo,0);
                   ColorierZone(4,15,3,19,26);
              end;
          end;
      end;
     if rep=21 then
     ChoixForgeron();

end;

//___________________________________________________________IHM et choix forgeur Armures
procedure ForgerArmureIHM();
begin
    effacerEcran();
    dessinerCadreXY(2,2,70,23, double,15,0);
    listerArmures(3,38, stuffDispo,1);


   // Cadre des loots possdés
   dessinercadreXY(75,2,115,20,double,15,0);
   //faire appel à une fonction contenu de l'inventaire(loots)

   // Cadre des informations
   dessinerCadreXY(75,21,115,26,double,15,0);
   texteXY(77,22,'Poids',10);
   texteXY(77,23,'Ratio A/D',10);
   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);

   // Cadre pour quitter
   dessinerCadreXY(2,25,20,27,double,15,0);
   texteXY(8,26,'RETOUR',15);
end;

procedure ChoixForgerArmure();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
    i : integer;
begin
     ForgerArmureIHM();
     cho := True;
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

                    listerArmures(3,38, stuffDispo,1);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                    ColorierZone(0,15,3,19,26);
                 end;
              2 :begin

                    listerArmures(3,38, stuffDispo,2);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              3 :begin
                    listerArmures(3,38, stuffDispo,3);

                    texteXY(77,22,'Poids',10);
                    texteXY(77,23,'Ratio A/D',10);
                    texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              4:begin
                   listerArmures(3,38, stuffDispo,4);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              5:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              6:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              7:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :  ZZZZZZ   Loot 2 :      ',4);
                 end;
              8:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                                 end;
              9:begin
                   listerArmures(3,38, stuffDispo,rep);

                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                 end;
              10:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              11:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              12:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              13:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              14:
                   begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              15: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              16: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              17: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
              end;
              18: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              19: begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                end;
              20:begin
                   listerArmures(3,38, stuffDispo,rep);
                   texteXY(77,22,'Poids',10);
                   texteXY(77,23,'Ratio A/D',10);
                   texteXY(77,25,'Loots 1 :     Loot 2 :      ',4);
                   ColorierZone(0,15,3,19,26);
                end;
              21: begin
                   listerArmures(3,38, stuffDispo,0);
                   ColorierZone(4,15,3,19,26);
              end;
          end;
      end;
     if rep=21 then
     ChoixForgeron();

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

//___________________________________________________________Procedure pour remplire la table des armes
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

end.
