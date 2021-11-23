unit chasseFuiteLogic;

{$mode objfpc}{$H+}

interface

function gestionBas(x,y : Integer) : Integer;
                 
function gestionHaut(x,y : Integer) : Integer;

function gestionDroite(x,y : Integer) : Integer;

implementation

uses
  Classes, SysUtils;

function gestionBas(x,y : Integer) : Integer;
begin
  if (y = 24) then
  else if (x = 41) and (y = 20) then
       y := 20
  else if (x = 42) and (y = 20) then
       y := 20
  else if (x = 43) and (y = 20) then
       y := 20
  else if (x = 44) and (y = 20) then
       y := 20
  else if (x = 45) and (y = 20) then
       y := 20
  else if (x = 46) and (y = 20) then
       y := 20
  else if (x = 47) and (y = 20) then
       y := 20
  else if (x = 48) and (y = 20) then
       y := 20
  else if (x = 49) and (y = 20) then
       y := 20
  else if (x = 50) and (y = 20) then
       y := 20
  else if (x = 51) and (y = 20) then
       y := 20
  else if (x = 52) and (y = 20) then
       y := 20
  else if (x = 53) and (y = 21) then
       y := 21
  else if (x = 54) and (y = 22) then
       y := 22
  else if (x = 55) and (y = 23) then
       y := 23
  else if (x = 56) and (y = 23) then
       y := 23
  else if (x = 57) and (y = 23) then
       y := 23
  else if (x = 58) and (y = 23) then
       y := 23
  else if (x = 59) and (y = 23) then
       y := 23
  else if (x = 60) and (y = 24) then
       y := 24
  else if (x = 61) and (y = 24) then
       y := 24
  else if (x = 62) and (y = 24) then
       y := 24
  else if (x = 63) and (y = 24) then
       y := 24
  else if (x = 64) and (y = 24) then
       y := 24
  else if (x = 65) and (y = 24) then
       y := 24
  else if (x = 66) and (y = 24) then
       y := 24
  else if (x = 67) and (y = 24) then
       y := 24
  else if (x = 68) and (y = 24) then
       y := 24
  else if (x = 69) and (y = 24) then
       y := 24
  else if (x = 70) and (y = 24) then
       y := 24
  else if (x = 71) and (y = 24) then
       y := 24
  else if (x = 72) and (y = 24) then
       y := 24
  else if (x = 73) and (y = 24) then
       y := 24
  else if (x = 74) and (y = 24) then
       y := 24
  else if (x = 75) and (y = 24) then
       y := 24
  else if (x = 76) and (y = 24) then
       y := 24
  else if (x = 77) and (y = 24) then
       y := 24
  else
      y := y + 1;

  gestionBas := y;
end;

function gestionHaut(x,y : Integer) : Integer;
begin
  if (y = 8) then

  else if (x = 49) and (y = 9) then
       y := 9
  else if (x = 48) and (y = 10) then
       y := 10
  else if (x = 47) and (y = 10) then
       y := 10
  else if (x = 46) and (y = 10) then
       y := 10
  else if (x = 45) and (y = 10) then
       y := 10
  else if (x = 44) and (y = 10) then
       y := 10
  else if (x = 43) and (y = 11) then
       y := 11
  else if (x = 41) and (y = 12) then
       y := 12
  else if (x = 42) and (y = 12) then
       y := 12
  else if (x = 77) and (y = 14) then
       y := 14
  else if (x = 76) and (y = 13) then
       y := 13
  else if (x = 75) and (y = 12) then
       y := 12
  else if (x = 74) and (y = 12) then
       y := 12
  else if (x = 73) and (y = 12) then
       y := 12
  else if (x = 72) and (y = 12) then
       y := 12
  else if (x = 71) and (y = 11) then
       y := 11
  else if (x = 70) and (y = 11) then
       y := 11
  else if (x = 69) and (y = 11) then
       y := 11
  else if (x = 68) and (y = 11) then
       y := 11
  else if (x = 67) and (y = 11) then
       y := 11
  else if (x = 66) and (y = 11) then
       y := 11
  else if (x = 65) and (y = 11) then
       y := 11
  else if (x = 64) and (y = 11) then
       y := 11
  else if (x = 63) and (y = 11) then
       y := 11
  else if (x = 62) and (y = 9) then
       y := 9
  else
      y := y - 1;

  gestionHaut := y;
end;

function gestionDroite(x,y : Integer) : Integer;
begin
  if (x = 77) then
  else if (x = 77) and (y = 14) then
       x := 77
  else if (x = 76) and (y = 13) then
       x := 76
  else if (x = 75) and (y = 12) then
       x := 75
  else if (x = 71) and (y = 11) then
       x := 71
  else if (x = 62) and (y = 10) then
       x := 62
  else if (x = 62) and (y = 9) then
       x := 62
  else if (x = 61) and (y = 8) then
       x := 61

  else
      x := x + 1;

  gestionDroite := x;
end;

function gestionGauche(x,y : Integer) : Integer;
begin
  if (x = 41) then
     else if (x = 50) and (y = 8) then
          x := 50
     else if (x = 49) and (y = 9) then
          x := 49
     else if (x = 44) and (y = 10) then
          x := 44
     else if (x = 43) and (y = 11) then
          x := 43
     else if (x = 53) and (y = 21) then
          x := 53
     else if (x = 54) and (y = 22) then
          x := 54
     else if (x = 55) and (y = 23) then
          x := 55
     else if (x = 60) and (y = 24) then
          x := 60
     else
         x := x - 1;

     gestionGauche := x;
end;

end.

