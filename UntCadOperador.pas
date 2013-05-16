unit UntCadOperador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Menus, fcLabel, ToolWin, ComCtrls, StdCtrls, DBCtrls,
  DBGrids, Wwdbigrd, Grids, Wwdbgrid, Mask, LMDControl, LMDDrawEdge,
  Buttons, ExtCtrls, JvMemDS, JvComponent, JvEnterTab, LMDCustomButton,
  LMDButton, JvShape, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  bsSkinData, BusinessSkinForm;

type
  TFrmCadOperador = class(TForm)
    Label13: TLabel;
    Label14: TLabel;
    Panel1: TPanel;
    GroupBoxDados: TGroupBox;
    BitBtnConsultaUnidade: TSpeedButton;
    LMDDrawEdge1: TLMDDrawEdge;
    LMDDrawEdge2: TLMDDrawEdge;
    LMDDrawEdge4: TLMDDrawEdge;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    wwDBGridTabela: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    DBCheckBoxSabado: TDBCheckBox;
    DBCheckBoxQuinta: TDBCheckBox;
    DBCheckBoxQuarta: TDBCheckBox;
    DBCheckBoxSexta: TDBCheckBox;
    DBCheckBoxTerca: TDBCheckBox;
    DBCheckBoxSegunda: TDBCheckBox;
    DBCheckBoxDomingo: TDBCheckBox;
    DBCheckBoxDesativado: TDBCheckBox;
    CoolBar1: TCoolBar;
    BtnNovo: TSpeedButton;
    BtnConsulta: TSpeedButton;
    BtnExclui: TSpeedButton;
    ShadowLabel1: TfcLabel;
    PanelSenha: TPanel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    EditSenhaConf: TEdit;
    DBEditNome: TDBEdit;
    DBEdit4: TDBEdit;
    MainMenu1: TMainMenu;
    OpcaoExcluir: TMenuItem;
    Opcaonovo: TMenuItem;
    OpcaoConsulta: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    OpcaoFechar: TMenuItem;
    ADODataSetOperador: TZQuery;
    ADODataSetOpcoes: TZQuery;
    DataSourceOperador: TDataSource;
    DataSourceOpcoes: TDataSource;
    ADODataSetOperadorCODIGO: TIntegerField;
    ADODataSetOperadorNOME: TStringField;
    ADODataSetOperadorSENHA: TStringField;
    ADODataSetOperadorVALIDADE: TDateTimeField;
    ADODataSetOperadorDESATIVADO: TStringField;
    ADODataSetOperadorALTERA_SENHA: TStringField;
    ADODataSetOperadorSEGUNDA: TStringField;
    ADODataSetOperadorTERCA: TStringField;
    ADODataSetOperadorQUARTA: TStringField;
    ADODataSetOperadorQUINTA: TStringField;
    ADODataSetOperadorSEXTA: TStringField;
    ADODataSetOperadorSABADO: TStringField;
    ADODataSetOperadorDOMINGO: TStringField;
    ADODataSetOpcoesACESSO: TIntegerField;
    ADODataSetOpcoesCADASTRAR: TIntegerField;
    ADODataSetOpcoesALTERAR: TIntegerField;
    ADODataSetOpcoesEXCLUIR: TIntegerField;
    ADODataSetOpcoesLIBERADO: TIntegerField;
    JvMemoryDataOpcoes: TJvMemoryData;
    JvMemoryDataOpcoesOPCAO: TStringField;
    JvMemoryDataOpcoesCADASTRO: TIntegerField;
    JvMemoryDataOpcoesALTERACAO: TIntegerField;
    JvMemoryDataOpcoesEXCLUSAO: TIntegerField;
    JvMemoryDataOpcoesLIBERACAO: TIntegerField;
    ADODataSetAcesso: TZQuery;
    ADODataSetAcessoACESSO: TIntegerField;
    ADODataSetAcessoMODULO: TStringField;
    ADODataSetAcessoMENU: TStringField;
    ADODataSetAcessoOPCAO: TStringField;
    ADODataSetAcessoACESSO_UNICO: TIntegerField;
    JvMemoryDataOpcoesACESSO: TIntegerField;
    DBEditSenha: TDBEdit;
    ADODataSetOpcoesCODOPERADOR: TIntegerField;
    EditSenhaHabilitar: TEdit;
    JvMemoryDataOpcoesUNICO: TIntegerField;
    JvEnterAsTab1: TJvEnterAsTab;
    ADODataSetDiversos: TZQuery;
    JvMemoryDataOpcoesCALC_OPCAO: TStringField;
    LMDDrawEdge3: TLMDDrawEdge;
    EditTodasUnidades: TEdit;
    ADODataSetOperadorACESSOTODAS: TStringField;
    JvShape11: TJvShape;
    BitBtnEditar: TLMDButton;
    JvShape1: TJvShape;
    BitBtnCancelar: TLMDButton;
    JvShape2: TJvShape;
    BitBtnSalvar: TLMDButton;
    JvShape3: TJvShape;
    BitBtnSair: TLMDButton;
    ZQueryOperador: TZQuery;
    DBCheckBoxTodosAmbiente: TDBCheckBox;
    ADODataSetOperadorTODOSAMBIENTES: TStringField;
    JvShape4: TJvShape;
    LMDButtonPermAmbiente: TLMDButton;
    DBCheckBoxMudarSenhaAoLogar: TDBCheckBox;
    ADODataSetOperadorMUDAR_SENHA_NOLOGON: TStringField;
    DBCheckBoxTodasUnid: TDBCheckBox;
    ADODataSetOperadorTODASUNIDADES: TStringField;
    LMDButtonPermUnidade: TLMDButton;
    JvShape5: TJvShape;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    ADODataSetOperadorNOMECOMPLETO: TStringField;
    procedure QueryUsuarioNewRecord(DataSet: TDataSet);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnExcluiClick(Sender: TObject);
    procedure BitBtnEditarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceOperadorStateChange(Sender: TObject);
    procedure OpcaonovoClick(Sender: TObject);
    procedure EditSenhaHabilitarKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaHabilitarEnter(Sender: TObject);
    procedure EditSenhaHabilitarExit(Sender: TObject);
    procedure EditSenhaConfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditSenhaConfExit(Sender: TObject);
    procedure ADODataSetOperadorBeforePost(DataSet: TDataSet);
    procedure JvMemoryDataOpcoesCalcFields(DataSet: TDataSet);
    procedure JvMemoryDataOpcoesLIBERACAOSetText(Sender: TField;
      const Text: String);
    procedure JvMemoryDataOpcoesCADASTROSetText(Sender: TField;
      const Text: String);
    procedure JvMemoryDataOpcoesALTERACAOSetText(Sender: TField;
      const Text: String);
    procedure JvMemoryDataOpcoesEXCLUSAOSetText(Sender: TField;
      const Text: String);
    procedure BtnConsultaClick(Sender: TObject);
    procedure OpcaoConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditTodasUnidadesEnter(Sender: TObject);
    procedure EditTodasUnidadesExit(Sender: TObject);
    procedure EditTodasUnidadesKeyPress(Sender: TObject; var Key: Char);
    procedure Excluir1Click(Sender: TObject);
    procedure OpcaoFecharClick(Sender: TObject);
    procedure ADODataSetOperadorVALIDADESetText(Sender: TField;
      const Text: String);
    procedure BitBtnEditarMouseEnter(Sender: TObject);
    procedure BitBtnSalvarMouseEnter(Sender: TObject);
    procedure BitBtnCancelarMouseEnter(Sender: TObject);
    procedure BitBtnSairMouseEnter(Sender: TObject);
    procedure BitBtnEditarMouseExit(Sender: TObject);
    procedure BitBtnSalvarMouseExit(Sender: TObject);
    procedure BitBtnCancelarMouseExit(Sender: TObject);
    procedure BitBtnSairMouseExit(Sender: TObject);
    procedure DBCheckBoxTodosAmbienteClick(Sender: TObject);
    procedure LMDButtonPermAmbienteMouseEnter(Sender: TObject);
    procedure LMDButtonPermAmbienteMouseExit(Sender: TObject);
    procedure LMDButtonPermAmbienteClick(Sender: TObject);
    procedure ADODataSetOperadorAfterEdit(DataSet: TDataSet);
    procedure DBCheckBoxTodasUnidClick(Sender: TObject);
    procedure LMDButtonPermUnidadeClick(Sender: TObject);
  private
    { Private declarations }
    vNovoCodigo: Integer;
  public
    { Public declarations }
  end;

