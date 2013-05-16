unit UntPrRecurso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DB, ZAbstractRODataset,
  ZDataset, bsSkinCtrls, bsSkinGrids, bsDBGrids, bsSkinData,
  BusinessSkinForm, wwdbdatetimepicker, Mask, bsSkinBoxCtrls, FR_DSet,
  FR_DBSet, FR_Class, FR_Shape;

type
  TFrmPrRecursoPer = class(TForm)
    BitBtnFechar: TBitBtn;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    Label1: TLabel;
    Label3: TLabel;
    BitBtnImprimir: TBitBtn;
    frReportEventoRec: TfrReport;
    frDBDataSetEventoRec: TfrDBDataSet;
    ZReadOnlyQueryEventoRec: TZReadOnlyQuery;
    bsSkinEditRecurso: TbsSkinEdit;
    CheckBoxTodos: TCheckBox;
    ButtonPesqRecurso: TButton;
    ZReadOnlyQueryEventoRecID_RESERVA_REC: TIntegerField;
    ZReadOnlyQueryEventoRecID_EVENTO_REC: TIntegerField;
    ZReadOnlyQueryEventoRecID_RECURSO: TIntegerField;
    ZReadOnlyQueryEventoRecDATA: TDateTimeField;
    ZReadOnlyQueryEventoRecSTATUS: TIntegerField;
    ZReadOnlyQueryEventoRecH_INICIO: TDateTimeField;
    ZReadOnlyQueryEventoRecH_FIM: TDateTimeField;
    ZReadOnlyQueryEventoRecDESC_RECURSO: TStringField;
    ZReadOnlyQueryEventoRecDESCRICAO: TStringField;
    ZReadOnlyQueryEventoRecOUTRAS_INFORMACOES: TStringField;
    wwDBDateTimePickerInicial: TwwDBDateTimePicker;
    wwDBDateTimePickerFinal: TwwDBDateTimePicker;
    ZReadOnlyQueryEventoRecDESC_UNIDADE: TStringField;
    bsSkinEditUnidade: TbsSkinEdit;
    CheckBoxUnidade: TCheckBox;
    ButtonBuscaUnidade: TButton;
    frShapeObject1: TfrShapeObject;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnImprimirClick(Sender: TObject);
    procedure ButtonPesqRecursoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bsSkinEditRecursoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonBuscaUnidadeClick(Sender: TObject);
  private
    { Private declarations }
    vSqlAnterior: String;
  public
    { Public declarations }
  end;

var
  FrmPrRecursoPer: TFrmPrRecursoPer;

implementation

uses UntDataModule, UntPesqAmbiente, UntPrincipal, UntPesqRecursos,
  UntPesqUnidade;

{$R *.dfm}

procedure TFrmPrRecursoPer.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    vSqlAnterior := ZReadOnlyQueryEventoRec.SQL.Text;
end;

procedure TFrmPrRecursoPer.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPrRecursoPer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TFrmPrRecursoPer.bsSkinDBGridTabelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

procedure TFrmPrRecursoPer.BitBtnImprimirClick(Sender: TObject);
begin
    ZReadOnlyQueryEventoRec.Close;
    ZReadOnlyQueryEventoRec.SQL.Clear;
    ZReadOnlyQueryEventoRec.SQL.Add('Select Unidades.Desc_Unidade, Reservas_Recurso.*, Recursos.Descricao Desc_Recurso, Evento_Recurso.Descricao, Evento_Recurso.Outras_Informacoes From Reservas_Recurso, Recursos, Evento_Recurso, Unidades');
    ZReadOnlyQueryEventoRec.SQL.Add('Where Unidades.CodUnidade = Recursos.Id_Unidade And Reservas_Recurso.id_Recurso = Recursos.id_Recurso And Evento_Recurso.Id_Evento_Rec = Reservas_Recurso.Id_Evento_Rec');
    ZReadOnlyQueryEventoRec.SQL.Add('And Reservas_Recurso.Data Between ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerInicial.Date)) + ' And ' + QuotedStr(FormatDateTime('mm/dd/yyyy', wwDBDateTimePickerFinal.Date)));
    ZReadOnlyQueryEventoRec.SQL.Add('And Recursos.Id_Unidade In (Select Id_Unidade From Temp_Unid_Operador Where Id_Operador = ' + IntToStr(FrmDataModule.vCodOperador) + ')');

    If Not CheckBoxUnidade.Checked Then
        ZReadOnlyQueryEventoRec.SQL.Add('And Recursos.Id_Unidade = ' + IntToStr(bsSkinEditUnidade.Tag));

    If Not CheckBoxTodos.Checked Then
        ZReadOnlyQueryEventoRec.SQL.Add('And Reservas_Recurso.id_Recurso = ' + IntToStr(bsSkinEditRecurso.Tag));

    ZReadOnlyQueryEventoRec.SQL.Add('Order By Unidades.Desc_Unidade, Reservas_Recurso.Data');
    ZReadOnlyQueryEventoRec.Open;

    frVariables['vPeriodo'] := 'Período de: ' + wwDBDateTimePickerInicial.Text + ' Até ' + wwDBDateTimePickerFinal.Text;
    frReportEventoRec.ShowReport;
end;

procedure TFrmPrRecursoPer.ButtonPesqRecursoClick(Sender: TObject);
begin
    If CheckBoxTodos.Checked Then
        Exit;

    If bsSkinEditUnidade.Tag = 0 Then
    Begin
        Application.MessageBox('Escolhe uma unidade', 'Atenção', 48);
        Exit;
    End;

    Try
        wwDBDateTimePickerInicial.SetFocus;

        Application.CreateForm(TFrmPesqRecursos, FrmPesqRecursos);
        FrmPesqRecursos.ShowModal;
    Finally
        If FrmPesqRecursos.Tag = 1 Then
        Begin
            bsSkinEditRecurso.Tag := FrmPesqRecursos.ZReadOnlyQueryPesquisaID_RECURSO.AsInteger;
            bsSkinEditRecurso.Text := FrmPesqRecursos.ZReadOnlyQueryPesquisaDESCRICAO.AsString;
        End;

        FrmPesqRecursos.Free;
    End
end;

procedure TFrmPrRecursoPer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If Key = 13 Then
        Keybd_event(9, 0, 0, 0);
end;

procedure TFrmPrRecursoPer.bsSkinEditRecursoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If (Key = 120) And (Not CheckBoxTodos.Checked) Then
        ButtonPesqRecurso.Click;
end;

procedure TFrmPrRecursoPer.ButtonBuscaUnidadeClick(Sender: TObject);
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

end.
