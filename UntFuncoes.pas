unit UntFuncoes;

interface
uses
  Windows, ExtCtrls, ComCtrls, DBTables, Math;

const
  C1 = 52845;
  C2 = 22719;

function ValidaTarja(num: string): boolean;
function DataExtenso(aData: TDateTime): String;
function DiaExtenso(aData: TDateTime): String;
function NumeroDia(aData: TDateTime): String;
function CalcJuros(Vlr, taxa: double; inicio, fim: String): double;
function Decrypt( const sStr: String; Key: Word): String;
function Encrypt( const sStr: String; Key: Word): String;
function SemAcento(Texto: String): String;
function SemCarcEsp(Texto: String): String;
function FormatDataMySql(Data: TDateTime): String;
function FormatDataFireBird(Data: TDateTime): String;
function FormatCEP(CEP: String): String;
function FormatFONE(FONE: String): String;
function FormatCurrencMySQL(Number: String): String;
function FormatCurrenc(Number: String): String;
function FormatNumToPrint(Num: double): String;
procedure hideTaskbar; // desabilita
procedure showTaskbar; // habilita
procedure FiltroCD(Sind:String);
procedure FiltroCob(Sind:String);
procedure MarcaEmpresasOk(Sind:String);
procedure FiltroAtualizar(Sind:String);
function CalcDAC_Febraban(Num: String): String;
function CalcDVG_Febraban(Num: String): String;
function cgc(num: string): boolean;
function GetBuildInfo(NomeExec: String): String;

implementation

uses
  SysUtils, Dialogs;

function DataExtenso(aData: TDateTime): String;
var
  Present: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  oMes: String;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  case Month of
   1: oMes := 'janeiro';
   2: oMes := 'fevereiro';
   3: oMes := 'marÁo';
   4: oMes := 'abril';
   5: oMes := 'maio';
   6: oMes := 'junho';
   7: oMes := 'julho';
   8: oMes := 'agosto';
   9: oMes := 'setembro';
   10: oMes := 'outubro';
   11: oMes := 'novembro';
   12: oMes := 'dezembro';
  else
   oMes := '';
  end;
  Result := IntToStr(Day)+' de '+oMes+' de '+IntToStr(Year);
end;

function DiaExtenso(aData: TDateTime): String;
var
  nrdia: Integer;
  diasemana: array[1..7] of String;
  meses: array[1..12] of String;
  dia, mes, ano: Word;
begin
  diasemana[1]:= 'Domingo';
  diasemana[2]:= 'Segunda-feira';
  diasemana[3]:= 'TerÁa-feira';
  diasemana[4]:= 'Quarta-feira';
  diasemana[5]:= 'Quinta-feira';
  diasemana[6]:= 'Sexta-feira';
  diasemana[7]:= 'S·bado';
  nrdia:= DayOfWeek(aData);
  Result := diasemana[nrdia];
end;

function NumeroDia(aData: TDateTime): String;
var
  Present: TDateTime;
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  Result := IntToStr(Day);
end;

function ValidaTarja(num: string): boolean;
var
  sb1, sb2, sb3: Integer;
  a, b, c, d, e, f, g: Integer;
  h, i, j, k, l, m, n, o, p, q: Integer;
  r, s, t, u, v, w, x, y, z, z2: Integer;
