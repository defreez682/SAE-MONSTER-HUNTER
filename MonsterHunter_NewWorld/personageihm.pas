unit personageIHM;

{$mode objfpc}{$H+}


interface

{créer l’interface de choix pour le nom, le sexe et la taille}
procedure choixONInterface();
{créer l’interface de choix pour le résumé }
procedure choixONInterface2();
{On créer l’interface nécessaire pour le dialogue}
procedure creationInterfaceDialogue();
{On créer l’interface du formulaire}
procedure creationInterfaceFormulaire();
{On créer les textes pour la saisie du sexe}
procedure interfaceSaisieSexe();
{Appelle à la création du personnage}
procedure creationPersonnage();
{Formulaire qui permet la saisie du nom}
procedure saisieNom();
{Formulaire qui permet la saisie du sexe}
procedure saisieSexe();
{Formulaire qui permet la saisie de la taille}
procedure saisieTaille();
{Création du résumé }
procedure resume();


implementation

uses
  Classes, SysUtils,Personnage,GestionEcran, gestionTexte, crtperso,villageIHM;



procedure choixONInterface();
begin
     dessinerCadreXY(20,16,30,20,simple,White,Black);
     dessinerCadreXY(40,16,50,20,simple,White,Black);
end;

procedure choixONInterface2();
begin;
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

procedure interfaceSaisieSexe();
begin
     texteXY(15,4,'Quel est votre sexe, ',White);
     texteEnCouleur(getNomActuelle(personnage1),Red);
     texteEnCouleur('?',White);
     texteXY(15,5,'(30 Lettres MAX)',White);
     texteXY(15,7,getSexeActuelle(personnage1),White);
     texteXY(15,9,'Votre sexe est "',White);
     texteEnCouleur(getSexeActuelle(personnage1),Yellow);
     texteEnCouleur('"',White);
     texteXY(15,10,'Correcte?',White);
     texteXY(81,6,getNomActuelle(personnage1),Black);
end;

procedure saisieNom();
var nomsaisie : string;
    rep : integer = 1; // Position du choix
    ch : Char; // Contient la touche
    correcte: boolean = False; // Permet de savoir si le joueur à accepter son nom
    cho : boolean = False; // Permet de faire tourner la boucle du choix

begin
     while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(15,4);
               texteAtemps('Ecrivez votre nom : (20 lettres MAX)',25,White);
               deplacerCurseurXY(15,6);
               readln(nomsaisie);
               if not (nomsaisie = '') then // On vérifie que l'on a bien tapé le nom
                  begin
                      if (Length(nomsaisie) < 20) then // On vérifie que le nom est moins de 20 caractères
                      begin
                           miseAjourNom(personnage1,nomsaisie);
                           deplacerCurseurXY(15,8);
                           texteAtemps('Votre nom est "',25,White);
                           texteAtemps(getNomActuelle(personnage1),50,Red);
                           texteAtemps('"',25,White);
                           deplacerCurseurXY(15,9);
                           texteAtemps('Correcte?',40,White);
                           cho := True;
                           choixONInterface();
                           texteXY(24,18,'Oui',Red);
                           texteXY(44,18,'Non',White);
                           deplacerCurseurXY(27,18);
                           while (cho = True) do
                                 begin
                                     ch := ReadKey;
                                     case ch of
                                          #75 : if (rep < 2) then  // droite
                                                   rep := rep + 1
                                                else
                                                   rep := 1; // On retourne à 1 si on est à 2
                                          #77 : if (rep > 1) then  // gauche
                                                   rep := rep - 1
                                                else
                                                   rep := 2; // On retourne à 2 si on est à 1
                                          #13 : cho := False; // si le joueur appuie on arrête la saisie
                                     end;



                                     if (rep = 1) then
                                        begin
                                            texteXY(24,18,'Oui',Red);
                                            texteXY(44,18,'Non',White);
                                            deplacerCurseurXY(27,18);
                                        end
                                     else
                                         begin
                                            texteXY(24,18,'Oui',White);
                                            texteXY(44,18,'Non',Red);
                                         end;
                                 end;
                           if (rep = 1) then
                              correcte := True // On arrête le choix
                           else
                              rep := 1;

                      end
                      else;
                  end;
           end;
     saisieSexe() // On appelle la saisie du sexe après que tout soit terminé
end;

procedure saisieSexe();
var sexesaisie : string; // contient le sexe
    rep : integer = 1; // Position du choix
    ch : Char; // Contient la touche
    correcte: boolean = False; // Permet de savoir si le joueur à accepter son sexe
    cho : boolean = False; // Permet de faire tourner la boucle du choix
