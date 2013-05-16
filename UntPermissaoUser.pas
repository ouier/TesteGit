unit UntPermissaoUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, StdCtrls, wwcheckbox, LMDCustomButton,
  LMDButton, ExtCtrls, JvShape, DBClient, DBGrids;

type
  TFrmPermissaoUser = class(TForm)
    ZQueryAmb_Unidade: TZQuery;
    DataSourceAmb_Unidade: TDataSource;
    wwDBGrid1: TwwDBGrid;
    ClientDataSetAmb_Unidade: TClientDataSet;
    ClientDataSetAmb_UnidadeID_UNIDADE: TIntegerField;
    ClientDataSetAmb_UnidadeUNIDADE: TStringField;
    ClientDataSetAmb_UnidadeID_AMBIENTE: TIntegerField;
    ClientDataSetAmb_UnidadeAMBIENTE: TStringField;
    JvShape3: TJvShape;
    BitBtnSair: TLMDButton;
    JvShape1: TJvShape;
    BitBtnSalvar: TLMDButton;
    ZQueryAmb_UnidadeID_UNIDADE: TIntegerField;
    ZQueryAmb_UnidadeUNIDADE: TStringField;
    ZQueryAmb_UnidadeID_AMBIENTE: TIntegerField;
    ZQueryAmb_UnidadeAMBIENTE: TStringField;
    wwCheckBox1: TwwCheckBox;
    ClientDataSetAmb_UnidadeMARCA: TStringField;
    ZQueryAmbienteOper: TZQuery;
    ZQueryAmbienteOperID_OPERADOR: TIntegerField;
    ZQueryAmbienteOperID_AMBIENTE: TIntegerField;
    ZQueryAmbienteOperID_UNIDADE: TIntegerField;
    ZReadOnlyQueryDiversos: TZReadOnlyQuery;
    ZQueryAmbienteOperSTATUS: TSmallintField;
    JvShape2: TJvShape;
    LMDButtonMarcaTodos: TLMDButton;
    JvShape4: TJvShape;
    LMDButtonDesmacacao: TLMDButton;
    ClientDataSetAmb_UnidadeALT_EVENTO: TStringField;
    ClientDataSetAmb_UnidadeEXC_EVENTO: TStringField;
    wwCheckBoxAltEvento: TwwCheckBox;
    wwCheckBoxExcEvento: TwwCheckBox;
    ZQueryAmbienteOperALT_EVENTO: TStringField;
    ZQueryAmbienteOperEXC_EVENTO: TStringField;
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
  FrmPermissaoUser: TFrmPermissaoUser;

implementation

uses UntDataModule, UntCadOperador;

{$R *.dfm}

procedure TFrmPermissaoUser.FormCreate(Sender: TObject);
var
    vUnidadeAnterior: String; vTemp: Variant;
begin
    ClientDataSetAmb_Unidade.Open;

    ZQueryAmbienteOper.Close;
    ZQueryAmbienteOper.ParamByName('pIdOperador').Value := FrmCadOperador.ADODataSetOperadorCODIGO.AsInteger;
    ZQueryAmbienteOper.Open;

    ZQueryAmb_Unidade.Open;

    While Not ZQueryAmb_Unidade.Eof Do
    Begin
        ClientDataSetAmb_Unidade.Append;
        ClientDataSetAmb_UnidadeID_UNIDADE.Value := ZQueryAmb_UnidadeID_UNIDADE.AsInteger;

        If vUnidadeAnterior <> ZQueryAmb_UnidadeUNIDADE.AsString Then
            ClientDataSetAmb_UnidadeUNIDADE.Value := ZQueryAmb_UnidadeUNIDADE.AsString;

        ClientDataSetAmb_UnidadeID_AMBIENTE.Value := ZQueryAmb_UnidadeID_AMBIENTE.AsInteger;
        ClientDataSetAmb_UnidadeAMBIENTE.Value := ZQueryAmb_UnidadeAMBIENTE.AsString;

        If VarToStr(ZQueryAmbienteOper.Lookup('Id_Ambiente', ZQueryAmb_UnidadeID_AMBIENTE.AsString, 'Status')) = '1' Then
            ClientDataSetAmb_UnidadeMARCA.Value := 'True'
        Else
            ClientDataSetAmb_UnidadeMARCA.Value := 'False';

        ClientDataSetAmb_UnidadeALT_EVENTO.Value := VarToStr(ZQueryAmbienteOper.Lookup('Id_Ambiente', ZQueryAmb_UnidadeID_AMBIENTE.AsString, 'Alt_Evento'));
        ClientDataSetAmb_UnidadeEXC_EVENTO.Value := VarToStr(ZQueryAmbienteOper.Lookup('Id_Ambiente', ZQueryAmb_UnidadeID_AMBIENTE.AsString, 'Exc_Evento'));

        ClientDataSetAmb_Unidade.Post;

        vUnidadeAnterior := ZQueryAmb_UnidadeUNIDADE.AsString;

        ZQueryAmb_Unidade.Next;
    End;

    ClientDataSetAmb_Unidade.First;
