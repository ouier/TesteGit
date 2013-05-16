program Eventos;

{%File 'Agenda.ini'}

uses
  Forms,
  Windows,
  UntAgendaDiaria in 'UntAgendaDiaria.pas' {FrmAgendaDiaria},
  UntAgendaDiariaRec in 'UntAgendaDiariaRec.pas' {FrmAgendaDiariaRec},
  UntAgendaMes in 'UntAgendaMes.pas' {FrmAgendaMes},
  UntArquivoConf in 'UntArquivoConf.pas' {FrmArquivoConf},
  UntCadAmbiente in 'UntCadAmbiente.pas' {FrmCadAmbiente},
  UntCadEvento in 'UntCadEvento.pas' {FrmCadEvento},
  UntCadEvento_Rec in 'UntCadEvento_Rec.pas' {FrmCadEvento_Rec},
  UntCadOperador in 'UntCadOperador.pas' {FrmCadOperador},
  UntCadRecursos in 'UntCadRecursos.pas' {FrmCadRecursos},
  UntCadTipoEvento in 'UntCadTipoEvento.pas' {FrmCadTipoEvento},
  UntCadUnidade in 'UntCadUnidade.pas' {FrmCadUnidade},
  UntDataModule in 'UntDataModule.pas' {FrmDataModule: TDataModule},
  UntEntrada in 'UntEntrada.pas' {FrmEntrada},
  UntEscolhaUnid in 'UntEscolhaUnid.pas' {FrmEscolhaUnid},
  UntFuncoes in 'UntFuncoes.pas',
  UntMudaASenha in 'UntMudaASenha.pas' {FrmMudaASenha},
  UntPermissaoUser in 'UntPermissaoUser.pas' {FrmPermissaoUser},
  UntPermUnidade in 'UntPermUnidade.pas' {FrmPermUnidade},
  UntPesqAmbiente2 in 'UntPesqAmbiente2.pas' {FrmPesqAmbiente2},
  UntPesqAmbiente in 'UntPesqAmbiente.pas' {FrmPesqAmbiente},
  UntPesqEvento in 'UntPesqEvento.pas' {FrmPesqEvento},
  UntPesqEvento_Rec in 'UntPesqEvento_Rec.pas' {FrmPesqEvento_Rec},
  UntPesqOperador in 'UntPesqOperador.pas' {FrmPesqOperador},
  UntPesqRecursos in 'UntPesqRecursos.pas' {FrmPesqRecursos},
  UntPesqTipoEvento in 'UntPesqTipoEvento.pas' {FrmPesqTipoEvento},
  UntPesqUnidade in 'UntPesqUnidade.pas' {FrmPesqUnidade},
  UntPrEventosPer in 'UntPrEventosPer.pas' {FrmPrEventosPer},
  UntPrincipal in 'UntPrincipal.pas' {FrmPrincipal},
  UntRecursoAlugado in 'UntRecursoAlugado.pas' {FrmRecursoAlugado},
  UntPerAgendamento in 'UntPerAgendamento.pas' {FrmPerAgendamento},
  UntTrocaSenha in 'UntTrocaSenha.pas' {FrmTrocaSenha},
  UntPesqSolicitante in 'UntPesqSolicitante.pas' {FrmPesqSolicitante},
  UntPrRecurso in 'UntPrRecurso.pas' {FrmPrRecursoPer};

{$R *.res}

begin
    Application.Initialize;
    If (ParamStr(1) = '') Or (ParamStr(1) <> '/Spd') then
        Begin
            MessageBox(0, 'Este programa deve ser executado pelo programa Iniciador.exe', 'Atenção', 48);
            Application.Terminate;
        End
    Else
        Begin
            Application.CreateForm(TFrmDataModule, FrmDataModule);
  Application.CreateForm(TFrmEntrada, FrmEntrada);
  FrmEntrada.ShowModal;
            FrmEntrada.Free;

            Application.CreateForm(TFrmPrincipal, FrmPrincipal);
            Application.Run;
        End;
end.