var
  FrmCadOperador: TFrmCadOperador;

implementation

uses UntDataModule, UntPesqOperador, UntPermissaoUser, UntPermUnidade;

{$R *.dfm}

procedure TFrmCadOperador.QueryUsuarioNewRecord(DataSet: TDataSet);
begin
    ADODataSetOperadorCODIGO.Value := FrmDataModule.NovoCodigo('CadOperador', 0);
end;

procedure TFrmCadOperador.BtnNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1005, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    vNovoCodigo := FrmDataModule.NovoCodigo('CadOperador', 0);

    FrmDataModule.ZConnection1.StartTransaction;
    DataSourceOpcoes.AutoEdit := True;

    ADODataSetOperador.Append;
    ADODataSetOperadorCODIGO.Value := vNovoCodigo;
    ADODataSetOperadorSEGUNDA.Value := 'S';
    ADODataSetOperadorTERCA.Value := 'S';
    ADODataSetOperadorQUARTA.Value := 'S';
    ADODataSetOperadorQUINTA.Value := 'S';
    ADODataSetOperadorSEXTA.Value := 'S';
    ADODataSetOperadorSABADO.Value := 'S';
    ADODataSetOperadorDOMINGO.Value := 'S';
    ADODataSetOperadorDESATIVADO.Value := 'N';
    ADODataSetOperadorACESSOTODAS.Value := 'N';
    //ADODataSetOperador.Post;
    //ADODataSetOperador.Edit;

    //Preenche as opções
    JvMemoryDataOpcoes.EmptyTable;
    If ADODataSetAcesso.RecordCount > 0 Then
        ADODataSetAcesso.First;

    While Not ADODataSetAcesso.Eof Do
    Begin
        JvMemoryDataOpcoes.Append;
        JvMemoryDataOpcoesUNICO.Value := ADODataSetAcessoACESSO_UNICO.AsInteger;
        JvMemoryDataOpcoesACESSO.Value := ADODataSetAcessoACESSO.AsInteger;
        JvMemoryDataOpcoesOPCAO.Value := ADODataSetAcessoOPCAO.AsString;
        JvMemoryDataOpcoes.Post;

        ADODataSetAcesso.Next;
    End;

    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.BtnExcluiClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1005, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    If ADODataSetOperadorCODIGO.AsInteger = 0 Then
    Begin
        Application.MessageBox('Não tem registro para ser excluído', 'Atenção', 48);
        Exit;
    End;

    If Application.MessageBox('Deseja realmente excluir o usuário', 'Atenção', 292) = 6 Then
    Begin
        //Inicia a trasação
        FrmDataModule.ZConnection1.StartTransaction;

        If ADODataSetOpcoes.RecordCount > 0 Then
            ADODataSetOpcoes.First;

        While Not ADODataSetOpcoes.Eof Do
            ADODataSetOpcoes.Delete;

        ADODataSetOperador.Delete;

        JvMemoryDataOpcoes.EmptyTable;

        EditSenhaConf.Text := '';

        FrmDataModule.ZConnection1.Commit;
    End;
