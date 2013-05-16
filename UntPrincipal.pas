unit UntPrincipal;

interface

uses
  UntFuncoes, Windows, Messages, SysUtils, Variants,
  Classes, Graphics, Controls, Forms, Dialogs, bsSkinData, BusinessSkinForm, Menus,
  bsSkinCtrls, ExtCtrls, ImgList, bsSkinGrids, bsDBGrids, bsCalendar, ComCtrls,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, FR_Class, FR_Shape, StdCtrls,
  wwdbdatetimepicker, Mask, bsSkinBoxCtrls, ZDataset, DB, dbcgrids, bsdbctrls,
  RxMemDS, JvComponent, JvTransLED, Buttons, jpeg, RxGIF,
  ZAbstractRODataset, ZAbstractDataset, DBCtrls;

type
  TFrmPrincipal = class(TForm)
    Panel2: TPanel;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsSkinMainMenu1: TbsSkinMainMenu;
    bsSkinMainMenuBar1: TbsSkinMainMenuBar;
    Mnu1000: TMenuItem;
    Mnu1001: TMenuItem;
    Mnu1002: TMenuItem;
    Mnu1003: TMenuItem;
    Mnu4001: TMenuItem;
    bsSkinToolBar1: TbsSkinToolBar;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    sbAgenda: TbsSkinSpeedButton;
    frContrato: TfrReport;
    frShapeObject1: TfrShapeObject;
    gbCalendario: TbsSkinGroupBox;
    pAgenda: TbsSkinPanel;
    bsSkinPanel1: TbsSkinPanel;
    LedPainel: TbsSkinPanel;
    Image3: TImage;
    bsSkinStdLabel1: TbsSkinStdLabel;
    DiaEvento: TbsSkinStdLabel;
    rxCrono: TRxMemoryData;
    rxCronoAuditorio: TStringField;
    DiaSemanaExtenso: TbsSkinStdLabel;
    pCronograma: TbsSkinPanel;
    rxCronoH01: TIntegerField;
    rxCronoH02: TIntegerField;
    rxCronoH03: TIntegerField;
    rxCronoH04: TIntegerField;
    rxCronoH05: TIntegerField;
    rxCronoH06: TIntegerField;
    rxCronoH07: TIntegerField;
    rxCronoH08: TIntegerField;
    rxCronoH09: TIntegerField;
    rxCronoH10: TIntegerField;
    rxCronoH11: TIntegerField;
    rxCronoH12: TIntegerField;
    rxCronoH13: TIntegerField;
    rxCronoH14: TIntegerField;
    rxCronoH15: TIntegerField;
    rxCronoH16: TIntegerField;
    rxCronoH17: TIntegerField;
    rxCronoH18: TIntegerField;
    rxCronoH19: TIntegerField;
    rxCronoH20: TIntegerField;
    rxCronoH21: TIntegerField;
    rxCronoH22: TIntegerField;
    rxCronoH23: TIntegerField;
    rxCronoH24: TIntegerField;
    gCronograma: TwwDBGrid;
    dsCrono: TDataSource;
    ImageList1: TImageList;
    rxCronoID: TIntegerField;
    rxCronox: TStringField;
    bsSkinPanel2: TbsSkinPanel;
    JvTransLED3: TJvTransLED;
    bsSkinStdLabel6: TbsSkinStdLabel;
    bsSkinStdLabel5: TbsSkinStdLabel;
    JvTransLED2: TJvTransLED;
    bsSkinStdLabel4: TbsSkinStdLabel;
    JvTransLED1: TJvTransLED;
    DiaExtensoCronograma: TbsSkinStdLabel;
    DiaCronograma: TbsSkinStdLabel;
    Image4: TImage;
    Reservas: TbsSkinDBGrid;
    Eventos: TbsSkinGroupBox;
    bsSkinDBText3: TbsSkinDBText;
    bsSkinDBText5: TbsSkinDBText;
    bsSkinDBText2: TbsSkinDBText;
    bsSkinDBText6: TbsSkinDBText;
    bsSkinStdLabel10: TbsSkinStdLabel;
    bbEditaEvento: TbsSkinButton;
    BarraReservas: TbsSkinScrollBar;
    Image2: TImage;
    Mnu4000: TMenuItem;
    Mnu2000: TMenuItem;
    Mnu2001: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Mnu3000: TMenuItem;
    Mnu3001: TMenuItem;
    ssbAgendaEventos: TbsSkinSpeedButton;
    ZQueryReservas: TZQuery;
    ZQueryReservasID_RESERVA: TIntegerField;
    ZQueryReservasID_EVENTO: TIntegerField;
    ZQueryReservasID_AMBIENTE: TIntegerField;
    ZQueryReservasDATA: TDateTimeField;
    ZQueryReservasSTATUS: TIntegerField;
    ZQueryReservasH_INICIO: TDateTimeField;
    ZQueryReservasH_FIM: TDateTimeField;
    ZQueryReservasNomeAmbiente: TStringField;
    DataSourceReserva: TDataSource;
    ZQueryReservasNOME: TStringField;
    ZQueryEventos: TZQuery;
    DataSourceEvento: TDataSource;
    bsSkinPanelHoje: TbsSkinPanel;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    N3: TMenuItem;
    Mnu3002: TMenuItem;
    bsSkinSpeedButtonAgendaRec: TbsSkinSpeedButton;
    N4: TMenuItem;
    Mnu2002: TMenuItem;
    N5: TMenuItem;
    Mnu1004: TMenuItem;
    N6: TMenuItem;
    Mnu1005: TMenuItem;
    N7: TMenuItem;
    Mnu1006: TMenuItem;
    ZReadOnlyQueryPrivilegios: TZReadOnlyQuery;
    ZReadOnlyQueryPrivilegiosACESSO: TIntegerField;
    ZReadOnlyQueryPrivilegiosCADASTRAR: TIntegerField;
    ZReadOnlyQueryPrivilegiosALTERAR: TIntegerField;
    ZReadOnlyQueryPrivilegiosEXCLUIR: TIntegerField;
    ZReadOnlyQueryPrivilegiosLIBERADO: TIntegerField;
    ZReadOnlyQueryPrivilegiosCODOPERADOR: TIntegerField;
    bsSkinPanel3: TbsSkinPanel;
    PanelOperador: TPanel;
    LabelOperador: TLabel;
    Panel1: TPanel;
    Calendario: TbsSkinMonthCalendar;
    N8: TMenuItem;
    Mnu2003: TMenuItem;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinDBText1: TbsSkinDBText;
    bsSkinDBText4: TbsSkinDBText;
    bsSkinStdLabel3: TbsSkinStdLabel;
    bsSkinStdLabel7: TbsSkinStdLabel;
    DBText1: TDBText;
    Timer1: TTimer;
    ZReadOnlyQueryUnidades: TZReadOnlyQuery;
    ZReadOnlyQueryAmbienteAcesso: TZReadOnlyQuery;
    ZReadOnlyQueryAmbienteAcessoID_OPERADOR: TIntegerField;
    ZReadOnlyQueryAmbienteAcessoID_AMBIENTE: TIntegerField;
    ZReadOnlyQueryAmbienteAcessoID_UNIDADE: TIntegerField;
    ZReadOnlyQueryAmbienteAcessoLOOK_UNIDADE: TStringField;
    ZQueryEventosID_EVENTO: TIntegerField;
    ZQueryEventosDATA_PREENCHIMENTO: TDateTimeField;
    ZQueryEventosID_TIPO_EVENTO: TIntegerField;
    ZQueryEventosDESCRICAO: TStringField;
    ZQueryEventosSOLICITANTE: TStringField;
    ZQueryEventosPUBLICO_CAPACIDADE: TIntegerField;
    ZQueryEventosOUTRAS_INFORMACOES: TStringField;
    ZQueryEventosAREA_RESP_EVENTO: TStringField;
    ZQueryEventosPESSOA_CONTATO: TStringField;
    ZQueryEventosCARGO_PESSOA_CONTATO: TStringField;
    ZQueryEventosEMAIL_PESSOA_CONTATO: TStringField;
    ZQueryEventosEMAIL_OPCIONAL: TStringField;
    ZQueryEventosFONE_PESSOA_CONTATO: TStringField;
    ZQueryEventosCELULAR_PESSOA_CONTATO: TStringField;
    ZQueryEventosID_USUARIO: TIntegerField;
    ZQueryEventosVALOR: TFloatField;
    ZQueryEventosUSER_CADASTROU: TStringField;
    ZQueryEventosUSER_ALTEROU: TStringField;
    ZQueryEventosQTDE_PES_PARTIC: TSmallintField;
    ZQueryEventosEMPRESA: TStringField;
    ZQueryReservasLOOK_UNIDADE: TStringField;
    Panel3: TPanel;
    RichEditAviso: TRichEdit;
    bsSkinSpeedButtonLocalizarEvento: TbsSkinSpeedButton;
    procedure Mnu4001Click(Sender: TObject);
    procedure Mnu1001Click(Sender: TObject);
    procedure Mnu1002Click(Sender: TObject);
    procedure Mnu1003Click(Sender: TObject);
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure CalendarioNumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalendarioClick(Sender: TObject);
    procedure bbEditaEventoClick(Sender: TObject);
    procedure Mnu2001Click(Sender: TObject);
    procedure bsSkinSpeedButton2Click(Sender: TObject);
    procedure Mnu3001Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbAgendaClick(Sender: TObject);
    procedure ssbAgendaEventosClick(Sender: TObject);
    procedure Mnu3002Click(Sender: TObject);
    procedure Mnu2002Click(Sender: TObject);
    procedure bsSkinSpeedButtonAgendaRecClick(Sender: TObject);
    procedure Mnu1004Click(Sender: TObject);
    procedure Mnu1005Click(Sender: TObject);
    procedure Mnu1006Click(Sender: TObject);
    procedure bsSkinPanel3Click(Sender: TObject);
    procedure Mnu2003Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ZQueryReservasAfterScroll(DataSet: TDataSet);
    procedure bsSkinSpeedButtonLocalizarEventoClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaAgenda;
    procedure Previlegios;
    procedure PintaAzul;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  UntCadAmbiente, UntCadTipoEvento, UntCadRecursos, UntCadEvento,
  UntPrEventosPer, UntDataModule, UntAgendaMes, UntCadEvento_Rec,
  UntPrRecurso, UntRecursoAlugado, UntArquivoConf, UntCadOperador,
  UntCadUnidade, UntEntrada, UntPermissaoUser, UntEscolhaUnid,
  UntPesqSolicitante;

