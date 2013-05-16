unit UntCadAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmCadAmbiente = class(TForm)
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
    bsSkinDBEditAmbiente: TbsSkinDBEdit;
    Label3: TLabel;
    bsSkinDBEdit3: TbsSkinDBEdit;
    Label4: TLabel;
    bsSkinDBEdit4: TbsSkinDBEdit;
    Label5: TLabel;
    bsSkinDBEdit5: TbsSkinDBEdit;
    Label6: TLabel;
    bsSkinDBEdit6: TbsSkinDBEdit;
    Label7: TLabel;
    bsSkinDBEdit7: TbsSkinDBEdit;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    Label8: TLabel;
    bsSkinDBMemoObs: TbsSkinDBMemo;
    ZQueryAmbiente: TZQuery;
    DataSourceAmbiente: TDataSource;
    ZQueryAmbienteID_AMBIENTE: TIntegerField;
    ZQueryAmbienteNOME: TStringField;
    ZQueryAmbienteDESCRICAO: TStringField;
    ZQueryAmbienteCAPACIDADE_PESSOAS: TIntegerField;
    ZQueryAmbienteCUSTO: TFloatField;
    ZQueryAmbientePER_MINIMO: TStringField;
    ZQueryAmbienteHORA_INDUSTRIA: TFloatField;
    ZQueryAmbienteHORA_COMUNIDADE: TFloatField;
    ZQueryAmbienteHORA_CONVENIADO: TFloatField;
    bsSkinSpeedButtonCancelar: TbsSkinSpeedButton;
    Label9: TLabel;
    bsSkinDBEdit1: TbsSkinDBEdit;
    ButtonBuscaUnid: TButton;
    ZReadOnlyQueryUnidade: TZReadOnlyQuery;
    ZQueryAmbienteID_UNIDADE: TIntegerField;
    ZQueryAmbienteLOOK_UNIDADE: TStringField;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceAmbienteStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryAmbienteBeforePost(DataSet: TDataSet);
    procedure ButtonBuscaUnidClick(Sender: TObject);
    procedure ZQueryAmbienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadAmbiente: TFrmCadAmbiente;

implementation

uses
  UntPesqAmbiente, UntDataModule, UntPrincipal, UntPesqUnidade,
  UntPesqAmbiente2;

{$R *.dfm}

procedure TFrmCadAmbiente.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1001, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryAmbiente.Append;

    bsSkinDBEditCodigo.SetFocus;
end;

procedure TFrmCadAmbiente.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1001, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryAmbiente.Edit;
end;

procedure TFrmCadAmbiente.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadAmbiente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryAmbiente.Close;
    ZReadOnlyQueryUnidade.Close;

    Action := CaFree;
end;

procedure TFrmCadAmbiente.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If Trim(bsSkinDBEditAmbiente.Text) = '' Then
    Begin
        Application.MessageBox('Digite uma descrição para o ambiente', 'Atenção', 48);
        Exit;
    end;

    ZQueryAmbiente.Post;

    FrmDataModule.ArquivaOpcoes(IntToStr(FrmDataModule.vCodOperador));
end;

procedure TFrmCadAmbiente.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1001, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    If MessageBox(0, '', 'Atenção', 292 + MB_TASKMODAL) = 7 Then
        Exit;

    ZQueryAmbiente.Delete;
end;

procedure TFrmCadAmbiente.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZReadOnlyQueryUnidade.Open;
    ZQueryAmbiente.Open;
end;

procedure TFrmCadAmbiente.DataSourceAmbienteStateChange(Sender: TObject);
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

procedure TFrmCadAmbiente.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryAmbiente.Cancel;
end;

procedure TFrmCadAmbiente.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqAmbiente2, FrmPesqAmbiente2);
            FrmPesqAmbiente2.ShowModal;
        Finally
            If FrmPesqAmbiente2.Tag = 1 Then
            Begin
                ZQueryAmbiente.Close;
                ZQueryAmbiente.ParamByName('pIdAmbiente').Value := FrmPesqAmbiente2.ZReadOnlyQueryPesquisaID_AMBIENTE.AsInteger;
                ZQueryAmbiente.Open;
            End;

            FrmPesqAmbiente2.Free;
        End
    Else If (Key = 13) And (Not bsSkinDBMemoObs.Focused) Then
        Keybd_event(9, 0, 0, 0);
end;

procedure TFrmCadAmbiente.ZQueryAmbienteBeforePost(DataSet: TDataSet);
begin
    If ZQueryAmbiente.State In [dsInsert] Then
        ZQueryAmbienteID_AMBIENTE.Value := FrmDataModule.NovoCodigo('ID_AMBIENTE', 0);
end;

procedure TFrmCadAmbiente.ButtonBuscaUnidClick(Sender: TObject);
begin
    If ZQueryAmbiente.State In [dsInsert, dsEdit] Then
    Else
        Exit;

    Try
        Application.CreateForm(TFrmPesqUnidade, FrmPesqUnidade);
        FrmPesqUnidade.ShowModal;
    Finally
        If FrmPesqUnidade.Tag = 1 Then
            ZQueryAmbienteID_UNIDADE.Value := FrmPesqUnidade.ZReadOnlyQueryPesquisaCODUNIDADE.AsInteger;

        FrmPesqUnidade.Free;
    End;
end;

procedure TFrmCadAmbiente.ZQueryAmbienteNewRecord(DataSet: TDataSet);
begin
    ZQueryAmbienteID_UNIDADE.Value := FrmDataModule.vCodUnidade;
end;

end.