begin
  //inicia as variaveis BLOCO 1
  sb1:=0;a:=0; b:=0; c:=0; d:=0; e:=0; f:=0; g:=0;
  a:=StrToInt(num[1]);
  b:=StrToInt(num[2]);
  c:=StrToInt(num[3]);
  d:=StrToInt(num[4]);
  e:=StrToInt(num[5]);
  f:=StrToInt(num[6]);
  g:=StrToInt(num[7]);

  a:=(a*2);
  if (a>9) then
   a:= StrToInt(Copy(IntToStr(a),1,1))+StrToInt(Copy(IntToStr(a),2,1));

  c:=(c*2);
  if (c>9) then
   c:= StrToInt(Copy(IntToStr(c),1,1))+StrToInt(Copy(IntToStr(c),2,1));

  e:=(e*2);
  if (e>9) then
   e:= StrToInt(Copy(IntToStr(e),1,1))+StrToInt(Copy(IntToStr(e),2,1));

  g:=(g*2);
  if (g>9) then
   g:= StrToInt(Copy(IntToStr(g),1,1))+StrToInt(Copy(IntToStr(g),2,1));

  sb1:=a+b+c+d+e+f+g;

  If (sb1>9) then
   sb1:= (10-StrToInt(Copy(IntToStr(sb1),2,1)))
  else
   sb1:= (10-sb1);

  if (sb1 > 9) then
   sb1:=0;

  //inicia as variaveis BLOCO 2
  sb2:=0;h:=0; i:=0; j:=0; k:=0; l:=0; m:=0; n:=0; o:=0; p:=0; q:=0;
  h:=StrToInt(num[9]);
  i:=StrToInt(num[10]);
  j:=StrToInt(num[11]);
  k:=StrToInt(num[12]);
  l:=StrToInt(num[13]);
  m:=StrToInt(num[14]);
  n:=StrToInt(num[15]);
  o:=StrToInt(num[16]);
  p:=StrToInt(num[17]);
  q:=StrToInt(num[18]);

  i:=(i*2);
  if (i>9) then
   i:= StrToInt(Copy(IntToStr(i),1,1))+StrToInt(Copy(IntToStr(i),2,1));

  k:=(k*2);
  if (k>9) then
   k:= StrToInt(Copy(IntToStr(k),1,1))+StrToInt(Copy(IntToStr(k),2,1));

  m:=(m*2);
  if (m>9) then
   m:= StrToInt(Copy(IntToStr(m),1,1))+StrToInt(Copy(IntToStr(m),2,1));

  o:=(o*2);
  if (o>9) then
   o:= StrToInt(Copy(IntToStr(o),1,1))+StrToInt(Copy(IntToStr(o),2,1));

  q:=(q*2);
  if (q>9) then
   q:= StrToInt(Copy(IntToStr(q),1,1))+StrToInt(Copy(IntToStr(q),2,1));

  sb2:=h+i+j+k+l+m+n+o+p+q;

  If (sb2>9) then
   sb2:= (10-StrToInt(Copy(IntToStr(sb2),2,1)))
  else
   sb2:= (10-sb2);

  if (sb2 > 9) then
   sb2:=0;

  //inicia as variaveis BLOCO 3
  sb3:=0;r:=0; s:=0; t:=0; u:=0; v:=0; w:=0; x:=0; y:=0; z:=0; z2:=0;
  r:=StrToInt(num[20]);
  s:=StrToInt(num[21]);
  t:=StrToInt(num[22]);
  u:=StrToInt(num[23]);
  v:=StrToInt(num[24]);
  w:=StrToInt(num[25]);
  x:=StrToInt(num[26]);
  y:=StrToInt(num[27]);
  z:=StrToInt(num[28]);
  z2:=StrToInt(num[29]);

  s:=(s*2);
  if (s>9) then
   s:= StrToInt(Copy(IntToStr(s),1,1))+StrToInt(Copy(IntToStr(s),2,1));

  u:=(u*2);
  if (u>9) then
   u:= StrToInt(Copy(IntToStr(u),1,1))+StrToInt(Copy(IntToStr(u),2,1));

  w:=(w*2);
  if (w>9) then
   w:= StrToInt(Copy(IntToStr(w),1,1))+StrToInt(Copy(IntToStr(w),2,1));

  y:=(y*2);
  if (y>9) then
   y:= StrToInt(Copy(IntToStr(y),1,1))+StrToInt(Copy(IntToStr(y),2,1));

  z2:=(z2*2);
  if (z2>9) then
   z2:= StrToInt(Copy(IntToStr(z2),1,1))+StrToInt(Copy(IntToStr(z2),2,1));

  sb3:=r+s+t+u+v+w+x+y+z+z2;

  If (sb3>9) then
   sb3:= (10-StrToInt(Copy(IntToStr(sb3),2,1)))
  else
   sb3:= (10-sb3);

  if (sb3 > 9) then
   sb3:=0;

  if (sb1=StrToInt(num[19])) and (sb2=StrToInt(num[8])) and (sb3=StrToInt(num[30])) then
   ValidaTarja:=True
  else
   ValidaTarja:=False;
end;

function CalcJuros(Vlr, taxa: double; inicio, fim: String): double;
var
  vDias, n, n1, n2, pf : Double;
  vBruto, vFace, vTaxa: Real;
  res: double;