end;

procedure TFrmPermissaoUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := CaFree;

    ZQueryAmb_Unidade.Close;
    ZQueryAmbienteOper.Close;
    ClientDataSetAmb_Unidade.Close;
end;

procedure TFrmPermissaoUser.BitBtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmPermissaoUser.BitBtnSalvarClick(Sender: TObject);
begin
    //Apaga os registros anteriores
    ZReadOnlyQueryDiversos.Close;
    ZReadOnlyQueryDiversos.SQL.Clear;
    ZReadOnlyQueryDiversos.SQL.Add('Delete From Ambiente_Operador Where Id_Operador = ' + FrmCadOperador.ADODataSetOperadorCODIGO.AsString);
    ZReadOnlyQueryDiversos.ExecSQL;

    If Not ClientDataSetAmb_Unidade.IsEmpty Then
        ClientDataSetAmb_Unidade.First;

    While Not ClientDataSetAmb_Unidade.Eof Do
    Begin
        ZQueryAmbienteOper.Append;
        ZQueryAmbienteOperID_OPERADOR.Value := FrmCadOperador.ADODataSetOperadorCODIGO.AsInteger;
        ZQueryAmbienteOperID_AMBIENTE.Value := ClientDataSetAmb_UnidadeID_AMBIENTE.AsInteger;
        ZQueryAmbienteOperID_UNIDADE.Value := ClientDataSetAmb_UnidadeID_UNIDADE.AsInteger;
        ZQueryAmbienteOperALT_EVENTO.Value := ClientDataSetAmb_UnidadeALT_EVENTO.AsString;
        ZQueryAmbienteOperEXC_EVENTO.Value := ClientDataSetAmb_UnidadeEXC_EVENTO.AsString;

        If ClientDataSetAmb_UnidadeMARCA.AsString = 'True' Then
            ZQueryAmbienteOperSTATUS.Value := 1
        Else
            ZQueryAmbienteOperSTATUS.Value := 0;
        ZQueryAmbienteOper.Post;

        ClientDataSetAmb_Unidade.Next;
    End;
end;

procedure TFrmPermissaoUser.LMDButtonMarcaTodosClick(Sender: TObject);
begin
    If Not ClientDataSetAmb_Unidade.IsEmpty Then
        ClientDataSetAmb_Unidade.First;

    While Not ClientDataSetAmb_Unidade.Eof Do
    Begin
        ClientDataSetAmb_Unidade.Edit;
        ClientDataSetAmb_UnidadeMARCA.Value := 'True';
        ClientDataSetAmb_Unidade.Post;

        ClientDataSetAmb_Unidade.Next;
    End;

    If Not ClientDataSetAmb_Unidade.IsEmpty Then
        ClientDataSetAmb_Unidade.First;
end;

procedure TFrmPermissaoUser.LMDButtonDesmacacaoClick(Sender: TObject);
begin
    If Not ClientDataSetAmb_Unidade.IsEmpty Then
        ClientDataSetAmb_Unidade.First;

    While Not ClientDataSetAmb_Unidade.Eof Do
    Begin
        ClientDataSetAmb_Unidade.Edit;
        ClientDataSetAmb_UnidadeMARCA.Value := 'False';
        ClientDataSetAmb_Unidade.Post;

        ClientDataSetAmb_Unidade.Next;
    End;

    If Not ClientDataSetAmb_Unidade.IsEmpty Then
        ClientDataSetAmb_Unidade.First;
end;

end.
