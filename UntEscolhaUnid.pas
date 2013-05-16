unit UntEscolhaUnid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LMDCustomButton, LMDButton, ExtCtrls, JvShape, StdCtrls, Mask,
  bsSkinBoxCtrls, bsdbctrls;

type
  TFrmEscolhaUnid = class(TForm)
    Label9: TLabel;
    ButtonBuscaUnid: TButton;
    JvShape12: TJvShape;
    LMDButtonOk: TLMDButton;
    JvShape1: TJvShape;
    LMDButtonSair: TLMDButton;
    EditUnidade: TEdit;
    procedure ButtonBuscaUnidClick(Sender: TObject);
    procedure EditUnidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDButtonSairClick(Sender: TObject);
    procedure LMDButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEscolhaUnid: TFrmEscolhaUnid;

implementation

uses UntDataModule, UntPesqUnidade, DB;

{$R *.dfm}

procedure TFrmEscolhaUnid.ButtonBuscaUnidClick(Sender: TObject);
begin
    Try
        Application.CreateForm(TFrmPesqUnidade, FrmPesqUnidade);
        FrmPesqUnidade.ShowModal;
    Finally
        If FrmPesqUnidade.Tag = 1 Then
        Begin
            EditUnidade.Tag := FrmPesqUnidade.ZReadOnlyQueryPesquisaCODUNIDADE.AsInteger;
            EditUnidade.Text := FrmPesqUnidade.ZReadOnlyQueryPesquisaDESC_UNIDADE.AsString;
        End;

        FrmPesqUnidade.Free;
    End;
end;

procedure TFrmEscolhaUnid.EditUnidadeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 120 Then       //Tecla F9
        ButtonBuscaUnid.Click;
end;

procedure TFrmEscolhaUnid.LMDButtonSairClick(Sender: TObject);
begin
    FrmEscolhaUnid.Tag := 0;
    Close;
end;

procedure TFrmEscolhaUnid.LMDButtonOkClick(Sender: TObject);
begin
    If EditUnidade.Tag > 0 Then
    Begin
        FrmEscolhaUnid.Tag := 1;
        FrmDataModule.vCodUnidade := EditUnidade.Tag;
        Close;
    End;
end;

procedure TFrmEscolhaUnid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

end.
