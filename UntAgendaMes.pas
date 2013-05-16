unit UntAgendaMes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinData, BusinessSkinForm, Grids, Wwdbigrd, Wwdbgrid, DB,
  DBClient, StdCtrls, DateUtils, DBGrids, DBCtrls, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmAgendaMes = class(TForm)
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    ClientDataSetAgenda: TClientDataSet;
    ClientDataSetAgendaData: TDateField;
    DataSourceAgenda: TDataSource;
    ClientDataSetAgendaField1: TIntegerField;
    ClientDataSetAgendaField2: TIntegerField;
    ClientDataSetAgendaField3: TIntegerField;
    ClientDataSetAgendaField4: TIntegerField;
    ClientDataSetAgendaField5: TIntegerField;
    ClientDataSetAgendaField6: TIntegerField;
    ClientDataSetAgendaField7: TIntegerField;
    ClientDataSetAgendaField8: TIntegerField;
    ClientDataSetAgendaField9: TIntegerField;
    ClientDataSetAgendaField10: TIntegerField;
    Label1: TLabel;
    ComboBoxMeses: TComboBox;
    ComboBoxAno: TComboBox;
    ClientDataSetAgendaIntegerField11: TIntegerField;
    ClientDataSetAgendaIntegerField12: TIntegerField;
    ClientDataSetAgendaIntegerField13: TIntegerField;
    ClientDataSetAgendaIntegerField14: TIntegerField;
    ClientDataSetAgendaIntegerField15: TIntegerField;
    ClientDataSetAgendaIntegerField16: TIntegerField;
    ClientDataSetAgendaIntegerField17: TIntegerField;
    ClientDataSetAgendaIntegerField18: TIntegerField;
    ClientDataSetAgendaIntegerField19: TIntegerField;
    ClientDataSetAgendaIntegerField20: TIntegerField;
    ClientDataSetAgendaIntegerField21: TIntegerField;
    ClientDataSetAgendaIntegerField22: TIntegerField;
    ClientDataSetAgendaIntegerField23: TIntegerField;
    ClientDataSetAgendaIntegerField24: TIntegerField;
    ClientDataSetAgendaIntegerField25: TIntegerField;
    ClientDataSetAgendaIntegerField26: TIntegerField;
    ClientDataSetAgendaIntegerField27: TIntegerField;
    ClientDataSetAgendaIntegerField28: TIntegerField;
    ClientDataSetAgendaIntegerField29: TIntegerField;
    ClientDataSetAgendaIntegerField30: TIntegerField;
    ClientDataSetAgendaIntegerField31: TIntegerField;
    ClientDataSetAgendaIntegerField32: TIntegerField;
    ClientDataSetAgendaIntegerField33: TIntegerField;
    ClientDataSetAgendaIntegerField34: TIntegerField;
    ClientDataSetAgendaIntegerField35: TIntegerField;
    ClientDataSetAgendaIntegerField36: TIntegerField;
    ClientDataSetAgendaIntegerField37: TIntegerField;
    ClientDataSetAgendaIntegerField38: TIntegerField;
    ClientDataSetAgendaIntegerField39: TIntegerField;
    ClientDataSetAgendaIntegerField40: TIntegerField;
    ClientDataSetAgendaIntegerField41: TIntegerField;
    ClientDataSetAgendaIntegerField42: TIntegerField;
    ClientDataSetAgendaIntegerField43: TIntegerField;
    ClientDataSetAgendaIntegerField44: TIntegerField;
    ClientDataSetAgendaIntegerField45: TIntegerField;
    ClientDataSetAgendaIntegerField46: TIntegerField;
    ClientDataSetAgendaIntegerField47: TIntegerField;
    ClientDataSetAgendaIntegerField48: TIntegerField;
    ClientDataSetAgendaIntegerField49: TIntegerField;
    ClientDataSetAgendaIntegerField50: TIntegerField;
    ClientDataSetAgendaIntegerField51: TIntegerField;
    ClientDataSetAgendaIntegerField52: TIntegerField;
    ClientDataSetAgendaIntegerField53: TIntegerField;
    ClientDataSetAgendaIntegerField54: TIntegerField;
    ClientDataSetAgendaIntegerField55: TIntegerField;
    ClientDataSetAgendaIntegerField56: TIntegerField;
    ClientDataSetAgendaIntegerField57: TIntegerField;
    ClientDataSetAgendaIntegerField58: TIntegerField;
    ClientDataSetAgendaIntegerField59: TIntegerField;
    ClientDataSetAgendaIntegerField60: TIntegerField;
    ClientDataSetAgendaIntegerField61: TIntegerField;
    ClientDataSetAgendaIntegerField62: TIntegerField;
    ClientDataSetAgendaIntegerField63: TIntegerField;
    ClientDataSetAgendaIntegerField64: TIntegerField;
    ClientDataSetAgendaIntegerField65: TIntegerField;
    ClientDataSetAgendaIntegerField66: TIntegerField;
    ClientDataSetAgendaIntegerField67: TIntegerField;
    ClientDataSetAgendaIntegerField68: TIntegerField;
    ClientDataSetAgendaIntegerField69: TIntegerField;
    ClientDataSetAgendaIntegerField70: TIntegerField;
    ClientDataSetAgendaIntegerField71: TIntegerField;
    ClientDataSetAgendaIntegerField72: TIntegerField;
    ClientDataSetAgendaIntegerField73: TIntegerField;
    ClientDataSetAgendaIntegerField74: TIntegerField;
    ClientDataSetAgendaIntegerField75: TIntegerField;
    ClientDataSetAgendaIntegerField76: TIntegerField;
    ClientDataSetAgendaIntegerField77: TIntegerField;
    ClientDataSetAgendaIntegerField78: TIntegerField;
    ClientDataSetAgendaIntegerField79: TIntegerField;
    ClientDataSetAgendaIntegerField80: TIntegerField;
    ClientDataSetAgendaIntegerField81: TIntegerField;
    ClientDataSetAgendaIntegerField82: TIntegerField;
    ClientDataSetAgendaIntegerField83: TIntegerField;
    ClientDataSetAgendaIntegerField84: TIntegerField;
    ClientDataSetAgendaIntegerField85: TIntegerField;
    ClientDataSetAgendaIntegerField86: TIntegerField;
    ClientDataSetAgendaIntegerField87: TIntegerField;
    ClientDataSetAgendaIntegerField88: TIntegerField;
    ClientDataSetAgendaIntegerField89: TIntegerField;
    ClientDataSetAgendaIntegerField90: TIntegerField;
    ClientDataSetAgendaIntegerField91: TIntegerField;
    ClientDataSetAgendaIntegerField92: TIntegerField;
    ClientDataSetAgendaIntegerField93: TIntegerField;
    ClientDataSetAgendaIntegerField94: TIntegerField;
    ClientDataSetAgendaIntegerField95: TIntegerField;
    ClientDataSetAgendaIntegerField96: TIntegerField;
    DBGridMinutos: TDBGrid;
    DBGridTopo: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    BitBtnFechar: TBitBtn;
    ZQueryAmbiente: TZQuery;
    ZQueryAmbienteID_AMBIENTE: TIntegerField;
    ZQueryAmbienteNOME: TStringField;
    ZQueryAmbienteDESCRICAO: TStringField;
    ZQueryAmbienteCAPACIDADE_PESSOAS: TIntegerField;
    ZQueryAmbienteCUSTO: TFloatField;
    ZQueryAmbientePER_MINIMO: TStringField;
    ZQueryAmbienteHORA_INDUSTRIA: TFloatField;
    ZQueryAmbienteHORA_COMUNIDADE: TFloatField;
    ZQueryAmbienteHORA_CONVENIADO: TFloatField;
    DataSourceAmbiente: TDataSource;
    ZQueryReserva: TZQuery;
    ZQueryReservaID_RESERVA: TIntegerField;
    ZQueryReservaID_EVENTO: TIntegerField;
    ZQueryReservaID_AMBIENTE: TIntegerField;
    ZQueryReservaDATA: TDateTimeField;
    ZQueryReservaSTATUS: TIntegerField;
    ZQueryReservaH_INICIO: TDateTimeField;
    ZQueryReservaH_FIM: TDateTimeField;
    procedure ComboBoxAnoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBGridMinutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxMesesChange(Sender: TObject);
    procedure ComboBoxAnoChange(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vEstouCriandoForm: String;
  end;

var
  FrmAgendaMes: TFrmAgendaMes;

implementation

uses UntDataModule;

{$R *.dfm}

procedure TFrmAgendaMes.ComboBoxAnoKeyPress(Sender: TObject; var Key: Char);
var
    vDataInicial, vDataFinal, vHoraGrid: TDateTime; vMes: String; vQtdeDiasMes, I: Integer;
begin
    If Key <> #13 Then
    Begin
        Key := #0;
        Exit;
    End;

    ClientDataSetAgenda.EmptyDataSet;
    vEstouCriandoForm := 'Nao';

    If ComboBoxMeses.ItemIndex = 0 Then
        vMes := '01'
    Else If ComboBoxMeses.ItemIndex = 1 Then
        vMes := '02'
    Else If ComboBoxMeses.ItemIndex = 2 Then
        vMes := '03'
    Else If ComboBoxMeses.ItemIndex = 3 Then
        vMes := '04'
    Else If ComboBoxMeses.ItemIndex = 4 Then
        vMes := '05'
    Else If ComboBoxMeses.ItemIndex = 5 Then
        vMes := '06'
    Else If ComboBoxMeses.ItemIndex = 6 Then
        vMes := '07'
    Else If ComboBoxMeses.ItemIndex = 7 Then
        vMes := '08'
    Else If ComboBoxMeses.ItemIndex = 8 Then
        vMes := '09'
    Else If ComboBoxMeses.ItemIndex = 9 Then
        vMes := '10'
    Else If ComboBoxMeses.ItemIndex = 10 Then
        vMes := '11'
    Else If ComboBoxMeses.ItemIndex = 11 Then
        vMes := '12';

    vDataInicial := StrToDate('01/' + vMes + '/' + ComboBoxAno.Text);

    vQtdeDiasMes := DaysInAMonth(StrToInt(ComboBoxAno.Text), StrToInt(vMes));
    vDataFinal := StrToDate(IntToStr(vQtdeDiasMes) + '/' + vMes + '/' + ComboBoxAno.Text);

    While MonthOf(vDataInicial) = MonthOf(vDataFinal) Do
    Begin
        ClientDataSetAgenda.Append;
        ClientDataSetAgendaData.Value := vDataInicial;

        ZQueryReserva.Close;
        ZQueryReserva.ParamByName('pIdAmbiente').Value := ZQueryAmbienteID_AMBIENTE.AsInteger;
        ZQueryReserva.ParamByName('pData').Value := ClientDataSetAgendaData.AsDateTime;
        ZQueryReserva.Open;
        While Not ZQueryReserva.Eof Do
        Begin
            For I := 1 To 96 Do
            Begin
                vHoraGrid := StrToDateTime(DBGridMinutos.Columns[I].Title.Caption);

                If (vHoraGrid >= ZQueryReservaH_INICIO.AsDateTime) And (vHoraGrid < ZQueryReservaH_FIM.AsDateTime) Then
                    ClientDataSetAgenda.FieldByName('Campo' + IntToStr(I)).Value := 1;          //Coloca um valor qualquer para ser testado posteriormente
            End;

            ZQueryReserva.Next;
        End;

        ClientDataSetAgenda.Post;

        vDataInicial := vDataInicial + 1;
    End;

    ClientDataSetAgenda.First;
    DBGridMinutos.SetFocus;
end;

procedure TFrmAgendaMes.FormCreate(Sender: TObject);
var
    vHora: TDateTime; I: Integer; vMes: String;
begin
    vEstouCriandoForm := 'Sim';

    ZQueryAmbiente.Close;
    ZQueryAmbiente.ParamByName('pIdOperador').Value := FrmDataModule.vCodOperador;
    ZQueryAmbiente.Open;

    ClientDataSetAgenda.Open;

    vHora := StrToDateTime('7:00:00');
    For I := 1 To 96 Do
    Begin
        DBGridMinutos.Columns[I].Title.Caption := DateTimeToStr(vHora);
        vHora := IncMinute(vHora, 10);
    End;

    //Posiciona no mês atual
    vMes := FormatDateTime('mm', Date);

    If vMes = '01' Then
        ComboBoxMeses.ItemIndex := 0
    Else If vMes = '02' Then
        ComboBoxMeses.ItemIndex := 1
    Else If vMes = '03' Then
        ComboBoxMeses.ItemIndex := 2
    Else If vMes = '04' Then
        ComboBoxMeses.ItemIndex := 3
    Else If vMes = '05' Then
        ComboBoxMeses.ItemIndex := 4
    Else If vMes = '06' Then
        ComboBoxMeses.ItemIndex := 5
    Else If vMes = '07' Then
        ComboBoxMeses.ItemIndex := 6
    Else If vMes = '08' Then
        ComboBoxMeses.ItemIndex := 7
    Else If vMes = '09' Then
        ComboBoxMeses.ItemIndex := 8
    Else If vMes = '10' Then
        ComboBoxMeses.ItemIndex := 9
    Else If vMes = '11' Then
        ComboBoxMeses.ItemIndex := 10
    Else If vMes = '12' Then
        ComboBoxMeses.ItemIndex := 11;

    //posisiona no ano atual
    ComboBoxAno.Text := FormatDateTime('yyyy', Date);
end;

procedure TFrmAgendaMes.DBGridMinutosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;  State: TGridDrawState);
var
    I: Integer; vHoraGrid: TDateTime;