{$R *.dfm}

procedure TFrmPrincipal.AtualizaAgenda;
begin
  ZQueryReservas.Close;
  ZQueryReservas.ParamByName('pIdOperador').Value := FrmDataModule.vCodOperador;
  ZQueryReservas.ParamByName('pData').Value := Calendario.Date;
  ZQueryReservas.Open;

  Eventos.Visible              := Not ZQueryReservas.IsEmpty;
  Reservas.Visible             := Not ZQueryReservas.IsEmpty;
  BarraReservas.Visible        := Not ZQueryReservas.IsEmpty;
  DiaEvento.Caption            := DateToStr(Calendario.Date);
  DiaSemanaExtenso.Caption     := DiaExtenso(Calendario.Date);
  DiaCronograma.Caption        := DateToStr(Calendario.Date);
  DiaExtensoCronograma.Caption := DiaExtenso(Calendario.Date);
end;

procedure TFrmPrincipal.Mnu4001Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.Mnu1001Click(Sender: TObject);
begin
    Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
    FrmEscolhaUnid.ShowModal;

    If FrmEscolhaUnid.Tag = 1 Then
    Begin
        Application.CreateForm(TFrmCadAmbiente, FrmCadAmbiente);
        FrmCadAmbiente.ShowModal;
    End;
end;

