unit UntCadEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, wwdbdatetimepicker,
  Grids, Wwdbigrd, Wwdbgrid, wwdbedit, DBGrids, DBCtrls;

type
  TFrmCadEvento = class(TForm)
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinSpeedButtonSair: TbsSkinSpeedButton;
    bsSkinSpeedButtonExcluir: TbsSkinSpeedButton;
    bsSkinSpeedButtonEditar: TbsSkinSpeedButton;
    bsSkinSpeedButtonNovo: TbsSkinSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    bsSkinDBEditDescricao: TbsSkinDBEdit;
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
    ZQueryEvento: TZQuery;
    DataSourceEvento: TDataSource;
    bsSkinSpeedButtonCancelar: TbsSkinSpeedButton;
    bsSkinDBEdit1: TbsSkinDBEdit;
    Label9: TLabel;
    bsSkinDBEdit8: TbsSkinDBEdit;
    Label10: TLabel;
    bsSkinDBEdit9: TbsSkinDBEdit;
    Label11: TLabel;
    bsSkinDBEdit10: TbsSkinDBEdit;
    Label12: TLabel;
    DataEvento: TwwDBDateTimePicker;
    dbcbTipo: TbsSkinDBLookupComboBox;
    ZQueryEventoID_EVENTO: TIntegerField;
    ZQueryEventoDATA_PREENCHIMENTO: TDateTimeField;
    ZQueryEventoID_TIPO_EVENTO: TIntegerField;
    ZQueryEventoDESCRICAO: TStringField;
    ZQueryEventoSOLICITANTE: TStringField;
    ZQueryEventoPUBLICO_CAPACIDADE: TIntegerField;
    ZQueryEventoOUTRAS_INFORMACOES: TStringField;
    ZQueryEventoAREA_RESP_EVENTO: TStringField;
    ZQueryEventoPESSOA_CONTATO: TStringField;
    ZQueryEventoCARGO_PESSOA_CONTATO: TStringField;
    ZQueryEventoEMAIL_PESSOA_CONTATO: TStringField;
    ZQueryEventoEMAIL_OPCIONAL: TStringField;
    ZQueryEventoFONE_PESSOA_CONTATO: TStringField;
    ZQueryEventoCELULAR_PESSOA_CONTATO: TStringField;
    ZQueryEventoID_USUARIO: TIntegerField;
    ZQueryReserva: TZQuery;
    DataSourceReserva: TDataSource;
    ZQueryReservaID_RESERVA: TIntegerField;
    ZQueryReservaID_EVENTO: TIntegerField;
    ZQueryReservaID_AMBIENTE: TIntegerField;
    ZQueryReservaDATA: TDateTimeField;
    ZQueryReservaSTATUS: TIntegerField;
    ZQueryReservaH_INICIO: TDateTimeField;
    ZQueryReservaH_FIM: TDateTimeField;
    ZReadOnlyQueryAmbiente: TZReadOnlyQuery;
    ZQueryReservaLook_DescAmbiente: TStringField;
    DBGridTabela: TDBGrid;
    ZReadOnlyQueryDisponib: TZReadOnlyQuery;
    ZQueryTipoEvento: TZQuery;
    DataSourceTipoEvento: TDataSource;
    ZQueryTipoEventoID_TIPO_EVENTO: TIntegerField;
    ZQueryTipoEventoNOME: TStringField;
    ZQueryEventoVALOR: TFloatField;
    Label13: TLabel;
    bsSkinDBEdit2: TbsSkinDBEdit;
    ZQueryEventoUSER_CADASTROU: TStringField;
    ZQueryEventoUSER_ALTEROU: TStringField;
    Label14: TLabel;
    ZQueryDiversos: TZQuery;
    ZQueryEventoQTDE_PES_PARTIC: TSmallintField;
    Label15: TLabel;
    bsSkinDBEdit11: TbsSkinDBEdit;
    Label16: TLabel;
    bsSkinDBEdit12: TbsSkinDBEdit;
    ZQueryEventoEMPRESA: TStringField;
    lbl1: TLabel;
    ZQueryReserva_Log: TZQuery;
    ZQueryReserva_LogID_RESERVA: TIntegerField;
    ZQueryReserva_LogID_EVENTO: TIntegerField;
    ZQueryReserva_LogID_AMBIENTE: TIntegerField;
    ZQueryReserva_LogDATA: TDateTimeField;
    ZQueryReserva_LogH_INICIO: TDateTimeField;
    ZQueryReserva_LogH_FIM: TDateTimeField;
    ZQueryReserva_LogUSER_EXCLUIU: TStringField;
    ZQueryEvento_Log: TZQuery;
    ZQueryEvento_LogID_EVENTO: TIntegerField;
    ZQueryEvento_LogDATA_PREENCHIMENTO: TDateTimeField;
    ZQueryEvento_LogID_TIPO_EVENTO: TIntegerField;
    ZQueryEvento_LogDESCRICAO: TStringField;
    ZQueryEvento_LogSOLICITANTE: TStringField;
    ZQueryEvento_LogPESSOA_CONTATO: TStringField;
    ZQueryEvento_LogCARGO_PESSOA_CONTATO: TStringField;
    ZQueryEvento_LogEMAIL_PESSOA_CONTATO: TStringField;
    ZQueryEvento_LogEMAIL_OPCIONAL: TStringField;
    ZQueryEvento_LogFONE_PESSOA_CONTATO: TStringField;
    ZQueryEvento_LogCELULAR_PESSOA_CONTATO: TStringField;
    ZQueryEvento_LogUSER_CADASTROU: TStringField;
    ZQueryEvento_LogUSER_ALTEROU: TStringField;
    ZQueryEvento_LogUSER_EXCLUIU: TStringField;
    ZQueryEvento_LogOUTRAS_INFORMACOES: TStringField;
    ZQueryReserva_LogDATA_EXCLUSAO: TDateTimeField;
    ZQueryEvento_LogDATA_EXCLUSAO: TDateTimeField;
    ZQueryEventoSTATUS: TStringField;
    ZQueryEventoPERMITE_ALTERACAO: TStringField;
    bsSkinDBCheckRadioBox1: TbsSkinDBCheckRadioBox;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceEventoStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryReservaNewRecord(DataSet: TDataSet);
    procedure DBGridTabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryEventoNewRecord(DataSet: TDataSet);
    procedure ZQueryReservaBeforePost(DataSet: TDataSet);
    procedure DBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ZQueryEventoBeforePost(DataSet: TDataSet);
    procedure ZQueryReservaID_AMBIENTEValidate(Sender: TField);
    procedure ZQueryReservaBeforeDelete(DataSet: TDataSet);
    procedure ZQueryReservaH_FIMValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function PodeAlterar(Id_Operador, Id_Ambiente: Integer): Char;
    function PodeExcluir(Id_Operador, Id_Ambiente: Integer): Char;
  public
    { Public declarations }
  end;

