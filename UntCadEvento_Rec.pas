unit UntCadEvento_Rec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, wwdbdatetimepicker,
  Grids, Wwdbigrd, Wwdbgrid, wwdbedit, DBGrids;

type
  TFrmCadEvento_Rec = class(TForm)
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinSpeedButtonSair: TbsSkinSpeedButton;
    bsSkinSpeedButtonExcluir: TbsSkinSpeedButton;
    bsSkinSpeedButtonEditar: TbsSkinSpeedButton;
    bsSkinSpeedButtonNovo: TbsSkinSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    bsSkinDBEdit3: TbsSkinDBEdit;
    Label5: TLabel;
    bsSkinDBEdit5: TbsSkinDBEdit;
    Label7: TLabel;
    bsSkinDBEdit7: TbsSkinDBEdit;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    Label8: TLabel;
    bsSkinDBMemoObs: TbsSkinDBMemo;
    ZQueryEvento_Rec: TZQuery;
    DataSourceEvento_Rec: TDataSource;
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
    ZQueryReserva_Rec: TZQuery;
    DataSourceReserva_Rec: TDataSource;
    ZReadOnlyQueryRecurso: TZReadOnlyQuery;
    DBGridTabela: TDBGrid;
    ZReadOnlyQueryDisponib: TZReadOnlyQuery;
    Label13: TLabel;
    bsSkinDBEdit2: TbsSkinDBEdit;
    ZQueryReserva_RecID_RESERVA_REC: TIntegerField;
    ZQueryReserva_RecID_EVENTO_REC: TIntegerField;
    ZQueryReserva_RecID_RECURSO: TIntegerField;
    ZQueryReserva_RecDATA: TDateTimeField;
    ZQueryReserva_RecSTATUS: TIntegerField;
    ZQueryReserva_RecH_INICIO: TDateTimeField;
    ZQueryReserva_RecH_FIM: TDateTimeField;
    ZQueryReserva_RecLOOK_RECURSO: TStringField;
    ZReadOnlyQueryDisponibID_RESERVA_REC: TIntegerField;
    ZReadOnlyQueryDisponibID_EVENTO_REC: TIntegerField;
    ZReadOnlyQueryDisponibID_RECURSO: TIntegerField;
    ZReadOnlyQueryDisponibDATA: TDateTimeField;
    ZReadOnlyQueryDisponibSTATUS: TIntegerField;
    ZReadOnlyQueryDisponibH_INICIO: TDateTimeField;
    ZReadOnlyQueryDisponibH_FIM: TDateTimeField;
    ZQueryEvento_RecID_EVENTO_REC: TIntegerField;
    ZQueryEvento_RecDATA: TDateTimeField;
    ZQueryEvento_RecDESCRICAO: TStringField;
    ZQueryEvento_RecSOLICITANTE: TStringField;
    ZQueryEvento_RecOUTRAS_INFORMACOES: TStringField;
    ZQueryEvento_RecPESSOA_CONTATO: TStringField;
    ZQueryEvento_RecEMAIL_PESSOA_CONTATO: TStringField;
    ZQueryEvento_RecEMAIL_OPCIONAL: TStringField;
    ZQueryEvento_RecTELEFONE: TStringField;
    ZQueryEvento_RecCELULAR: TStringField;
    ZQueryEvento_RecVALOR: TFloatField;
    lbl2: TLabel;
    lbl1: TLabel;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceEvento_RecStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryReserva_RecNewRecord(DataSet: TDataSet);
    procedure DBGridTabelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryEvento_RecNewRecord(DataSet: TDataSet);
    procedure ZQueryReserva_RecBeforePost(DataSet: TDataSet);
    procedure DBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEvento_Rec: TFrmCadEvento_Rec;

implementation

uses
  UntDataModule, UntPesqAmbiente, UntPesqEvento, UntAgendaDiaria,
  UntPrincipal, UntPesqRecursos, UntAgendaDiariaRec, UntPesqEvento_Rec,
  UntPerAgendamento;

{$R *.dfm}

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2002, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryEvento_Rec.Append;
    DataSourceReserva_Rec.AutoEdit := True;

    DataEvento.SetFocus;
end;

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If ZQueryEvento_RecID_EVENTO_REC.AsInteger = 0 Then
        Exit;

    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2002, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    ZQueryEvento_Rec.Edit;
    DataSourceReserva_Rec.AutoEdit := True;
end;

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadEvento_Rec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryEvento_Rec.Close;
    ZQueryReserva_Rec.Close;
    ZReadOnlyQueryRecurso.Close;

    Action := CaFree;
end;

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    ZQueryEvento_Rec.Post;
    DataSourceReserva_Rec.AutoEdit := False;
