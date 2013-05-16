unit UntPermUnidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, wwcheckbox, LMDCustomButton,
  LMDButton, ExtCtrls, JvShape, DBClient;

type
  TFrmPermUnidade = class(TForm)
    ZQueryUnidade: TZQuery;
    DataSourceUnid_Operador: TDataSource;
    wwDBGrid1: TwwDBGrid;
    ClientDataSetUnid_Operador: TClientDataSet;
    ClientDataSetUnid_OperadorID_UNIDADE: TIntegerField;
    ClientDataSetUnid_OperadorUNIDADE: TStringField;
    JvShape3: TJvShape;
    BitBtnSair: TLMDButton;
    JvShape1: TJvShape;
    BitBtnSalvar: TLMDButton;
    wwCheckBox1: TwwCheckBox;
    ClientDataSetUnid_OperadorMARCA: TStringField;
    ZQueryUnidadeOper: TZQuery;
    ZReadOnlyQueryDiversos: TZReadOnlyQuery;
    JvShape2: TJvShape;
    LMDButtonMarcaTodos: TLMDButton;
    JvShape4: TJvShape;
    LMDButtonDesmacacao: TLMDButton;
    ZQueryUnidadeOperID_OPERADOR: TIntegerField;
    ZQueryUnidadeOperID_UNIDADE: TIntegerField;
    ZQueryUnidadeOperSTATUS: TSmallintField;
    ZQueryUnidadeCODUNIDADE: TIntegerField;
    ZQueryUnidadeDESC_UNIDADE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnSairClick(Sender: TObject);
    procedure BitBtnSalvarClick(Sender: TObject);
    procedure LMDButtonMarcaTodosClick(Sender: TObject);
    procedure LMDButtonDesmacacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPermUnidade: TFrmPermUnidade;

implementation

uses UntDataModule, UntCadOperador;

{$R *.dfm}

procedure TFrmPermUnidade.FormCreate(Sender: TObject);
var
    vUnidadeAnterior: String;
begin
    ZQueryUnidade.Open;

    ZQueryUnidadeOper.Close;
    ZQueryUnidadeOper.ParamByName('pIdOperador').Value := FrmCadOperador.ADODataSetOperadorCODIGO.AsInteger;
    ZQueryUnidadeOper.Open;

    While Not ZQueryUnidade.Eof Do
    Begin
        ClientDataSetUnid_Operador.Append;
        ClientDataSetUnid_OperadorID_UNIDADE.Value := ZQueryUnidadeCODUNIDADE.AsInteger;
        ClientDataSetUnid_OperadorUNIDADE.Value := ZQueryUnidadeDESC_UNIDADE.AsString;

        If ZQueryUnidadeOper.Lookup('Id_Unidade', ZQueryUnidadeCODUNIDADE.AsString, 'Status') = 1 Then
            ClientDataSetUnid_OperadorMARCA.Value := 'True'
        Else
            ClientDataSetUnid_OperadorMARCA.Value := 'False';

        ClientDataSetUnid_Operador.Post;

        ZQueryUnidade.Next;
    End;

    ClientDataSetUnid_Operador.First;
end;

procedure TFrmPermUnidade.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;

    ZQueryUnidade.Close;
    ZQueryUnidadeOper.Close;
end;

procedure TFrmPermUnidade.BitBtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmPermUnidade.BitBtnSalvarClick(Sender: TObject);
begin
    //Apaga os registros anteriores
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    ZReadOnlyQueryDiversos.SQL.Add('Delete From Unidade_Operador Where Id_Operador = ' + FrmCadOperador.ADODataSetOperadorCODIGO.AsString);
    ZReadOnlyQueryDiversos.ExecSQL;

    If Not ClientDataSetUnid_Operador.IsEmpty Then
        ClientDataSetUnid_Operador.First;

    While Not ClientDataSetUnid_Operador.Eof Do
    Begin
        ZQueryUnidadeOper.Append;
        ZQueryUnidadeOperID_OPERADOR.Value := FrmCadOperador.ADODataSetOperadorCODIGO.AsInteger;
        ZQueryUnidadeOperID_UNIDADE.Value := ClientDataSetUnid_OperadorID_UNIDADE.AsInteger;
        If ClientDataSetUnid_OperadorMARCA.AsString = 'True' Then
            ZQueryUnidadeOperSTATUS.Value := 1
        Else
            ZQueryUnidadeOperSTATUS.Value := 0;
        ZQueryUnidadeOper.Post;

        ClientDataSetUnid_Operador.Next;
    End;
end;

procedure TFrmPermUnidade.LMDButtonMarcaTodosClick(Sender: TObject);
begin
    If Not ClientDataSetUnid_Operador.IsEmpty Then
        ClientDataSetUnid_Operador.First;

    While Not ClientDataSetUnid_Operador.Eof Do
    Begin
        ClientDataSetUnid_Operador.Edit;
        ClientDataSetUnid_OperadorMARCA.Value := 'True';
        ClientDataSetUnid_Operador.Post;

        ClientDataSetUnid_Operador.Next;
    End;

    If Not ClientDataSetUnid_Operador.IsEmpty Then
        ClientDataSetUnid_Operador.First;
end;

procedure TFrmPermUnidade.LMDButtonDesmacacaoClick(Sender: TObject);
begin
    If Not ClientDataSetUnid_Operador.IsEmpty Then
        ClientDataSetUnid_Operador.First;

    While Not ClientDataSetUnid_Operador.Eof Do
    Begin
        ClientDataSetUnid_Operador.Edit;
        ClientDataSetUnid_OperadorMARCA.Value := 'False';
        ClientDataSetUnid_Operador.Post;

        ClientDataSetUnid_Operador.Next;
    End;

    If Not ClientDataSetUnid_Operador.IsEmpty Then
        ClientDataSetUnid_Operador.First;
end;

end.
