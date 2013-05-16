unit UntPesqAmbiente2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZDataset, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinData,
  BusinessSkinForm;

type
  TFrmPesqAmbiente2 = class(TForm)
    Label2: TLabel;
    EditDescricao: TEdit;
    BitBtnFechar: TBitBtn;
    ZReadOnlyQueryPesquisa: TZReadOnlyQuery;
    DataSourcePesquisa: TDataSource;
    bsSkinDBGridTabela: TbsSkinDBGrid;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    ZReadOnlyQueryPesquisaID_AMBIENTE: TIntegerField;
    ZReadOnlyQueryPesquisaNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqAmbiente2: TFrmPesqAmbiente2;

implementation

uses UntDataModule, UntPrincipal;

{$R *.dfm}

procedure TFrmPesqAmbiente2.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZReadOnlyQueryPesquisa.Open;

    bsSkinDBGridTabela.Columns[0].Width := 64;
    bsSkinDBGridTabela.Columns[1].Width := 329;
end;

procedure TFrmPesqAmbiente2.EditDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZReadOnlyQueryPesquisa.Close;
        ZReadOnlyQueryPesquisa.ParamByName('pIdUnidade').Value := FrmDataModule.vCodUnidade;
        ZReadOnlyQueryPesquisa.ParamByName('pDescricao').Value := EditDescricao.Text + '%';

        ZReadOnlyQueryPesquisa.Open;
        If Not ZReadOnlyQueryPesquisa.IsEmpty Then
            bsSkinDBGridTabela.SetFocus;

        bsSkinDBGridTabela.Columns[0].Width := 64;
        bsSkinDBGridTabela.Columns[1].Width := 329;
    End;
end;

procedure TFrmPesqAmbiente2.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPesqAmbiente2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPesqAmbiente2.bsSkinDBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

end.
