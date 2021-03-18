unit PedidoVenda.Model.Produtos;

interface

uses
  PedidoVenda.Controller.Produtos,
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

  CONST_POPULA_INFO_PRODUTO = 'SELECT * FROM TB_PRODUTOS WHERE ID_PRODUTOS = :ID_PRODUTOS';

type

  TModelProdutos = class(TInterfacedObject, iModelProdutos)
  private
    FQuery: TFDQuery;

    FOrdem: Integer;
    FCodProduto: Integer;
    FNomeProduto: string;
    FQuantidade: Double;
    FValorUnitario: Double;
    FValorTotal: Double;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelProdutos;

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

uses
  System.SysUtils,
  PedidoVenda.Componente.Conexao,
  PedidoVenda.Core.Funcoes;

{ TModelProdutos }

constructor TModelProdutos.Create;
begin
  FQuery                         := TFDQuery.Create(nil);
  FQuery.Connection              := DM.FD_Conn;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active                  := false;
  FQuery.SQL.Clear;
end;

destructor TModelProdutos.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

class function TModelProdutos.New: iModelProdutos;
begin
  result := self.Create;
end;

function TModelProdutos.NomeProduto(Value: string): iModelProdutos;
begin
  result       := self;
  FNomeProduto := Value;
end;

function TModelProdutos.Ordem(Value: Integer): iModelProdutos;
begin
  result := self;
  FOrdem := Value;
end;

function TModelProdutos.CodProduto(Value: Integer): iModelProdutos;
begin
  result      := self;
  FCodProduto := Value;
end;

function TModelProdutos.Quantidade(Value: Double): iModelProdutos;
begin
  result      := self;
  FQuantidade := Value;
end;

function TModelProdutos.ValorTotal(Value: Double): iModelProdutos;
begin
  result      := self;
  FValorTotal := Value;
end;

function TModelProdutos.ValorUnitario(Value: Double): iModelProdutos;
begin
  result         := self;
  FValorUnitario := Value;
end;

function TModelProdutos.PopulaInfoProdutos(AList: TStringList): iModelProdutos;
var
  i: Integer;
begin
  result := self;

  FQuery.SQL.Text                             := CONST_POPULA_INFO_PRODUTO;
  FQuery.ParamByName('ID_PRODUTOS').AsInteger := FCodProduto;
  FQuery.Open;

  for i := 0 to FQuery.FieldCount - 1 do
  begin
    AList.Add(FQuery.Fields[i].AsString);
    FQuery.Next;
  end;

end;

function TModelProdutos.SomaValorTotalProduto: string;
begin
  result := FormataValor(FloatToStr(FValorUnitario * FQuantidade));
end;

function TModelProdutos.PopulaItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
begin
  result := self;

  ATable.Append;
  ATable.FieldByName('cod_produto').AsInteger := FCodProduto;
  ATable.FieldByName('PRODUTO').AsString      := FNomeProduto;
  ATable.FieldByName('val_unitario').AsFloat  := FValorUnitario;
  ATable.FieldByName('qtd_produtos').AsFloat  := FQuantidade;
  ATable.FieldByName('val_total').AsFloat     := FValorTotal;
  ATable.Post;
end;

function TModelProdutos.EditaItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
begin
  result := self;

  ATable.Edit;
  ATable.FieldByName('cod_produto').AsInteger := FCodProduto;
  ATable.FieldByName('val_unitario').AsFloat  := FValorUnitario;
  ATable.FieldByName('qtd_produtos').AsFloat  := FQuantidade;
  ATable.FieldByName('val_total').AsFloat     := FValorTotal;
  ATable.Post;
end;

function TModelProdutos.DeleteItemTabTemporaria(ATable: TFDMemTable): iModelProdutos;
begin
  result := self;
  if ATable.RecordCount <> 0 then
  begin
    ATable.Delete;
    ATable.ApplyUpdates(0);
  end;
end;

function TModelProdutos.ValorTotalCompra(ATable: TFDMemTable): string;
var
  i: Integer;
  Vlr: Double;
begin
  Vlr := 0;
  ATable.First;
  for i := 0 to ATable.RecordCount - 1 do
  begin
    Vlr := Vlr + ATable.FieldByName('val_total').AsFloat;
    ATable.Next;
  end;

  result := FormataValor(FloatToStr(Vlr));

end;

end.