procedure TFrmPrincipal.Mnu1002Click(Sender: TObject);
begin
    Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
    FrmEscolhaUnid.ShowModal;

    If FrmEscolhaUnid.Tag = 1 Then
    Begin
        Application.CreateForm(TFrmCadRecursos, FrmCadRecursos);
        FrmCadRecursos.ShowModal;
    End;
end;

procedure TFrmPrincipal.Mnu1003Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmCadTipoEvento, FrmCadTipoEvento);
        FrmCadTipoEvento.ShowModal;
    finally
        FrmCadTipoEvento.Free;
    end;
end;

procedure TFrmPrincipal.bsSkinSpeedButton1Click(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2001, 'L') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    try
        Application.CreateForm(TFrmCadEvento, FrmCadEvento);
        FrmCadEvento.ShowModal;
    finally
        FrmCadEvento.Free;
    end;
end;

procedure TFrmPrincipal.CalendarioNumberClick(Sender: TObject);
begin
  AtualizaAgenda;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
    Self.Caption := 'Sistema de Reserva de Auditórios ' + UntFuncoes.GetBuildInfo(ExtractFilePath(Application.ExeName) + 'Eventos.exe');

    pAgenda.Align     := alClient;
    LedPainel.Caption := 'AGENDA DE EVENTOS';
    bsSkinPanelHoje.Caption := 'Hoje, ' + DataExtenso(Now);

    ZReadOnlyQueryUnidades.Open;

    ZReadOnlyQueryAmbienteAcesso.Close;
    ZReadOnlyQueryAmbienteAcesso.ParamByName('pIdOperador').Value := FrmDataModule.vCodOperador;
    ZReadOnlyQueryAmbienteAcesso.Open;

    ZQueryEventos.Open;

    Calendario.Date := Date;

    AtualizaAgenda;
    Previlegios;

    LabelOperador.Caption := FrmDataModule.vNomeOperador;

    Timer1.Interval := (1000 * 60) * 5;
    Timer1.Enabled := True;

    //Preenche o quadro de aviso
    RichEditAviso.Lines.Add('Para solicitar um ambiente, preencha');
    RichEditAviso.Lines.Add('formulário e envie para responsável');
    RichEditAviso.Lines.Add('');

    RichEditAviso.Lines.Add('Sesi - Auditório João Bênio');
    RichEditAviso.Lines.Add('Sesi - Salas 7º andar');
    RichEditAviso.Lines.Add('A/C Cláudio');
    PintaAzul;
    RichEditAviso.Lines.Add('servicos@sistemafieg.org.br');
    RichEditAviso.Lines.Add('');

    RichEditAviso.Lines.Add('Sesi - Salas 3º Andar');
    PintaAzul;
    RichEditAviso.Lines.Add('fabiana.fieg@sistemafieg.org.br');
    //PintaAzul;
    //RichEditAviso.Lines.Add('elizete@sistemafieg.org.br');
    RichEditAviso.Lines.Add('');

    RichEditAviso.Lines.Add('Sesi - Auditório 10º andar');
    RichEditAviso.Lines.Add('Palácio da Indústria - Salas');
    PintaAzul;
    RichEditAviso.Lines.Add('tania@sistemafieg.org.br');
    PintaAzul;
    RichEditAviso.Lines.Add('lusmair@sistemafieg.org.br');
