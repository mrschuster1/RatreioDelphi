{ ****************************************************************************** }
{ Projeto: Componentes ACBr }
{ Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil }
{ }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida }
{ }
{ Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr }

unit rastreio;

interface

uses
  System.DateUtils, clipbrd, Windows, Messages, SysUtils, Variants, Classes,
  Graphics, System.StrUtils,
  Controls, Forms, Dialogs, StdCtrls, Mask, ACBrBase, ACBrSocket, ACBrSedex,
  TypInfo, ExtCtrls, DB, DBClient, Grids, DBGrids, ComCtrls, TabNotBk,
  DBCtrls, JvComponentBase, JvClipboardMonitor, UCL.QuickButton, UCL.CaptionBar,
  JvExForms, JvClipboardViewer, UCL.ListButton, UCL.Panel, Vcl.DBCGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  UCL.ScrollBox;

type
  TformRastreio = class(TForm)
    ACBrSedex1: TACBrSedex;
    ds: TDataSource;
    cds: TClientDataSet;
    cdsData: TDateTimeField;
    cdsLocal: TStringField;
    cdsObservacao: TStringField;
    cdsSituacao: TStringField;
    UCaptionBar1: TUCaptionBar;
    UQuickButton1: TUQuickButton;
    UQuickButton2: TUQuickButton;
    Label16: TLabel;
    pnlbaixo: TPanel;
    pnldireita: TPanel;
    pnlesquerda: TPanel;
    sql: TFDQuery;
    dsSql: TDataSource;
    sqlRAST_COD: TIntegerField;
    sqlRAST_RASTREIO: TStringField;
    sqlRAST_DESCRICAO: TStringField;
    pnlPrincipal: TPanel;
    pgc: TPageControl;
    tbRastreio: TTabSheet;
    Panel1: TPanel;
    Panel3: TPanel;
    EdtRastreio: TEdit;
    UListButton1: TUListButton;
    btnSalvar: TUListButton;
    pnlAbas: TPanel;
    btnLista: TUListButton;
    btnRastreio: TUListButton;
    tbLista: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    gridLista: TDBCtrlGrid;
    lblObjeto: TLabel;
    lblStatus: TLabel;
    Panel7: TPanel;
    sqlRAST_RETORNO: TMemoField;
    lblIcone: TLabel;
    sqlRAST_SITUACAO: TStringField;
    sqlRAST_DATARETORNO: TSQLTimeStampField;
    lblDataHora: TLabel;
    boxList: TUScrollBox;
    UQuickButton3: TUQuickButton;
    HISTORICO: TFDQuery;
    dsHistorico: TDataSource;
    HISTORICOHIS_COD: TIntegerField;
    HISTORICOHIS_DESCRICAO: TStringField;
    pnlHistorico: TPanel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure btnRastreioClick(Sender: TObject);
    procedure btnListaClick(Sender: TObject);
    procedure gridListaPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure btnSalvarClick(Sender: TObject);
    procedure gridListaDblClick(Sender: TObject);
    procedure geraGrade;
    procedure UQuickButton3Click(Sender: TObject);
    procedure textoclick(Sender: TObject);
    procedure EdtRastreioChange(Sender: TObject);
    procedure EdtRastreioKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRastreioExit(Sender: TObject);
    procedure HISTORICOAfterOpen(DataSet: TDataSet);
    procedure ListBox1Click(Sender: TObject);
    procedure EdtRastreioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure GeraHistorico;
  public
  end;

var
  formRastreio: TformRastreio;

implementation

{$R *.dfm}

uses arquivos, Funcoes;

procedure TformRastreio.btnListaClick(Sender: TObject);
begin
  btnRastreio.Selected := false;
  pgc.ActivePage := tbLista;
  btnLista.Selected := true
end;

procedure TformRastreio.btnRastreioClick(Sender: TObject);
begin
  btnRastreio.Selected := true;
  pgc.ActivePage := tbRastreio;
  btnLista.Selected := false
end;

procedure TformRastreio.btnSalvarClick(Sender: TObject);
VAR
  N: Integer;
begin
  N := cds.RecordCount - 1;
  if sql.Locate('RAST_RASTREIO', EdtRastreio.Text) then
  begin
    SHOWMESSAGE('Rastreio já adicionado!');
    exit
  end
  ELSE
  BEGIN
    sql.Insert;
    sql['RAST_RASTREIO'] := EdtRastreio.Text;
    sql['RAST_DESCRICAO'] :=
      InputBox('Informe uma descrição para este rastreio', '',
      'Objeto ' + DateTimeToStr(dateof(now) + timeof(now)));
    sql['RAST_RETORNO'] := DateTimeToStr(ACBrSedex1.retRastreio[N].DataHora) +
      slinebreak + ACBrSedex1.retRastreio[N].Local + slinebreak +
      ACBrSedex1.retRastreio[N].Situacao;
    sql['RAST_DATARETORNO'] := ACBrSedex1.retRastreio[N].DataHora;
    sql['RAST_SITUACAO'] := ACBrSedex1.retRastreio[N].Situacao;
    sql.Post;
  END;
