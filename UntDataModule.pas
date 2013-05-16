unit UntDataModule;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, DBClient, ADODB,
  Provider, Dialogs, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZConnection, MidasLib, Forms;

type
  TFrmDataModule = class(TDataModule)
    ZConnection1: TZConnection;
    ZQueryCodigo: TZQuery;
    ZQueryCodigoNO_CAMPO: TStringField;
    ZQueryCodigoNR_ATUAL: TIntegerField;
    ZQueryDiversos: TZQuery;
    ZReadOnlyQueryDiversos2: TZQuery;
    ZReadOnlyQueryDiversos: TZQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vCodOperador, vCodUnidade: Integer; vNomeOperador: String;
    function NovoCodigo(vVariavel: String; vNumero: Integer): Integer;
    function EncryptSTR(const InString: string; StartKey, MultKey, AddKey: Integer): string;
    function DecryptSTR(const InString: string; StartKey, MultKey, AddKey: Integer): string;
    function ChecaPrevilegio(vCodOperador, vAcesso: Integer; vTipo: String): Boolean;
    procedure ArquivaOpcoes(vCodOperador: String);
  end;

var
  FrmDataModule: TFrmDataModule;

implementation

{$R *.dfm}

function TFrmDataModule.NovoCodigo(vVariavel: String; vNumero: Integer): Integer;
begin
    ZQueryCodigo.Close;
    ZQueryCodigo.Open;

    If Not ZQueryCodigo.IsEmpty Then
        ZQueryCodigo.First;
    If ZQueryCodigo.Locate('NO_CAMPO', vVariavel, []) Then
        Begin
            ZQueryCodigo.Edit;
            If vNumero = 0 Then
                ZQueryCodigoNR_ATUAL.Value := ZQueryCodigoNR_ATUAL.AsInteger + 1
            Else
                Begin
                    If ZQueryCodigoNR_ATUAL.AsInteger = vNumero Then
                    Begin
                        ZQueryCodigoNR_ATUAL.Value := ZQueryCodigoNR_ATUAL.AsInteger - 1;
                        ZQueryCodigo.Post;
                        Exit;
                    End;
                End;
        End
    Else
        Begin
            ZQueryCodigo.Append;
            ZQueryCodigoNR_ATUAL.Value := 1;
            ZQueryCodigoNO_CAMPO.Value := vVariavel;
        End;

    NovoCodigo := ZQueryCodigoNR_ATUAL.AsInteger;
    ZQueryCodigo.Post;
end;

procedure TFrmDataModule.DataModuleDestroy(Sender: TObject);
begin
    ZQueryCodigo.Close;
end;

procedure TFrmDataModule.DataModuleCreate(Sender: TObject);
begin
    //10.21.153.51:/bancos/AGENDA.FDB
    //10.21.153.51:/bancos/AGENDA_BAK.FDB

    //Prepara a formatação de data
    DateSeparator := '/';
    ShortDateFormat := 'dd/mm/yyyy';

    ZConnection1.Connected := False;
    ZConnection1.ReadOnly := False;

    ZConnection1.Connected := True;
    ZQueryCodigo.Open;

    //Às vezes aparece registros sem pai
    ZQueryDiversos.Close;
    ZQueryDiversos.SQL.Clear;
    ZQueryDiversos.SQL.Add('DELETE FROM RESERVAS WHERE NOT EXISTS(SELECT * FROM EVENTOS WHERE EVENTOS.id_evento = RESERVAS.id_evento)');
    ZQueryDiversos.ExecSQL;
end;

function TFrmDataModule.EncryptSTR(const InString: string; StartKey, MultKey, AddKey: Integer): string;
var
  I: Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function TFrmDataModule.DecryptSTR(const InString: string; StartKey, MultKey, AddKey: Integer): string;
var
  I: Byte;
begin
  Result := '';
  for I := 1 to Length(InString) do
  begin
    Result := Result + CHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;

function TFrmDataModule.ChecaPrevilegio(vCodOperador, vAcesso: Integer; vTipo: String): Boolean;
begin
    ZQueryDiversos.Close;
    ZQueryDiversos.Sql.Clear;
    ZQueryDiversos.Sql.Add('SELECT * FROM OP_OPERADOR WHERE CODOPERADOR = ' + IntToStr(vCodOperador) + ' AND ACESSO = ' + IntToStr(vAcesso));
    ZQueryDiversos.Open;
    If Not ZQueryDiversos.Eof Then
        Begin
            ChecaPrevilegio := True;

            If vTipo = 'C' Then
                Begin
                    If ZQueryDiversos.FieldByName('CADASTRAR').AsInteger = 0 Then
                        ChecaPrevilegio := False
                End
            Else If vTipo = 'A' Then
                Begin
                    If ZQueryDiversos.FieldByName('ALTERAR').AsInteger = 0 Then
                        ChecaPrevilegio := False
                End
            Else If vTipo = 'E' Then
                Begin
                    If ZQueryDiversos.FieldByName('EXCLUIR').AsInteger = 0 Then
                        ChecaPrevilegio := False
                End
            Else If vTipo = 'L' Then
                Begin
                    If ZQueryDiversos.FieldByName('LIBERADO').AsInteger = 0 Then
                        ChecaPrevilegio := False;
                End;
        End
    Else
        ChecaPrevilegio := True;
