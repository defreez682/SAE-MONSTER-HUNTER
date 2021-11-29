unit marchandIHM;

{$mode objfpc}{$H+}

interface



procedure MarchandDesignIHM();
procedure CadreMarchandIHM();
procedure acheterIHM();
procedure vendre();
procedure discussionIHM();
procedure Sujet1IHM();
procedure Sujet2IHM();
procedure Sujet2partie2IHM();
procedure Sujet2partie3IHM();
procedure Sujet3IHM();
procedure CadreArgentIHM();
procedure SujetArgentIHM();
procedure viderCadreMarchand();
procedure DessinFleche(rep : integer);
procedure DessinFlecheAchat(rep : integer);
procedure AchatImpossible();

implementation

uses
   SysUtils, GestionEcran, gestionTexte, crtPerso, marchandLogic, Personnage, VillageIHM, inventaireLogic;

// -------------- Design du marchand ainsi que ce qui se trouve dans la boutique
procedure MarchandDesignIHM();

begin
  // Apparence du marchand
  deplacerCurseurXY(55,7);
  writeln(',#####,');
  deplacerCurseurXY(55,8);
  writeln('#_   _#');
  deplacerCurseurXY(55,9);
  writeln('|a` `a|');
  deplacerCurseurXY(55,10);
  writeln('|  u  |');
  deplacerCurseurXY(55,11);
  writeln('\  =  /');
  deplacerCurseurXY(55,12);
  writeln('|\___/|');
  deplacerCurseurXY(45,13);
  writeln(' ___ ____/:     :\____ ___');
  deplacerCurseurXY(44,14);
  writeln('."   `.-===-\   /-===-.`   ".');
  deplacerCurseurXY(43,15);
  writeln('/      .-"""""-.-"""""-.      \');
  deplacerCurseurXY(50,25);

end;

// --------------------------- Affiche cadre du marchand avec dialogues et choix
procedure CadreMarchandIHM();

begin

  dessinercadreXY(5,20,115,28,simple,15,0);
  deplacerCurseurXY(6,21);
  couleurtexte(4);
  writeln('Marc, le marchand');
  deplacerCurseurXY(6,22);
  texteAtemps('Bienvenue chez Marc repere jeune aventurier ! J''ai tout ce dont vous pouvez rever !',10,15);
  deplacerCurseurXY(6,23);
  texteAtemps('Desirez-vous quelque chose en particulier ?',10,15);
  deplacerCurseurXY(9,24);
  texteAtemps('    Acheter',10,15);
  deplacerCurseurXY(9,25);
  texteAtemps('    Vendre',10,15);
  deplacerCurseurXY(9,26);
  texteAtemps('    Discussion',10,15);
  deplacerCurseurXY(9,27);
  texteAtemps('    Quitter',10,15);
  deplacerCurseurXY(106,27);


end;

// ----------------------------------- Affiche le cadre où l'argent sera affiché
procedure CadreArgentIHM();

begin

  dessinerCadreXY(90,0,115,2,simple,15,0);
  deplacerCurseurXY(97,1);
  write(getOrActuelle(personnage1), ' piece d''or');

end;

// ----------------------- Permet d'acheter des items/objets auprès du marchands
procedure acheterIHM();

var
  i,y : integer;

begin

     viderCadreMarchand();
     deplacerCurseurXY(6,21);
     couleurtexte(4);
     writeln('Marc, le marchand');
     texteXY(15,22,'BOMBES',3);
     couleurtexte(15);
     y:=23;
     deplacerCurseurXY(15,y);
     for i:=1 to 3 do
         begin
              writeln(stuffDispo.invBombeDispo[i].nomBombe, ' | prix : ',stuffDispo.invBombeDispo[i].prix);
              y:=(y+1);
              deplacerCurseurXY(15,y);
         end;

     texteXY(65,22,'POTIONS',3);
     couleurtexte(15);
     y:=23;
     deplacerCurseurXY(65,y);
     for i:=1 to 3 do
         begin
              writeln(stuffDispo.invPotionDispo[i].nomPotion, ' | prix : ',stuffDispo.invPotionDispo[i].prix);
              y:=(y+1);
              deplacerCurseurXY(65,y);
         end;

     texteXY(6,27,'Appuyer sur echap pour revenir en arriere',7);
     deplacerCurseurXY(106,27);

end;

// affiche l'inventaire avec une option vente - Potions, Loots, Bombes --------------------------------------------- A FAIRE
procedure vendre();

var
  x : integer;
  j : integer;
  i : integer;

begin
     dessinercadreXY(3,2,115,4,double,15,0);
     texteXY(45,3,'INVENTAIRE CONSOMMABLE ET DROP',15);
     dessinercadreXY(3,7,115,28,simple,15,0);

     couleurtexte(15);
     x:=8;
     deplacerCurseurXY(4,x);
     for i:= 0 to 3 do
         begin
              for j:=0 to 3 do
                  begin
                       texteXY(76,x,personnage1.inventaire.invDrop[i][j].nomDrop,15);
                       //write(personnage1.inventaire.invArme[i][j].nomArme);
                       x:=(x+1);
                       deplacerCurseurXY(76,x);
                  end;
         end;
     readln;
     // if item=vendu alors ValeurOr va dans OrJoueur

end;

// ----------------------------------------- Permet de discuter avec le marchand
procedure discussionIHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('De quoi voulez-vous parler ?',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('    Il fait beau aujourd''hui, n''est-ce pas ?',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('    Parlez-moi de la ville',10,15);
    deplacerCurseurXY(7,26);
    texteAtemps('    Auriez-vous des informations qui pourrait m''etre utile ?',10,15);
    deplacerCurseurXY(7,27);
    texteAtemps('    Non rien, ca ira',10,15);
    deplacerCurseurXY(106,27);
    choixDiscussions();

end;

// réponse à la question "il fait beau aujourd'hui, n'est-ce pas ?"
procedure Sujet1IHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Maintenant que vous me le dite, c''est lorsqu''on regarde dehors que l''on se rend compte que le temps est ',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('parfait pour une chasse. J''ai meme parfaitement ce qu''il vous faut pour une bonne chasse',10,15);
    deplacerCurseurXY(6,27);
    texteAtemps('Appuyer sur entrer pour continuer',10,7);
    deplacerCurseurXY(106,27);
    ChoixSujet1et3();

end;

// réponse à la demande "Parlez-moi de cette ville" - Partie 1
procedure Sujet2IHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Alors vous-voulez en savoir plus sur cette ville hein ? tres bien ...',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('Cette ville est nee dans le chaos et la destruction, il a deja plus de 50 ans deja... ',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('Laissez-moi vous conter l''histoire de notre ville ',10,15);
    deplacerCurseurXY(55,11);
    writeln('\  O  /');
    deplacerCurseurXY(57,24);
    texteAtemps('Permanium',30,4);
    couleurtexte(15);
    deplacerCurseurXY(55,11);
    writeln('\  =  /');
    deplacerCurseurXY(66,24);
    texteAtemps('. Alors qu''elle etait proie au desastre de la ',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('grande guerre les cadavres jonchaient le sol, la misere etait dans toutes les rues.',10,15);
    deplacerCurseurXY(55,11);
    writeln('\  O  /');
    deplacerCurseurXY(7,26);
    texteAtemps('Alors que l''on pensait que cette situation allait etre permanente, quelque chose de grandiose s''est produit.',10,15);
    deplacerCurseurXY(55,11);
    writeln('\  =  /');
    deplacerCurseurXY(7,27);
    texteAtemps('Appuyer sur entrer pour continuer',10,7);
    deplacerCurseurXY(106,27);
    ChoixSujet2();

end;

//réponse à la demande "Parlez-moi de cette ville" partie 2
procedure Sujet2partie2IHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Alors que tout semblait perdu, un homme fit surface et fit l''impensable. Grace a son charisme et sa nature ',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('de leader, il arriva a reunir tout le monde et c''est tous ensemble que le debut de la lutte commenca.',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('Une lutte pour la survie de chacun, pour le present et pour le futur. ',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('C''est apres quelques annees que la guerre a ete stoppe, personne ne pensait pouvoir revivre une vie "normal"',10,15);
    deplacerCurseurXY(7,26);
    texteAtemps('j''espere que cette histoire vous aura inspire',10,15);
    deplacerCurseurXY(7,27);
    texteAtemps('Appuyer sur entrer pour continuer',10,7);
    deplacerCurseurXY(106,27);
    choixSujet2P2();

end;

//réponse à la demande "Parlez-moi de cette ville" partie 3
procedure Sujet2partie3IHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Mais finalement si. Les personnes qui se sont battu ont batti cette ville comme symbole pour la resistance.',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('C''est grace a l''union que nous avons pu faire la force, que cette ville est nee, elle represente beaucoup',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('Retenez le bien, c''est dans les moments les plus durs que naissent les meilleures choses...',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('Mais vous-y trouverez de tout dans cette ville, Forgeron, Cantine, Chambre ',10,15);
    deplacerCurseurXY(7,27);
    texteAtemps('Appuyer sur entrer pour continuer',10,7);
    deplacerCurseurXY(106,27);
    choixSujet2P3();

end;

// Réponse à la question : "Auriez-vous des informations utiles ?"
procedure Sujet3IHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Vous pouvez acheter des items chez moi, n''hesitez pas a revenir apres chaque chasse ',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('Si vous avez des choses à vendre, c''est avec plaisir que je pourrais les acheter ',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('si cela m''interesse Vous pouvez aussi vous reposer dans une chambre ou bien acheter de quoi vous retablir',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('dans la cantine Si vous avez de quoi, le forgeron pourra aussi vous fabriquer des choses tant que vous avez ',10,15);
    deplacerCurseurXY(7,26);
    texteAtemps('les resources necessaire',10,15);
    deplacerCurseurXY(7,27);
    texteAtemps('Appuyer sur entrer pour continuer',10,7);
    deplacerCurseurXY(106,27);
    ChoixSujet1et3();
    deplacerCurseurXY(106,27);

end;

// --------------------------- Réponse du marchand si l'utilisateur n'a pas d'or
procedure SujetArgentIHM();
begin

    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(6,22);
    texteAtemps('Vous n''avez pas d''argent, revenez une prochaine fois...',40,15);
    effacerEcran();
    DemarrageMarchand();

end;

// Reponse du marchand si pas assez d'or ou de place dans inventaire lors de l'achat
procedure AchatImpossible();
begin

    viderCadreMarchand();
    if (isinventaireplein('bombe',personnage1).xA=-1) then
       texteXY(40,24,'Vous n''avez plus de place dans votre inventaire',4)
    else
    texteXY(50,24,'Vous n''avez pas assez d''or',4);
    readln;
    choixAchat();

end;

// ----------------------------------- Vide ce qui se trouve dans cadre marchand
procedure viderCadreMarchand();
var
  i : integer;

begin

     for i := 21 to 27 do
         texteXY(6,i,'                                                                                                             ',White);

end;

// --------------------------------------------------------- affiche les flèches
procedure DessinFleche(rep : integer);
begin

              if (rep = 1) then
                 begin
                     texteXY(9,24,'>>',White);
                     texteXY(9,25,'  ',White);
                     texteXY(9,26,'  ',White);
                     texteXY(9,27,'  ',White);
                     deplacerCurseurXY(8,24);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(9,24,'  ',White);
                     texteXY(9,25,'>>',White);
                     texteXY(9,26,'  ',White);
                     texteXY(9,27,'  ',White);
                     deplacerCurseurXY(8,25);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(9,24,'  ',White);
                     texteXY(9,25,'  ',White);
                     texteXY(9,26,'>>',White);
                     texteXY(9,27,'  ',White);
                     deplacerCurseurXY(8,26);
                 end;
              if (rep=4) then
                 begin
                     texteXY(9,24,'  ',White);
                     texteXY(9,25,'  ',White);
                     texteXY(9,26,'  ',White);
                     texteXY(9,27,'>>',White);
                     deplacerCurseurXY(8,27);
                 end;

end;

// ------------------------------- affiche les flèches pour les choix dans achat
procedure DessinFlecheAchat(rep : integer);
begin

             if (rep = 1) then
                 begin
                     texteXY(63,25,'  ',White);
                     texteXY(13,23,'>>',White);
                     texteXY(13,24,'  ',White);
                     texteXY(13,25,'  ',White);
                     deplacerCurseurXY(13,23);
                 end;
              if (rep = 2) then
                 begin
                     texteXY(13,23,'  ',White);
                     texteXY(13,24,'>>',White);
                     texteXY(13,25,'  ',White);
                     deplacerCurseurXY(13,24);
                 end;
              if (rep = 3) then
                 begin
                     texteXY(13,23,'  ',White);
                     texteXY(13,24,'  ',White);
                     texteXY(13,25,'>>',White);
                     deplacerCurseurXY(13,25);
                 end;
              if (rep=4) then
                 begin
                     texteXY(13,25,'  ',White);
                     texteXY(63,23,'>>',White);
                     texteXY(63,24,'  ',White);
                     texteXY(63,25,'  ',White);
                     deplacerCurseurXY(63,23);
                 end;
              if (rep=5) then
                 begin
                     texteXY(63,23,'  ',White);
                     texteXY(63,24,'>>',White);
                     texteXY(63,25,'  ',White);
                     deplacerCurseurXY(63,24);
                 end;

              if (rep=6) then
                 begin
                     texteXY(63,23,'  ',White);
                     texteXY(63,24,'  ',White);
                     texteXY(63,25,'>>',White);
                     deplacerCurseurXY(63,25);
                 end;

end;

end.