end;

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If ZQueryEvento_RecID_EVENTO_REC.AsInteger = 0 Then
        Exit;

    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2002, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    If  Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 7 Then
        Exit;

    While Not ZQueryReserva_Rec.Eof Do
        ZQueryReserva_Rec.Delete;

    ZQueryEvento_Rec.Delete;
    DataSourceReserva_Rec.AutoEdit := False;
end;

procedure TFrmCadEvento_Rec.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZQueryEvento_Rec.Open;
    ZQueryReserva_Rec.Open;
    ZReadOnlyQueryRecurso.Open;
end;

procedure TFrmCadEvento_Rec.DataSourceEvento_RecStateChange(Sender: TObject);
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

procedure TFrmCadEvento_Rec.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryEvento_Rec.Cancel;
    DataSourceReserva_Rec.AutoEdit := False;
end;

procedure TFrmCadEvento_Rec.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqEvento_Rec, FrmPesqEvento_Rec);
            FrmPesqEvento_Rec.ShowModal;
        Finally
            If FrmPesqEvento_Rec.Tag = 1 Then
            Begin
                ZQueryEvento_Rec.Close;
                ZQueryEvento_Rec.ParamByName('pIdEventoRec').Value := FrmPesqEvento_Rec.ZReadOnlyQueryPesquisaID_EVENTO_REC.AsInteger;
                ZQueryEvento_Rec.Open;

                DataEvento.SetFocus;
            End;

            FrmPesqEvento_Rec.Free;
        End
    Else If (Key = 13) And (Not bsSkinDBMemoObs.Focused) Then       //Tecla Enter
        Keybd_event(9, 0, 0, 0);
end;

procedure TFrmCadEvento_Rec.ZQueryReserva_RecNewRecord(DataSet: TDataSet);
begin
    ZQueryReserva_RecID_EVENTO_REC.Value := ZQueryEvento_RecID_EVENTO_REC.AsInteger;
    ZQueryReserva_RecID_RESERVA_REC.Value := FrmDataModule.NovoCodigo('ID_RESERVA_REC',0);
end;

procedure TFrmCadEvento_Rec.DBGridTabelaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    vDataInicial, vDataFinal, vInicio, vFim: TDateTime;
    vCodRecurso: Integer;
    vTemAluguel: Char;
begin
    If (Key = 120) And (bsSkinSpeedButtonGravar.Enabled) Then       //Tecla F9
        Try
            Application.CreateForm(TFrmPesqRecursos, FrmPesqRecursos);
            FrmPesqRecursos.ShowModal;
        Finally
            If FrmPesqRecursos.Tag = 1 Then
            Begin
                ZQueryReserva_Rec.Edit;
                ZQueryReserva_RecID_Recurso.Value := FrmPesqRecursos.ZReadOnlyQueryPesquisaID_RECURSO.AsInteger;
            End;

            FrmPesqRecursos.Free;
        End
    Else If Key = 121 Then       //Tecla F10
        Begin
            If ZQueryReserva_RecID_RECURSO.AsInteger = 0 Then
            Begin
                Application.MessageBox('Posicione em um aluguel feito' + #13 + 'antes de pressionar a tecla F10', 'Atenção', 48);
                Exit;
            End;

            Application.CreateForm(TFrmPerAgendamento, FrmPerAgendamento);
            FrmPerAgendamento.bsSkinDateEditInicial.Date := ZQueryReserva_RecDATA.AsDateTime + 1;
            FrmPerAgendamento.bsSkinDateEditFinal.Date := ZQueryReserva_RecDATA.AsDateTime + 1;
            FrmPerAgendamento.ShowModal;

            If FrmPerAgendamento.Tag = 1 Then
            Begin
                vDataInicial := FrmPerAgendamento.bsSkinDateEditInicial.Date;
                vDataFinal := FrmPerAgendamento.bsSkinDateEditFinal.Date;

                If (vDataFinal < vDataInicial) Or (vDataInicial > vDataFinal) Then
                Begin
                    Application.MessageBox('Período digitado incorretamente', 'Atenção', 48);
                    Exit;
                End;

                //Pega dados do ambiente atual para o agendamento automático
                vCodRecurso := ZQueryReserva_RecID_RECURSO.AsInteger;
                vInicio := ZQueryReserva_RecH_INICIO.AsDateTime;
                vFim := ZQueryReserva_RecH_FIM.AsDateTime;
                While vDataInicial <= vDataFinal Do
                Begin
                    Try
                        If ZQueryReserva_Rec.Locate('Data', vDataInicial, []) Then
                        Begin
                            vDataInicial := vDataInicial + 1;
                            Continue;
                        End;

                        {Dom=0, Seg=1, Ter=2, Qua=3, Qui=4, Sex=5, Sab=6}
                        vTemAluguel := 'N';
                        If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[0]) And (DayOfWeek(vDataInicial) = 1) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[1]) And (DayOfWeek(vDataInicial) = 2) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[2]) And (DayOfWeek(vDataInicial) = 3) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[3]) And (DayOfWeek(vDataInicial) = 4) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[4]) And (DayOfWeek(vDataInicial) = 5) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[5]) And (DayOfWeek(vDataInicial) = 6) Then
                            vTemAluguel := 'S'
                        Else If (FrmPerAgendamento.CheckListBoxDiasEventos.Checked[6]) And (DayOfWeek(vDataInicial) = 7) Then
                            vTemAluguel := 'S';

                        If vTemAluguel = 'N' Then
                        Begin
                            vDataInicial := vDataInicial + 1;
                            Continue;
                        End;

                        ZQueryReserva_Rec.Append;
                        ZQueryReserva_RecID_EVENTO_REC.Value := ZQueryEvento_RecID_EVENTO_REC.AsInteger;
                        ZQueryReserva_RecID_RESERVA_REC.Value := FrmDataModule.NovoCodigo('ID_RESERVA_REC',0);
                        ZQueryReserva_RecID_RECURSO.Value := vCodRecurso;
                        ZQueryReserva_RecDATA.Value := vDataInicial;
                        ZQueryReserva_RecH_INICIO.Value := vInicio;
                        ZQueryReserva_RecH_FIM.Value := vFim;
                        ZQueryReserva_Rec.Post;
                    Except
                        ZQueryReserva_Rec.Cancel;
                        Break;
                    End;

                    vDataInicial := vDataInicial + 1;
                End;
            End;

            FrmPerAgendamento.Free;
        End
    Else If (Key = 116) And (bsSkinSpeedButtonGravar.Enabled) Then       //Tecla F5
        Begin
            If Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 6 Then
                ZQueryReserva_Rec.Delete;
        End;
