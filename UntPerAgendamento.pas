unit UntPerAgendamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, bsSkinBoxCtrls, Buttons, CheckLst;

type
  TFrmPerAgendamento = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    bsSkinDateEditInicial: TbsSkinDateEdit;
    bsSkinDateEditFinal: TbsSkinDateEdit;
    BitBtnFechar: TBitBtn;
    CheckListBoxDiasEventos: TCheckListBox;
    Label2: TLabel;
    BitBtnGravar: TBitBtn;
    procedure bsSkinDateEditInicialKeyPress(Sender: TObject;
      var Key: Char);
    procedure BitBtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPerAgendamento: TFrmPerAgendamento;

implementation

uses UntPrincipal;

{$R *.dfm}

procedure TFrmPerAgendamento.bsSkinDateEditInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
        bsSkinDateEditFinal.SetFocus;
end;

procedure TFrmPerAgendamento.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPerAgendamento.FormCreate(Sender: TObject);
var
    I: Integer;
begin
    Self.Top := 250;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    For I := 0 To CheckListBoxDiasEventos.Items.Count - 1 Do
        CheckListBoxDiasEventos.Checked[I] := True;
end;

procedure TFrmPerAgendamento.BitBtnGravarClick(Sender: TObject);
begin
    If Application.MessageBox('Confirma o período para o agendamento automático', 'Atenção', 292) = 7 Then
        Exit;

    Self.Tag := 1;
    Close;
end;

end.