var
  FrmCadEvento: TFrmCadEvento;

implementation

uses
  UntDataModule, UntPesqAmbiente, UntPesqEvento, UntAgendaDiaria,
  UntPrincipal, UntPerAgendamento;

{$R *.dfm}

procedure TFrmCadEvento.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2001, 'C') Then
    Begin
        MessageBox(0, 'Sem acesso para esta opção', 'Atenção', 48 + MB_TASKMODAL);
        Exit;
    End;

    ZQueryEvento.Append;
    DataSourceReserva.AutoEdit := True;

    DataEvento.SetFocus;
end;

procedure TFrmCadEvento.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If ZQueryEventoID_EVENTO.AsInteger = 0 Then
        Exit;

    If PodeAlterar(FrmDataModule.vCodOperador, ZQueryReservaID_AMBIENTE.AsInteger) = 'N' Then
    Begin
        Application.MessageBox('Sem permissão para editar agendamento deste ambiente', 'Atenção', 48);
        Abort;
    End;

    ZQueryEvento.Edit;
    DataSourceReserva.AutoEdit := True;
end;

procedure TFrmCadEvento.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryEvento.Close;
    ZQueryReserva.Close;
    ZReadOnlyQueryAmbiente.Close;
    ZQueryTipoEvento.Close;
    ZQueryReserva_Log.Close;
    ZQueryEvento_Log.Close;

    Action := CaFree;
end;

procedure TFrmCadEvento.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If ZQueryEventoID_TIPO_EVENTO.AsString = '' Then
    begin
        Application.MessageBox('Escolha um tipo de evento', 'Atenção', 48);
        dbcbTipo.SetFocus;
        Exit;
    end;

    If Trim(ZQueryEventoDESCRICAO.AsString) = '' Then
    begin
        Application.MessageBox('Informe uma descrição para o evento', 'Atenção', 48);
        bsSkinDBEditDescricao.SetFocus;
        Exit;
    end;

    If ZQueryReserva.State In [dsInsert, dsEdit] Then
        ZQueryReserva.Post;

    ZQueryEvento.Post;
    DataSourceReserva.AutoEdit := False;