end;

procedure TformRastreio.Button1Click(Sender: TObject);
Var
  I: Integer;
begin
  pnlHistorico.Visible := false;
  if NOT HISTORICO.Locate('HIS_DESCRICAO', EdtRastreio.Text) then
    if EdtRastreio.GetTextLen = 13 then
    BEGIN
      HISTORICO.Insert;
      HISTORICO['HIS_DESCRICAO'] := EdtRastreio.Text;
      HISTORICO.Post;
    END;
  ACBrSedex1.Rastrear(EdtRastreio.Text);
  cds.Close;
  Try
    cds.CreateDataSet;
  except
  End;

  For I := 0 to ACBrSedex1.retRastreio.Count - 1 Do
  Begin
    cds.Append;

    cdsData.Value := ACBrSedex1.retRastreio[I].DataHora;
    cdsLocal.Value := ACBrSedex1.retRastreio[I].Local + ' - ' +
      ACBrSedex1.retRastreio[I].Observacao;
    cdsSituacao.Value := ACBrSedex1.retRastreio[I].Situacao;
    cdsObservacao.Value := ACBrSedex1.retRastreio[I].Observacao;

    cds.Post;
  End;
  geraGrade
end;

procedure TformRastreio.EdtRastreioChange(Sender: TObject);
begin
  with HISTORICO do
  begin
    filter := 'HIS_DESCRICAO' + ' like ' +
      QuotedStr('%' + EdtRastreio.Text + '%');
    filtered := true;
    if not ListBox1.Focused then
      GeraHistorico
  end;
end;

procedure TformRastreio.EdtRastreioExit(Sender: TObject);
begin
  if not ListBox1.Focused then
    pnlHistorico.Visible := false;
end;

procedure TformRastreio.EdtRastreioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) AND (ListBox1.Items.Count > 0) THEN
  BEGIN
    pnlHistorico.Visible := true;
    ListBox1.SetFocus;
  END;
end;

procedure TformRastreio.EdtRastreioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Button1Click(self);
  end;
end;

procedure TformRastreio.geraGrade;
var
  I, retorno: Integer;
  item: TUListButton;
begin
  if not cds.Active then
    cds.Open;
  cds.First;
  boxList.ClearBox;
  for I := 0 to pred(cds.RecordCount) do
  BEGIN

    item := TUListButton.Create(boxList);

    item.iconFont.Name := 'Font Awesome 6 Free Solid';
    item.iconFont.Size := 22;
    if containstext(cdsLocal.AsString, 'Objeto em trânsito - por favor aguarde')
    then
      retorno := 0;
    if containstext(cdsLocal.AsString, 'aduaneira finalizada') then
      retorno := 1;
    if containstext(cdsLocal.AsString, 'Objeto postado') then
      retorno := 2;
    if containstext(cdsLocal.AsString, 'Objeto recebido pelos Correios') then
      retorno := 3;
    if containstext(cdsLocal.AsString, 'Objeto saiu para entrega') then
      retorno := 4;
    if containstext(cdsLocal.AsString, 'incorreto') then
      retorno := 5;
    if containstext(cdsLocal.AsString, 'entregue ao') then
      retorno := 6;
    case retorno of
      0:

        item.FontIcon := '';
      1:

        item.FontIcon := '';
      2:

        item.FontIcon := '';
      3:

        item.FontIcon := '';
      4:

        item.FontIcon := '';
      5:

        item.FontIcon := '';
      6:
        item.FontIcon := '';
    end;
    item.Caption := 'Local: ' + cdsLocal.AsString;
    item.font.Name := 'Poppins';
    item.font.Size := 10;
    item.font.Style := [fsBold];
    item.Align := altop;
    item.ListStyle := lsBottomDetail;
    item.Height := 65;
    item.SelectMode := smNone;
    item.font.Color := clblack;
    item.Parent := boxList;
    item.Detail := 'Data: ' + cdsData.AsString;
    cds.NEXT;
  end;
end;

procedure TformRastreio.gridListaDblClick(Sender: TObject);
var
  N: Integer;
