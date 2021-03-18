unit PedidoVenda.Controller.Pedidos;

interface

uses
  FireDAC.Comp.Client;

type

  iModelPedido = interface
    ['{B81B2654-579E-4D28-AC52-8825FC4DA8BE}']

    function CodPedido(Value: integer): iModelPedido;
    function CodCliente(Value: integer): iModelPedido;
    function DataPedido(Value: TDateTime): iModelPedido;
    function ValPedido(Value: Double): iModelPedido;
    function InsertPedidoDB: iModelPedido;
    function DeletePedido: iModelPedido;
    function SelectPedidoDB: String;
  end;

  iModelPedidoItens = interface
    ['{199F16B8-2971-4A80-82D8-B70F902ACFA9}']

    function CodPedido(Value: integer): iModelPedidoItens;
    function InsertProdutosDB(ATable: TFDMemTable): iModelPedidoItens;
    function DeleteProdutosDB: iModelPedidoItens;
    function SelectProdutosDB(ATable: TFDMemTable): iModelPedidoItens;
  end;

implementation

end.
