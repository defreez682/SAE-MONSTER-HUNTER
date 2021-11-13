unit personageIHM;

{$mode objfpc}{$H+}

interface

procedure choixONInterface();
procedure choixONInterface2();
procedure creationInterfaceDialogue();
procedure creationInterfaceFormulaire();
procedure CreationInterfaceResume(Vitesse : boolean);
procedure interfaceSaisieNom();
procedure interfaceSaisieSexe();
procedure interfaceSaisieTaille();
procedure creationPersonnage();
procedure saisieNom();
procedure saisieSexe();
procedure saisieTaille();
procedure resume();


implementation

uses
  Classes, SysUtils,Personnage,GestionEcran, gestionTexte, crtperso;



procedure choixONInterface();
begin
     creationInterfaceFormulaire;
     dessinerCadreXY(20,16,30,20,simple,White,Black);
     dessinerCadreXY(40,16,50,20,simple,White,Black);
end;

procedure choixONInterface2();
begin;
     creationInterfaceResume(False);
     dessinerCadreXY(90,10,100,14,simple,White,Black);
     dessinerCadreXY(90,16,100,20,simple,White,Black);
end;


procedure creationInterfaceDialogue();
begin
     effacerEcran();
     dessinerCadreXY(20,10,100,20,simple,White,Black);
     deplacerCurseurXY(21,11);
     write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
     deplacerCurseurXY(31,12);
     write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
     deplacerCurseurXY(31,18);
     write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
     deplacerCurseurXY(21,19);
     write('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
end;

procedure creationInterfaceFormulaire();
begin
     effacerEcran();
     dessinerCadreXY(80,5,100,20,double,DarkGray,White);
     dessinerCadreXY(10,2,60,25,double,White,Black);
end;

procedure creationInterfaceResume(Vitesse : Boolean);
var T10,T20,T5,T30,T100 : Integer;
begin
    if (Vitesse = True) then
       begin
            T10 := 10;
            T20 := 20;
            T5 := 5;
            T30 := 30;
            T100 := 100;
       end
    else
        begin
            T10 := 0;
            T20 := 0;
            T5 := 0;
            T30 := 0;
            T100 := 0;
        end;
    effacerEcran();
    dessinerCadreXY(40,3,80,30,double,White,Black);
    deplacerCurseurXY(41,5);
    texteAtemps('Nom : ',T20,White);
    texteAtemps(getNomActuelle(),T20,White);
    deplacerCurseurXY(41,7);
    texteAtemps('Sexe : ',T20,White);
    texteAtemps(getSexeActuelle(),T20,White);
    deplacerCurseurXY(41,9);
    texteAtemps('Taille : ',T20,White);
    texteAtemps(IntToStr(getTailleActuelle()),T20,White);
    texteAtemps(' cm',T20,White);
    deplacerCurseurXY(41,10);
    texteAtemps('_______________________________________',T5,White);
    deplacerCurseurXY(41,12);
    texteAtemps('Niveau : ',T20,White);
    texteAtemps(IntToStr(getLvlActuelle()),T20,White);
    deplacerCurseurXY(41,13);
    texteAtemps('Experience necessaire avant niveau',T10,White);
    deplacerCurseurXY(41,14);
    texteAtemps('suivant : ',T10,White);
    texteAtemps(IntToStr(calculLvlSuivant()),T10,White);
    deplacerCurseurXY(41,15);
    texteAtemps('_______________________________________',T5,White);
    deplacerCurseurXY(41,17);
    texteAtemps('Argent : ',T20,White);
    texteAtemps(IntToStr(getOrActuelle()),T20,White);
    deplacerCurseurXY(41,18);
    texteAtemps('_______________________________________',T5,White);
    deplacerCurseurXY(41,20);
    texteAtemps('Equipement : ',T20,White);
    deplacerCurseurXY(41,21);
    texteAtemps('- Epee Basique',T10,White);
    deplacerCurseurXY(41,22);
    texteAtemps('- Casque de chasseur simple',T10,White);
    deplacerCurseurXY(41,23);
    texteAtemps('- Plastron de chasseur simple',T10,White);
    deplacerCurseurXY(41,24);
    texteAtemps('- Gants de chasseur simple',T10,White);
    deplacerCurseurXY(41,25);
    texteAtemps('- Taille de chasseur simple',T10,White);
    deplacerCurseurXY(41,26);
    texteAtemps('- Jambiere de chasseur simple',T10,White);
    deplacerCurseurXY(41,27);
    texteAtemps('- 3 Potions simples',T10,White);
    deplacerCurseurXY(60-9,1);
    texteAtemps('Cela vous convient ?',T30,White);
    deplacerCurseurXY(60-21,2);
    texteAtemps('(Une fois accepte, plus de retour arriere)',T100,Red);

end;



procedure interfaceSaisieNom();
begin
     deplacerCurseurXY(15,4);
     write('Ecrivez votre nom : (20 lettres MAX)');
     deplacerCurseurXY(15,6);
     write(getNomActuelle());
     deplacerCurseurXY(15,8);
     write('Votre nom est "');
     texteEnCouleur(getNomActuelle(),Red);
     texteEnCouleur('"',White);
     deplacerCurseurXY(15,9);
     write('Correcte?');
end;

procedure interfaceSaisieSexe();
begin
     deplacerCurseurXY(15,4);
     write('Quel est votre sexe, ');
     texteEnCouleur(getNomActuelle(),Red);
     texteEnCouleur('?',White);
     deplacerCurseurXY(15,5);
     write('(30 Lettres MAX)');
     deplacerCurseurXY(15,7);
     write(getSexeActuelle());
     deplacerCurseurXY(15,9);
     write('Votre sexe est "');
     texteEnCouleur(getSexeActuelle(),Yellow);
     texteEnCouleur('"',White);
     deplacerCurseurXY(15,10);
     write('Correcte?');
     deplacerCurseurXY(81,6);
     couleurTexte(Black);
     write(getNomActuelle());
end;

procedure interfaceSaisieTaille();
begin
     deplacerCurseurXY(15,4);
     write('Quel est votre taille (cm), ');
     texteEnCouleur(getNomActuelle(),Red);
     texteEnCouleur('?',White);
     deplacerCurseurXY(15,5);
     write('(au moins 100cm et pas plus de 290cm)');
     deplacerCurseurXY(15,9);
     write('Votre taille est de ');
     texteEnCouleur(IntToStr(getTailleActuelle()),LightMagenta);
     texteEnCouleur(' cm',White);
     deplacerCurseurXY(15,10);
     write('Correcte?');
     deplacerCurseurXY(81,6);
     couleurTexte(Black);
     write(getNomActuelle());
     deplacerCurseurXY(81,8);
     couleurTexte(Black);
     write(getSexeActuelle());
end;

procedure saisieNom();
var nomsaisie : string;
    rep : integer = 1;
    ch : Char;
    correcte: boolean = False;
    cho : boolean = False;

begin
     while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(15,4);
               texteAtemps('Ecrivez votre nom : (20 lettres MAX)',25,White);
               deplacerCurseurXY(15,6);
               readln(nomsaisie);
               if not (nomsaisie = '') then
                  begin
                      if (Length(nomsaisie) < 20) then
                      begin
                           miseAjourNom(nomsaisie);
                           deplacerCurseurXY(15,8);
                           texteAtemps('Votre nom est "',25,White);
                           texteAtemps(getNomActuelle(),50,Red);
                           texteAtemps('"',25,White);
                           deplacerCurseurXY(15,9);
                           texteAtemps('Correcte?',40,White);
                           cho := True;
                           choixONInterface();
                           interfaceSaisieNom();
                           deplacerCurseurXY(24,18);
                           texteEnCouleur('Oui',Red);
                           deplacerCurseurXY(44,18);
                           texteEnCouleur('Non',White);
                           deplacerCurseurXY(27,18);
                           while (cho = True) do
                                 begin
                                     ch := ReadKey;
                                     case ch of
                                          #75 : if (rep < 2) then
                                                   rep := rep + 1
                                                else
                                                   rep := 1;
                                          #77 : if (rep > 1) then
                                                   rep := rep - 1
                                                else
                                                   rep := 2;
                                          #13 : cho := False;
                                     end;



                                     if (rep = 1) then
                                        begin
                                            choixONInterface();
                                            interfaceSaisieNom();
                                            deplacerCurseurXY(24,18);
                                            texteEnCouleur('Oui',Red);
                                            deplacerCurseurXY(44,18);
                                            texteEnCouleur('Non',White);
                                            deplacerCurseurXY(27,18);
                                        end
                                     else
                                         begin
                                            choixONInterface();
                                            interfaceSaisieNom();
                                            deplacerCurseurXY(24,18);
                                            texteEnCouleur('Oui',White);
                                            deplacerCurseurXY(44,18);
                                            texteEnCouleur('Non',Red);
                                         end;
                                 end;
                           if (rep = 1) then
                              correcte := True
                           else
                              rep := 1;

                      end
                      else;
                  end;
           end;
     saisieSexe()
end;

procedure saisieSexe();
var sexesaisie : string;
    rep : integer = 1;
    ch : Char;
    correcte: boolean = False;
    cho : boolean = False;
begin
     while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(81,6);
               couleurTexte(Black);
               write(getNomActuelle());
               deplacerCurseurXY(15,4);
               texteAtemps('Quel est votre sexe, ',25,White);
               texteAtemps(getNomActuelle(),25,Red);
               texteAtemps('?',25,White);
               deplacerCurseurXY(15,5);
               texteAtemps('(30 Lettres MAX)',25,White);
               deplacerCurseurXY(15,7);
               readln(sexesaisie);
               if not (sexesaisie = '') then
                  begin
                      if (Length(sexesaisie) < 30) then
                      begin
                           miseAjourSexe(sexesaisie);
                           deplacerCurseurXY(15,9);
                           texteAtemps('Votre sexe est "',25,White);
                           texteAtemps(getSexeActuelle(),50,Yellow);
                           texteAtemps('"',25,White);
                           deplacerCurseurXY(15,10);
                           texteAtemps('Correcte?',40,White);
                           cho := True;
                           choixONInterface();
                           interfaceSaisieSexe();
                           deplacerCurseurXY(24,18);
                           texteEnCouleur('Oui',Red);
                           deplacerCurseurXY(44,18);
                           texteEnCouleur('Non',White);
                           deplacerCurseurXY(27,18);
                           while (cho= True) do
                                 begin
                                      ch := ReadKey;
                                      case ch of
                                           #75 : if (rep < 2) then
                                                    rep := rep + 1
                                                 else
                                                    rep := 1;
                                           #77 : if (rep > 1) then
                                                    rep := rep - 1
                                                 else
                                                    rep := 2;
                                          #13 : cho := False;
                                      end;



                                      if (rep = 1) then
                                              begin
                                                   choixONInterface();
                                                   interfaceSaisieSexe();
                                                   deplacerCurseurXY(24,18);
                                                   texteEnCouleur('Oui',Red);
                                                   deplacerCurseurXY(44,18);
                                                   texteEnCouleur('Non',White);
                                                   deplacerCurseurXY(27,18);
                                              end
                                              else
                                                  begin
                                                       choixONInterface();
                                                       interfaceSaisieSexe();
                                                       deplacerCurseurXY(24,18);
                                                       texteEnCouleur('Oui',White);
                                                       deplacerCurseurXY(44,18);
                                                       texteEnCouleur('Non',Red);
                                                  end;
                                 end;
                                 if (rep = 1) then
                                    begin
                                         case sexesaisie of 'homme','Homme','Femme','femme','Garçon','garçon','garcon','Garcon' :
                                              begin
                                                  correcte := True;
                                              end
                                              else
                                                  begin
                                                       creationInterfaceFormulaire();
                                                       interfaceSaisieSexe();
                                                       deplacerCurseurXY(15,11);
                                                       texteAtemps(getSexeActuelle,30,Yellow);
                                                       texteAtemps('... ',700,Yellow);
                                                       deplacerCurseurXY(15,12);
                                                       texteAtemps('Je ne connaissais pas ce sexe...',15,White);
                                                       deplacerCurseurXY(15,13);
                                                       texteAtemps('Mais passons.',30,White);
                                                       ReadKey();
                                                       correcte := True;
                                                  end;
                                         end;
                                    end
                                    else
                                        rep := 1;
                      end
                      else;
                  end;
           end;
     saisieTaille();
end;


procedure saisieTaille();

var taillesaisie : integer = 100;
    rep : integer = 1;
    ch : Char;
    correcte: boolean = False;
    cho : boolean = False;
    choixtaille : boolean = False;
    barx : integer = 15;
begin
          while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(81,6);
               couleurTexte(Black);
               write(getNomActuelle());
               deplacerCurseurXY(81,8);
               couleurTexte(Black);
               write(getSexeActuelle());
               deplacerCurseurXY(15,4);
               texteAtemps('Quel est votre taille (cm), ',25,White);
               texteAtemps(getNomActuelle(),25,Red);
               texteAtemps('?',25,White);
               deplacerCurseurXY(15,5);
               texteAtemps('(au moins 100cm et pas plus de 290cm)',10,White);
               choixtaille := True;
               texteXY(33,6,IntToStr(taillesaisie),LightMagenta);
               texteXY(15,7,'[-------------------------------------]',White);
               texteXY(barx,7,'|',Red);
               while (choixtaille = True) do
                     begin
                        ch := ReadKey;
                        case ch of
                             #75 : if (taillesaisie > 100) then
                                       begin
                                           taillesaisie := taillesaisie - 1;
                                           if (taillesaisie mod 10 = 0) then
                                              barx := barx - 2;
                                       end
                                   else
                                       taillesaisie := 100;
                             #77 : if (taillesaisie < 290) then
                                      begin
                                           taillesaisie := taillesaisie + 1;
                                           if (taillesaisie mod 10 = 0) then
                                              barx := barx + 2;
                                      end
                                   else
                                       taillesaisie := 290;
                             #13 : choixtaille := False;
                        end;

                             texteXY(15,4,'Quel est votre taille (cm), ',White);
                             texteEnCouleur(getNomActuelle(),Red);
                             texteEnCouleur('?',White);
                             texteXY(15,5,'(au moins 100cm et pas plus de 290cm)',White);
                             texteXY(33,6,IntToStr(taillesaisie),LightMagenta);
                             texteXY(15,7,'[-------------------------------------]',White);
                             texteXY(barx,7,'|',Red);


                     end;
               miseAjourTaille(taillesaisie);
               deplacerCurseurXY(15,9);
               texteAtemps('Votre taille est de ',25,White);
               texteAtemps(IntToStr(getTailleActuelle()),50,LightMagenta);
               texteAtemps(' cm',25,White);
               deplacerCurseurXY(15,10);
               texteAtemps('Correcte?',40,White);
               deplacerCurseurXY(15,11);
               cho := True;
               choixONInterface();
               interfaceSaisieTaille();
               texteXY(33,6,IntToStr(taillesaisie),LightMagenta);
               texteXY(15,7,'[-------------------------------------]',White);
               texteXY(barx,7,'|',Red);
               deplacerCurseurXY(24,18);
               texteEnCouleur('Oui',Red);
               deplacerCurseurXY(44,18);
               texteEnCouleur('Non',White);
               deplacerCurseurXY(27,18);
               while (cho = True) do
                     begin
                          ch := ReadKey;
                          case ch of
                               #75 : if (rep < 2) then
                                        rep := rep + 1
                                     else
                                        rep := 1;
                               #77 : if (rep > 1) then
                                        rep := rep - 1
                                     else
                                        rep := 2;
                               #13 : cho := False;
                          end;



                          if (rep = 1) then
                             begin
                                  choixONInterface();
                                  interfaceSaisieTaille();
                                  texteXY(33,6,IntToStr(taillesaisie),LightMagenta);
                                  texteXY(15,7,'[-------------------------------------]',White);
                                  texteXY(barx,7,'|',Red);
                                  deplacerCurseurXY(24,18);
                                  texteEnCouleur('Oui',Red);
                                  deplacerCurseurXY(44,18);
                                  texteEnCouleur('Non',White);
                                  deplacerCurseurXY(27,18);
                             end
                          else
                              begin
                                   choixONInterface();
                                   interfaceSaisieTaille();
                                   texteXY(33,6,IntToStr(taillesaisie),LightMagenta);
                                   texteXY(15,7,'[-------------------------------------]',White);
                                   texteXY(barx,7,'|',Red);
                                   deplacerCurseurXY(24,18);
                                   texteEnCouleur('Oui',White);
                                   deplacerCurseurXY(44,18);
                                   texteEnCouleur('Non',Red);
                              end;
                     end;
               if (rep = 1) then
                   correcte := True
               else
                   rep := 1;


           end;
           resume();
end;

procedure resume();
var rep : integer = 1;
    ch : Char;
    correcte : Boolean = False;

begin
     creationInterfaceResume(True);
     choixONInterface2();
     deplacerCurseurXY(94,12);
     texteEnCouleur('Oui',Red);
     deplacerCurseurXY(94,18);
     texteEnCouleur('Non',White);
     deplacerCurseurXY(97,12);
     correcte := True;
     while (correcte = True) do
           begin
               ch := ReadKey;
               case ch of
                    #80 : if (rep < 2) then
                             rep := rep + 1
                          else
                             rep := 1;
                    #72 : if (rep > 1) then
                             rep := rep - 1
                          else
                             rep := 2;
                    #13 : correcte := False;
               end;



               if (rep = 1) then
                  begin
                      choixONInterface2();
                      deplacerCurseurXY(94,12);
                      texteEnCouleur('Oui',Red);
                      deplacerCurseurXY(94,18);
                      texteEnCouleur('Non',White);
                      deplacerCurseurXY(97,12);
                  end
               else
                   begin
                      choixONInterface2();
                      deplacerCurseurXY(94,12);
                      texteEnCouleur('Oui',White);
                      deplacerCurseurXY(94,18);
                      texteEnCouleur('Non',Red);
                      deplacerCurseurXY(97,18);                                                                                                                                                                 ;
                   end;


           end;
    if (rep = 1) then
        miseAjourPersonnage(1)
        // Village
    else
       creationPersonnage();
end;


procedure creationPersonnage();

begin

     changerTailleConsole(120,31);
     creationInterfaceDialogue();
     deplacerCurseurXY(60-6,15);
     texteAtemps('Aventurier.',40,White);
     ReadKey;

     creationInterfaceDialogue();
     deplacerCurseurXY(60-34,15);
     texteAtemps('Vous faites partie de la sixieme grande expedition du nouveau monde.',20,White);
     ReadKey;

     creationInterfaceDialogue();
     deplacerCurseurXY(60-23,15);
     texteAtemps('Une nouvelle ile mysterieuse a ete decouverte :',30,White);
     ReadKey;

     creationInterfaceDialogue();
     deplacerCurseurXY(60-4,15);
     texteAtemps('Aeternum',60,LightCyan);
     ReadKey;

     creationInterfaceDialogue();
     deplacerCurseurXY(60-32,15);
     texteAtemps('Vous y etes envoye pour decouvrir tous les ',25,White);
     texteAtemps('mysteres de cette ile.',25,Cyan);
     ReadKey;

     creationInterfaceDialogue();
     deplacerCurseurXY(60-37,15);
     texteAtemps('Mais avant tout, j''ai besoin que vous remplissiez cette ',25,White);
     texteAtemps('fiche d''information.',25,Red);
     ReadKey;

     saisieNom();


end;

end.

