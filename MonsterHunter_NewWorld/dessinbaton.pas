unit dessinBaton;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran,windows;

procedure dessinPersonnage(x,y:Integer);
procedure dessinEpee(x,y:Integer);
procedure dessinPlastron(x,y:Integer);
procedure dessinJambiere(x,y:Integer);
procedure dessinBotte(x,y:Integer);
procedure dessinCasque(x,y:Integer);
procedure dessinGants(x,y:Integer);
procedure dessin3D(x,y:integer);
procedure ColorierZoneRemix(couleur : Byte ;couleurT : Byte; xStart,xEnd,y:Integer);
procedure dessinerCadreRemix(c1, c2 : coordonnees; t : typeBordure; ct, cf : byte);
procedure dessinerCadreXYRemix(x,y,x2,y2 : integer; t : typeBordure; coulTrait, coulFond : byte);
implementation
procedure dessin3D(x,y:integer);
begin
  deplacerCurseurXY(x,y);
  write('   +----------------+');
  deplacerCurseurXY(x,y+1);
  write('  /|               /|');
  deplacerCurseurXY(x,y+2);
  write(' / |              / |');
  deplacerCurseurXY(x,y+3);
  write('*--+-------------*  |');
  deplacerCurseurXY(x,y+4);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+5);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+6);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+7);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+8);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+9);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+10);
  write('|  |             |  |');
  deplacerCurseurXY(x,y+11);
  write('|  +-------------+--+');
  deplacerCurseurXY(x,y+12);
  write('| /              | /');
  deplacerCurseurXY(x,y+13);
  write('|/               |/');
  deplacerCurseurXY(x,y+14);
  write('*----------------*');


end;

