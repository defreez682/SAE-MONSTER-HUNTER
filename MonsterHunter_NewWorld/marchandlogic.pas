unit marchandLogic;

{$mode objfpc}{$H+}

interface
procedure ChoixAchat();
procedure ChoixDiscussions();
procedure choixMarchand();
procedure ChoixSujet1et3();
procedure ChoixSujet2();
procedure ChoixSujet2P2();
procedure ChoixSujet2P3();
procedure CadreArgent;
procedure DemarrageMarchand();

implementation
uses
  SysUtils,MarchandIHM, Personnage, GestionEcran, crtPerso, GestionTexte, villageIHM, inventaireLogic;





// ------------------ Permet de faire un choix parmis ce que propose le marchand
procedure ChoixMarchand();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
    MarchandDesignIHM();
    CadreMarchandIHM();
    deplacerCurseurXY(9,24);
    write('>>');

    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 :   //Indique la fleche en haut
                      begin
                          if (rep < 4) then
                             rep := rep + 1
                          else
                             rep := 1;
                      end;
                  #72 :  //Indique la felche en bas
                       begin
                            if (rep > 1) then
                               rep := rep - 1
                            else
                               rep := 4;
                       end;
                  #13 : cho := False;  //la touche entrer
              end;

              dessinFleche(rep);
          end;
    case rep of
        1 : if (getOrActuelle(personnage1)=0) then
                sujetArgentIHM()
            else
                choixAchat();
        2 : vendre();
        3 : discussionIHM();
        4 : ChoixMenuVillage();
    end;
end;

procedure choixAchat();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
    i : integer;
begin
     acheterIHM();
     deplacerCurseurXY(13,23);
     write('>>');
     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #72 :   //Indique la fleche en haut
                  begin
                      if (rep > 1) then
                         rep := rep - 1
                      else
                         rep := 6;
                  end;
              #80 :  //Indique la felche en bas
                   begin
                        if (rep < 6) then
                           rep := rep + 1
                        else
                           rep := 1;
                   end;
              #27 : //la touche echap
                   begin
                       ChoixMarchand();
                   end;
              #13 : cho := False;  //la touche entrer
          end;
          DessinFlecheAchat(rep);

          case rep of
                   1 : begin
                       // alors GetOrActuelle - Valeur objet
                       // ajoute objet dans inventaire
                       MiseajourOr(personnage1,getOrActuelle(personnage1)-stuffDispo.invBombeDispo[1].prix);
                       cadreArgent();
                       ajoutItemToPersonnage(
                       choixAchat();
                       readln;

                       end;
                   2 : begin

                       end;
                   3 : begin

                       end;
                   4 : begin

                       end;
                   5 : begin

                       end;
                   6 : begin

                       end;
          end;


      end;

     end;


// ----------------- permet de faire un choix aux types de discussions possibles
procedure choixDiscussions();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin
    deplacerCurseurXY(9,24);
    write('>>');

    cho := True;
    while (cho= True) do
          begin
              ch := ReadKey;
              case ch of
                  #80 :   //Indique la fleche en haut
                      begin
                          if (rep < 4) then
                             rep := rep + 1
                          else
                             rep := 1;
                      end;
                  #72 :  //Indique la felche en bas
                       begin
                            if (rep > 1) then
                               rep := rep - 1
                            else
                               rep := 4;
                       end;
                  #13 : cho := False;  //la touche entrer
              end;

              dessinFleche(rep);

          end;
    case rep of
        1 : sujet1IHM();
        2 : sujet2IHM();
        3 : sujet3IHM();
        4 : ChoixMarchand();
    end;
end;

procedure ChoixSujet1et3();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
    i : integer;
begin

     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #13 : begin  //la touche entrer
              cho := True;
              DiscussionIHM();
              end;
              end;
          end;
      end;

procedure ChoixSujet2();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin

     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #13 : begin  //la touche entrer
              cho := True;
              Sujet2partie2IHM();
              end;
              end;
          end;
      end;

procedure ChoixSujet2P2();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin

     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #13 : begin  //la touche entrer
              cho := True;
              Sujet2partie3IHM();
              end;
              end;
          end;
      end;

procedure ChoixSujet2P3();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;
begin

     cho := True;
     while (cho= True) do
      begin
          ch := ReadKey;
          case ch of
              #13 : begin  //la touche entrer
              cho := True;
              DiscussionIHM();
              end;
              end;
          end;
      end;

procedure CadreArgent();
begin
    cadreArgentIHM();
end;

procedure DemarrageMarchand();
begin

     effacerEcran();
     cadreArgent();
     choixMarchand();

end;


end.

