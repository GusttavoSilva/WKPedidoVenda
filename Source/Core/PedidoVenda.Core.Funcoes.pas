unit PedidoVenda.Core.Funcoes;

interface

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
function FormataValor(valor: String; QuantZeros: Integer = 2): String;
function StrParaDouble(valor: string; QuantZeros: Integer = 2): Double;

implementation

uses
  System.SysUtils,
  Vcl.Dialogs;

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
begin
    if Expressao then
    Result := ParteTRUE
  else
    Result := ParteFALSE;
end;

function StrParaDouble(valor: string; QuantZeros: Integer): Double;
begin
  Result := strtofloat(StringReplace(FormataValor(valor, QuantZeros), '.', '', [rfReplaceAll, rfIgnoreCase]));
end;

function FormataValor(valor: String; QuantZeros: Integer ): String;
var
  i: Integer;
  Formato, Sinal: String;
begin
  Result := '';

  if (valor <> '') then
    Sinal := iif(copy(valor, 01, 01) = '-', '-', '');

  for i := 0 to Length(valor) do
    if (valor[i] in ['0' .. '9', ',']) then
      Result := Result + valor[i];

  Formato := '#,##0.' + StringOfChar('0', QuantZeros);
  if (QuantZeros <> 0) then
    valor := '0,' + StringOfChar('0', QuantZeros)
  else
    valor := '';

  try
    if (Result = '') then
      Result := Sinal + valor
    else
      Result := Sinal + FormatFloat(Formato, strtofloat(Result));
  except
    Result := Sinal + valor;
  end;
end;

end.