end;

procedure TFrmCadEvento.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If ZQueryEventoID_EVENTO.AsInteger = 0 Then
        Exit;

    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2001, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    If Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 7 Then
        Exit;

    While Not ZQueryReserva.Eof Do
        ZQueryReserva.Delete;

    ZQueryEvento_Log.Append;
    ZQueryEvento_LogID_EVENTO.Value := ZQueryEventoID_EVENTO.AsInteger;
    ZQueryEvento_LogDATA_PREENCHIMENTO.Value := ZQueryEventoDATA_PREENCHIMENTO.AsDateTime;
    ZQueryEvento_LogID_TIPO_EVENTO.Value := ZQueryEventoID_TIPO_EVENTO.AsInteger;
    ZQueryEvento_LogDESCRICAO.Value := ZQueryEventoDESCRICAO.AsString;
    ZQueryEvento_LogSOLICITANTE.Value := ZQueryEventoSOLICITANTE.AsString;
    ZQueryEvento_LogPESSOA_CONTATO.Value := ZQueryEventoPESSOA_CONTATO.AsString;
    ZQueryEvento_LogCARGO_PESSOA_CONTATO.Value := ZQueryEventoCARGO_PESSOA_CONTATO.AsString;
    ZQueryEvento_LogEMAIL_PESSOA_CONTATO.Value := ZQueryEventoEMAIL_PESSOA_CONTATO.AsString;
    ZQueryEvento_LogEMAIL_OPCIONAL.Value := ZQueryEventoEMAIL_OPCIONAL.AsString;
    ZQueryEvento_LogFONE_PESSOA_CONTATO.Value := ZQueryEventoFONE_PESSOA_CONTATO.AsString;
    ZQueryEvento_LogCELULAR_PESSOA_CONTATO.Value := ZQueryEventoCELULAR_PESSOA_CONTATO.AsString;
    ZQueryEvento_LogUSER_CADASTROU.Value := ZQueryEventoUSER_CADASTROU.AsString;
    ZQueryEvento_LogUSER_ALTEROU.Value := ZQueryEventoUSER_ALTEROU.AsString;
    ZQueryEvento_LogUSER_EXCLUIU.Value := FrmDataModule.vNomeOperador;
    ZQueryEvento_LogOUTRAS_INFORMACOES.Value := ZQueryEventoOUTRAS_INFORMACOES.AsString;
    ZQueryEvento_LogDATA_EXCLUSAO.Value := Now;
    ZQueryEvento_Log.Post;

    ZQueryEvento.Delete;

    DataSourceReserva.AutoEdit := False;
end;

procedure TFrmCadEvento.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZQueryTipoEvento.Open;
    ZQueryEvento.Open;
    ZQueryReserva.Open;
    ZReadOnlyQueryAmbiente.Open;
    ZQueryReserva_Log.Open;
    ZQueryEvento_Log.Open;
end;

procedure TFrmCadEvento.DataSourceEventoStateChange(Sender: TObject);
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

procedure TFrmCadEvento.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryEvento.Cancel;
    DataSourceReserva.AutoEdit := False;
end;

procedure TFrmCadEvento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If FrmCadEvento.Tag = 1 then
        Exit;

    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqEvento, FrmPesqEvento);
            FrmPesqEvento.ShowModal;
        Finally
            If FrmPesqEvento.Tag = 1 Then
            Begin
                ZQueryEvento.Close;
                ZQueryEvento.ParamByName('pIdEvento').Value := FrmPesqEvento.ZReadOnlyQueryPesquisaID_EVENTO.AsInteger;
                ZQueryEvento.Open;

                DataEvento.SetFocus;
            End;

            FrmPesqEvento.Free;
        End
    Else If (Key = 13) And (Not bsSkinDBMemoObs.Focused) Then       //Tecla Enter
        Keybd_event(9, 0, 0, 0);
end;

procedure TFrmCadEvento.ZQueryReservaNewRecord(DataSet: TDataSet);
begin
    ZQueryReservaID_EVENTO.Value := ZQueryEventoID_EVENTO.AsInteger;
    ZQueryReservaID_RESERVA.Value := FrmDataModule.NovoCodigo('ID_RESERVA',0);