end;

procedure TFrmPrincipal.CalendarioClick(Sender: TObject);
begin
  AtualizaAgenda;
end;

procedure TFrmPrincipal.bbEditaEventoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2001, 'L') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    try
        Application.CreateForm(TFrmCadEvento, FrmCadEvento);

        FrmCadEvento.ZQueryEvento.Close;
        FrmCadEvento.ZQueryEvento.ParamByName('pIdEvento').Value := ZQueryReservasID_EVENTO.AsInteger;
        FrmCadEvento.ZQueryEvento.Open;

        If (FrmDataModule.vNomeOperador <> FrmCadEvento.ZQueryEventoUSER_CADASTROU.AsString) And (FrmCadEvento.ZQueryEventoPERMITE_ALTERACAO.AsString <> 'S') And (FrmDataModule.vCodOperador <> 247) Then
        begin
            Application.MessageBox('Somente quem agendou poderá modificar', 'Atenção', 48);
            FrmCadEvento.Tag := 1;
        end;

        FrmCadEvento.ShowModal;
    finally
        FrmCadEvento.Free;
    end;
end;

procedure TFrmPrincipal.Mnu2001Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmCadEvento, FrmCadEvento);
        FrmCadEvento.ShowModal;
    finally
        FrmCadEvento.Free;
    end;
end;

procedure TFrmPrincipal.bsSkinSpeedButton2Click(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 2002, 'L') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    If FrmDataModule.vCodUnidade = 0 Then
    Begin
        Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
        FrmEscolhaUnid.ShowModal;
    End;

    If FrmDataModule.vCodUnidade > 0 Then
    Begin
        Try
            Application.CreateForm(TFrmCadEvento_Rec, FrmCadEvento_Rec);
            FrmCadEvento_Rec.ShowModal;
        Finally
            FrmCadEvento_Rec.Free
        End;
    End;
end;

procedure TFrmPrincipal.Mnu3001Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmPrEventosPer, FrmPrEventosPer);
        FrmPrEventosPer.ShowModal;
    finally
        FrmPrEventosPer.Free;
    end;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryEventos.Close;
    ZReadOnlyQueryUnidades.Close;
end;

procedure TFrmPrincipal.sbAgendaClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFrmPrincipal.ssbAgendaEventosClick(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmAgendaMes, FrmAgendaMes);
        FrmAgendaMes.ShowModal;
    finally
        FrmAgendaMes.Free;
    end;
end;

