program RastreioEncomendasACBR;

uses
  Vcl.Forms,
  rastreio in 'rastreio.pas' {formRastreio},
  Funcoes in 'Funcoes.pas',
  ARQUIVOS in 'ARQUIVOS.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformRastreio, formRastreio);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
