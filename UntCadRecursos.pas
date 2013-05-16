unit UntCadRecursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmCadRecursos = class(TForm)
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
    bsSkinDBEditRecurso: TbsSkinDBEdit;
    Label3: TLabel;
    bsSkinDBEdit3: TbsSkinDBEdit;
    Label5: TLabel;
    bsSkinDBEdit5: TbsSkinDBEdit;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    ZQueryRecursos: TZQuery;
    DataSourceRecursos: TDataSource;
    bsSkinSpeedButtonCancelar: TbsSkinSpeedButton;
    ZQueryRecursosID_RECURSO: TIntegerField;
    ZQueryRecursosNUMERO_PATRIMONIO: TIntegerField;
    ZQueryRecursosDESCRICAO: TStringField;
    ZQueryRecursosLOCALIZACAO: TStringField;
    ZQueryRecursosCUSTO: TFloatField;
    ZQueryRecursosID_UNIDADE: TIntegerField;
    Label9: TLabel;
    bsSkinDBEdit1: TbsSkinDBEdit;
    ButtonBuscaUnid: TButton;
    ZReadOnlyQueryUnidade: TZReadOnlyQuery;
    ZQueryRecursosLOOK_UNIDADE: TStringField;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceRecursosStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryRecursosBeforePost(DataSet: TDataSet);
    procedure ZQueryRecursosNewRecord(DataSet: TDataSet);
    procedure ButtonBuscaUnidClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadRecursos: TFrmCadRecursos;

implementation

uses
  UntPesqAmbiente, UntPesqRecursos, UntDataModule, UntPrincipal,
  UntPesqUnidade;

{$R *.dfm}

procedure TFrmCadRecursos.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1002, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryRecursos.Append;

    bsSkinDBEditRecurso.SetFocus;
end;

procedure TFrmCadRecursos.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1002, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryRecursos.Edit;
end;

procedure TFrmCadRecursos.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadRecursos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZReadOnlyQueryUnidade.Close;
    ZQueryRecursos.Close;
    Action := CaFree;
end;

procedure TFrmCadRecursos.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If Trim(bsSkinDBEditRecurso.Text) = '' Then
    Begin
        Application.MessageBox('Digite uma descrição para o recurso', 'Atenção', 48);
        Exit;
    end;

    ZQueryRecursos.Post;
end;

procedure TFrmCadRecursos.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1002, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    If Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 7 Then
        Exit;

    ZQueryRecursos.Delete;
end;

procedure TFrmCadRecursos.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZReadOnlyQueryUnidade.Open;
    ZQueryRecursos.Open;
end;

procedure TFrmCadRecursos.DataSourceRecursosStateChange(Sender: TObject);
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

procedure TFrmCadRecursos.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryRecursos.Cancel;
end;

procedure TFrmCadRecursos.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqRecursos, FrmPesqRecursos);
            FrmPesqRecursos.ShowModal;
        Finally
            If FrmPesqRecursos.Tag = 1 Then
            Begin
                ZQueryRecursos.Close;
                ZQueryRecursos.ParamByName('pIdRecurso').Value := FrmPesqRecursos.ZReadOnlyQueryPesquisaID_RECURSO.AsInteger;
                ZQueryRecursos.Open;
            End;

            FrmPesqRecursos.Free;
        End;
end;

procedure TFrmCadRecursos.ZQueryRecursosBeforePost(DataSet: TDataSet);
begin
    If ZQueryRecursos.State In [dsInsert] Then
        ZQueryRecursosID_RECURSO.Value := FrmDataModule.NovoCodigo('ID_RECURSO', 0);
end;

procedure TFrmCadRecursos.ZQueryRecursosNewRecord(DataSet: TDataSet);
begin
    ZQueryRecursosID_UNIDADE.Value := FrmDataModule.vCodUnidade;
end;

procedure TFrmCadRecursos.ButtonBuscaUnidClick(Sender: TObject);
begin
    If ZQueryRecursos.State In [dsInsert, dsEdit] Then
    Else
        Exit;

    Try
        Application.CreateForm(TFrmPesqUnidade, FrmPesqUnidade);
        FrmPesqUnidade.ShowModal;
    Finally
        If FrmPesqUnidade.Tag = 1 Then
            ZQueryRecursosID_UNIDADE.Value := FrmPesqUnidade.ZReadOnlyQueryPesquisaCODUNIDADE.AsInteger;

        FrmPesqUnidade.Free;
    End;
end;

procedure TFrmCadRecursos.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
        Keybd_event(9, 0, 0, 0);
end;

end.