begin
    If vEstouCriandoForm = 'Sim' Then
        Exit;

    If (Column.FieldName <> 'Data') And (Column.Field.AsInteger = 1) Then
    Begin
        DBGridMinutos.Canvas.Brush.Color:= clRed;
        DBGridMinutos.Canvas.Font.Color:= clWindowText;
        DBGridMinutos.Canvas.FillRect(Rect);
        DBGridMinutos.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    End;
end;

procedure TFrmAgendaMes.BitBtnFecharClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmAgendaMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    ZQueryAmbiente.Close;
    ClientDataSetAgenda.Close;

    Action := CaFree;
end;

procedure TFrmAgendaMes.FormKeyPress(Sender: TObject; var Key: Char);
begin
    If (Key = #13) And (Not ComboBoxAno.Focused) Then
        Keybd_Event(9, 0, 0, 0);
end;

procedure TFrmAgendaMes.ComboBoxMesesChange(Sender: TObject);
begin
    ClientDataSetAgenda.EmptyDataSet;
end;

procedure TFrmAgendaMes.ComboBoxAnoChange(Sender: TObject);
begin
    ClientDataSetAgenda.EmptyDataSet;
end;

procedure TFrmAgendaMes.DBLookupComboBox1Click(Sender: TObject);
begin
    ClientDataSetAgenda.EmptyDataSet;
end;

end.
