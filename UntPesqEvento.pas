unit UntPesqEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZDataset, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinData,
  BusinessSkinForm, wwdbdatetimepicker, Mask, bsSkinBoxCtrls;

type
  TFrmPesqEvento = class(TForm)
    BitBtnFechar: TBitBtn;
    ZReadOnlyQueryPesquisa: TZReadOnlyQuery;
    DataSourcePesquisa: TDataSource;
    bsSkinDBGridTabela: TbsSkinDBGrid;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    ZReadOnlyQueryPesquisaID_EVENTO: TIntegerField;
    ZReadOnlyQueryPesquisaDESCRICAO: TStringField;
    Label1: TLabel;
    Label3: TLabel;
    bsSkinDateEditInicial: TbsSkinDateEdit;
    bsSkinDateEditFinal: TbsSkinDateEdit;
    Label2: TLabel;
    bsSkinEditDescricao: TbsSkinEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure bsSkinDateEditFinalKeyPress(Sender: TObject; var Key: Char);
    procedure bsSkinEditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure bsSkinDateEditInicialKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqEvento: TFrmPesqEvento;

implementation

uses UntDataModule, UntPrincipal;

{$R *.dfm}

procedure TFrmPesqEvento.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZReadOnlyQueryPesquisa.Open;

    bsSkinDBGridTabela.Columns[0].Width := 47;
    bsSkinDBGridTabela.Columns[1].Width := 482;
end;

procedure TFrmPesqEvento.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPesqEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPesqEvento.bsSkinDBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

procedure TFrmPesqEvento.bsSkinDateEditFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZReadOnlyQueryPesquisa.Close;
        ZReadOnlyQueryPesquisa.SQL.Clear;
        ZReadOnlyQueryPesquisa.SQL.Add('Select Distinct Eventos.* From Eventos, reservas Where Eventos.Id_Evento = reservas.Id_Evento And Reservas.Id_Ambiente In (Select Id_Ambiente From Temp_Amb_Operador Where Id_Operador = ' +
        IntToStr(FrmDataModule.vCodOperador) + ') And Eventos.Data_Preenchimento Between ' + QuotedStr(FormatDateTime('mm/dd/yyyy', bsSkinDateEditInicial.Date)) + ' And ' + QuotedStr(FormatDateTime('mm/dd/yyyy', bsSkinDateEditFinal.Date)) + ' Order By Eventos.Descricao');
        ZReadOnlyQueryPesquisa.Open;
        If Not ZReadOnlyQueryPesquisa.IsEmpty Then
            bsSkinDBGridTabela.SetFocus;

        bsSkinDBGridTabela.Columns[0].Width := 47;
        bsSkinDBGridTabela.Columns[1].Width := 482;
    End;
end;

procedure TFrmPesqEvento.bsSkinEditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZReadOnlyQueryPesquisa.Close;
        ZReadOnlyQueryPesquisa.SQL.Clear;
        ZReadOnlyQueryPesquisa.SQL.Add('Select Distinct Eventos.* From Eventos, reservas Where Eventos.Id_Evento = reservas.Id_Evento And Reservas.Id_Ambiente In (Select Id_Ambiente From Temp_Amb_Operador Where Id_Operador = ' + IntToStr(FrmDataModule.vCodOperador) + ') And Descricao Like ''' + bsSkinEditDescricao.Text + '%'' Order By Eventos.Descricao');
        ZReadOnlyQueryPesquisa.Open;
        If Not ZReadOnlyQueryPesquisa.IsEmpty Then
            bsSkinDBGridTabela.SetFocus;

        bsSkinDBGridTabela.Columns[0].Width := 47;
        bsSkinDBGridTabela.Columns[1].Width := 482;
    End;
end;

procedure TFrmPesqEvento.bsSkinDateEditInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        bsSkinDateEditFinal.SetFocus;
end;

end.
