unit PedidoVenda.Model.Pedido;

interface

uses
  PedidoVenda.Controller.Pedidos,
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

  CONST_INSERT_PEDIDO = 'INSERT INTO TB_PEDIDO (COD_CLIENTE, DAT_PEDIDO, VAL_PEDIDO) VALUES ' +
    '(:COD_CLIENTE, :DAT_PEDIDO, :VAL_PEDIDO); ';

  CONST_DELETE_PEDIDO = 'DELETE FROM  TB_PEDIDO WHERE ID_PEDIDO = :ID_PEDIDO';

  CONST_SELECT_PEDIDO = 'SELECT * FROM TB_PEDIDO WHERE ID_PEDIDO = :ID_PEDIDO';

type

  TModelPedido = class(TInterfacedObject, iModelPedido)
  private
    FQuery: TFDQuery;

    FCodPedido: integer;
    FCodCliente: integer;
    FDataPedido: TDateTime;
    FValPedido: Double;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedido;

    function CodPedido(Value: integer): iModelPedido;
    function CodCliente(Value: integer): iModelPedido;
    function DataPedido(Value: TDateTime): iModelPedido;
    function ValPedido(Value: Double): iModelPedido;
    function InsertPedidoDB: iModelPedido;
    function DeletePedido: iModelPedido;
    function SelectPedidoDB: String;
  end;

implementation

uses
  System.SysUtils,
  PedidoVenda.Componente.Conexao;

{ TModelPedido }

constructor TModelPedido.Create;
begin
  FQuery                         := TFDQuery.Create(nil);
  FQuery.Connection              := DM.FD_Conn;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active                  := false;
  FQuery.SQL.Clear;
end;

class function TModelPedido.New: iModelPedido;
begin
  result := self.Create;
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TModelPedido.CodCliente(Value: integer): iModelPedido;
begin
  result      := self;
  FCodCliente := Value;
end;

function TModelPedido.CodPedido(Value: integer): iModelPedido;
begin
  result     := self;
  FCodPedido := Value;
end;

function TModelPedido.DataPedido(Value: TDateTime): iModelPedido;
begin
  result      := self;
  FDataPedido := Value;
end;

function TModelPedido.ValPedido(Value: Double): iModelPedido;
begin
  result     := self;
  FValPedido := Value;
end;

function TModelPedido.InsertPedidoDB: iModelPedido;
begin
  result := self;
  DM.FD_Conn.StartTransaction;
  try
    FQuery.SQL.Text                             := CONST_INSERT_PEDIDO;
    FQuery.ParamByName('COD_CLIENTE').AsInteger := FCodCliente;
    FQuery.ParamByName('DAT_PEDIDO').AsDateTime := FDataPedido;
    FQuery.ParamByName('VAL_PEDIDO').AsFloat    := FValPedido;
    FQuery.ExecSQL;
    DM.FD_Conn.Commit;
  except
    DM.FD_Conn.Rollback;
  end;
end;

function TModelPedido.SelectPedidoDB: String;
begin
  FQuery.SQL.Text                           := CONST_SELECT_PEDIDO;
  FQuery.ParamByName('ID_PEDIDO').AsInteger := FCodPedido;
  FQuery.Open;
  result := FQuery.FieldByName('cod_cliente').asString;
end;

function TModelPedido.DeletePedido: iModelPedido;
begin
  result := self;
  DM.FD_Conn.StartTransaction;
  try
    FQuery.SQL.Text                           := CONST_DELETE_PEDIDO;
    FQuery.ParamByName('ID_PEDIDO').AsInteger := FCodPedido;
    FQuery.ExecSQL;
    DM.FD_Conn.Commit;
  except
    DM.FD_Conn.Rollback;
  end;
end;

end.
