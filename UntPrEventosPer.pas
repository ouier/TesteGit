unit UntPrEventosPer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZDataset, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinData,
  BusinessSkinForm, wwdbdatetimepicker, Mask, bsSkinBoxCtrls, FR_DSet,
  FR_DBSet, FR_Class, FR_Shape, EXLReportExcelTLB, EXLReportBand, EXLReport;

type
  TFrmPrEventosPer = class(TForm)
    BitBtnFechar: TBitBtn;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    BitBtnImprimir: TBitBtn;
    frReportEventos: TfrReport;
    frDBDataSetEventos: TfrDBDataSet;
    ZReadOnlyQueryEventos: TZReadOnlyQuery;
    bsSkinEditAmbiente: TbsSkinEdit;
    CheckBoxTodos: TCheckBox;
    ButtonPesqAmbiente: TButton;
    ZReadOnlyQueryEventosID_RESERVA: TIntegerField;
    ZReadOnlyQueryEventosID_EVENTO: TIntegerField;
    ZReadOnlyQueryEventosID_AMBIENTE: TIntegerField;
    ZReadOnlyQueryEventosDATA: TDateTimeField;
    ZReadOnlyQueryEventosSTATUS: TIntegerField;
    ZReadOnlyQueryEventosH_INICIO: TDateTimeField;
    ZReadOnlyQueryEventosH_FIM: TDateTimeField;
    ZReadOnlyQueryEventosNOME: TStringField;
    ZReadOnlyQueryEventosDESCRICAO: TStringField;
    ZReadOnlyQueryEventosOUTRAS_INFORMACOES: TStringField;
    ZReadOnlyQueryEventosCALC_OBSERVACAO: TStringField;
    ZReadOnlyQueryEventosSOLICITANTE: TStringField;
    ZReadOnlyQueryEventosPESSOA_CONTATO: TStringField;
    ZReadOnlyQueryEventosFONE_PESSOA_CONTATO: TStringField;
    bsSkinEditUnidade: TbsSkinEdit;
    CheckBoxUnidade: TCheckBox;
    ButtonBuscaUnidade: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    wwDBDateTimePickerInicial: TwwDBDateTimePicker;
    wwDBDateTimePickerFinal: TwwDBDateTimePicker;
    ZReadOnlyQueryEventosID_UNIDADE: TIntegerField;
    ZReadOnlyQueryEventosDESC_UNIDADE: TStringField;
    frShapeObject1: TfrShapeObject;
    BitBtnExportaExcel: TBitBtn;
    EXLReportExportacao: TEXLReport;
    ZReadOnlyQueryExportaExcel: TZReadOnlyQuery;
    ZReadOnlyQueryExportaExcelLOCAL: TStringField;
    ZReadOnlyQueryExportaExcelDATA: TDateTimeField;
    ZReadOnlyQueryExportaExcelH_INICIO: TDateTimeField;
    ZReadOnlyQueryExportaExcelH_FIM: TDateTimeField;
    ZReadOnlyQueryExportaExcelQTDE_PES_PARTIC: TSmallintField;
    ZReadOnlyQueryExportaExcelEVENTO: TStringField;
    ZReadOnlyQueryExportaExcelRESPONSAVEL: TStringField;
    ZReadOnlyQueryExportaExcelCALC_DATA: TStringField;
    ZReadOnlyQueryExportaExcelCALC_INICIO: TStringField;
    ZReadOnlyQueryExportaExcelCALC_FIM: TStringField;
    ZReadOnlyQueryEventosQTDE_PES_PARTIC: TSmallintField;
    BitBtnSintetico: TBitBtn;
    frReportSintetico: TfrReport;
    ZReadOnlyQuerySintetico: TZReadOnlyQuery;
    ZReadOnlyQuerySinteticoCODUNIDADE: TIntegerField;
    ZReadOnlyQuerySinteticoDESC_UNIDADE: TStringField;
    ZReadOnlyQuerySinteticoTOT_PARTICIPANTE: TLargeintField;
    frDBDataSetSintetico: TfrDBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnImprimirClick(Sender: TObject);
    procedure ButtonPesqAmbienteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bsSkinEditAmbienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZReadOnlyQueryEventosCalcFields(DataSet: TDataSet);
    procedure ButtonBuscaUnidadeClick(Sender: TObject);
    procedure BitBtnExportaExcelClick(Sender: TObject);
    procedure ZReadOnlyQueryExportaExcelCalcFields(DataSet: TDataSet);
    procedure BitBtnSinteticoClick(Sender: TObject);
  private
    { Private declarations }
    vSqlAnterior: String;
  public
    { Public declarations }
  end;

var
  FrmPrEventosPer: TFrmPrEventosPer;

implementation

uses UntDataModule, UntPesqAmbiente, UntPrincipal, UntPesqUnidade;

{$R *.dfm}

procedure TFrmPrEventosPer.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    vSqlAnterior := ZReadOnlyQueryEventos.SQL.Text;
end;

procedure TFrmPrEventosPer.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPrEventosPer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPrEventosPer.bsSkinDBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

