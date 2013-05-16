unit UntPesqEvento_Rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZDataset, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinData,
  BusinessSkinForm, wwdbdatetimepicker, Mask, bsSkinBoxCtrls;

type
  TFrmPesqEvento_Rec = class(TForm)
    BitBtnFechar: TBitBtn;
    ZReadOnlyQueryPesquisa: TZReadOnlyQuery;
    DataSourcePesquisa: TDataSource;
    bsSkinDBGridTabela: TbsSkinDBGrid;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    Label1: TLabel;
    Label3: TLabel;
    bsSkinDateEditInicial: TbsSkinDateEdit;
    bsSkinDateEditFinal: TbsSkinDateEdit;
    Label2: TLabel;
    bsSkinEditDescricao: TbsSkinEdit;
    ZReadOnlyQueryPesquisaID_EVENTO_REC: TIntegerField;
    ZReadOnlyQueryPesquisaDESCRICAO: TStringField;
    ZReadOnlyQueryPesquisaDATA: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure bsSkinDateEditFinalKeyPress(Sender: TObject; var Key: Char);
    procedure bsSkinEditDescricaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqEvento_Rec: TFrmPesqEvento_Rec;

implementation

uses UntDataModule, UntPrincipal;

{$R *.dfm}

procedure TFrmPesqEvento_Rec.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZReadOnlyQueryPesquisa.Open;

    bsSkinDBGridTabela.Columns[0].Width := 47;
    bsSkinDBGridTabela.Columns[1].Width := 482;
end;

procedure TFrmPesqEvento_Rec.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPesqEvento_Rec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPesqEvento_Rec.bsSkinDBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

procedure TFrmPesqEvento_Rec.bsSkinDateEditFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZReadOnlyQueryPesquisa.Close;
        ZReadOnlyQueryPesquisa.SQL.Clear;
        ZReadOnlyQueryPesquisa.SQL.Add('SELECT DISTINCT EVENTO_RECURSO.ID_EVENTO_REC, EVENTO_RECURSO.DESCRICAO, EVENTO_RECURSO.SOLICITANTE, EVENTO_RECURSO.OUTRAS_INFORMACOES, EVENTO_RECURSO.PESSOA_CONTATO, EVENTO_RECURSO.EMAIL_PESSOA_CONTATO, EVENTO_RECURSO.EMAIL_OPCIONAL,');
        ZReadOnlyQueryPesquisa.SQL.Add('EVENTO_RECURSO.TELEFONE, EVENTO_RECURSO.CELULAR, EVENTO_RECURSO.VALOR, RESERVAS_RECURSO.DATA');
        ZReadOnlyQueryPesquisa.SQL.Add('FROM RESERVAS_RECURSO INNER JOIN EVENTO_RECURSO ON (RESERVAS_RECURSO.ID_EVENTO_REC = EVENTO_RECURSO.ID_EVENTO_REC)');
        ZReadOnlyQueryPesquisa.SQL.Add('Where RESERVAS_RECURSO.Data Between ' + QuotedStr(FormatDateTime('mm/dd/yyyy', bsSkinDateEditInicial.Date)) + ' And ' + QuotedStr(FormatDateTime('mm/dd/yyyy', bsSkinDateEditFinal.Date)) + ' ORDER BY RESERVAS_RECURSO.DATA');
        ZReadOnlyQueryPesquisa.Open;
        If Not ZReadOnlyQueryPesquisa.IsEmpty Then
            bsSkinDBGridTabela.SetFocus;

        bsSkinDBGridTabela.Columns[0].Width := 76;
        bsSkinDBGridTabela.Columns[1].Width := 355;
        bsSkinDBGridTabela.Columns[2].Width := 112;
    End;
end;

procedure TFrmPesqEvento_Rec.bsSkinEditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZReadOnlyQueryPesquisa.Close;
        ZReadOnlyQueryPesquisa.SQL.Clear;
        ZReadOnlyQueryPesquisa.SQL.Add('Select * From Evento_Recurso Where Descricao Like ' + QuotedStr(bsSkinEditDescricao.Text + '%') + ' Order By Descricao');
        ZReadOnlyQueryPesquisa.Open;
        If Not ZReadOnlyQueryPesquisa.IsEmpty Then
            bsSkinDBGridTabela.SetFocus;

        bsSkinDBGridTabela.Columns[0].Width := 76;
        bsSkinDBGridTabela.Columns[1].Width := 355;
        bsSkinDBGridTabela.Columns[2].Width := 112;
    End;
end;

end.
