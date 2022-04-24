unit Funcoes;

interface

uses system.StrUtils, SysUtils, Types, Windows, DateUtils, Controls, Forms,
  DBClient,
  Tlhelp32, Winapi.ShellAPI,
  Variants, Dialogs, DBGrids, Graphics, DB, IniFiles, Classes,

  Messages, ComCtrls, PsApi, stdCtrls, Zlib, ShlObj,
  system.IoUtils, dbWeb, ComObj, XMLDoc, XMLIntf,
  Vcl.ExtCtrls, Vcl.DBCtrls,

  XPStyleActnCtrls, StdStyleActnCtrls,
  system.Notification, Vcl.Buttons, Vcl.Menus,
  system.Actions, Vcl.ActnList, system.ImageList, Vcl.ImgList,
  Vcl.CategoryButtons, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus,
  Vcl.TitleBarCtrls, Vcl.Imaging.jpeg;

function DiasUteis(DataInicial, DataFinal: TDateTime): integer;

implementation

uses ARQUIVos;

function DiasUteis(DataInicial, DataFinal: TDateTime): integer;
var
  Feriados: TStringList;
  DiaMes: string;
begin
  result := 0;

  if DataInicial > DataFinal then
    Exit;

  // Carrega feriados nacionais fixos
  Feriados := TStringList.Create;
  try
    Feriados.Add('1/1');
    Feriados.Add('21/4');
    Feriados.Add('1/5');
    Feriados.Add('7/9');
    Feriados.Add('12/10');
    Feriados.Add('2/11');
    Feriados.Add('15/11');
    Feriados.Add('25/12');

    while (DataInicial <= DataFinal) do
    begin
      DiaMes := IntToStr(DayOf(DataInicial)) + '/' +
        IntToStr(MonthOf(DataInicial));
      if (DayOfTheWeek(DataInicial) in [1 .. 5]) and
        (Feriados.IndexOf(DiaMes) = -1) then
        result := result + 1;

      DataInicial := DataInicial + 1;
    end;
  finally
    FreeAndNil(Feriados);
  end;
end;

end.