begin
  vDias := 0; n := 0; n1 := 0; n2 :=0; pf:=0; vBruto:=0; vFace:=0; vTaxa:=0; res:=0;
  vDias := StrToDate(fim)-StrToDate(inicio) ;
  n := (vDias/30);
  n1 := n;
  n2 := Int(n1*1);
  vBruto := Vlr;
  vFace :=0;
  vTaxa := taxa;
  if n2=n then begin
   vFace := vBruto*(Power(1+(vTaxa/100),n));
   //vFace := (vFace-vBruto);
   Result := vFace;
   end
  else begin
   pf := (n1-n2);
   //ShowMessage(' Valor: '+FloatToStr(Power(vBruto*( 1+ (vTaxa/100) ),n2)));
   vFace := vBruto*(Power(1+(vTaxa/100),n2))*((((vTaxa/30)*(pf*30))/100)+1);
   //vFace := (vFace-vBruto);
   Result := vFace;
   end;
end;

procedure hideTaskbar; // desabilita
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;
begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle:= FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_HIDE);
end;

procedure showTaskbar; // habilita
var
  wndHandle : THandle;
  wndClass : array[0..50] of Char;
begin
  StrPCopy(@wndClass[0], 'Shell_TrayWnd');
  wndHandle:= FindWindow(@wndClass[0], nil);
  ShowWindow(wndHandle, SW_RESTORE);
end;

(************************************************************)
function Decrypt( const sStr: String; Key: Word): String;
(************************************************************)
var
  I: LongInt;
begin
  Result := sStr;
  for I := 1 to Length(sStr) do begin
   Result[I] := Char(Byte(sStr[I]) xor (Key shr 8));
   Key := (Byte(Result[I]) + Key) * C1 + C2;
   end;
end;

(************************************************************)
function Encrypt( const sStr: String; Key: Word): String;
(************************************************************)
var
  I: LongInt;
begin
  Result := sStr;
  for I := 1 to Length(sStr) do begin
   Result[I] := Char(Byte(sStr[I]) xor (Key shr 8));
   Key := (Byte(sStr[I]) + Key) * C1 + C2;
   end;
end;

(*************************************************************)
function SemAcento(Texto: String): String;
(*************************************************************)
type
  TConjCarac = set of char;
var
  NewCarac, newString: String;
  a,b: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
