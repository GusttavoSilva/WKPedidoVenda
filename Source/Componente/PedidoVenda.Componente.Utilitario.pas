unit PedidoVenda.Componente.Utilitario;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient;

type
  TDmUtil = class(TDataModule)
    mem_ListaProduto: TFDMemTable;
    ds_ProdutosLista: TDataSource;
    ds_ListaPedidos: TDataSource;
    mem_ListaProdutoORDEM: TAutoIncField;
    mem_ListaProdutoCODIGO: TIntegerField;
    mem_ListaProdutoPRODUTO: TStringField;
    mem_ListaProdutoVALOR: TFloatField;
    mem_ListaProdutoQUANTIDADE: TFloatField;
    mem_ListaProdutoTOTAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmUtil: TDmUtil;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses PedidoVenda.Componente.Conexao;

{$R *.dfm}

end.
