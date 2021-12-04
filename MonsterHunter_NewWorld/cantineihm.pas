{Unité permet de se reposer et de gestir son inventaire}
unit cantineIHM;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

uses
  Classes, SysUtils ,GestionEcran, gestiontexte, crtPerso, Personnage,villageIHM;

  procedure cantineInterface();     //Interface de la cantine
  procedure cantineChoix();         //Choisir une option à faire soit Acheter ou retourner au village
  procedure cantine();              //Regroupe les deux procedure cantineChoix() et cantineInterface()
  procedure messageOrInsuffisant(); // Message qui s'affiche si l'achat n'est pas reussi quand l'or est

implementation
//Creation de l'interface de la cantine
procedure cantineInterface();
begin
     effacerEcran();
     dessinerCadreXY(1,0,14,2, double, white, black);
     texteXY(4,1, 'CANTINE', 15);

     //Cadre indique le total d'or possédé
     dessinerCadreXY(76,0,113,2, double, 10, black);
     deplacerCurseurXY(93,1); texteEnCouleur('OR : ', 10); write(getOrActuelle());

     //cadres des repas
     dessinerCadreXY(1,3,37,12, simple, white, black);
     texteXY(7,4, ' .--.         /``''.', 15);
     texteXY(7,5, '/    \ .---. |     \', 15);
     texteXY(7,6, '|    |/     `;--.  |', 15);
     texteXY(7,7, '\    /\     /    \.''', 15);
     texteXY(7,8, ' ''--''  ''----|    | ', 15);
     texteXY(7,9, '            \    / ', 15);
     texteXY(7,10, '             ''--'' ', 15);

     dessinerCadreXY(38,3,75,12, simple, white, black);
     texteXY(46,5, '         .---. /)', 15);
     texteXY(46,6, '      .''     `\/)', 15);
     texteXY(46,7, '    /  _   .''`/|', 15);
     texteXY(46,8, ' ,=(  __\ (__/_/==,', 15);
     texteXY(46,9, '`==================`', 15);


     dessinerCadreXY(76,3,113,12, simple, white, black);
     texteXY(85,6, ' :----:     o8Oo./', 15);
     texteXY(85,7, 'C|====| ._o8o8o8Oo_.', 15);
     texteXY(85,8, ' |    |  \========/', 15);
     texteXY(85,9, ' `----''   `------''',15);

     dessinerCadreXY(1,13,37,22, simple, white, black);
     texteXY(5,15, ' .--\--.', 15);
     texteXY(5,16, '/   `   \  #  ', 15);
     texteXY(5,17, '|       |  \ `-._____,-''=/', 15);
     texteXY(5,18, ' \     /    `._ ----- _,''', 15);
     texteXY(5,19, '  ''-''-''        `-----''', 15);


     dessinerCadreXY(38,13,75,22, simple, white, black);
     texteXY(47,14, '        (', 15);
     texteXY(47,15, '     )    )', 15);
     texteXY(47,16, '  _.(--"("""--.._', 15);
     texteXY(47,17, ' /, _..-----).._,\', 15);
     texteXY(47,18, '|  `''''''-----''''''`  |', 15);
     texteXY(47,19, ' \               /', 15);
     texteXY(47,20, '  ''.           .''', 15);
     texteXY(47,21, '    ''--.....--''', 15);

     dessinerCadreXY(76,13,113,22, simple, white, black);
     texteXY(90,16, '  .-"""-.', 15);
     texteXY(90,17, ' /* * * *\', 15);
     texteXY(90,18, ':_.-:`:-._;', 15);
     texteXY(90,19, '    (_)', 15);
     texteXY(90,20, ' \|/(_)\|/', 15);


     //cadre description des repas
     dessinerCadreXY(60,23,113,27, simple, white, black);

     //button pour faire le retour au village
     dessinerCadreXY(4,24,19,26, simple, white, black);
     texteXY(9,25, 'RETOUR', 15);

     ColorierZoneXY(6 ,black, 2,4,36,11);
     texteXY(62,25,'OEUFS: PERMETTENT D''AVOIR DEFENSE +             ',6);
     texteXY(100,26,'Prix: 50', 10);

end;

//Creation L'option du choix d'un repas
procedure cantineChoix();
var cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #72 :   //Indique la fleche en huat
                  begin
                      if (rep > 3) then
                         rep := rep - 3
                      else
                         rep := 7;
                  end;
              #80 :  //Indique la felche en bas
                   begin
                        if (rep < 4) then
                           rep := rep + 3
                        else if (rep = 7) then
                           rep := 1
                        else
                           rep := 7;
                   end;
              #77 :  //Droite
                   begin
                       if (rep < 7) then
                          rep := rep + 1
                       else
                           rep := 1;
                   end;
              #75 :  //Gauche
                   begin
                       if (rep > 1) then
                          rep := rep - 1
                       else
                           rep := 7;
                   end;
              #13 : cho := False;  //la touche entrer
          end;


          if (rep = 1) then
             begin
               ColorierZoneXY(6 ,black, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,4,75,11);
               ColorierZoneXY(black ,white, 77,4,113,11);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(black ,white, 39,13,75,22);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(black ,white, 5,24,19,26);

               texteXY(62,25,'OEUFS: PERMETTENT D''AVOIR DEFENSE +              ',6);
               texteXY(100,26,'Prix: 50', 10);

             end;
          if (rep = 2) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(6 ,black, 39,4,74,11);
               ColorierZoneXY(black ,white, 77,4,113,11);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(black ,white, 39,13,75,22);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(black ,white, 5,24,19,26);

               texteXY(62,25,'POULET: PERMET D''INCREMENTER L''ATTAQUE DE ++    ',6);
               texteXY(100,26,'Prix: 70', 10);

             end;
          if (rep = 3) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,4,75,11);
               ColorierZoneXY(6 ,black, 77,4,112,11);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(black ,white, 39,13,75,22);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(black ,white, 5,24,19,26);

               texteXY(62,25,'PETIT DEJEURNER: AUGMENTER L''ATTAQUE DE +        ',6);
               texteXY(100,26,'Prix: 80', 10);

             end;
          if (rep = 4) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,4,75,11);
               ColorierZoneXY(black ,white, 77,4,113,11);
               ColorierZoneXY(6 ,black, 2,14,36,21);
               ColorierZoneXY(black ,white, 39,13,75,22);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(black ,white, 5,24,19,26);

               texteXY(62,25,'FRUITS: PERMETTENT DE PERDRE POIDS DE --          ',6);
               texteXY(100,26,'Prix: 65', 10);

             end;
          if (rep = 5) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,4,75,11);
               ColorierZoneXY(black ,white, 77,4,113,11);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(6 ,black, 39,14,74,21);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(black ,white, 5,24,19,26);

               texteXY(62,25,'SOUP: PERMET D''INCREMENTER LA DEFENSE ++        ' ,6);
               texteXY(100,26,'Prix: 82', 10);

             end;
          if (rep = 6) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,4,75,11);
               ColorierZoneXY(black ,white, 77,4,113,11);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(black ,white, 39,14,75,21);
               ColorierZoneXY(6 ,black, 77,14,112,21);
               ColorierZoneXY(black ,white, 5,24,19,26);


               texteXY(62,25,'CHMPIGNON: PERMET DE PERDRE LE POIDS DE -         ',6);
               texteXY(100,26,'Prix: 55',10);

             end;
          if (rep = 7) then
             begin
               ColorierZoneXY(black ,white, 2,4,36,11);
               ColorierZoneXY(black ,white, 39,3,75,12);
               ColorierZoneXY(black ,white, 77,3,113,12);
               ColorierZoneXY(black ,white, 2,13,36,22);
               ColorierZoneXY(black ,white, 39,13,75,22);
               ColorierZoneXY(black ,white, 77,13,113,22);
               ColorierZoneXY(red ,black, 5,25,18,25);

               texteXY(62,25,'                 RETOUR A LA VILLE                ',red);
               texteXY(100,26,'        ', 10);

             end;
      end;

     if (rep = 1) then
        begin
          if ((getOrActuelle() - 50) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 50) ;
             modificationDataJoueur(5,7);
             cantine();
        end
     else if (rep = 2) then
         begin
          if ((getOrActuelle() - 70) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 70) ;
             modificationDataJoueur(15,8);
             cantine();
         end
     else if (rep = 3) then
        begin
          if ((getOrActuelle() - 80) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 80) ; 
             modificationDataJoueur(8,9);
             cantine();
        end
     else if (rep = 4) then
        begin
          if ((getOrActuelle() - 65) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 65) ;
             modificationDataJoueur(10,10);
             cantine();
        end
     else if (rep = 5) then
        begin
          if ((getOrActuelle() - 82) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 82) ;
             modificationDataJoueur(15,11);
             cantine();
        end
     else if (rep = 6) then
       begin
         if ((getOrActuelle() - 55) < 0) then
             messageOrInsuffisant()
          else
             miseAjourOr(getOrActuelle() - 55) ;  
             modificationDataJoueur(5,12);
             cantine();
       end
     else if (rep = 7) then
          choixMenuVillage();
end;

//Cantine Complet
procedure cantine();
begin
   cantineInterface();
   cantineChoix();
end;

//Message que s'affiche si l'or pour acheter un repas est insuffisant
procedure messageOrInsuffisant();
begin
   dessinerCadreXY(20,9,100,16, double, white, black);
   deplacerCurseurXY(50, 12);
   texteAtemps('Achat non reussi!!', 100,15);
   deplacerCurseurXY(40, 13);
   texteAtemps('Malheuresement votre Or est insuffisant', 100,15);
   cantine();
end;

end.