begin
  Acentos   := ['¬','√','¡','¿','«','…','È',' ','Í','Õ','Ì','”','Û','‘','Ù','’','ı','⁄','‹','€','∫','™','á',''''];
  ComAcento := '¬√¡¿«…È ÍÕÌ”Û‘Ù’ı⁄‹€∫™á''''';
  SemAcento := 'AAAACEeEeIiOoOoOoUUU..Á¥';
  for a:=1 to Length(Texto) do begin
   if Texto[a] in Acentos then begin
    Carac := Texto[a];
    b:=Pos(Carac,ComAcento);
    Texto[a] := SemAcento[b];
    end
  end;
  Result := Texto;
end;

(*************************************************************)
function SemCarcEsp(Texto: String): String;
(*************************************************************)
type
  TConjCarac = set of char;
var
  NewCarac, newString: String;
  a,b: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
begin
  Acentos   := [''''];
  ComAcento := '''''';
  SemAcento := ' ';
  for a:=1 to Length(Texto) do begin
   if Texto[a] in Acentos then begin
    Carac := Texto[a];
    b:=Pos(Carac,ComAcento);
    Texto[a] := SemAcento[b];
    end
  end;
  Result := Texto;
end;


(*************************************************************)
function FormatCEP(CEP: String): String;
(*************************************************************)
type
  TConjCarac = set of char;
var
  NewCarac, newString: string;
  a,b,t: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
begin
  Acentos   := ['.','-','=','/','\',':','*','X'];
  ComAcento := '.-=/\:*X';
  t :=Length(CEP);
  for a:=1 to t do begin
   if not (CEP[a] in Acentos) then
    SemAcento := SemAcento+CEP[a];
   end;
  Result := SemAcento;
end;

(*************************************************************)
function FormatFONE(FONE: String): String;
(*************************************************************)
type
  TConjCarac = set of char;
var
  NewCarac, newString: string;
  a,b,t: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
begin
  Acentos   := ['X','=','.',' '];
  ComAcento := 'X=. ';
  t :=Length(FONE);
  for a:=1 to t do begin
   if not (FONE[a] in Acentos) then
    SemAcento := SemAcento+FONE[a];
  end;
  Result := SemAcento;
end;

procedure FiltroCD(Sind:String);
begin
end;

procedure FiltroCob(Sind:String);
begin
end;

procedure MarcaEmpresasOk(Sind:String);
begin
end;

(*************************************************************)
//FORMATAR DATA PARA UTILIZAR EM FILTROS DE TABELAS E QUERYS MYSQL
(*************************************************************)
function FormatDataMySql(Data: TDateTime): String;
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  DecodeDate(Data, Year, Month, Day);
  Result := IntToStr(Year)+'-'+IntToStr(Month)+'-'+IntToStr(Day);
end;

function FormatDataFireBird(Data: TDateTime): String;
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
  DecodeDate(Data, Year, Month, Day);
  Result := IntToStr(Month)+'/'+IntToStr(Day)+'/'+IntToStr(Year);
end;

procedure FiltroAtualizar(Sind:String);
begin
{  Principal.qContribuinte.Close;
  Principal.qContribuinte.SQL.Clear;
  Principal.qContribuinte.SQL.Add('select * from contrib where (Sindicato='+''''+Sind+''''+
  ') and (CNPJ='+''''+''''+') or (RazaoSocial='+''''+''''+
  ') or (Endereco<>'+''''+''''+
  ') or (Bairro<>'+''''+''''+
  ') or (Cep<>'+''''+''''+
  ') or (Cidade<>'+''''+''''+
  ') or (UF<>'+''''+''''+
  ') or (StatusTelemarketing<>'+''''+'EA'+''''+')');
  Principal.qContribuinte.Open;
  Principal.qContribuinte.First;
  Principal.sbLimpaResultado.Visible := True;}
end;

function CalcDAC_Febraban(Num: String): String;
var
  Sequencia: array of integer;
  Numero: array of integer;
  Resultado: array of integer;
  a: Integer;
  inteiro, fracao: Real;
  eSeq, oResultado: String;
  FracInt, vResultado: Integer;
begin
  SetLength(Sequencia, 11); eSeq := '21212121212';
  SetLength(Numero, 11);
  SetLength(Resultado, 11);

  vResultado:=0;
  oResultado:='';

  Inteiro:= 0; Fracao:= 0;

  for a:=10 downto 0 do begin
   Sequencia[a] := StrToInt(Copy(eSeq,a+1,1));
   end;

  for a:=10 downto 0 do begin
   Numero[a] := StrToInt(Copy(Num,a+1,1));
   end;

  for a :=10 downto 0 do begin
   Resultado[a] := (Numero[a]*Sequencia[a]);
   end;

  for a:=0 to 10 do begin
   oResultado := oResultado+IntToStr(Resultado[a])
   end;

  for a:=0 to (Length(oResultado)-1) do begin
   vResultado := vResultado+StrToInt(oResultado[a+1]);
   end;

  fracao := (frac(vResultado/10));
  //FracInt:= StrToInt(FloatToStr(Fracao*10));
  FracInt:= Round(Fracao*10);

  //FracInt:= StrToInt(FloatToStr(Fracao*10));
  inteiro :=((vResultado/10)-fracao);
  if FracInt>0 then
   Result := IntToStr(10-FracInt)
  else Result := IntToStr(FracInt);
end;

function CalcDVG_Febraban(Num: String): String;
var
  Sequencia: array of integer;
  Numero: array of integer;
  Resultado: array of integer;
  a: Integer;
  inteiro, fracao: Real;
  eSeq, oResultado: String;
  FracInt, vResultado: Integer;
begin
  SetLength(Sequencia, 43);
  eSeq := '2121212121212121212121212121212121212121212';
  SetLength(Numero, 43);
  SetLength(Resultado, 43);

  vResultado:=0;
  oResultado:='';

  Inteiro:= 0; Fracao:= 0;

  for a:=42 downto 0 do begin
   Sequencia[a] := StrToInt(Copy(eSeq,a+1,1));
   end;

  for a:=42 downto 0 do begin
   Numero[a] := StrToInt(Copy(Num,a+1,1));
   end;

  for a :=42 downto 0 do begin
   Resultado[a] := (Numero[a]*Sequencia[a]);
   end;

  for a:=0 to 42 do begin
   oResultado := oResultado+IntToStr(Resultado[a])
   end;

  for a:=0 to (Length(oResultado)-1) do begin
   vResultado := vResultado+StrToInt(oResultado[a+1]);
   end;

  fracao := (frac(vResultado/10));
  //FracInt:= StrToInt(FloatToStr(Fracao*10));
  FracInt:= Round(Fracao*10);
  inteiro :=((vResultado/10)-fracao);
  if FracInt>0 then
   Result := IntToStr(10-FracInt)
  else Result := IntToStr(FracInt);
end;

function cgc(num: string): boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  n1:=StrToInt(num[1]);
  n2:=StrToInt(num[2]);
  n3:=StrToInt(num[3]);
  n4:=StrToInt(num[4]);
  n5:=StrToInt(num[5]);
  n6:=StrToInt(num[6]);
  n7:=StrToInt(num[7]);
  n8:=StrToInt(num[8]);
  n9:=StrToInt(num[9]);
  n10:=StrToInt(num[10]);
  n11:=StrToInt(num[11]);
  n12:=StrToInt(num[12]);
  d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
  d1:=11-(d1 mod 11);
  if d1>=10 then d1:=0;
  d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
  d2:=11-(d2 mod 11);
  if d2>=10 then d2:=0;
  calculado:=inttostr(d1)+inttostr(d2);
  digitado:=num[13]+num[14];
  if calculado=digitado then
   cgc:=true
  else cgc:=false;
end;

function FormatCurrencMySQL(Number: String): String;
type
  TConjCarac = set of char;
var
  Prefix, NewCarac, newString: string;
  a,b,t: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
begin
  if (Number='') then
   Number :='0';

  Acentos   := ['.',','];
  ComAcento := '.,';
  t :=Length(Number);
  Prefix := 'I';
  for a:=1 to t do begin
   if (Number[a] <> '.') then
    SemAcento := SemAcento+Number[a];
  end;
  while Pos(',', SemAcento) > 0 do
   SemAcento[Pos(',', SemAcento)] := '.';
  Result := SemAcento;
end;

function FormatCurrenc(Number: String): String;
type
  TConjCarac = set of char;
var
  Prefix, NewCarac, newString: string;
  a,b,t: Integer;
  Acentos: TConjCarac;
  ComAcento, SemAcento, Carac: String;
  oNumero: Double;
begin
  if (Number='') then
   Number :='0';

  Acentos   := ['.',','];
  ComAcento := '.,';
  t :=Length(Number);
  Prefix := 'I';
  for a:=1 to t do begin
   if (Number[a]='.') or (Number[a]=',') then
    //SemAcento := SemAcento+Number[a];
    Delete(Number,a,1);
  end;
  //while Pos(',', SemAcento) > 0 do
  // SemAcento[Pos(',', SemAcento)] := '';
  try
   oNumero := StrToFloat(Number)/100;
   Result := FormatFloat('#,##0.00',oNumero);
  except
   Result := '0,00';
  end;
end;

function FormatNumToPrint(Num: double): String;
var
  oResult, oVal: String;
  a: integer;
begin
  oVal := FormatFloat('#,##0.00',Num);
  for a:=1 to (14-Length(oVal)) do
   oResult := oResult+' ';

  Result := oResult+oVal;
end;

function GetBuildInfo(NomeExec: String): String;
var
    VerInfoSize: DWORD;
    VerInfo: Pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
    V1, V2, V3, V4: Word;
    Prog : string;
begin
    Prog := NomeExec;
    VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
    GetMem(VerInfo, VerInfoSize);

    If VerInfo = Nil Then
        Exit;

    GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    with VerValue^ do
      begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
      end;
    FreeMem(VerInfo, VerInfoSize);

    result := Copy (IntToStr (100 + v1), 3, 2) + '.' +
      Copy (IntToStr (100 + v2), 3, 2) + '.' +
      Copy (IntToStr (100 + v3), 3, 2) + '.' +
      Copy (IntToStr (100 + v4), 3, 2);
end;

end.