procedure TFrmPrEventosPer.BitBtnImprimirClick(Sender: TObject);
begin
    if wwDBDateTimePickerInicial.Text = '' Then
    begin
        Application.MessageBox('Digite uma data inicial', 'Atenção', 48);
        Exit;
    end;

    if wwDBDateTimePickerFinal.Text = '' Then
    begin
        Application.MessageBox('Digite uma data final', 'Atenção', 48);
        Exit;
    end;

    ZReadOnlyQueryEventos.Close;
    ZReadOnlyQueryEventos.SQL.Clear;
    ZReadOnlyQueryEventos.SQL.Add('Select Reservas.*, Ambientes.Id_Unidade, Unidades.Desc_Unidade, Ambientes.nome, Eventos.Qtde_Pes_Partic, ' + ' Eventos.Descricao, Eventos.Outras_Informacoes, Eventos.Solicitante, Eventos.PESSOA_CONTATO, Eventos.FONE_PESSOA_CONTATO From Reservas, Ambientes, Eventos, Unidades');
    ZReadOnlyQueryEventos.SQL.Add('Where Unidades.CodUnidade = Ambientes.Id_Unidade And Reservas.id_ambiente = Ambientes.id_ambiente');
    ZReadOnlyQueryEventos.SQL.Add('And Eventos.Id_Evento = Reservas.Id_Evento And Data Between ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerInicial.Date)) + ' And ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerFinal.Date)));
    ZReadOnlyQueryEventos.SQL.Add('And Ambientes.Id_Unidade In (Select Id_Unidade From Temp_Unid_Operador Where Id_Operador = ' + IntToStr(FrmDataModule.vCodOperador) + ')');
    ZReadOnlyQueryEventos.SQL.Add('And Ambientes.Id_Ambiente In (Select Id_Ambiente From Temp_Amb_Operador Where Id_Operador = ' + IntToStr(FrmDataModule.vCodOperador) + ')');

    If Not CheckBoxUnidade.Checked Then
        ZReadOnlyQueryEventos.SQL.Add('And Ambientes.Id_Unidade = ' + IntToStr(bsSkinEditUnidade.Tag));

    If Not CheckBoxTodos.Checked Then
        ZReadOnlyQueryEventos.SQL.Add('And Reservas.Id_Ambiente = ' + IntToStr(bsSkinEditAmbiente.Tag));

    ZReadOnlyQueryEventos.SQL.Add('Order By Unidades.Desc_Unidade, Reservas.Data');
    ZReadOnlyQueryEventos.Open;

    frVariables['vPeriodo'] := 'Período de: ' + wwDBDateTimePickerInicial.Text + ' Até ' + wwDBDateTimePickerFinal.Text;
    frReportEventos.ShowReport;
end;

procedure TFrmPrEventosPer.ButtonPesqAmbienteClick(Sender: TObject);
begin
    If CheckBoxTodos.Checked Then
        Exit;

    Try
        wwDBDateTimePickerInicial.SetFocus;

        Application.CreateForm(TFrmPesqAmbiente, FrmPesqAmbiente);
        FrmPesqAmbiente.ShowModal;
    Finally
        If FrmPesqAmbiente.Tag = 1 Then
        Begin
            bsSkinEditAmbiente.Tag := FrmPesqAmbiente.ZReadOnlyQueryPesquisaID_AMBIENTE.AsInteger;
            bsSkinEditAmbiente.Text := FrmPesqAmbiente.ZReadOnlyQueryPesquisaNOME.AsString;
        End;

        FrmPesqAmbiente.Free;
    End
end;

procedure TFrmPrEventosPer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

    If Key = 13 Then
        Keybd_event(9, 0, 0, 0);
end;

procedure TFrmPrEventosPer.bsSkinEditAmbienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If (Key = 120) And (Not CheckBoxTodos.Checked) Then
        ButtonPesqAmbiente.Click;
end;

procedure TFrmPrEventosPer.ZReadOnlyQueryEventosCalcFields(DataSet: TDataSet);
begin
    ZReadOnlyQueryEventosCALC_OBSERVACAO.Value := ZReadOnlyQueryEventosOUTRAS_INFORMACOES.AsString + ' SOLICITANTE: ' + ZReadOnlyQueryEventosSOLICITANTE.AsString + ' CONTATO: ' + ZReadOnlyQueryEventosPESSOA_CONTATO.AsString + ' ' + ZReadOnlyQueryEventosFONE_PESSOA_CONTATO.AsString;
end;

procedure TFrmPrEventosPer.ButtonBuscaUnidadeClick(Sender: TObject);
begin
    Try
        Application.CreateForm(TFrmPesqUnidade, FrmPesqUnidade);
        FrmPesqUnidade.ShowModal;
    Finally
        If FrmPesqUnidade.Tag = 1 Then
        Begin
            bsSkinEditUnidade.Tag := FrmPesqUnidade.ZReadOnlyQueryPesquisaCODUNIDADE.AsInteger;
            bsSkinEditUnidade.Text := FrmPesqUnidade.ZReadOnlyQueryPesquisaDESC_UNIDADE.AsString;
        End;

        FrmPesqUnidade.Free;
    End;