begin
     while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(81,6);
               couleurTexte(Black);
               write(getNomActuelle(personnage1));
               deplacerCurseurXY(15,4);
               texteAtemps('Quel est votre sexe, ',25,White);
               texteAtemps(getNomActuelle(personnage1),25,Red);
               texteAtemps('?',25,White);
               deplacerCurseurXY(15,5);
               texteAtemps('(30 Lettres MAX)',25,White);
               deplacerCurseurXY(15,7);
               readln(sexesaisie);
               if not (sexesaisie = '') then  // On vérifie que ce ne soit pas vide
                  begin
                      if (Length(sexesaisie) < 30) then // On vérifie que e soit inférieur à 30 caractères
                      begin
                           miseAjourSexe(personnage1,sexesaisie);
                           deplacerCurseurXY(15,9);
                           texteAtemps('Votre sexe est "',25,White);
                           texteAtemps(getSexeActuelle(personnage1),50,Yellow);
                           texteAtemps('"',25,White);
                           deplacerCurseurXY(15,10);
                           texteAtemps('Correcte?',40,White);
                           cho := True;
                           choixONInterface();
                           texteXY(24,18,'Oui',Red);
                           texteXY(44,18,'Non',White);
                           deplacerCurseurXY(27,18);
                           while (cho= True) do
                                 begin
                                      ch := ReadKey;
                                      case ch of
                                           #75 : if (rep < 2) then  // droite
                                                    rep := rep + 1
                                                 else
                                                    rep := 1; // On retourne à 1 si on est à 2
                                           #77 : if (rep > 1) then  // gauche
                                                    rep := rep - 1
                                                 else
                                                    rep := 2; // On retourne à 2 si on est à 1
                                           #13 : cho := False; // si le joueur valide on quitte la saisie
                                      end;



                                      if (rep = 1) then
                                              begin

                                                  texteXY(24,18,'Oui',Red);
                                                  texteXY(44,18,'Non',White);
                                                  deplacerCurseurXY(27,18);
                                              end
                                      else
                                              begin
                                                 texteXY(24,18,'Oui',White);
                                                 texteXY(44,18,'Non',Red);
                                              end;
                                 end;
                                 if (rep = 1) then
                                    begin
                                         case sexesaisie of 'homme','Homme','Femme','femme','Garçon','garçon','garcon','Garcon' : // si tout ces sexes sont indiqué on passe,
                                              begin
                                                  correcte := True; // On arrête le choix
                                              end
                                              else // Sinon on affiche ce commentaire
                                                  begin
                                                       creationInterfaceFormulaire();
                                                       interfaceSaisieSexe();
                                                       deplacerCurseurXY(15,11);
                                                       texteAtemps(getSexeActuelle(personnage1),30,Yellow);
                                                       texteAtemps('... ',700,Yellow);
                                                       deplacerCurseurXY(15,12);
                                                       texteAtemps('Je ne connaissais pas ce sexe...',15,White);
                                                       deplacerCurseurXY(15,13);
                                                       texteAtemps('Mais passons.',30,White);
                                                       ReadKey();
                                                       correcte := True; // On arrête le choix
                                                  end;
                                         end;
                                    end
                                    else
                                        rep := 1;
                      end
                      else;
                  end;
           end;
     saisieTaille(); // On appelle le saisie de l'interface
end;

procedure saisieTaille();

var taillesaisie : integer = 100; // On initialise la taille à 100
    taillesaisieaff : real; // Contient la taille qui s'affiche
    rep : integer = 1; // Position du choix
    ch : Char; // contient la touche appuyé
    correcte: boolean = False; // Permet de savoir si le joueur à accepter sa taille
    cho : boolean = False; // Permet de faire tourner la boucle du choix
    choixtaille : boolean = False; // Permet de faire tourner la sélection de taille
    barx : integer = 15; // Position de la barre