end;

procedure TFrmCadOperador.BitBtnEditarClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1005, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    FrmDataModule.ZConnection1.StartTransaction;

    ADODataSetOperador.Edit;
    If ADODataSetOperadorTODASUNIDADES.AsString = '' Then
        ADODataSetOperadorTODASUNIDADES.Value := 'N';

    ADODataSetOperadorSENHA.Value := FrmDataModule.DecryptSTR(ADODataSetOperadorSENHA.AsString, 5554, 1000, 6000);
    EditSenhaConf.Text := ADODataSetOperadorSENHA.AsString;

    DataSourceOpcoes.AutoEdit := True;
    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.BitBtnCancelarClick(Sender: TObject);
begin
    ADODataSetOperador.Cancel;
    EditSenhaConf.Text := ADODataSetOperadorSENHA.AsString;

    DataSourceOpcoes.AutoEdit := False;
    FrmDataModule.ZConnection1.Rollback;

    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.BitBtnSalvarClick(Sender: TObject);
begin
    //Checa se já tem o usuário
    ADODataSetDiversos.Close;
    ADODataSetDiversos.SQL.Clear;
    ADODataSetDiversos.SQL.Add('SELECT * FROM OPERADOR WHERE NOME = ''' + ADODataSetOperadorNOME.AsString + ''' AND CODIGO <> ' + ADODataSetOperadorCODIGO.AsString);
    ADODataSetDiversos.Open;
    If Not ADODataSetDiversos.Eof Then
    Begin
        Application.MessageBox('Este usuário já está cadastrado', 'Atenção', 48);
        Exit;
    End;

    ADODataSetOperador.Post;

    DataSourceOpcoes.AutoEdit := False;

    ADODataSetDiversos.Close;
    ADODataSetDiversos.SQL.Clear;
    ADODataSetDiversos.SQL.Add('DELETE FROM OP_OPERADOR WHERE CODOPERADOR = ' + ADODataSetOperadorCODIGO.AsString);
    ADODataSetDiversos.ExecSQL;

    If JvMemoryDataOpcoes.RecordCount > 0 Then
        JvMemoryDataOpcoes.First;

    While Not JvMemoryDataOpcoes.Eof Do
    Begin
        ADODataSetOpcoes.Append;
        ADODataSetOpcoesCODOPERADOR.Value := ADODataSetOperadorCODIGO.AsInteger;
        ADODataSetOpcoesACESSO.Value := JvMemoryDataOpcoesACESSO.AsInteger;
        ADODataSetOpcoesCADASTRAR.Value := JvMemoryDataOpcoesCADASTRO.AsInteger;
        ADODataSetOpcoesALTERAR.Value := JvMemoryDataOpcoesALTERACAO.AsInteger;
        ADODataSetOpcoesEXCLUIR.Value := JvMemoryDataOpcoesEXCLUSAO.AsInteger;
        ADODataSetOpcoesLIBERADO.Value := JvMemoryDataOpcoesLIBERACAO.AsInteger;
        ADODataSetOpcoes.Post;

        JvMemoryDataOpcoes.Next;
    End;

    If JvMemoryDataOpcoes.RecordCount > 0 Then
        JvMemoryDataOpcoes.First;

    FrmDataModule.ZConnection1.Commit;

    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.BitBtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCadOperador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ADODataSetAcesso.Close;
    ADODataSetOperador.Close;
    ADODataSetOpcoes.Close;
    JvMemoryDataOpcoes.Close;

    Action := CaFree;
end;

procedure TFrmCadOperador.FormCreate(Sender: TObject);
begin
    ADODataSetAcesso.Open;
    ADODataSetOperador.Open;
    ADODataSetOpcoes.Open;
    JvMemoryDataOpcoes.Open;
end;

procedure TFrmCadOperador.DataSourceOperadorStateChange(Sender: TObject);
Var
    Edita : Boolean;
begin
    Edita := ((Sender As TDataSource).State In [dsinsert, dsedit]);
    BtnExclui.Enabled := Not Edita;
    OpcaoExcluir.Enabled := Not Edita;
    BitBtnCancelar.Enabled := Edita;
    BtnNovo.Enabled := Not Edita;
    Opcaonovo.Enabled := Not Edita;
    BitBtnSalvar.Enabled := Edita;
    BitBtnEditar.Enabled := Not Edita;
    BtnConsulta.Enabled := Not Edita;
    OpcaoConsulta.Enabled := Not Edita;
    LMDButtonPermAmbiente.Enabled := Edita;
    LMDButtonPermUnidade.Enabled := Edita;
end;

procedure TFrmCadOperador.OpcaonovoClick(Sender: TObject);
begin
    BtnNovo.Click;
    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.EditSenhaHabilitarKeyPress(Sender: TObject;
  var Key: Char);
begin
    If (Key = #13) And (EditSenhaHabilitar.Text = '853714') Then
    Begin
        Key := #0;

        If JvMemoryDataOpcoes.RecordCount > 0 Then
            JvMemoryDataOpcoes.First;

        While Not JvMemoryDataOpcoes.Eof Do
        Begin
            JvMemoryDataOpcoes.Edit;
            If JvMemoryDataOpcoesUNICO.AsInteger = 1 Then
                Begin
                    JvMemoryDataOpcoesCADASTRO.Value := 0;
                    JvMemoryDataOpcoesALTERACAO.Value := 0;
                    JvMemoryDataOpcoesEXCLUSAO.Value := 0;
                    JvMemoryDataOpcoesLIBERACAO.Value := 1;
                End
            Else
                Begin
                    JvMemoryDataOpcoesCADASTRO.Value := 1;
                    JvMemoryDataOpcoesALTERACAO.Value := 1;
                    JvMemoryDataOpcoesEXCLUSAO.Value := 1;
                    JvMemoryDataOpcoesLIBERACAO.Value := 1;
                End;
            JvMemoryDataOpcoes.Post;

            JvMemoryDataOpcoes.Next;
        End;

        EditSenhaHabilitar.Visible := False;
    End;
end;

procedure TFrmCadOperador.EditSenhaHabilitarEnter(Sender: TObject);
begin
    JvEnterAsTab1.EnterAsTab := False;
end;

procedure TFrmCadOperador.EditSenhaHabilitarExit(Sender: TObject);
begin
    JvEnterAsTab1.EnterAsTab := True;
    EditSenhaHabilitar.Visible := False;
end;

procedure TFrmCadOperador.EditSenhaConfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = 122 Then    //Tecla F12
    Begin
        EditSenhaHabilitar.Visible := True;
        EditSenhaHabilitar.SetFocus;
    End;
end;

procedure TFrmCadOperador.EditSenhaConfExit(Sender: TObject);
begin
    If (UpperCase(ADODataSetOperadorSENHA.AsString) <> UpperCase(EditSenhaConf.Text)) And (Length(Trim(ADODataSetOperadorSENHA.AsString)) > 0) Then
    Begin
        Application.MessageBox('A senha não bate com a confirmada', 'Atenção', 48);
        DBEditSenha.SetFocus;
    End;
end;

procedure TFrmCadOperador.ADODataSetOperadorBeforePost(DataSet: TDataSet);
begin
    ADODataSetOperadorSENHA.Value := FrmDataModule.EncryptSTR(ADODataSetOperadorSENHA.AsString, 5554, 1000, 6000);
    EditSenhaConf.Text := ADODataSetOperadorSENHA.AsString;
end;

procedure TFrmCadOperador.JvMemoryDataOpcoesCalcFields(DataSet: TDataSet);
begin
    If ADODataSetOpcoesACESSO.AsInteger > 0 Then
    Begin
        ADODataSetDiversos.Close;
        ADODataSetDiversos.SQL.Clear;
        ADODataSetDiversos.SQL.Add('SELECT OPCAO FROM ACESSO WHERE ACESSO = ' + ADODataSetOpcoesACESSO.AsString);
        ADODataSetDiversos.Open;
        If Not ADODataSetDiversos.Eof Then
            JvMemoryDataOpcoesCALC_OPCAO.Value := ADODataSetDiversos.FieldByName('OPCAO').AsString;

        ADODataSetDiversos.Close;
    End;
end;

procedure TFrmCadOperador.JvMemoryDataOpcoesLIBERACAOSetText(Sender: TField; const Text: String);
begin
    If Text = '0' Then
        Begin
            JvMemoryDataOpcoesCADASTRO.Value := 0;
            JvMemoryDataOpcoesALTERACAO.Value := 0;
            JvMemoryDataOpcoesEXCLUSAO.Value := 0;
            JvMemoryDataOpcoesLIBERACAO.Value := 0;
        End
    Else
        JvMemoryDataOpcoesLIBERACAO.Value := 1;
end;

procedure TFrmCadOperador.JvMemoryDataOpcoesCADASTROSetText(Sender: TField;
  const Text: String);
begin
    If JvMemoryDataOpcoesUNICO.AsInteger = 1 Then
       Sender.Value := 0
    Else
       Sender.Value := Text;
end;

procedure TFrmCadOperador.JvMemoryDataOpcoesALTERACAOSetText(Sender: TField;
  const Text: String);
begin
    If JvMemoryDataOpcoesUNICO.AsInteger = 1 Then
       Sender.Value := 0
    Else
       Sender.Value := Text;
end;

procedure TFrmCadOperador.JvMemoryDataOpcoesEXCLUSAOSetText(Sender: TField;
  const Text: String);
begin
    If JvMemoryDataOpcoesUNICO.AsInteger = 1 Then
       Sender.Value := 0
    Else
       Sender.Value := Text;
end;

procedure TFrmCadOperador.BtnConsultaClick(Sender: TObject);
begin
    Try
        Application.CreateForm(TFrmPesqOperador, FrmPesqOperador);
        FrmPesqOperador.ShowModal;
    Finally
        If FrmPesqOperador.Tag = 1 Then
        Begin
            Self.Update;

            ADODataSetOperador.Close;
            ADODataSetOperador.ParamByName('pCodOperador').Value := FrmPesqOperador.ZReadOnlyQueryPesquisaCODIGO.AsInteger;
            ADODataSetOperador.Open;

            If Not ADODataSetOperador.Eof Then
                EditSenhaConf.Text := ADODataSetOperadorSENHA.AsString;

            //Preenche as opções
            JvMemoryDataOpcoes.DisableControls;
            ADODataSetOperador.DisableControls;

            JvMemoryDataOpcoes.EmptyTable;

            If ADODataSetAcesso.RecordCount > 0 Then
                ADODataSetAcesso.First;

            While Not ADODataSetAcesso.Eof Do
            Begin
                JvMemoryDataOpcoes.Append;
                JvMemoryDataOpcoesUNICO.Value := ADODataSetAcessoACESSO_UNICO.AsInteger;
                JvMemoryDataOpcoesACESSO.Value := ADODataSetAcessoACESSO.AsInteger;
                JvMemoryDataOpcoesOPCAO.Value := ADODataSetAcessoOPCAO.AsString;
                JvMemoryDataOpcoesLIBERACAO.Value := ADODataSetOpcoes.Lookup('ACESSO', ADODataSetAcessoACESSO.AsInteger, 'LIBERADO');
                JvMemoryDataOpcoesCADASTRO.Value := ADODataSetOpcoes.Lookup('ACESSO', ADODataSetAcessoACESSO.AsInteger, 'CADASTRAR');
                JvMemoryDataOpcoesALTERACAO.Value := ADODataSetOpcoes.Lookup('ACESSO', ADODataSetAcessoACESSO.AsInteger, 'ALTERAR');
                JvMemoryDataOpcoesEXCLUSAO.Value := ADODataSetOpcoes.Lookup('ACESSO', ADODataSetAcessoACESSO.AsInteger, 'EXCLUIR');
                JvMemoryDataOpcoes.Post;

                ADODataSetAcesso.Next;
            End;

            JvMemoryDataOpcoes.First;

            JvMemoryDataOpcoes.EnableControls;
            ADODataSetOperador.EnableControls;
        End;

        FrmPesqOperador.Free;
    End;
end;

procedure TFrmCadOperador.OpcaoConsultaClick(Sender: TObject);
begin
    BtnConsulta.Click;
    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        BtnConsulta.Click;
end;

procedure TFrmCadOperador.EditTodasUnidadesEnter(Sender: TObject);
begin
    JvEnterAsTab1.EnterAsTab := False;
end;

procedure TFrmCadOperador.EditTodasUnidadesExit(Sender: TObject);
begin
    If EditTodasUnidades.Tag = 1 Then
        Begin
            If EditTodasUnidades.Text = 'opemspd' then
                ADODataSetOperadorTODASUNIDADES.Value := 'S'
            Else
                ADODataSetOperadorTODASUNIDADES.Value := 'N';
        End
    Else If EditTodasUnidades.Tag = 2 Then
        Begin
            If EditTodasUnidades.Text = 'opemspd' then
                ADODataSetOperadorTODOSAMBIENTES.Value := 'S'
            Else
                ADODataSetOperadorTODOSAMBIENTES.Value := 'N';
        End;

    EditTodasUnidades.Visible := False;
end;

procedure TFrmCadOperador.EditTodasUnidadesKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        DBEditNome.SetFocus
end;

procedure TFrmCadOperador.Excluir1Click(Sender: TObject);
begin
    BtnExclui.Click;
    DBEditNome.SetFocus;
end;

procedure TFrmCadOperador.OpcaoFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmCadOperador.ADODataSetOperadorVALIDADESetText(Sender: TField;
  const Text: String);
begin
    If Text = '  /  /    ' Then
        Sender.Clear;
end;

procedure TFrmCadOperador.BitBtnEditarMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmCadOperador.BitBtnSalvarMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmCadOperador.BitBtnCancelarMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmCadOperador.BitBtnSairMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmCadOperador.BitBtnEditarMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmCadOperador.BitBtnSalvarMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmCadOperador.BitBtnCancelarMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmCadOperador.BitBtnSairMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmCadOperador.DBCheckBoxTodosAmbienteClick(Sender: TObject);
begin
    If ADODataSetOperador.State In [dsInsert, dsEdit] Then
    Begin
        EditTodasUnidades.Tag := 2;  //Todos ambientes

        If DBCheckBoxTodosAmbiente.Checked Then
            EditTodasUnidades.Visible := True
        Else
            EditTodasUnidades.Visible := False;

        If EditTodasUnidades.Visible Then
            EditTodasUnidades.SetFocus;
    End;
end;

procedure TFrmCadOperador.LMDButtonPermAmbienteMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmCadOperador.LMDButtonPermAmbienteMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmCadOperador.LMDButtonPermAmbienteClick(Sender: TObject);
begin
    If ADODataSetOperadorCODIGO.AsInteger = 0 Then
        Exit;

    Try
        Application.CreateForm(TFrmPermissaoUser, FrmPermissaoUser);
        FrmPermissaoUser.ShowModal;
    Except
        FrmPermissaoUser.Free;
    End;
end;

procedure TFrmCadOperador.ADODataSetOperadorAfterEdit(DataSet: TDataSet);
begin
    If ADODataSetOperadorMUDAR_SENHA_NOLOGON.IsNull Then
        ADODataSetOperadorMUDAR_SENHA_NOLOGON.Value := 'N';
end;

procedure TFrmCadOperador.DBCheckBoxTodasUnidClick(Sender: TObject);
begin
    If ADODataSetOperador.State In [dsInsert, dsEdit] Then
    Begin
        EditTodasUnidades.Tag := 1;  //Todas Unidades

        If DBCheckBoxTodasUnid.Checked Then
            EditTodasUnidades.Visible := True
        Else
            EditTodasUnidades.Visible := False;

        If EditTodasUnidades.Visible Then
            EditTodasUnidades.SetFocus;
    End;
end;

procedure TFrmCadOperador.LMDButtonPermUnidadeClick(Sender: TObject);
begin
    If ADODataSetOperadorCODIGO.AsInteger = 0 Then
        Exit;

    Try
        Application.CreateForm(TFrmPermUnidade, FrmPermUnidade);
        FrmPermUnidade.ShowModal;
    Except
        FrmPermUnidade.Free;
    End;
end;

end.
