unit UntMudaASenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomButton, LMDButton, ExtCtrls, JvShape,
  JvComponent, JvEnterTab;

type
  TFrmMudaASenha = class(TForm)
    EditSenhaNovaI: TEdit;
    EditSenhaNovaII: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    JvShape3: TJvShape;
    BitBtnSair: TLMDButton;
    JvEnterAsTab1: TJvEnterAsTab;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMudaASenha: TFrmMudaASenha;

implementation

uses UntEntrada, UntPrincipal;

{$R *.dfm}

procedure TFrmMudaASenha.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (Screen.Width  div 2) - (Self.Width div 2);
end;

procedure TFrmMudaASenha.BitBtnSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMudaASenha.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    If EditSenhaNovaI.Text <> EditSenhaNovaII.Text Then
        Begin
            Application.MessageBox('As senhas não bate', 'Atenção', 48);

            CanClose := False;
            EditSenhaNovaI.SetFocus;
        End
    Else
        FrmEntrada.vNovaSenha := EditSenhaNovaI.Text;
end;

end.
