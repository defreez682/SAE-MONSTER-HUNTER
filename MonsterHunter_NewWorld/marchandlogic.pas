unit marchandLogic;

{$mode objfpc}{$H+}
{$codepage UTF8}

interface

procedure ChoixDiscussions();
procedure choixMarchand();
procedure ChoixAchat();
procedure choixVente();
procedure ChoixSujet1et3();
procedure ChoixSujet2();
procedure ChoixSujet2P2();
procedure ChoixSujet2P3();
procedure CadreArgent;
procedure DemarrageMarchand();

implementation
uses
  SysUtils,MarchandIHM, Personnage, GestionEcran, crtPerso, villageIHM, inventaireLogic;

// ------------------ Permet de faire un choix parmis ce que propose le marchand
procedure ChoixMarchand();
var
    cho : boolean;
    rep : integer = 1;
    ch  : char;

begin
    MarchandDesignIHM();
    cadreArgent();
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
        2 : choixVente();
        3 : discussionIHM();
        4 : ChoixMenuVillage();
    end;

end;

// ----------------------- permet de choisir ce que l'on veut acheter dans achat
procedure choixAchat();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;

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
              #77 :  //Droite
                   begin
                       if (rep <= 3) then
                          rep := rep + 3
                       else
                           rep := (rep-3);
                   end;
              #75 :  //Gauche
                   begin
                       if (rep <= 3) then
                          rep := rep + 3
                       else
                           rep := (rep-3);
                   end;
              #27 : //la touche echap
                   begin
                       ChoixMarchand();
                   end;
              #13 : begin
              cho := False;  //la touche entrer
                     if (rep<=3) then
                        begin
                          recupInventaire(personnage1);
                          if (getOrActuelle(personnage1) < stuffDispo.invBombeDispo[rep].prix) or (isinventaireplein('bombe',personnage1).xA=-1) then
                                  AchatImpossible()
                          else
                            begin
                                MiseajourOr(personnage1,getOrActuelle(personnage1)-stuffDispo.invBombeDispo[rep].prix);
                                cadreArgent();

                                ajoutItemToPersonnage('bombe',rep,personnage1);
                                recupInventaire(personnage1);

                                choixAchat();
                            end;
                        end
                     else
                       begin
                           recupInventaire(personnage1);
                         if (getOrActuelle(personnage1) < stuffDispo.invpotionDispo[rep].prix) or (isinventaireplein('potion',personnage1).xA=-1) then
                               AchatImpossible()
                         else
                           begin
                               MiseajourOr(personnage1,getOrActuelle(personnage1)-stuffDispo.invpotionDispo[rep-3].prix);
                               cadreArgent();

                               ajoutItemToPersonnage('potion',rep-3,personnage1);
                               recupInventaire(personnage1);
                               choixAchat();
                           end;
                      end;

                  end;
          end;
          DessinFlecheAchat(rep);
      end;

end;

procedure choixVente();

var
    cho : boolean;
    rep : integer = 1;
    ch  : char;

begin

     VendreIHM();
     deplacerCurseurXY(4,10);
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
                         rep := 16;
                  end;
              #80 :  //Indique la felche en bas
                   begin
                        if (rep < 16) then
                           rep := rep + 1
                        else
                           rep := 1;
                   end;
              #77 :  //Droite
                   begin
                       if (rep <= 8) then
                          rep := rep + 8
                       else
                           rep := (rep-8);
                   end;
              #75 :  //Gauche
                   begin
                       if (rep <= 8) then
                          rep := rep + 8
                       else
                           rep := (rep-8);
                   end;
              #27 : //la touche echap
                   begin
                       effacerEcran();
                       ChoixMarchand();
                   end;
              #13 : begin
              cho := False;  //la touche entrer

              { if rep="VIDE" then
                 choixVente()
              else if rep>=8 then
                   begin
                      dropEquipement();
                      miseaourOr(personnage1,getOrActuelle(personnage1)+valeurObjetInventaire;
                      cadreArgent();
                   end;
              else


                 }

              {if (rep<=8) then
                  begin
                    dropEquipement(Personnage1,
                  end;}
              end;
              {case rep of
                  1 :
                    begin

                    end;
                  2 :
                    begin

                    end;
                  3 :
                    begin

                    end;
                  4 :
                    begin

                    end;
                  5 :
                    begin

                    end;
                  6 :
                    begin

                    end;
                  7 :
                    begin

                    end;
                  8 :
                    begin

                    end;
                  9 :
                    begin

                    end;
                  10:
                    begin

                    end;
                  11:
                    begin

                    end;
                  12:
                    begin

                    end;
                  13:
                    begin

                    end;
                  14:
                    begin

                    end;
                  15:
                    begin

                    end;
                  16:
                    begin

                    end;

              end;}
          end;

      DessinFlecheVendre(rep);
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

// -------------- permet de revenir au choix de discussion pour le sujet 1 et  2
procedure ChoixSujet1et3();

var
    cho : boolean;
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

// ---------------- permet de passer a la partie 2 de la conversation du sujet 2
procedure ChoixSujet2();

var
    cho : boolean;
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

// ---------------- permet de passer a la partie 3 de la conversation du sujet 2
procedure ChoixSujet2P2();

var
    cho : boolean;
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

// ------------------------------------ permet de revenir au choix de discussion
procedure ChoixSujet2P3();

var
    cho : boolean;
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

// --------------------------------------------------------- affiche cadreArgent
procedure CadreArgent();
begin
    cadreArgentIHM();
end;

// -------------------------------------------------  Afin d'acceder au marchand
procedure DemarrageMarchand();
begin

     effacerEcran();
     cadreArgent();
     choixMarchand();

end;

end.