end;

procedure TFrmCadEvento.DBGridTabelaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    vDataInicial, vDataFinal, vInicio, vFim: TDateTime;
    vCodAmbiente: Integer;
    vTemEvento: Char;
begin
    If FrmCadEvento.Tag = 1 then
        Exit;

    If (Key = 120) And (bsSkinSpeedButtonGravar.Enabled) Then       //Tecla F9
        Try
            Application.CreateForm(TFrmPesqAmbiente, FrmPesqAmbiente);
            FrmPesqAmbiente.ShowModal;
        Finally
            If FrmPesqAmbiente.Tag = 1 Then
            Begin
                ZQueryReserva.Edit;
                ZQueryReservaID_AMBIENTE.Value := FrmPesqAmbiente.ZReadOnlyQueryPesquisaID_AMBIENTE.AsInteger;
            End;

            FrmPesqAmbiente.Free;
        End
    Else If Key = 121 Then       //Tecla F10
        Begin
            If ZQueryReservaID_AMBIENTE.AsInteger = 0 Then
            Begin
                Application.MessageBox('Posicione em uma reserva feita' + #13 + 'antes de pressionar a tecla F10', 'Atenção', 48);
                Exit;
            End;

            Application.CreateForm(TFrmPerAgendamento, FrmPerAgendamento);
            FrmPerAgendamento.bsSkinDateEditInicial.Date := ZQueryReservaDATA.AsDateTime + 1;
            FrmPerAgendamento.bsSkinDateEditFinal.Date := ZQueryReservaDATA.AsDateTime + 1;
            FrmPerAgendamento.ShowModal;

            If FrmPerAgendamento.Tag = 1 Then
            Begin
                vDataInicial := FrmPerAgendamento.bsSkinDateEditInicial.Date;
                vDataFinal := FrmPerAgendamento.bsSkinDateEditFinal.Date;

                If (vDataFinal < vDataInicial) Or (vDataInicial > vDataFinal) Then
                Begin
                    Application.MessageBox('Período digitado incorretamente' + #13 + 'antes de pressionar a tecla F10', 'Atenção', 48);
                    Exit;
                End;

                //Pega dados do ambiente atual para o agendamento automático
                vCodAmbiente := ZQueryReservaID_AMBIENTE.AsInteger;
                vInicio := ZQueryReservaH_INICIO.AsDateTime;
                vFim := ZQueryReservaH_FIM.AsDateTime;
                While vDataInicial <= vDataFinal Do
                Begin
                    Try
                        If ZQueryReserva.Locate('Data', vDataInicial, []) Then
                        Begin
                            vDataInicial := vDataInicial + 1;
                            Continue;
                        End;

                        {Dom=0, Seg=1, Ter=2, Qua=3, Qui=4, Sex=5, Sab=6}
                        vTemEvento := 'N';
                        If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[0]) And (DayOfWeek(vDataInicial) = 1) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[1]) And (DayOfWeek(vDataInicial) = 2) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[2]) And (DayOfWeek(vDataInicial) = 3) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[3]) And (DayOfWeek(vDataInicial) = 4) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[4]) And (DayOfWeek(vDataInicial) = 5) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[5]) And (DayOfWeek(vDataInicial) = 6) Then
                            vTemEvento := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[6]) And (DayOfWeek(vDataInicial) = 7) Then
                            vTemEvento := 'S';

                        If vTemEvento = 'N' Then
                        Begin
                            vDataInicial := vDataInicial + 1;
                            Continue;
                        End;

                        ZQueryReserva.Append;
                        ZQueryReservaID_RESERVA.Value := FrmDataModule.NovoCodigo('ID_RESERVA',0);
                        ZQueryReservaID_EVENTO.Value := ZQueryEventoID_EVENTO.AsInteger;
                        ZQueryReservaID_AMBIENTE.Value := vCodAmbiente;
                        ZQueryReservaDATA.Value := vDataInicial;
                        ZQueryReservaH_INICIO.Value := vInicio;
                        ZQueryReservaH_FIM.Value := vFim;
                        ZQueryReserva.Post;
                    Except
                        ZQueryReserva.Cancel;
                        Break;
                    End;

                    vDataInicial := vDataInicial + 1;
                End;
            End;

            FrmPerAgendamento.Free;
        End
    Else If (Key = 116) And (bsSkinSpeedButtonGravar.Enabled) Then       //Tecla F5
        Begin
            If Application.MessageBox('Deseja realmente excluir', 'Atenção', 48) = 6 Then
                ZQueryReserva.Delete;
        End;