begin
          while (correcte = False) do
           begin
               CreationInterfaceFormulaire();
               deplacerCurseurXY(81,6);
               couleurTexte(Black);
               write(getNomActuelle(personnage1));
               deplacerCurseurXY(81,8);
               couleurTexte(Black);
               write(getSexeActuelle(personnage1));
               deplacerCurseurXY(15,4);
               texteAtemps('Quel est votre taille (m), ',25,White);
               texteAtemps(getNomActuelle(personnage1),25,Red);
               texteAtemps('?',25,White);
               choixtaille := True;
               taillesaisieaff := taillesaisie/100;
               texteXY(33,6,FloatToStrF(taillesaisieaff,fffixed,1,2),LightMagenta);
               texteXY(14,7,'[---------------------------------------]',White);
               texteXY(13,8,'1.00',White);
               texteXY(52,8,'2.90',White);
               texteXY(barx,7,'|',Red);
               while (choixtaille = True) do
                     begin
                        ch := ReadKey;
                        case ch of
                             #75 : if (taillesaisie > 100) then
                                       begin
                                           taillesaisie := taillesaisie - 1; // On enlève 1 à la taille
                                           if (taillesaisie mod 10 = 0) then // tout les 10 on baisse de 2 pixels
                                              barx := barx - 2;
                                       end
                                   else
                                       begin
                                            taillesaisie := 100; // Au bout d'un mètre on stop
                                            barx := 15;
                                       end;
                             #77 : if (taillesaisie < 290) then
                                      begin
                                           taillesaisie := taillesaisie + 1; // On ajoute 1 à la taille
                                           if (taillesaisie mod 10 = 0) then // tout les 10 on augmente de 2 pixels
                                              barx := barx + 2;
                                      end
                                   else
                                       begin
                                            taillesaisie := 290; // Au bout de 2,90 m on stop
                                            barx := 53;
                                       end;
                             #13 : choixtaille := False; // Si le joueur valide on arrête le choix de la taille
                        end;

                             texteXY(15,4,'Quel est votre taille (m), ',White);
                             texteEnCouleur(getNomActuelle(personnage1),Red);
                             texteEnCouleur('?',White);
                             taillesaisieaff := taillesaisie/100;
                             texteXY(33,6,FloatToStrF(taillesaisieaff,fffixed,1,2),LightMagenta);
                             texteXY(14,7,'[---------------------------------------]',White);
                             texteXY(13,8,'1.00',White);
                             texteXY(52,8,'2.90',White);
                             texteXY(barx,7,'|',Red);


                     end;
               miseAjourTaille(personnage1,taillesaisie);
               deplacerCurseurXY(15,10);
               texteAtemps('Votre taille est de ',25,White);
               texteAtemps(FloatToStrF(getTailleActuelle(personnage1)/100,fffixed,1,2),50,LightMagenta);
               texteAtemps(' m',25,White);
               deplacerCurseurXY(15,11);
               texteAtemps('Correcte?',40,White);
               cho := True;
               choixONInterface();
               texteXY(24,18,'Oui',Red);
               texteXY(44,18,'Non',White);
               deplacerCurseurXY(27,18);
               while (cho = True) do
                     begin
                          ch := ReadKey;
                          case ch of
                               #75 : if (rep < 2) then  // droite
                                        rep := rep + 1
                                     else
                                        rep := 1; // On retourne à 1 si on est à 2
                               #77 : if (rep > 1) then  // gauche
                                        rep := rep - 1
                                     else
                                        rep := 2; // On retourne à 2 si on est à 1
                               #13 : cho := False; // si le joueur valide on quitte la saisie
                          end;



                          if (rep = 1) then
                             begin
                                 texteXY(24,18,'Oui',Red);
                                 texteXY(44,18,'Non',White);
                                 deplacerCurseurXY(27,18);
                             end
                          else
                              begin
                                 texteXY(24,18,'Oui',White);
                                 texteXY(44,18,'Non',Red);
                              end;
                     end;
               if (rep = 1) then
                   correcte := True // On arrête la saisie
               else
                   rep := 1;


           end;
           resume(); // On appelle résumé
end;

procedure resume();
var rep : integer = 1;
    ch : Char;
    correcte : Boolean = False;

