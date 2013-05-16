unit UntPesqSolicitante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, wwdblook,
  wwdbdatetimepicker, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

type
  TFrmPesqSolicitante = class(TForm)
    wwDBDateTimePickerDataInicial: TwwDBDateTimePicker;
    lbl1: TLabel;
    wwDBDateTimePickerDataFinal: TwwDBDateTimePicker;
    lbl2: TLabel;
    lbl3: TLabel;
    BitBtnFechar: TBitBtn;
    wwDBGridTabela: TwwDBGrid;
    ZQuerySolicitante: TZQuery;
    ZQuerySolicitanteSOLICITANTE: TStringField;
    ZQueryEvento: TZQuery;
    DataSourceEvento: TDataSource;
    ZQueryEventoDATA: TDateTimeField;
    ZQueryEventoH_INICIO: TDateTimeField;
    ZQueryEventoH_FIM: TDateTimeField;
    ZQueryEventoSOLICITANTE: TStringField;
    ZQueryEventoDESCRICAO: TStringField;
    lbl4: TLabel;
    ZQueryEventoFONE_PESSOA_CONTATO: TStringField;
    ZQueryEventoCELULAR_PESSOA_CONTATO: TStringField;
    ZQueryEventoEMAIL_PESSOA_CONTATO: TStringField;
    DataSourceSolicitante: TDataSource;
    cxLookupComboBoxSolicitante: TcxLookupComboBox;
    lbl5: TLabel;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wwDBDateTimePickerDataInicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure wwDBDateTimePickerDataFinalKeyPress(Sender: TObject;
      var Key: Char);
    procedure wwDBGridTabelaDblClick(Sender: TObject);
    procedure cxDBLookupComboSolicitanteEnter(Sender: TObject);
    procedure cxLookupComboBoxSolicitanteKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqSolicitante: TFrmPesqSolicitante;

implementation

uses UntPrincipal, UntDataModule, UntCadEvento;

{$R *.dfm}

procedure TFrmPesqSolicitante.BitBtnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmPesqSolicitante.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    wwDBDateTimePickerDataInicial.Date := Date;
    wwDBDateTimePickerDataFinal.Date := Date;

    ZQueryEvento.Open;
end;

procedure TFrmPesqSolicitante.wwDBDateTimePickerDataInicialKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
        wwDBDateTimePickerDataFinal.SetFocus;
end;

procedure TFrmPesqSolicitante.wwDBDateTimePickerDataFinalKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
        cxLookupComboBoxSolicitante.SetFocus;
end;

procedure TFrmPesqSolicitante.wwDBGridTabelaDblClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2001, 'L') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    try
        Application.CreateForm(TFrmCadEvento, FrmCadEvento);

        FrmCadEvento.ZQueryEvento.Append;
        FrmCadEvento.ZQueryEventoID_TIPO_EVENTO.Value := 8;
        FrmCadEvento.ZQueryEventoSOLICITANTE.Value := ZQueryEventoSOLICITANTE.AsString;
        FrmCadEvento.ZQueryEventoFONE_PESSOA_CONTATO.Value := ZQueryEventoFONE_PESSOA_CONTATO.AsString;
        FrmCadEvento.ZQueryEventoCELULAR_PESSOA_CONTATO.Value := ZQueryEventoCELULAR_PESSOA_CONTATO.AsString;
        FrmCadEvento.ZQueryEventoEMAIL_PESSOA_CONTATO.Value := ZQueryEventoEMAIL_PESSOA_CONTATO.AsString;

        FrmCadEvento.DataSourceReserva.AutoEdit := True;

        FrmCadEvento.ShowModal;
    finally
        FrmCadEvento.Free;
    end;
end;

procedure TFrmPesqSolicitante.cxDBLookupComboSolicitanteEnter(Sender: TObject);
begin
    ZQuerySolicitante.Close;
    ZQuerySolicitante.SQL.Clear;
    ZQuerySolicitante.SQL.Add('SELECT DISTINCT EVENTOS.SOLICITANTE FROM EVENTOS INNER JOIN RESERVAS ON (EVENTOS.ID_EVENTO = RESERVAS.ID_EVENTO)');
    ZQuerySolicitante.SQL.Add('WHERE EVENTOS.SOLICITANTE IS NOT NULL and RESERVAS.DATA BETWEEN ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerDataInicial.Date) + ''' AND ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerDataFinal.Date) + '''');
    ZQuerySolicitante.SQL.Add('and RESERVAS.ID_AMBIENTE IN (SELECT ID_AMBIENTE FROM TEMP_AMB_OPERADOR WHERE ID_OPERADOR = ' + IntToStr(FrmDataModule.vCodOperador) + ')');
    ZQuerySolicitante.SQL.Add('ORDER BY EVENTOS.SOLICITANTE');
    ZQuerySolicitante.Open;
end;

procedure TFrmPesqSolicitante.cxLookupComboBoxSolicitanteKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
    Begin
        ZQueryEvento.Close;
        ZQueryEvento.SQL.Clear;
        ZQueryEvento.SQL.Add('SELECT EVENTOS.FONE_PESSOA_CONTATO, EVENTOS.CELULAR_PESSOA_CONTATO, EVENTOS.EMAIL_PESSOA_CONTATO, RESERVAS.DATA, RESERVAS.H_INICIO, RESERVAS.H_FIM, EVENTOS.SOLICITANTE, EVENTOS.DESCRICAO FROM RESERVAS');
        ZQueryEvento.SQL.Add('INNER JOIN EVENTOS ON (RESERVAS.ID_EVENTO = EVENTOS.ID_EVENTO) WHERE RESERVAS.DATA BETWEEN ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerDataInicial.Date) + ''' AND ''' + FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerDataFinal.Date) + '''');
        ZQueryEvento.SQL.Add('AND EVENTOS.SOLICITANTE = ''' + cxLookupComboBoxSolicitante.Text + '''');
        ZQueryEvento.SQL.Add('AND RESERVAS.ID_AMBIENTE IN (SELECT ID_AMBIENTE FROM TEMP_AMB_OPERADOR WHERE ID_OPERADOR = ' + IntToStr(FrmDataModule.vCodOperador) + ')');
        ZQueryEvento.SQL.Add('ORDER BY RESERVAS.DATA, RESERVAS.H_INICIO');
        ZQueryEvento.Open;
    end;
end;

procedure TFrmPesqSolicitante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryEvento.Close;
end;

end.