end;

procedure TFrmDataModule.ArquivaOpcoes(vCodOperador: String);
var
    vTodosAmbientes, vTodasUnidades: String;
begin
    //Verifica se acessa todos ambientes
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    ZReadOnlyQueryDiversos.SQL.Add('Select * From Operador Where Codigo = ' + vCodOperador);
    ZReadOnlyQueryDiversos.Open;
    If Not ZReadOnlyQueryDiversos.IsEmpty Then
    Begin
        If ZReadOnlyQueryDiversos.FieldByName('TodosAmbientes').AsString = 'S' Then
            vTodosAmbientes := 'S'
        Else
            vTodosAmbientes := 'N';

        If ZReadOnlyQueryDiversos.FieldByName('TodasUnidades').AsString = 'S' Then
            vTodasUnidades := 'S'
        Else
            vTodasUnidades := 'N';
    End;

    //**************************************************************************************
    //Apaga os ambientes do usuário
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    ZReadOnlyQueryDiversos.SQL.Add('DELETE FROM TEMP_AMB_OPERADOR WHERE ID_OPERADOR = ' + vCodOperador);
    ZReadOnlyQueryDiversos.ExecSQL;

    //Pega as opções de ambiente
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    If vTodosAmbientes = 'S' Then
        ZReadOnlyQueryDiversos.SQL.Add('SELECT ID_AMBIENTE, ' + vCodOperador + ' ID_OPERADOR, ID_UNIDADE FROM AMBIENTES')
    Else
        ZReadOnlyQueryDiversos.SQL.Add('SELECT * FROM AMBIENTE_OPERADOR WHERE STATUS = 1 AND ID_OPERADOR = ' + vCodOperador);

    ZReadOnlyQueryDiversos.Open;
    While Not ZReadOnlyQueryDiversos.Eof Do
    Begin
        ZReadOnlyQueryDiversos2.Close;
        ZReadOnlyQueryDiversos2.SQL.Clear;
        ZReadOnlyQueryDiversos2.SQL.Add('INSERT INTO TEMP_AMB_OPERADOR (ID_OPERADOR, ID_AMBIENTE, ID_UNIDADE) VALUES(' + vCodOperador + ',' + ZReadOnlyQueryDiversos.FieldByName('Id_Ambiente').AsString + ',' + ZReadOnlyQueryDiversos.FieldByName('Id_Unidade').AsString + ')');
        ZReadOnlyQueryDiversos2.ExecSQL;

        ZReadOnlyQueryDiversos.Next;
    End;


    //**************************************************************************************
    //Apaga as Unidades do
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    ZReadOnlyQueryDiversos.SQL.Add('DELETE FROM TEMP_UNID_OPERADOR WHERE ID_OPERADOR = ' + vCodOperador);
    ZReadOnlyQueryDiversos.ExecSQL;

    //Pega as opções de unidades
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    If vTodasUnidades = 'S' Then
        ZReadOnlyQueryDiversos.SQL.Add('SELECT CODUNIDADE ID_UNIDADE, ' + vCodOperador + ' ID_OPERADOR FROM UNIDADES')
    Else
        ZReadOnlyQueryDiversos.SQL.Add('SELECT * FROM UNIDADE_OPERADOR WHERE STATUS = 1 AND ID_OPERADOR = ' + vCodOperador);

    ZReadOnlyQueryDiversos.Open;
    While Not ZReadOnlyQueryDiversos.Eof Do
    Begin
        ZReadOnlyQueryDiversos2.Close;
        ZReadOnlyQueryDiversos2.SQL.Clear;
        ZReadOnlyQueryDiversos2.SQL.Add('INSERT INTO TEMP_UNID_OPERADOR (ID_OPERADOR, ID_UNIDADE) VALUES(' + vCodOperador + ',' + ZReadOnlyQueryDiversos.FieldByName('Id_Unidade').AsString + ')');
        ZReadOnlyQueryDiversos2.ExecSQL;

        ZReadOnlyQueryDiversos.Next;
    End;
end;

end.