begin
     effacerEcran();
     dessinerCadreXY(40,3,80,30,double,White,Black);
     deplacerCurseurXY(41,5);
     texteAtemps('Nom : ',20,White);
     texteAtemps(getNomActuelle(personnage1),20,White);
     deplacerCurseurXY(41,7);
     texteAtemps('Sexe : ',20,White);
     texteAtemps(getSexeActuelle(personnage1),20,White);
     deplacerCurseurXY(41,9);
     texteAtemps('Taille : ',20,White);
     texteAtemps(FloatToStrF(getTailleActuelle(personnage1)/100,fffixed,1,2),20,White);
     texteAtemps(' m',20,White);
     deplacerCurseurXY(41,10);
     texteAtemps('_______________________________________',5,White);
     deplacerCurseurXY(41,12);
     texteAtemps('Niveau : ',20,White);
     texteAtemps('1',20,White);
     deplacerCurseurXY(41,13);
     texteAtemps('Experience necessaire avant niveau',10,White);
     deplacerCurseurXY(41,14);
     texteAtemps('suivant : ',10,White);
     texteAtemps('1000',10,White);
     deplacerCurseurXY(41,15);
     texteAtemps('_______________________________________',5,White);
     deplacerCurseurXY(41,17);
     texteAtemps('Argent : ',20,White);
     texteAtemps('500',20,White);
     deplacerCurseurXY(41,18);
     texteAtemps('_______________________________________',5,White);
     deplacerCurseurXY(41,20);
     texteAtemps('Equipement : ',20,White);
     deplacerCurseurXY(41,21);
     texteAtemps('- Epee simple',10,White);
     deplacerCurseurXY(41,22);
     texteAtemps('- Casque de chasseur',10,White);
     deplacerCurseurXY(41,23);
     texteAtemps('- Plastron de chasseur',10,White);
     deplacerCurseurXY(41,24);
     texteAtemps('- Gants de chasseur',10,White);
     deplacerCurseurXY(41,25);
     texteAtemps('- Jambiere de chasseur',10,White);
     deplacerCurseurXY(41,26);
     texteAtemps('- Botte de chasseur',10,White);
     deplacerCurseurXY(41,27);
     texteAtemps('- 3 Potions simples',10,White);
     deplacerCurseurXY(60-9,1);
     texteAtemps('Cela vous convient ?',30,White);
     deplacerCurseurXY(60-21,2);
     texteAtemps('(Une fois accepte, plus de retour arriere)',30,Red);
     choixONInterface2();
     texteXY(94,12,'Oui',Red);
     texteXY(94,18,'Non',White);
     deplacerCurseurXY(97,12);
     correcte := True;
     while (correcte = True) do
           begin
               ch := ReadKey;
               case ch of
                    #75 : if (rep < 2) then  // droite
                             rep := rep + 1
                          else
                             rep := 1; // On retourne à 1 si on est à 2
                    #77 : if (rep > 1) then  // gauche
                             rep := rep - 1
                          else
                             rep := 2; // On retourne à 2 si on est à 1
                    #13 : correcte := False; // si le joueur valide on quitte la saisie
               end;



               if (rep = 1) then
                  begin
                      texteXY(94,12,'Oui',Red);
                      texteXY(94,18,'Non',White);
                      deplacerCurseurXY(97,12);
                  end
               else
                   begin
                      texteXY(94,12,'Oui',White);
                      texteXY(94,18,'Non',Red);
                      deplacerCurseurXY(97,18);                                                                                                                                                                 ;
                   end;
           end;
    if (rep = 1) then
        begin
             miseAjourPersonnage(1); // On affirme que le personnage a été créer
             creationInventaire(personnage1); // On créer/recréer l'inventaire
             miseAjourOr(500); // On initialise les golds
             miseAjourLvl(1);  // On initialise le niveau
             miseAjourEXP(0);  // On initialise l'exp
             modificationDataJoueur(calculHpMaxBase(),13); // On initialise la vie
             modificationDataJoueur(1,14); // Le combat contre le boss 1 n'a pas été fait
             modificationDataJoueur(1,15); // Le combat contre le boss 1 n'a pas été fait
             modificationDataJoueur(1,16); // Le combat contre le boss 1 n'a pas été fait
             choixMenuVillage(); // On appelle le village

        end
    else
       creationPersonnage(); // sinon on recommence la création du personnage
end;

procedure creationPersonnage();

begin

     creationInterfaceDialogue();
     deplacerCurseurXY(60-6,15);
     texteAtemps('Aventurier.',40,White);
     ReadKey;

     texteXY(21,15,'                                                                          ',White);
     deplacerCurseurXY(60-34,15);
     texteAtemps('Vous faites partie de la sixieme grande expedition du nouveau monde.',20,White);
     ReadKey;

     texteXY(21,15,'                                                                          ',White);
     deplacerCurseurXY(60-23,15);
     texteAtemps('Une nouvelle ile mysterieuse a ete decouverte :',30,White);
     ReadKey;

     texteXY(21,15,'                                                                          ',White);
     deplacerCurseurXY(60-4,15);
     texteAtemps('Aeternum',60,LightCyan);
     ReadKey;

     texteXY(21,15,'                                                                          ',White);
     deplacerCurseurXY(60-32,15);
     texteAtemps('Vous y etes envoye pour decouvrir tous les ',25,White);
     texteAtemps('mysteres de cette ile.',25,Cyan);
     ReadKey;

     texteXY(21,15,'                                                                          ',White);
     deplacerCurseurXY(60-37,15);
     texteAtemps('Mais avant tout, j''ai besoin que vous remplissiez cette ',25,White);
     texteAtemps('fiche d''information.',25,Red);
     ReadKey;

     saisieNom(); // On appelle la saisie du nom


end;

end.

