unit marchandLogic;

{$mode objfpc}{$H+}

interface

uses
  SysUtils,MarchandIHM, Personnage, GestionEcran,villageIHM;

procedure Marchand();
procedure CadreMarchand();
procedure Acheter();
procedure CadreArgent();
procedure Discussion();
procedure Sujet1();
procedure Sujet2();
procedure Sujet2partie2();
procedure Sujet2partie3();
procedure Sujet3();
procedure DemarrageMarchand();

implementation
procedure Marchand();

begin
  MarchandDesignIHM
end;

procedure CadreMarchand(); // Affiche le cadre du marchandIHM avec les discussions

var
c : integer;

begin
  CadreMarchandIHM();
  c:=0;
  while (c<>1) and (c<>2) and (c<>3) and (c<>4) do
  begin
  readln(c);
  deplacerCurseurXY(106,27);
  case c of // permet de faire choisir au joueur ce qu'il désire faire
  1 : begin        // Acheter
        if (getOrActuelle(personnage1)=0) then sujetArgentIHM() else
          acheter();
      end;
  2 : begin
        vendre(); // Vendre
      end;
  3 : begin
        discussion();  // Discuter avec le marchand
      end;
  4 : begin
        choixMenuVillage();   // Quitter et revenir aux choix des villes
      end;

  end;

  end;

end;


// --------------------------------------- Achat item (à changer quand y'aura les items)
procedure Acheter();

var
   c : integer;

begin
  acheterIHM();
  readln(c);
  begin

  while (c<>1) do
  begin
  readln(c);
  deplacerCurseurXY(110,27);
  end;

  CadreMarchand();
  end;
  readln;

end;

// ---------------------------------------- Affiche le cadre argent avec l'argent possédé
procedure CadreArgent();

begin
  CadreArgentIHM();
end;

// ---------------------------------------- Permet de discutter avec le vendeur
procedure Discussion();

var
   c : integer;

begin
  DiscussionIHM();
  c:=0;
  while (c<>1) and (c<>2) and (c<>3) and (c<>4) do
  begin
  readln(c);
  deplacerCurseurXY(106,27);
  case c of                 // permet au joueur de choisir de quoi il veut discuter
  1 : begin        // Beau temps
        Sujet1();
      end;
  2 : begin
        Sujet2(); // Village
      end;
  3 : begin
        Sujet3();  // Discuter avec le marchand
      end;
  4 : begin
        CadreMarchand(); //Revenir en arrière
      end;

  end;

end;

end;

// ---------------------------- Sujet 1 de la discussion
procedure Sujet1();

var
   c : integer;

begin
  Sujet1IHM();
  c:=0;
  while (c<>1) do
  begin
       readln(c);
       deplacerCurseurXY(106,27);
  end;

  Discussion();

end;

// ---------------------------- Sujet 2 discussion sur le lore du village
procedure Sujet2();

var
   c : integer;

begin
  Sujet2IHM();
  c:=0;

while (c<>1) and (c<>2) do
begin
  readln(c);
  deplacerCurseurXY(106,27);
  case c of
  1 : begin
        Discussion(); // Retour en arrière
      end;
  2 : begin
        Sujet2partie2(); // Suite du sujet 2
        end;
  end;

end;
end;

procedure Sujet2partie2(); // Sujet 2-2 discussion sur information de la ville

Var
   c : integer;

begin
Sujet2partie2IHM();
c:=0;

while (c<>1) and (c<>2) do
begin
     readln(c);
     deplacerCurseurXY(106,27);
     case c of
     1 : begin
           Sujet2(); // retour en arrière
         end;
     2 : begin
           Sujet2partie3(); // suite du sujet 2
         end;
     end;
end;

end;

procedure Sujet2partie3(); // Sujet 2-3 discussion sur les informations de la ville
var
   c : integer;
begin
  Sujet2partie3IHM();
  c:=0;
begin
  readln(c);
  deplacerCurseurXY(106,27);
  case c of
  1 : begin
        Sujet2partie2(); // retour en arrière
      end;
  2 : begin
        Discussion(); // retour sur l'écran des choix de discussion
      end;
  end;
end;

end;

// ---------------------------- Sujet 3 discussion sur les informations utiles
procedure Sujet3();

var
   c : integer;

begin
  Sujet3IHM();
  c:=0;
  while (c<>1) do
  begin
       readln(c);
       deplacerCurseurXY(110,27);
  end;

  Discussion();

end;

// ------------------------------------------------------- Démarage du programme marchand
procedure DemarrageMarchand();
begin

     effacerEcran();
     CadreArgent();
     Marchand();
     CadreMarchand();

end;

end.

