unit PedidoVenda.Controller.Clientes;

interface

uses
  System.Classes;

type
  iModelClientes = interface
    ['{1D74723C-41A4-4665-89DF-80A603AA0AF1}']

    function CodCliente(Value: Integer = 0): iModelClientes;
    function PopulaInfoClientes(AList: TStringList): iModelClientes;
  end;

implementation

end.
