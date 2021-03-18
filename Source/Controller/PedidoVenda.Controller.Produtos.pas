unit PedidoVenda.Controller.Produtos;

interface

uses
  System.Classes, FireDAC.Comp.Client;

type

  iModelProdutos = interface
    ['{CDD5676C-3E33-453B-89EA-FA66DE82ACA6}']

    function Ordem(Value: Integer): iModelProdutos;
    function CodProduto(Value: Integer): iModelProdutos;
    function NomeProduto(Value: string): iModelProdutos;
    function Quantidade(Value: Double): iModelProdutos;
    function ValorUnitario(Value: Double): iModelProdutos;
    function ValorTotal(Value: Double): iModelProdutos;
    function PopulaInfoProdutos(AList: TStringList): iModelProdutos;
    function SomaValorTotalProduto: string;
    function PopulaItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
    function EditaItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
    function DeleteItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
    function ValorTotalCompra(ATable: TFDMemTable): string;
  end;

implementation

end.