begin
  sql.Edit;
  EdtRastreio.Text := sql['RAST_RASTREIO'];
  Button1Click(self);
  N := cds.RecordCount - 1;
  sql['RAST_RETORNO'] := DateTimeToStr(ACBrSedex1.retRastreio[N].DataHora) +
    slinebreak + ACBrSedex1.retRastreio[N].Local + slinebreak +
    ACBrSedex1.retRastreio[N].Situacao;
  pgc.ActivePage := tbRastreio;
  btnRastreio.Selected := true;
  btnLista.Selected := false;
  gridLista.Update;
  sql.Post
end;

procedure TformRastreio.gridListaPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
VAR
  D, retorno: Integer;
  diaUtil: string;
begin
  if not sql.Active then
    sql.Open;
  if sql.RecordCount > 0 then
  begin

    // plural ou singular nos dias úteis
    D := diasuteis(dateof(sql['RAST_DATARETORNO']), dateof(now));
    if D = 1 then
      diaUtil := INTTOSTR(D) + ' dia útil'
    else
      diaUtil := INTTOSTR(D) + ' dias úteis';
    // imagem do retorno

    if containstext(sqlRAST_SITUACAO.AsString,
      'Objeto em trânsito - por favor aguarde') then
      retorno := 0;
    if containstext(sqlRAST_SITUACAO.AsString, 'aduaneira finalizada') then
      retorno := 1;
    if containstext(sqlRAST_SITUACAO.AsString, 'Objeto postado') then
      retorno := 2;
    if containstext(sqlRAST_SITUACAO.AsString, 'Objeto recebido pelos Correios')
    then
      retorno := 3;
    if containstext(sqlRAST_SITUACAO.AsString, 'Objeto saiu para entrega') then
      retorno := 4;
    if containstext(sqlRAST_SITUACAO.AsString, 'incorreto') then
      retorno := 5;
    if containstext(sqlRAST_SITUACAO.AsString, 'entregue ao') then
      retorno := 6;
    case retorno of
      0:
        lblIcone.Caption := '';
      1:
        lblIcone.Caption := '';
      2:
        lblIcone.Caption := '';
      3:
        lblIcone.Caption := '';
      4:
        lblIcone.Caption := '';
      5:
        lblIcone.Caption := '';
      6:
        lblIcone.Caption := '';
    end;
    //
    gridLista.RowCount := sql.RecordCount;
    lblObjeto.Caption := sql['RAST_RASTREIO'] + slinebreak +
      sql['RAST_DESCRICAO'];
    lblStatus.Caption := sql['RAST_SITUACAO'];
    lblStatus.Hint := sql['RAST_RETORNO'];
    lblDataHora.Caption := datetostr(dateof(sql['RAST_DATARETORNO'])) + ' - ' +
      TimeToStr(timeof(sql['RAST_DATARETORNO'])) + '                  '
      + diaUtil
  end
end;

procedure TformRastreio.gridPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
VAR
  retorno: Integer;
begin

end;

procedure TformRastreio.HISTORICOAfterOpen(DataSet: TDataSet);
begin
  if HISTORICO.RecordCount = 0 then
    pnlHistorico.Visible := false;
end;

procedure TformRastreio.ListBox1Click(Sender: TObject);
begin
  EdtRastreio.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
  pnlHistorico.Visible := false;
end;

procedure TformRastreio.ListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP OR VK_DOWN then
    EdtRastreio.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
  if Key = VK_RETURN then
  BEGIN
    EdtRastreio.Text := ListBox1.Items.Strings[ListBox1.ItemIndex];
    pnlHistorico.Visible := false
  end;
end;

procedure TformRastreio.textoclick(Sender: TObject);
begin
  EdtRastreio.Text := TLabel(Sender as TLabel).Caption;
  pnlHistorico.Visible := false;
end;

procedure TformRastreio.GeraHistorico;
var
  I: Integer;
  texto: TLabel;
begin
  pnlHistorico.Visible := true;
  ListBox1.Clear;
  HISTORICO.First;
  for I := 0 to HISTORICO.RecordCount - 1 do
  begin
    ListBox1.Items.Add(HISTORICO['HIS_DESCRICAO']);
    pnlHistorico.Height := ListBox1.Items.Count * ListBox1.ITEMHeight;
    HISTORICO.NEXT;
  end;
  If HISTORICO.RecordCount = 0 then
    pnlHistorico.Visible := false;
end;

procedure TformRastreio.UQuickButton3Click(Sender: TObject);
begin
  GeraHistorico;
end;

procedure TformRastreio.FormShow(Sender: TObject);
begin
  pgc.ActivePage := tbRastreio;
  if NOT sql.Active then
    sql.Open;
  if NOT HISTORICO.Active then
    HISTORICO.Open;
  EdtRastreio.Text := Clipboard.AsText
end;

end.
