unit PedidoVenda.Model.PedidoItens;

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

  CONST_INSERT_PEDIDOITENS = 'INSERT INTO tb_pedido_itens ' +
    '(COD_PEDIDO, COD_PRODUTO, QTD_PRODUTOS, VAL_UNITARIO, VAL_TOTAL) VALUES ' +
    '((select max(ID_PEDIDO) FROM TB_PEDIDO), :COD_PRODUTO, :QTD_PRODUTOS, :VAL_UNITARIO, :VAL_TOTAL) ';

  CONST_DELETE_PEDIDOITENS = 'DELETE FROM TB_PEDIDO_ITENS WHERE COD_PEDIDO = :COD_PEDIDO';

  CONST_SELECT_PEDIDOITENS = 'SELECT pi.*, p.NOM_DESCRICAO as produto FROM tb_pedido_itens pi ' +
    'left join tb_produtos p on (p.id_produtos = pi.COD_PRODUTO)  WHERE COD_PEDIDO = :COD_PEDIDO';

type

  TmodelPedidoItens = class(TInterfacedObject, iModelPedidoItens)
  private
    FQuery: TFDQuery;
    FCodPedido: integer;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedidoItens;

    function CodPedido(value: integer): iModelPedidoItens;
    function InsertProdutosDB(ATable: TFDMemTable): iModelPedidoItens;
    function DeleteProdutosDB: iModelPedidoItens;
    function SelectProdutosDB(ATable: TFDMemTable): iModelPedidoItens;

  end;

implementation

uses
  System.SysUtils,
  PedidoVenda.Componente.Conexao;

{ TmodelPedidoItens }

class function TmodelPedidoItens.New: iModelPedidoItens;
begin
  result := self.Create;
end;

constructor TmodelPedidoItens.Create;
begin
  FQuery                         := TFDQuery.Create(nil);
  FQuery.Connection              := DM.FD_Conn;
  FQuery.FetchOptions.RowsetSize := 50000;
  FQuery.Active                  := false;
  FQuery.SQL.Clear;
end;

destructor TmodelPedidoItens.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function TmodelPedidoItens.CodPedido(value: integer): iModelPedidoItens;
begin
  result     := self;
  FCodPedido := value;
end;

function TmodelPedidoItens.DeleteProdutosDB: iModelPedidoItens;
begin
  result := self;

  DM.FD_Conn.StartTransaction;
  try
    FQuery.SQL.Text                            := CONST_DELETE_PEDIDOITENS;
    FQuery.ParamByName('COD_PEDIDO').AsInteger := FCodPedido;
    FQuery.ExecSQL;
    DM.FD_Conn.Commit;
  except
    DM.FD_Conn.Rollback;
  end;

end;

function TmodelPedidoItens.InsertProdutosDB(ATable: TFDMemTable): iModelPedidoItens;
var
  i: integer;
begin
  result := self;
  DM.FD_Conn.StartTransaction;
  try
    ATable.First;
    for i := 0 to ATable.RecordCount - 1 do
    begin
      FQuery.SQL.Text                             := CONST_INSERT_PEDIDOITENS;
      FQuery.ParamByName('COD_PRODUTO').AsInteger := ATable.FieldByName('cod_produto').AsInteger;
      FQuery.ParamByName('QTD_PRODUTOS').AsFloat  := ATable.FieldByName('qtd_produtos').AsFloat;
      FQuery.ParamByName('VAL_UNITARIO').AsFloat  := ATable.FieldByName('val_unitario').AsFloat;
      FQuery.ParamByName('VAL_TOTAL').AsFloat     := ATable.FieldByName('val_total').AsFloat;
      FQuery.ExecSQL;
      ATable.Next;
    end;
    DM.FD_Conn.Commit;
  except
    DM.FD_Conn.Rollback;
  end;
end;

function TmodelPedidoItens.SelectProdutosDB(ATable: TFDMemTable): iModelPedidoItens;
begin
  result                                     := self;
  FQuery.SQL.Text                            := CONST_SELECT_PEDIDOITENS;
  FQuery.ParamByName('COD_PEDIDO').AsInteger := FCodPedido;
  FQuery.Open;
  ATable.CopyDataSet(FQuery);
end;

end.
