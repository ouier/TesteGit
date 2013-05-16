unit UntAgendaDiaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, DateUtils, XSBuiltIns, DB,
  ZAbstractRODataset, ZDataset;

type
  TFrmAgendaDiaria = class(TForm)
    StringGridPeriodo1Hora: TStringGrid;
    DBGridMinutos: TDBGrid;
    LabelAmbiente: TLabel;
    BitBtnFechar: TBitBtn;
    DBGridTabela: TDBGrid;
    DataSourceDisponibilidade: TDataSource;
    ZReadOnlyQueryDisponib: TZReadOnlyQuery;
    ZReadOnlyQueryDisponibID_RESERVA: TIntegerField;
    ZReadOnlyQueryDisponibID_EVENTO: TIntegerField;
    ZReadOnlyQueryDisponibID_AMBIENTE: TIntegerField;
    ZReadOnlyQueryDisponibDATA: TDateTimeField;
    ZReadOnlyQueryDisponibSTATUS: TIntegerField;
    ZReadOnlyQueryDisponibH_INICIO: TDateTimeField;
    ZReadOnlyQueryDisponibH_FIM: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PintaGrid(HoraInicial, HoraFinal: TDateTime);
  end;

var
  FrmAgendaDiaria: TFrmAgendaDiaria;

implementation

uses UntCadEvento;

{$R *.dfm}

procedure TFrmAgendaDiaria.FormCreate(Sender: TObject);
var
    I: Integer; vHora: TDateTime;
begin
    StringGridPeriodo1Hora.Cells[0,0] := '07';
    StringGridPeriodo1Hora.Cells[1,0] := '08';
    StringGridPeriodo1Hora.Cells[2,0] := '09';
    StringGridPeriodo1Hora.Cells[3,0] := '10';
    StringGridPeriodo1Hora.Cells[4,0] := '11';
    StringGridPeriodo1Hora.Cells[5,0] := '12';
    StringGridPeriodo1Hora.Cells[6,0] := '13';
    StringGridPeriodo1Hora.Cells[7,0] := '14';
    StringGridPeriodo1Hora.Cells[8,0] := '15';
    StringGridPeriodo1Hora.Cells[9,0] := '16';
    StringGridPeriodo1Hora.Cells[10,0] := '17';
    StringGridPeriodo1Hora.Cells[11,0] := '18';
    StringGridPeriodo1Hora.Cells[12,0] := '19';
    StringGridPeriodo1Hora.Cells[13,0] := '20';
    StringGridPeriodo1Hora.Cells[14,0] := '21';
    StringGridPeriodo1Hora.Cells[15,0] := '22';

    vHora := StrToDateTime('7:00:00');
    For I := 0 To 95 Do
    Begin
        DBGridMinutos.Columns[I].Title.Caption := DateTimeToStr(vHora);
        vHora := IncMinute(vHora, 10);
    End;
end;

procedure TFrmAgendaDiaria.PintaGrid(HoraInicial, HoraFinal: TDateTime);
var
    I: Integer; vHoraGrid: TDateTime;
begin
    For I := 0 To 95 Do
    Begin
        vHoraGrid := StrToDateTime(DBGridMinutos.Columns[I].Title.Caption);

        If (vHoraGrid >= HoraInicial) And (vHoraGrid < HoraFinal) Then
            DBGridMinutos.Columns[I].Color := clAqua;
    End;
end;

procedure TFrmAgendaDiaria.BitBtnFecharClick(Sender: TObject);
begin
    Close;
end;

end.