end;

procedure TFrmPrEventosPer.BitBtnExportaExcelClick(Sender: TObject);
begin
    if wwDBDateTimePickerInicial.Text = '' Then
    begin
        Application.MessageBox('Digite uma data inicial', 'Atenção', 48);
        Exit;
    end;

    if wwDBDateTimePickerFinal.Text = '' Then
    begin
        Application.MessageBox('Digite uma data final', 'Atenção', 48);
        Exit;
    end;

    If (CheckBoxUnidade.Checked) or (bsSkinEditUnidade.Text = '') Then
    begin
        Application.MessageBox('Escolha uma unidade', 'Atenção', 48);
        Exit;
    end;

    ZReadOnlyQueryExportaExcel.Close;
    ZReadOnlyQueryExportaExcel.SQL.Clear;
    ZReadOnlyQueryExportaExcel.SQL.Add('SELECT AMBIENTES.NOME LOCAL, RESERVAS.DATA, RESERVAS.H_INICIO, RESERVAS.H_FIM, EVENTOS.QTDE_PES_PARTIC, EVENTOS.DESCRICAO EVENTO, EVENTOS.SOLICITANTE RESPONSAVEL');
    ZReadOnlyQueryExportaExcel.SQL.Add('FROM AMBIENTES INNER JOIN RESERVAS ON AMBIENTES.ID_AMBIENTE = RESERVAS.ID_AMBIENTE INNER JOIN EVENTOS ON RESERVAS.ID_EVENTO = EVENTOS.ID_EVENTO');
    ZReadOnlyQueryExportaExcel.SQL.Add('WHERE AMBIENTES.ID_UNIDADE = ' + IntToStr(bsSkinEditUnidade.Tag));
    ZReadOnlyQueryExportaExcel.SQL.Add('AND RESERVAS.DATA BETWEEN ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerInicial.Date)) + ' AND ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerFinal.Date)));
    ZReadOnlyQueryExportaExcel.SQL.Add('ORDER BY AMBIENTES.NOME, RESERVAS.DATA, RESERVAS.H_INICIO');
    ZReadOnlyQueryExportaExcel.Open;

    EXLReportExportacao.Dictionary.FieldByName('vUnidade').ValueAsString := bsSkinEditUnidade.Text;
    EXLReportExportacao.Dictionary.FieldByName('vPeriodo').ValueAsString := 'Período de: ' + wwDBDateTimePickerInicial.Text + ' Até ' + wwDBDateTimePickerFinal.Text;
    EXLReportExportacao.Show;
end;

procedure TFrmPrEventosPer.ZReadOnlyQueryExportaExcelCalcFields(DataSet: TDataSet);
begin
    ZReadOnlyQueryExportaExcelCALC_DATA.Value := FormatDateTime('dd/mm/yyyy', ZReadOnlyQueryExportaExcelDATA.AsDateTime);
    ZReadOnlyQueryExportaExcelCALC_INICIO.Value := FormatDateTime('hh:nn', ZReadOnlyQueryExportaExcelH_INICIO.AsDateTime);
    ZReadOnlyQueryExportaExcelCALC_FIM.Value := FormatDateTime('hh:nn', ZReadOnlyQueryExportaExcelH_FIM.AsDateTime);
end;

procedure TFrmPrEventosPer.BitBtnSinteticoClick(Sender: TObject);
begin
  frVariables['vPeriodo'] := 'Período de: ' + wwDBDateTimePickerInicial.Text + ' Até ' + wwDBDateTimePickerFinal.Text;

  ZReadOnlyQuerySintetico.Close;
  ZReadOnlyQuerySintetico.SQL.Clear;
  ZReadOnlyQuerySintetico.SQL.Add('SELECT UNIDADES.CODUNIDADE, UNIDADES.DESC_UNIDADE, SUM( EVENTOS.QTDE_PES_PARTIC ) TOT_PARTICIPANTE ' +
    'FROM EVENTOS INNER JOIN RESERVAS ON (EVENTOS.ID_EVENTO = RESERVAS.ID_EVENTO) ' +
    'INNER JOIN AMBIENTES ON (RESERVAS.ID_AMBIENTE = AMBIENTES.ID_AMBIENTE) ' +
    'INNER JOIN UNIDADES ON (AMBIENTES.ID_UNIDADE = UNIDADES.CODUNIDADE) ' +
    'WHERE EVENTOS.QTDE_PES_PARTIC IS NOT NULL ' +
    'AND RESERVAS.DATA BETWEEN ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerInicial.Date) + ''' AND ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerFinal.Date) + ''' ');

  If Not CheckBoxUnidade.Checked Then
      ZReadOnlyQuerySintetico.SQL.Add('And Ambientes.Id_Unidade = ' + IntToStr(bsSkinEditUnidade.Tag));

  ZReadOnlyQuerySintetico.SQL.Add('GROUP BY UNIDADES.CODUNIDADE, UNIDADES.DESC_UNIDADE ORDER BY UNIDADES.DESC_UNIDADE');
  ZReadOnlyQuerySintetico.Open;

  frReportSintetico.ShowReport;
end;

end.
