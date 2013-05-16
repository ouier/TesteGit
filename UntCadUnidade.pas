unit UntCadUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmCadUnidade = class(TForm)
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinSpeedButtonSair: TbsSkinSpeedButton;
    bsSkinSpeedButtonExcluir: TbsSkinSpeedButton;
    bsSkinSpeedButtonEditar: TbsSkinSpeedButton;
    bsSkinSpeedButtonNovo: TbsSkinSpeedButton;
    Label1: TLabel;
    bsSkinDBEditCodigo: TbsSkinDBEdit;
    Label2: TLabel;
    bsSkinDBEditDescricao: TbsSkinDBEdit;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    ZQueryBase: TZQuery;
    DataSourceBase: TDataSource;
    bsSkinSpeedButtonCancelar: TbsSkinSpeedButton;
    ZQueryBaseCODUNIDADE: TIntegerField;
    ZQueryBaseDESC_UNIDADE: TStringField;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceBaseStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryBaseBeforePost(DataSet: TDataSet);
    procedure ZQueryBaseBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadUnidade: TFrmCadUnidade;

implementation

uses
  UntPesqAmbiente, UntPesqRecursos, UntDataModule, UntPrincipal,
  UntPesqUnidade;

{$R *.dfm}

procedure TFrmCadUnidade.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1006, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryBase.Append;

    bsSkinDBEditDescricao.SetFocus;
end;

procedure TFrmCadUnidade.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1006, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryBase.Edit;
end;

procedure TFrmCadUnidade.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadUnidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryBase.Close;
    Action := CaFree;
end;

procedure TFrmCadUnidade.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If Trim(bsSkinDBEditDescricao.Text) = '' Then
    Begin
        Application.MessageBox('Digite uma descrição para a unidade', 'Atenção', 48);
        Exit;
    end;

    ZQueryBase.Post;
    FrmDataModule.ArquivaOpcoes(IntToStr(FrmDataModule.vCodOperador));
end;

procedure TFrmCadUnidade.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1006, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    If Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 7 Then
        Exit;

    ZQueryBase.Delete;

    FrmDataModule.ArquivaOpcoes(IntToStr(FrmDataModule.vCodOperador));
end;

procedure TFrmCadUnidade.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZQueryBase.Open;
end;

procedure TFrmCadUnidade.DataSourceBaseStateChange(Sender: TObject);
Var
    Edita : Boolean;
begin
    Edita := ((Sender As TDataSource).State In [dsinsert, dsedit]);
    bsSkinSpeedButtonNovo.Enabled := Not Edita;
    bsSkinSpeedButtonEditar.Enabled := Not Edita;
    bsSkinSpeedButtonCancelar.Enabled := Edita;
    bsSkinSpeedButtonGravar.Enabled := Edita;
    bsSkinSpeedButtonExcluir.Enabled := Not Edita;
end;

procedure TFrmCadUnidade.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryBase.Cancel;
end;

procedure TFrmCadUnidade.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqUnidade, FrmPesqUnidade);
            FrmPesqUnidade.ShowModal;
        Finally
            If FrmPesqUnidade.Tag = 1 Then
            Begin
                ZQueryBase.Close;
                ZQueryBase.ParamByName('pCodUnidade').Value := FrmPesqUnidade.ZReadOnlyQueryPesquisaCODUNIDADE.AsInteger;
                ZQueryBase.Open;
            End;

            FrmPesqUnidade.Free;
        End;
end;

procedure TFrmCadUnidade.ZQueryBaseBeforePost(DataSet: TDataSet);
begin
    If ZQueryBase.State In [dsInsert] Then
        ZQueryBaseCODUNIDADE.Value := FrmDataModule.NovoCodigo('Unidade', 0);
end;

procedure TFrmCadUnidade.ZQueryBaseBeforeDelete(DataSet: TDataSet);
begin
    FrmDataModule.NovoCodigo('Unidade', ZQueryBaseCODUNIDADE.AsInteger);
end;

end.