procedure TFrmPrincipal.Mnu3002Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmPrRecursoPer, FrmPrRecursoPer);
        FrmPrRecursoPer.ShowModal;
    finally
        FrmPrRecursoPer.Free;
    end;
end;

procedure TFrmPrincipal.Mnu2002Click(Sender: TObject);
begin
    try
        If FrmDataModule.vCodUnidade = 0 Then
        Begin
            Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
            FrmEscolhaUnid.ShowModal;
        End;

        If FrmDataModule.vCodUnidade > 0 Then
        Begin
            Application.CreateForm(TFrmCadEvento_Rec, FrmCadEvento_Rec);
            FrmCadEvento_Rec.ShowModal;
        End;
    finally
        FrmCadEvento_Rec.Free;
    end;
end;

procedure TFrmPrincipal.bsSkinSpeedButtonAgendaRecClick(Sender: TObject);
begin
    If FrmDataModule.vCodUnidade = 0 Then
    Begin
        Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
        FrmEscolhaUnid.ShowModal;
    End;

    If FrmDataModule.vCodUnidade > 0 Then
    try
        Application.CreateForm(TFrmRecursoAlugado, FrmRecursoAlugado);
        FrmRecursoAlugado.ShowModal;
    finally
        FrmRecursoAlugado.Free;
    end;
end;

procedure TFrmPrincipal.Mnu1004Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmArquivoConf, FrmArquivoConf);
        FrmArquivoConf.ShowModal;
    finally
        FrmArquivoConf.Free;
    end;
end;

procedure TFrmPrincipal.Mnu1005Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmCadOperador, FrmCadOperador);
        FrmCadOperador.ShowModal;
    finally
        FrmCadOperador.Free;
    end;
end;

procedure TFrmPrincipal.Mnu1006Click(Sender: TObject);
begin
    try
        Application.CreateForm(TFrmCadUnidade, FrmCadUnidade);
        FrmCadUnidade.ShowModal;
    finally
        FrmCadUnidade.Free;
    end;
end;

procedure TFrmPrincipal.Previlegios;
Var
    I, M: Integer;
begin
    for I := 0 to bsSkinMainMenu1.Items.Count - 1 do
    begin
        for M := 0 to bsSkinMainMenu1.Items[I].Count - 1 do
        begin
            If bsSkinMainMenu1.Items[I].Items[M].Caption <> '-' Then
            Begin
                ZReadOnlyQueryPrivilegios.Close;
                ZReadOnlyQueryPrivilegios.ParamByName('pCodOperador').Value := FrmDataModule.vCodOperador;
                ZReadOnlyQueryPrivilegios.ParamByName('pAcesso').Value := Copy(bsSkinMainMenu1.Items[I].Items[M].Name, 4, 4);
                ZReadOnlyQueryPrivilegios.Open;
                If Not ZReadOnlyQueryPrivilegios.eof Then
                Begin
                    If ZReadOnlyQueryPrivilegiosLIBERADO.AsInteger = 1 Then
                        bsSkinMainMenu1.Items[I].Items[M].Enabled := True
                    Else
                        bsSkinMainMenu1.Items[I].Items[M].Enabled := False;
                End;

                ZReadOnlyQueryPrivilegios.Close;
            End;
        end;
    end;
end;

procedure TFrmPrincipal.bsSkinPanel3Click(Sender: TObject);
begin
    Application.CreateForm(TFrmEntrada, FrmEntrada);
    FrmEntrada.ShowModal;
    FrmEntrada.Free;

    Previlegios;

    LabelOperador.Caption := FrmDataModule.vNomeOperador;
end;

procedure TFrmPrincipal.Mnu2003Click(Sender: TObject);
begin
    Application.CreateForm(TFrmEscolhaUnid, FrmEscolhaUnid);
    FrmEscolhaUnid.ShowModal;
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
    AtualizaAgenda;
end;

procedure TFrmPrincipal.ZQueryReservasAfterScroll(DataSet: TDataSet);
begin
    Eventos.Caption := ZQueryReservasLOOK_UNIDADE.AsString;
end;

procedure TFrmPrincipal.PintaAzul;
begin
    RichEditAviso.SelAttributes.Color := clBLue;
end;

procedure TFrmPrincipal.bsSkinSpeedButtonLocalizarEventoClick(
  Sender: TObject);
begin
    Application.CreateForm(TFrmPesqSolicitante, FrmPesqSolicitante);
    FrmPesqSolicitante.Showmodal;
end;

end.
