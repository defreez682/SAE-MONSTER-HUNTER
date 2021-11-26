unit dessinBaton;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,GestionEcran,windows;

procedure dessinMur();
procedure dessinPersonnage(x,y:Integer);
procedure dessinEpee(x,y:Integer);
procedure dessinPlastron(x,y:Integer);
procedure dessinJambiere(x,y:Integer);
procedure dessinBotte(x,y:Integer);
procedure dessinCasque(x,y:Integer);
procedure dessinGants(x,y:Integer);
procedure ColorierZoneRemix(couleur : Byte ;couleurT : Byte; xStart,xEnd,y:Integer);
implementation

procedure dessinPersonnage(x,y:Integer);
begin

     deplacerCurseurXY(x,y);
     write('  _\|/_');
     deplacerCurseurXY(x,y+1);
     write('   /--\');
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
     write('  |#||#|');
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

procedure dessinMur();
var
  y:Integer;
  j:Integer;
  i:integer;
  z:Integer;
begin
     couleurTexte(6);
     j:=0;
     for y:=31 to 59 do
         begin
              deplacerCurseurXY(65,y);
              write('|');
         end;

     for y:=59 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(64-j,y);
              write('\');
         end;
     j:=0;

     for y:=55 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(65-j,y);
              write('\');
         end;
     j:=0;
     for y:=50 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(65-j,y);
              write('\');
         end;
     j:=0;
     for y:=45 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(65-j,y);
              write('\');
         end;
     j:=0;
     for y:=40 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(65-j,y);
              write('\');
         end;
     j:=0;
     for y:=35 downto 31 do
         begin
              j:=j+1;
              deplacerCurseurXY(65-j,y);
              write('\');
         end;
//---------------------------
     j:=65;
     i:=60;
     for y:=5 downto 1 do
         begin
              j:=j-5;
              i:=i-5;
              for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(j,i-z);
                       write('|');
                  end;
         end;



     for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(58,48-z);
                       write('|');
                  end;
     for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(52,42-z);
                       write('|');
                  end;
     for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(46,36-z);
                       write('|');
                  end;






     j:=65;
     i:=50;
     for y:=3 downto 1 do
         begin
              j:=j-5;
              i:=i-5;
              for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(j,i-z);
                       write('|');
                  end;
         end;

     for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(58,38-z);
                       write('|');
                  end;
     for z:=0 to 1 do
                  begin
                       deplacerCurseurXY(52,32-z);
                       write('|');
                  end;




     j:=65;
     i:=40;
     for y:=1 downto 1 do
         begin
              j:=j-5;
              i:=i-5;
              for z:=0 to 3 do
                  begin
                       deplacerCurseurXY(j,i-z);
                       write('|');
                  end;
         end;
     deplacerCurseurXY(65,60);
end;

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
end.
