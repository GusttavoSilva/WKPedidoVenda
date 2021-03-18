unit PedidoVenda.Model.Clientes;

interface

uses
  PedidoVenda.Controller.Clientes,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

const

  CONST_POPULA_INFO_CLIENTE = 'SELECT * FROM TB_CLIENTES WHERE ID_CLIENTE = :ID_CLIENTE';

type

  TModelClientes = class(TInterfacedObject, iModelClientes)
  private
    FQuery: TFDQuery;

    FCodCliente: Integer;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelClientes;

    function CodCliente(Value: Integer = 0): iModelClientes;
    function PopulaInfoClientes(AList: TStringList): iModelClientes;
  end;

implementation

uses
  System.SysUtils,
  PedidoVenda.Componente.Conexao;

{ TModelClientes }

constructor TModelClientes.Create;
begin
  FQuery                         := TFDQuery.Create(nil);
  FQuery.Connection              := DM.FD_Conn;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active                  := false;
  FQuery.SQL.Clear;
end;

destructor TModelClientes.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelClientes.New: iModelClientes;
begin
  result := self.Create;
end;

function TModelClientes.CodCliente(Value: Integer): iModelClientes;
begin
  result      := self;
  FCodCliente := Value;
end;

function TModelClientes.PopulaInfoClientes(AList: TStringList): iModelClientes;
var
  i: Integer;
begin
  result := self;

  FQuery.SQL.Text                            := CONST_POPULA_INFO_CLIENTE;
  FQuery.ParamByName('ID_CLIENTE').AsInteger := FCodCliente;
  FQuery.Open;

  for i := 0 to FQuery.FieldCount - 1 do
  begin
    AList.Add(FQuery.Fields[i].AsString);
    FQuery.Next;
  end;
end;

end.
