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

implementation
uses
   SysUtils, GestionEcran, gestionTexte, crtPerso, marchandLogic, Personnage;

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
  texteAtemps('1 : Acheter',10,15);
  deplacerCurseurXY(9,25);
  texteAtemps('2 : Vendre',10,15);
  deplacerCurseurXY(9,26);
  texteAtemps('3 : Discussion',10,15);
  deplacerCurseurXY(9,27);
  texteAtemps('4 : Quitter',10,15);
  deplacerCurseurXY(106,27);

end;

// ----------------------- Permet d'acheter des items/objets auprès du marchands
procedure acheterIHM();
begin

     viderCadreMarchand();
     deplacerCurseurXY(6,21);
     couleurtexte(4);
     writeln('Marc, le marchand'); // write(random(item))
     couleurtexte(15);
     deplacerCurseurXY(7,22);
     writeln('Foudre Hurlante : 110 po');
     deplacerCurseurXY(7,23);
     writeln('Potion : 66 po');
     deplacerCurseurXY(7,24);
     writeln('bombe barile : 13O po');
     deplacerCurseurXY(7,24);
     writeln('super bombe barile : 200 po');
     deplacerCurseurXY(6,27);
     writeln('1 : Retour');
     deplacerCurseurXY(106,27);

end;

// affiche l'inventaire avec une option vendre en +
procedure vendre();

begin

     //inventaire pour vendre
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
    deplacerCurseurXY(7,23);
    texteAtemps('1 : Il fait beau aujourd''hui, n''est-ce pas ?',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('2 : Parlez-moi de la ville',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('3 : Auriez-vous des informations qui pourrait m''etre utile ?',10,15);
    deplacerCurseurXY(7,26);
    texteAtemps('4 : Non rien, ca ira',10,15);
    deplacerCurseurXY(106,27);

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
    texteAtemps('1 : Retour',10,3);
    deplacerCurseurXY(106,27);

end;

procedure Sujet2IHM(); // réponse à la demande "Parlez-moi de cette ville" - Partie 1
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
    texteAtemps('1 : Retour  2 : Suivant',10,3);
    deplacerCurseurXY(106,27);

end;

procedure Sujet2partie2IHM(); //réponse à la demande "Parlez-moi de cette ville" partie 2
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
    texteAtemps('1 : Retour  2 : Suivant',10,3);
    deplacerCurseurXY(106,27);

end;

procedure Sujet2partie3IHM(); //réponse à la demande "Parlez-moi de cette ville" partie 3
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
    texteAtemps('1 : Retour  2 : Quitter',10,3);
    deplacerCurseurXY(106,27);

end;

procedure Sujet3IHM(); // Réponse à la question : "Auriez-vous des informations utiles ?"
begin
    viderCadreMarchand();
    deplacerCurseurXY(6,21);
    couleurtexte(4);
    writeln('Marc, le marchand');
    couleurtexte(15);
    deplacerCurseurXY(7,22);
    texteAtemps('Vous pouvez acheter des items chez moi, je change regulierement ce que je propose donc n''hesitez pas a ',10,15);
    deplacerCurseurXY(7,23);
    texteAtemps('revenir apres une chasse. Si vous avez des choses à vendre, c''est avec plaisir que je pourrais les acheter ',10,15);
    deplacerCurseurXY(7,24);
    texteAtemps('si cela m''interesse Vous pouvez aussi vous reposer dans une chambre ou bien acheter de quoi vous retablir',10,15);
    deplacerCurseurXY(7,25);
    texteAtemps('dans la cantine Si vous avez de quoi, le forgeron pourra aussi vous fabriquer des choses tant que vous avez ',10,15);
    deplacerCurseurXY(7,26);
    texteAtemps('les resources necessaire',10,15);

    deplacerCurseurXY(6,27);
    texteAtemps('1 : Retour',10,3);

    deplacerCurseurXY(106,27);
end;

procedure SujetArgentIHM(); //Réponse du marchand si vous avez "0" d'or
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

procedure viderCadreMarchand();
var
  i : integer;

begin

     for i := 21 to 27 do
         texteXY(6,i,'                                                                                                             ',White);

end;


// Affiche le cadre où l'argent sera affiché
procedure CadreArgentIHM();

begin

  dessinerCadreXY(90,0,115,2,simple,15,0);
  deplacerCurseurXY(97,1);
  write(getOrActuelle(), ' piece d''or');

end;

end.