end;

procedure TFrmCadEvento.ZQueryEventoNewRecord(DataSet: TDataSet);
begin
    ZQueryEventoID_EVENTO.Value := FrmDataModule.NovoCodigo('ID_EVENTO', 0);
    ZQueryEventoUSER_CADASTROU.Value := FrmDataModule.vNomeOperador;
    ZQueryEventoDATA_PREENCHIMENTO.Value := Date;
end;

procedure TFrmCadEvento.ZQueryReservaBeforePost(DataSet: TDataSet);
begin
    If PodeAlterar(FrmDataModule.vCodOperador, ZQueryReservaID_AMBIENTE.AsInteger) = 'N' Then
    Begin
        Application.MessageBox('Sem permissão para alterar agendamento deste ambiente', 'Atenção', 48);
        Abort;
    End;

    ZReadOnlyQueryDisponib.Close;
    ZReadOnlyQueryDisponib.ParamByName('pIdAmbiente').Value := ZQueryReservaID_AMBIENTE.AsInteger;
    ZReadOnlyQueryDisponib.ParamByName('pIdReserva').Value := ZQueryReservaID_RESERVA.AsInteger;
    ZReadOnlyQueryDisponib.ParamByName('pData').Value := ZQueryReservaDATA.AsDateTime;
    ZReadOnlyQueryDisponib.ParamByName('pHoraInicial').Value := ZQueryReservaH_INICIO.AsDateTime;
    ZReadOnlyQueryDisponib.ParamByName('pHoraFinal').Value := ZQueryReservaH_FIM.AsDateTime;
    ZReadOnlyQueryDisponib.Open;
    If Not ZReadOnlyQueryDisponib.IsEmpty Then
    Begin
        Try
            Application.CreateForm(TFrmAgendaDiaria, FrmAgendaDiaria);

            FrmAgendaDiaria.Caption := 'Conflito de horário !!!';

            FrmAgendaDiaria.ZReadOnlyQueryDisponib.Close;
            FrmAgendaDiaria.ZReadOnlyQueryDisponib.ParamByName('pIdAmbiente').Value := ZQueryReservaID_AMBIENTE.AsInteger;
            FrmAgendaDiaria.ZReadOnlyQueryDisponib.ParamByName('pData').Value := ZQueryReservaDATA.AsDateTime;
            FrmAgendaDiaria.ZReadOnlyQueryDisponib.Open;
            While Not FrmAgendaDiaria.ZReadOnlyQueryDisponib.Eof Do
            Begin
                //Manda pintar os horários ocupados
                FrmAgendaDiaria.PintaGrid(FrmAgendaDiaria.ZReadOnlyQueryDisponibH_INICIO.AsDateTime, FrmAgendaDiaria.ZReadOnlyQueryDisponibH_FIM.AsDateTime);

                FrmAgendaDiaria.ZReadOnlyQueryDisponib.Next;
            End;

            FrmAgendaDiaria.ShowModal;
        Finally
            FrmAgendaDiaria.Free;
        End;

        Abort;
    End;
end;

procedure TFrmCadEvento.DBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Not bsSkinSpeedButtonGravar.Enabled Then
        Key := #0;
end;

procedure TFrmCadEvento.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Not bsSkinSpeedButtonGravar.Enabled Then
        Key := #0;
end;

procedure TFrmCadEvento.ZQueryEventoBeforePost(DataSet: TDataSet);
begin
    ZQueryEventoUSER_ALTEROU.Value := FrmDataModule.vNomeOperador;
end;

procedure TFrmCadEvento.ZQueryReservaID_AMBIENTEValidate(Sender: TField);
begin
    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('SELECT * FROM TEMP_AMB_OPERADOR WHERE ID_OPERADOR = ' + IntToStr(FrmDataModule.vCodOperador) + ' AND ID_AMBIENTE = ' + ZQueryReservaID_AMBIENTE.AsString);
    ZQueryDiversos.Open;
    if ZQueryDiversos.IsEmpty then
    begin
        Application.MessageBox('Você não tem acesso a este ambiente', 'Atenção', 48);
        Abort;
    end;
end;

