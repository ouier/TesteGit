unit UntCadTipoEvento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsSkinCtrls, ExtCtrls, BusinessSkinForm, bsSkinData,
  bsSkinGrids, bsDBGrids, StdCtrls, Mask, bsSkinBoxCtrls, bsdbctrls, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFrmCadTipoEvento = class(TForm)
    bsSkinData1: TbsSkinData;
    bsCompressedStoredSkin1: TbsCompressedStoredSkin;
    bsBusinessSkinForm1: TbsBusinessSkinForm;
    bsSkinSpeedButtonSair: TbsSkinSpeedButton;
    bsSkinSpeedButtonExcluir: TbsSkinSpeedButton;
    bsSkinSpeedButtonEditar: TbsSkinSpeedButton;
    bsSkinSpeedButtonNovo: TbsSkinSpeedButton;
    Label1: TLabel;
    bsSkinDBEditCodigo: TbsSkinDBEdit;
    Label2: TLabel;
    bsSkinDBEditTipo: TbsSkinDBEdit;
    bsSkinSpeedButtonGravar: TbsSkinSpeedButton;
    DataSourceTipoEvento: TDataSource;
    bsSkinSpeedButtonCancelar: TbsSkinSpeedButton;
    ZQueryTipoEvento: TZQuery;
    ZQueryTipoEventoID_TIPO_EVENTO: TIntegerField;
    ZQueryTipoEventoNOME: TStringField;
    procedure bsSkinSpeedButtonNovoClick(Sender: TObject);
    procedure bsSkinSpeedButtonEditarClick(Sender: TObject);
    procedure bsSkinSpeedButtonSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinSpeedButtonGravarClick(Sender: TObject);
    procedure bsSkinSpeedButtonExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataSourceTipoEventoStateChange(Sender: TObject);
    procedure bsSkinSpeedButtonCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZQueryTipoEventoBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadTipoEvento: TFrmCadTipoEvento;

implementation

uses
  UntPesqAmbiente, UntPesqTipoEvento, UntDataModule, UntPrincipal;

{$R *.dfm}

procedure TFrmCadTipoEvento.bsSkinSpeedButtonNovoClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1003, 'C') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryTipoEvento.Append;

    bsSkinDBEditCodigo.SetFocus;
end;

procedure TFrmCadTipoEvento.bsSkinSpeedButtonEditarClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1003, 'A') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;


    ZQueryTipoEvento.Edit;
end;

procedure TFrmCadTipoEvento.bsSkinSpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadTipoEvento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ZQueryTipoEvento.Close;
    Action := CaFree;
end;

procedure TFrmCadTipoEvento.bsSkinSpeedButtonGravarClick(Sender: TObject);
begin
    If Trim(bsSkinDBEditTipo.Text) = '' Then
    Begin
        Application.MessageBox('Digite uma descrição para o tipo', 'Atenção', 48);
        Exit;
    end;

    ZQueryTipoEvento.Post;
end;

procedure TFrmCadTipoEvento.bsSkinSpeedButtonExcluirClick(Sender: TObject);
begin
    If Not FrmDataModule.ChecaPrevilegio(FrmDataModule.vCodOperador, 1003, 'E') Then
    Begin
        Application.MessageBox('Sem acesso para esta opção', 'Atenção', 48);
        Exit;
    End;

    If Application.MessageBox('Deseja realmente excluir', 'Atenção', 292) = 7 Then
        Exit;

    ZQueryTipoEvento.Delete;
end;

procedure TFrmCadTipoEvento.FormCreate(Sender: TObject);
begin
    Self.Top := 84;
	Self.Left := (FrmPrincipal.Width  div 2) - (Self.Width div 2);

    ZQueryTipoEvento.Open;
end;

procedure TFrmCadTipoEvento.DataSourceTipoEventoStateChange(Sender: TObject);
Var
    Edita : Boolean;
begin
    Edita := ((Sender As TDataSource).State In [dsinsert, dsedit]);
    bsSkinSpeedButtonNovo.Enabled := Not Edita;
    bsSkinSpeedButtonEditar.Enabled := Not Edita;
    bsSkinSpeedButtonCancelar.Enabled := Edita;
    bsSkinSpeedButtonGravar.Enabled := Edita;
    bsSkinSpeedButtonExcluir.Enabled := Not Edita;
end;

procedure TFrmCadTipoEvento.bsSkinSpeedButtonCancelarClick(Sender: TObject);
begin
    ZQueryTipoEvento.Cancel;
end;

procedure TFrmCadTipoEvento.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    If Key = 113 Then       //Tecla F2
        Try
            Application.CreateForm(TFrmPesqTipoEvento, FrmPesqTipoEvento);
            FrmPesqTipoEvento.ShowModal;
        Finally
            If FrmPesqTipoEvento.Tag = 1 Then
            Begin
                ZQueryTipoEvento.Close;
                ZQueryTipoEvento.ParamByName('pIdTipoEvento').Value := FrmPesqTipoEvento.ZReadOnlyQueryPesquisaID_TIPO_EVENTO.AsInteger;
                ZQueryTipoEvento.Open;
            End;

            FrmPesqTipoEvento.Free;
        End;
end;

procedure TFrmCadTipoEvento.ZQueryTipoEventoBeforePost(DataSet: TDataSet);
begin
    If ZQueryTipoEvento.State In [dsInsert] Then
        ZQueryTipoEventoID_TIPO_EVENTO.Value := FrmDataModule.NovoCodigo('ID_TIPO_EVENTO', 0);
end;

end.