end;

procedure TFrmCadEvento_Rec.ZQueryEvento_RecNewRecord(DataSet: TDataSet);
begin
    ZQueryEvento_RecDATA.Value := Date;
    ZQueryEvento_RecID_EVENTO_Rec.Value := FrmDataModule.NovoCodigo('ID_EVENTO_REC', 0);
end;

procedure TFrmCadEvento_Rec.ZQueryReserva_RecBeforePost(DataSet: TDataSet);
begin
    ZReadOnlyQueryDisponib.Close;
    ZReadOnlyQueryDisponib.ParamByName('pIdRecurso').Value := ZQueryReserva_RecID_RECURSO.AsInteger;
    ZReadOnlyQueryDisponib.ParamByName('pIdReservaRec').Value := ZQueryReserva_RecID_RESERVA_REC.AsInteger;
    ZReadOnlyQueryDisponib.ParamByName('pData').Value := ZQueryReserva_RecDATA.AsDateTime;
    ZReadOnlyQueryDisponib.ParamByName('pHoraInicial').Value := ZQueryReserva_RecH_INICIO.AsDateTime;
    ZReadOnlyQueryDisponib.ParamByName('pHoraFinal').Value := ZQueryReserva_RecH_FIM.AsDateTime;
    ZReadOnlyQueryDisponib.Open;

    If Not ZReadOnlyQueryDisponib.IsEmpty Then
    Begin
        Try
            Application.CreateForm(TFrmAgendaDiariaRec, FrmAgendaDiariaRec);

            FrmAgendaDiariaRec.Caption := 'Conflito de horário !!!';

            FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.Close;
            FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.ParamByName('pIdRecurso').Value := ZQueryReserva_RecID_RECURSO.AsInteger;
            FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.ParamByName('pData').Value := ZQueryReserva_RecDATA.AsDateTime;
            FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.Open;
            While Not FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.Eof Do
            Begin
                //Manda pintar os horários ocupados
                FrmAgendaDiariaRec.PintaGrid(FrmAgendaDiariaRec.ZReadOnlyQueryDisponibH_INICIO.AsDateTime, FrmAgendaDiariaRec.ZReadOnlyQueryDisponibH_FIM.AsDateTime);

                FrmAgendaDiariaRec.ZReadOnlyQueryDisponib.Next;
            End;

            FrmAgendaDiariaRec.ShowModal;
        Finally
            FrmAgendaDiariaRec.Free;
        End;

        Abort;
    End;
end;

procedure TFrmCadEvento_Rec.DBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Not bsSkinSpeedButtonGravar.Enabled Then
        Key := #0;
end;

procedure TFrmCadEvento_Rec.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If Not bsSkinSpeedButtonGravar.Enabled Then
        Key := #0;
end;

end.