function TFrmCadEvento.PodeAlterar(Id_Operador, Id_Ambiente: Integer): Char;
var
    vCodUnidade: Integer;
begin
    //Descobre a unidade
    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('SELECT Id_Unidade FROM AMBIENTES WHERE Id_ambiente = ' + IntToStr(Id_Ambiente));
    ZQueryDiversos.Open;
    If Not ZQueryDiversos.IsEmpty Then
        vCodUnidade := ZQueryDiversos.FieldByName('Id_Unidade').AsInteger;

    //Verifica permissão
    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('Select * From Ambiente_Operador Where Alt_Evento = ''V'' And Id_Unidade = ' + IntToStr(vCodUnidade) + ' And Id_Operador = ' + IntToStr(Id_Operador) + ' And Id_Ambiente = ' + IntToStr(Id_Ambiente));
    ZQueryDiversos.Open;
    If ZQueryDiversos.IsEmpty Then
        PodeAlterar := 'N'
    Else
        PodeAlterar := 'S';

    ZQueryDiversos.Close;
end;

function TFrmCadEvento.PodeExcluir(Id_Operador, Id_Ambiente: Integer): Char;
var
    vCodUnidade: Integer;
begin
    //Descobre a unidade
    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('SELECT Id_Unidade FROM AMBIENTES WHERE Id_ambiente = ' + IntToStr(Id_Ambiente));
    ZQueryDiversos.Open;
    If Not ZQueryDiversos.IsEmpty Then
        vCodUnidade := ZQueryDiversos.FieldByName('Id_Unidade').AsInteger;

    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('Select * From Ambiente_Operador Where Exc_Evento = ''V'' And Id_Unidade = ' + IntToStr(vCodUnidade) + ' And Id_Operador = ' + IntToStr(Id_Operador) + ' And Id_Ambiente = ' + IntToStr(Id_Ambiente));
    ZQueryDiversos.Open;
    If ZQueryDiversos.IsEmpty Then
        PodeExcluir := 'N'
    Else
        PodeExcluir := 'S';

    ZQueryDiversos.Close;
end;

procedure TFrmCadEvento.ZQueryReservaBeforeDelete(DataSet: TDataSet);
begin
    If PodeExcluir(FrmDataModule.vCodOperador, ZQueryReservaID_AMBIENTE.AsInteger) = 'N' Then
        Begin
            Application.MessageBox('Sem permissão para excluir agendamento deste ambiente', 'Atenção', 48);
            Abort;
        End
    Else
        begin
            ZQueryReserva_Log.Append;
            ZQueryReserva_LogID_RESERVA.Value := ZQueryReservaID_RESERVA.AsInteger;
            ZQueryReserva_LogID_EVENTO.Value := ZQueryReservaID_EVENTO.AsInteger;
            ZQueryReserva_LogID_AMBIENTE.Value := ZQueryReservaID_AMBIENTE.AsInteger;
            ZQueryReserva_LogDATA.Value := ZQueryReservaDATA.AsDateTime;
            ZQueryReserva_LogH_INICIO.Value := ZQueryReservaH_INICIO.AsDateTime;
            ZQueryReserva_LogH_FIM.Value := ZQueryReservaH_FIM.AsDateTime;
            ZQueryReserva_LogUSER_EXCLUIU.Value := FrmDataModule.vNomeOperador;
            ZQueryReserva_LogDATA_EXCLUSAO.Value := Now;
            ZQueryReserva_Log.Post;
        end;
end;

procedure TFrmCadEvento.ZQueryReservaH_FIMValidate(Sender: TField);
begin
    If ZQueryReservaH_FIM.AsDateTime < ZQueryReservaH_INICIO.AsDateTime then
    begin
        Application.MessageBox('A hora final não pode ser menor que a hora inicial', 'Atenção', 48);
        Abort;
    end;
end;

procedure TFrmCadEvento.FormShow(Sender: TObject);
begin
    If FrmCadEvento.Tag = 1 then
    begin
        ZQueryReserva.RequestLive := False;
        ZQueryEvento.RequestLive := False;

        bsSkinSpeedButtonExcluir.Enabled := False;
        bsSkinSpeedButtonEditar.Enabled := False;
        bsSkinSpeedButtonNovo.Enabled := False;
        bsSkinSpeedButtonGravar.Enabled := False;
        bsSkinSpeedButtonCancelar.Enabled := False;
    end;
end;

end.
