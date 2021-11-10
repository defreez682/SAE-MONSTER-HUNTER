program MonsterHunter_NewWorld;


uses gestionTexte, Personnage, sysutils, gestionFichier, GestionEcran;

var a : Integer;

begin
  checkUp();
  a := 1;
  miseAjourLVL(0);
  while a = 1 do
        begin
             effacerEcran();
             miseAjourLVL(getLvlActuelle()+1);
             writeln('Level : 'getLvlActuelle());
             writeln('HpMax de Base : ',calculHpMaxBase());
             writeln('Ad de Base : ',calculADBase());
             writeln('Armure de Base : ',calculArmureBase());
             attendre(1000);
        end;

end.

