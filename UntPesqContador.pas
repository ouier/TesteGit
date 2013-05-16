unit UntPesqContador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Db, DBTables;

type
  TFrmPesqContador = class(TForm)
    wwDBGridTabela: TwwDBGrid;
    BitBtnFechar: TBitBtn;
    Panel2: TPanel;
    EditDescricao: TEdit;
    QueryBase: TQuery;
    DataSourceBase: TDataSource;
    QueryBaseID: TIntegerField;
    QueryBaseRAZAOSOCIAL: TStringField;
    procedure BitBtnFecharClick(Sender: TObject);
    procedure wwDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqContador: TFrmPesqContador;

implementation

{$R *.DFM}

procedure TFrmPesqContador.BitBtnFecharClick(Sender: TObject);
begin
    Self.Tag := 0;
    Close;
end;

procedure TFrmPesqContador.wwDBGridTabelaKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
    Begin
        Self.Tag := 1;
        Close;
    End;
end;

procedure TFrmPesqContador.EditDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
    Begin
        QueryBase.Close;
        QueryBase.ParamByName('pDescricao').Value := EditDescricao.Text + '%';
        QueryBase.Open;
        If Not QueryBase.Eof Then
            wwDBGridTabela.SetFocus;
    End;
end;

procedure TFrmPesqContador.FormCreate(Sender: TObject);
begin
    Self.Top := 110;
	Self.Left := (Screen.Width  div 2) - (Self.Width div 2);

    QueryBase.Open;
end;

end.
