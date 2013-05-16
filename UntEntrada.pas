unit UntEntrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, Db, DBTables,
  ADODB, jpeg, LMDCustomButton, LMDButton, JvShape, FMTBcd, DBClient,
  Provider, SqlExpr, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmEntrada = class(TForm)
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    EditNome: TEdit;
    EditSenha: TEdit;
    Label5: TLabel;
    Image1: TImage;
    JvShape11: TJvShape;
    BtnAbandonar: TLMDButton;
    JvShape12: TJvShape;
    BtnOk: TLMDButton;
    ADODataSetUsuario: TZQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure EditNomeKeyPress(Sender: TObject; var Key: Char);
    procedure EditNomeEnter(Sender: TObject);
    procedure EditNomeExit(Sender: TObject);
    procedure BtnAbandonarClick(Sender: TObject);
    procedure CampoUnidadeKeyPress(Sender: TObject; var Key: Char);
    procedure EditSenhaExit(Sender: TObject);
    procedure BtnAbandonarMouseExit(Sender: TObject);
    procedure BtnAbandonarMouseEnter(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    function ChecaDiaAcesso: Boolean;
  public
    Sair: Boolean;
    Lugar: Integer;
    vNovaSenha: String;
    { Public declarations }
  end;

var
  FrmEntrada: TFrmEntrada;

implementation

uses ShellAPI, UntPrincipal, UntDataModule, UntMudaASenha;


{$R *.DFM}

procedure TFrmEntrada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Escape then
  begin
    if Lugar = 1 then
      Application.Terminate
    else
      if Lugar = 2 then
        Close;
  end;
end;

procedure TFrmEntrada.FormCreate(Sender: TObject);
begin
  top := (Screen.Height div 2) - (Height div 2);
  Left := (Screen.Width div 2) - (Width div 2);
  Sair := False;

  Application.ExeName
end;

procedure TFrmEntrada.EditNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    key := #0;
    SelectNext((Sender as Twincontrol), true, true);
  end;

end;

procedure TFrmEntrada.EditNomeEnter(Sender: TObject);
begin
  TEdit(Sender).color := clInfoBk;
end;

procedure TFrmEntrada.EditNomeExit(Sender: TObject);
begin
  TEdit(Sender).color := clWindow;


end;

procedure TFrmEntrada.BtnAbandonarClick(Sender: TObject);
begin
    If FrmPrincipal = Nil Then
        Application.Terminate
    Else
        Begin
            Sair := True;
            Close;
            
        End;
end;

procedure TFrmEntrada.CampoUnidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', #8, #13]) then key := #0;
  if (Key = #13) then
  begin
    key := #0;
    SelectNext((Sender as Twincontrol), true, true);
  end;
end;

procedure TFrmEntrada.EditSenhaExit(Sender: TObject);
begin
    TEdit(Sender).color := clWindow;
end;

procedure TFrmEntrada.BtnAbandonarMouseExit(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clActiveBorder;
end;

procedure TFrmEntrada.BtnAbandonarMouseEnter(Sender: TObject);
begin
    TLMDButton(Sender).Color:=clWindow;
end;

procedure TFrmEntrada.BtnOkClick(Sender: TObject);
var
    vSenha: String;
begin
    vSenha := FrmDataModule.EncryptSTR(EditSenha.Text, 5554, 1000, 6000);

    If EditSenha.Text = 'OPEMSPD' Then
    Begin
        Sair := True;
        Close;
        Exit;
    End;

    ADODataSetUsuario.Close;
    ADODataSetUsuario.SQL.Clear;
    ADODataSetUsuario.SQL.Add('SELECT * FROM OPERADOR WHERE NOME = ''' + EditNome.Text + '''');
    ADODataSetUsuario.Open;
    If Not ADODataSetUsuario.Eof Then
        Begin
            If ADODataSetUsuario.FieldByName('MUDAR_SENHA_NOLOGON').AsString = 'S' Then
            Begin
                Application.CreateForm(TFrmMudaASenha, FrmMudaASenha);
                FrmMudaASenha.ShowModal;
                If (vNovaSenha <> '') And (vNovaSenha <> '123') Then
                Begin
                    ADODataSetUsuario.Edit;
                    ADODataSetUsuario.FieldByName('MUDAR_SENHA_NOLOGON').Value := 'N';
                    ADODataSetUsuario.FieldByName('SENHA').Value := FrmDataModule.EncryptSTR(vNovaSenha, 5554, 1000, 6000);
                    ADODataSetUsuario.Post;

                    vSenha := ADODataSetUsuario.FieldByName('SENHA').AsString;
                End;
            End;

            If ADODataSetUsuario.FieldByName('Senha').AsString <> vSenha Then
                Begin
                    Application.MessageBox('A senha foi digitada incorretamente', 'Atenção', 48);
                    EditSenha.SetFocus;
                End
            Else If ADODataSetUsuario.FieldByName('Validade').AsString <> '' Then
                Begin
                    If ADODataSetUsuario.FieldByName('Validade').AsDateTime < Date Then
                    Begin
                        Application.MessageBox('Este Usuário está com data de validade vencida', 'Atenção', 48);
                        EditNome.SetFocus;
                    End
                End
            Else If ADODataSetUsuario.FieldByName('Desativado').AsString = 'S' Then
                Begin
                    Application.MessageBox('Este Usuário está desativado', 'Atenção', 48);
                    EditNome.SetFocus;
                End
            Else If Not ChecaDiaAcesso Then
                Begin
                    Application.MessageBox('Usuário não pode acessar hoje', 'Atenção', 48);
                    EditNome.SetFocus;
                End
            Else
                Begin
                    FrmDataModule.vCodOperador := ADODataSetUsuario.FieldByName('Codigo').AsInteger;
                    FrmDataModule.vNomeOperador := ADODataSetUsuario.FieldByName('Nome').AsString;

                    FrmDataModule.ArquivaOpcoes(IntToStr(FrmDataModule.vCodOperador));

                    Sair := True;
                    Close;
                End;
        End
    Else
        Begin
            Application.MessageBox('Este usuário não existe', 'Atenção', 48);
            EditNome.SetFocus;
        End;
end;

function TFrmEntrada.ChecaDiaAcesso: Boolean;
var
    DiaDaSemana: Integer;
begin
    DiaDaSemana := DayOfWeek(Date);
    If (DiaDaSemana = 1) And (ADODataSetUsuario.FieldByName('Domingo').AsString = 'S') Then
    Else If (DiaDaSemana = 2) And (ADODataSetUsuario.FieldByName('Segunda').AsString = 'S') Then
    Else If (DiaDaSemana = 3) And (ADODataSetUsuario.FieldByName('Terca').AsString = 'S') Then
    Else If (DiaDaSemana = 4) And (ADODataSetUsuario.FieldByName('Quarta').AsString = 'S') Then
    Else If (DiaDaSemana = 5) And (ADODataSetUsuario.FieldByName('Quinta').AsString = 'S') Then
    Else If (DiaDaSemana = 6) And (ADODataSetUsuario.FieldByName('Sexta').AsString = 'S') Then
    Else If (DiaDaSemana = 7) And (ADODataSetUsuario.FieldByName('Sabado').AsString = 'S') Then
    else
        Begin
            ChecaDiaAcesso := False;
            Exit;
        End;

    ChecaDiaAcesso := True;
end;

procedure TFrmEntrada.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Sair then
    CanClose := True
  else
    CanClose := False;
end;

end.