procedure dessinPersonnage(x,y:Integer);
begin

     deplacerCurseurXY(x,y);
     write('  _\|/_');
     deplacerCurseurXY(x,y+1);
     write('-------');
     deplacerCurseurXY(x,y+2);
     write('   |[]|');
     deplacerCurseurXY(x,y+3);
     write(' _] \/ [_');
     deplacerCurseurXY(x,y+4);
     write('/_ `==` _\');
     deplacerCurseurXY(x,y+5);
     write('\\|    |//');
     deplacerCurseurXY(x,y+6);
     write(' l\  __/j');
     deplacerCurseurXY(x,y+7);
     write(' `|-`##|');
     deplacerCurseurXY(x,y+8);
     write('  |#||#|');
     deplacerCurseurXY(x,y+9);
     write('--|#||#|');
     deplacerCurseurXY(x,y+10);
     write(' _|#||#|_');
     deplacerCurseurXY(x,y+11);
     write('`=="  "==`');


end;

procedure dessinEpee(x,y:Integer);
begin

     deplacerCurseurXY(x,y);
     write('      /| ___________');
     deplacerCurseurXY(x,y+1);
     write('O|===|* >___________>');
     deplacerCurseurXY(x,y+2);
     write('      \|');





end;

procedure dessinPlastron(x,y:Integer);
begin

     deplacerCurseurXY(x,y);
     write('    __     __');
     deplacerCurseurXY(x,y+1);
     write('   /  -   -  \');
     deplacerCurseurXY(x,y+2);
     write('    _ ----- _');
     deplacerCurseurXY(x,y+3);
     write('     | --- |');
     deplacerCurseurXY(x,y+4);
     write('     \     /');
     deplacerCurseurXY(x,y+5);
     write('      |___|');

end;

procedure dessinJambiere(x,y:Integer);
begin
     deplacerCurseurXY(x,y);
     write('    |`^"^`|');
     deplacerCurseurXY(x,y+1);
     write('    |  |  |');
     deplacerCurseurXY(x,y+2);
     write('    |  |  |');
     deplacerCurseurXY(x,y+3);
     write('    |  |  |');
     deplacerCurseurXY(x,y+4);
     write('    L__l__J');

end;

procedure dessinBotte(x,y:Integer);
begin
     deplacerCurseurXY(x,y);
     write('  _____');
     deplacerCurseurXY(x,y+1);
     write(' |   __|__');
     deplacerCurseurXY(x,y+2);
     write('  \ |     |');
     deplacerCurseurXY(x,y+3);
     write(' __)|    /');
     deplacerCurseurXY(x,y+4);
     write('(___|   (__');
     deplacerCurseurXY(x,y+5);
     write('    (_-____)');
end;

procedure dessinCasque(x,y:Integer);
begin
     deplacerCurseurXY(x,y);
     write('  ______');
     deplacerCurseurXY(x,y+1);
     write(' /------\');
     deplacerCurseurXY(x,y+2);
     write('|   __   |');

     deplacerCurseurXY(x,y+3);
     write('|_|    |_|');

end;

procedure dessinGants(x,y:Integer);
begin
     deplacerCurseurXY(x,y);
     write('       _____');
     deplacerCurseurXY(x,y+1);
     write('   ___/___ _)');
     deplacerCurseurXY(x,y+2);
     write(' .-`-`  __)__\');
     deplacerCurseurXY(x,y+3);
     write('|            \)');
     deplacerCurseurXY(x,y+4);
     write('|            )/');

     deplacerCurseurXY(x,y+5);
     write('`---.________/');

end;



// Utilise la même procédure que dans Gestion Ecran mais sans remettre le curseur à 0;0
procedure ColorierZoneRemix(couleur : Byte ;couleurT : Byte; xStart,xEnd,y:Integer);
    var
      LastMode: Word;
      Buffer : CONSOLE_SCREEN_BUFFER_INFO;
      stdOutputHandle : Cardinal;
      cursorPos       : TCoord;

      nbChars         : Cardinal;
	    TextAttr		  : Byte;
    begin
      couleurTexte(couleurT);
      stdOutputHandle := GetStdHandle(STD_OUTPUT_HANDLE);
      cursorPos := GetLargestConsoleWindowSize(stdOutputHandle);
      GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE),Buffer);

      cursorPos.X := xStart;
      cursorPos.Y := y;
      LastMode :=  Buffer.wAttributes;
      TextAttr := (LastMode and $0F) or ((couleur shl 4) and $F0);
      FillConsoleOutputAttribute(stdOutputHandle, TextAttr, xEnd-xStart+1, cursorPos, nbChars);
      cursorPos.X := 120;
      cursorPos.Y := 0;
      SetConsoleCursorPosition(stdOutputHandle, cursorPos);
      couleurTexte(white);
    end;

// Utilise la même procédure que dans Gestion Ecran mais sans effacer le contenu du cadre
procedure dessinerCadreRemix(c1, c2 : coordonnees; t : typeBordure; ct, cf : byte);
    type typeBords = (CHG, H, CHD, V, CBG, CBD);
    type tabBordures = array[typeBords] of char;
    const bordsSimples : tabBordures = (#218, #196, #191, #179, #192, #217);
          bordsDoubles : tabBordures = (#201, #205, #187, #186, #200, #188);
    var bords : tabBordures;
        i: integer;
    begin
      // changement de couleur
	  couleurs(ct, cf);

      // on choisit la bordure
      if t = simple then
        bords := bordsSimples
      else
        bords := bordsDoubles;

      // on dessine la ligne du haut
      deplacerCurseur(c1);
      write(bords[CHG]);
      for i := c1.x+1 to c2.x-1 do
        write(bords[H]);
      write(bords[CHD]);

      // on dessine les lignes intermédiaires
      for i := c1.y+1 to c2.y-1 do
      begin
        deplacerCurseurXY(c1.x, i);
        write(bords[V]);
        deplacerCurseurXY(c2.x,i);
        write(bords[V]);
      end;

      // on dessine la ligne du bas
      deplacerCurseurXY(c1.x, c2.y);
      write(bords[CBG]);
      for i := c1.x+1 to c2.x-1 do
        write(bords[H]);
      write(bords[CBD]);

    end;

// Utilise la même procédure que dans Gestion Ecran mais en appelant dessinerCadreRemix
procedure dessinerCadreXYRemix(x,y,x2,y2 : integer; t : typeBordure; coulTrait, coulFond : byte);
    var c1, c2 : coordonnees;
    begin
      c1.x := x;
      c1.y := y;
      c2.x := x2;
      c2.y := y2;
      dessinerCadreRemix(c1, c2, t, coulTrait, coulFond);
    end;
end.
