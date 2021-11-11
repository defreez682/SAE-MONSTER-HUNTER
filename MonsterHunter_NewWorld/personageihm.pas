unit personageIHM;

{$mode objfpc}{$H+}

interface

procedure creationInterfaceDialogue();
procedure CreationInterfaceFormulaire();
procedure CreationInterfaceResume();
procedure creationPersonnage();
procedure saisieNom();
procedure saisieSexe();
procedure saisieTaille();
procedure resume();

implementation

uses
  Classes, SysUtils,Personnage,GestionEcran, gestionTexte;




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

procedure CreationInterfaceFormulaire();
begin
     effacerEcran();
     dessinerCadreXY(80,5,100,20,double,DarkGray,White);
     dessinerCadreXY(10,2,60,25,double,White,Black);
end;

procedure CreationInterfaceResume();
begin
    effacerEcran();
    dessinerCadreXY(40,3,80,30,double,White,Black);
    deplacerCurseurXY(41,5);
    texteAtemps('Nom : ',20,White);
    texteAtemps(getNomActuelle(),20,White);
    deplacerCurseurXY(41,7);
    texteAtemps('Sexe : ',20,White);
    texteAtemps(getSexeActuelle(),20,White);
    deplacerCurseurXY(41,9);
    texteAtemps('Taille : ',20,White);
    texteAtemps(IntToStr(getTailleActuelle()),20,White);
    texteAtemps(' cm',20,White);
    deplacerCurseurXY(41,10);
    texteAtemps('_______________________________________',5,White);
    deplacerCurseurXY(41,12);
    texteAtemps('Niveau : ',20,White);
    texteAtemps(IntToStr(getLvlActuelle()),20,White);
    deplacerCurseurXY(41,13);
    texteAtemps('Experience necessaire avant niveau',10,White);
    deplacerCurseurXY(41,14);
    texteAtemps('suivant : ',10,White);
    texteAtemps(IntToStr(calculLvlSuivant()),10,White);
    deplacerCurseurXY(41,15);
    texteAtemps('_______________________________________',5,White);
    deplacerCurseurXY(41,17);
    texteAtemps('Argent : ',20,White);
    texteAtemps(IntToStr(getOrActuelle()),20,White);
    deplacerCurseurXY(41,18);
    texteAtemps('_______________________________________',5,White);
    deplacerCurseurXY(41,20);
    texteAtemps('Equipement : ',20,White);
    deplacerCurseurXY(41,21);
    texteAtemps('- Epee Basique',10,White);
    deplacerCurseurXY(41,22);
    texteAtemps('- Casque de chasseur simple',10,White);
    deplacerCurseurXY(41,23);
    texteAtemps('- Plastron de chasseur simple',10,White);
    deplacerCurseurXY(41,24);
    texteAtemps('- Gants de chasseur simple',10,White);
    deplacerCurseurXY(41,25);
    texteAtemps('- Taille de chasseur simple',10,White);
    deplacerCurseurXY(41,26);
    texteAtemps('- Jambiere de chasseur simple',10,White);
    deplacerCurseurXY(41,27);
    texteAtemps('- 3 Potions simples',10,White);

end;

// 120 de largeur


procedure saisieNom();
var nomsaisie : string;
    rep : string;
    correcte: boolean = False;

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
                           texteAtemps('Correcte? (O/N)',40,White);
                           deplacerCurseurXY(15,10);
                           readln(rep);
                           if (rep = 'O') or (rep = 'o') then
                              correcte := True
                           else;
                      end
                      else;
                  end;
           end;

     saisieSexe();

end;

procedure saisieSexe();
var sexesaisie : string;
    rep : string;
    correcte: boolean = False;
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
                           texteAtemps('Correcte? (O/N)',40,White);
                           deplacerCurseurXY(15,11);
                           readln(rep);
                           if (rep = 'O') or (rep = 'o') then
                              begin
                              // Oui c'est long.
                              case sexesaisie of 'homme','Homme','Femme','femme','Garçon','garçon','garcon','Garcon' :
                                 begin
                                      correcte := True;
                                 end
                              else
                                 begin
                                      deplacerCurseurXY(15,11);
                                      texteAtemps(getSexeActuelle,30,Yellow);
                                      texteAtemps('... ',700,Yellow);
                                      deplacerCurseurXY(15,12);
                                      texteAtemps('Je ne connaissais pas ce sexe...',15,White);
                                      deplacerCurseurXY(15,13);
                                      texteAtemps('Mais passons.',30,White);
                                      readln();
                                 end
                              end;
                              correcte := True
                           end
                           else;

                      end
                      else;
                  end;
           end;
       saisieTaille();
end;


procedure saisieTaille();

var taillesaisie : integer;
    rep : string;
    correcte: boolean = False;
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
               texteAtemps('(au moins 100cm et pas plus de 230cm)',10,White);
               deplacerCurseurXY(15,7);
               readln(taillesaisie);
               if (taillesaisie > 100) or (taillesaisie < 230) then
                  begin
                        miseAjourTaille(taillesaisie);
                        deplacerCurseurXY(15,9);
                        texteAtemps('Votre taille est de ',25,White);
                        texteAtemps(IntToStr(getTailleActuelle()),50,LightMagenta);
                        texteAtemps(' cm',25,White);
                        deplacerCurseurXY(15,10);
                        texteAtemps('Correcte? (O/N)',40,White);
                        deplacerCurseurXY(15,11);
                        readln(rep);
                        if (rep = 'O') or (rep = 'o') then
                                correcte := true
                        else;
                  end
               else
                   begin
                   end;

           end;

           resume();

end;

procedure resume();
var rep : string;
begin
     CreationInterfaceResume();

     deplacerCurseurXY(60-12,1);
     texteAtemps('Cela vous convient ? (O/N)',30,White);
     deplacerCurseurXY(60-21,2);
     texteAtemps('(Une fois accepter, plus de retour arriere)',100,Red);

     deplacerCurseurXY(85,15);
     texteAtemps('Reponse : ',10,Yellow);
     readln(rep);
     if (rep = 'O') or (rep = 'o') then
     else
       saisieNom();
end;

procedure creationPersonnage();

begin


     creationInterfaceDialogue();
     deplacerCurseurXY(60-6,15);
     texteAtemps('Aventurier.',40,White);
     readln();

     creationInterfaceDialogue();
     deplacerCurseurXY(60-34,15);
     texteAtemps('Vous faites partie de la sixieme grande expedition du nouveau monde.',20,White);
     readln();

     creationInterfaceDialogue();
     deplacerCurseurXY(60-23,15);
     texteAtemps('Une nouvelle ile mysterieuse a ete decouverte :',30,White);
     readln();

     creationInterfaceDialogue();
     deplacerCurseurXY(60-4,15);
     texteAtemps('Aeternum',60,LightCyan);
     readln();

     creationInterfaceDialogue();
     deplacerCurseurXY(60-32,15);
     texteAtemps('Vous y etes envoye pour decouvrir tous les ',25,White);
     texteAtemps('mysteres de cette ile.',25,Cyan);
     readln();

     creationInterfaceDialogue();
     deplacerCurseurXY(60-37,15);
     texteAtemps('Mais avant tout, j''ai besoin que vous remplissiez cette ',25,White);
     texteAtemps('fiche d''information.',25,Red);
     readln();

     saisieNom();


end;

end.

