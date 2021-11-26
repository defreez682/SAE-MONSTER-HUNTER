unit forgeronLogic;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, GestionEcran, forgeronIHM;

procedure ForgeronDesign();
procedure ForgeronCadre();
procedure DemarrageForgeron();
procedure ForgerArme();
procedure ForgerArmure();

implementation

procedure ForgeronDesign();
begin
  ForgeronDesignIHM();
end;

procedure ForgeronCadre();
var
  c : integer;

begin
  ForgeronCadreIHM();

end;


procedure ForgerArme();
begin

  ForgerArmeIHM();

end;

procedure ForgerArmure();

begin

  ForgerArmureIHM();

end;

procedure DemarrageForgeron();

begin

  effacerEcran();
  ChoixForgeron();


end;

end.

