unit UntArquivoConf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, StdCtrls, IniFiles;

type
  TFrmArquivoConf = class(TForm)
    Label2: TLabel;
    EditNomeExec: TEdit;
    bsSkinSpeedButtonSair: TbsSkinSpeedButton;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    ButtonBusca: TButton;
    OpenDialogo: TOpenDialog;
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure ButtonBuscaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ArquivoIni: TIniFile;
  public
    { Public declarations }
  end;

var
  FrmArquivoConf: TFrmArquivoConf;

implementation

{$R *.dfm}

procedure TFrmArquivoConf.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmArquivoConf.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If Messagebox(0, 'Confirma a gravação do arquivo', 'Atenção', 292) = 7 Then
        Exit;

    ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Agenda.ini');
    ArquivoIni.WriteString('Atualizacao','ExeNovo',EditNomeExec.Text);
    ArquivoIni.Free;
end;

procedure TFrmArquivoConf.ButtonBuscaClick(Sender: TObject);
begin
    OpenDialogo.Execute;
    EditNomeExec.Text := OpenDialogo.FileName;
end;

procedure TFrmArquivoConf.FormCreate(Sender: TObject);
begin
    ArquivoIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Agenda.ini');
    EditNomeExec.Text := ArquivoIni.ReadString('Atualizacao', 'ExeNovo', '');
end;

end.
