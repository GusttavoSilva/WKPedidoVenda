program PedidoVenda;

uses
  Vcl.Forms,
  PedidoVenda.View.TelaPedido in 'Source\View\PedidoVenda.View.TelaPedido.pas' {FrmTelaPedido},
  PedidoVenda.Componente.Conexao in 'Source\Componente\PedidoVenda.Componente.Conexao.pas' {DM: TDataModule},
  PedidoVenda.Controller.Conexao in 'Source\Controller\PedidoVenda.Controller.Conexao.pas',
  PedidoVenda.Model.Conexao in 'Source\Model\PedidoVenda.Model.Conexao.pas',
  PedidoVenda.Controller.Clientes in 'Source\Controller\PedidoVenda.Controller.Clientes.pas',
  PedidoVenda.Model.Clientes in 'Source\Model\PedidoVenda.Model.Clientes.pas',
  PedidoVenda.Core.Funcoes in 'Source\Core\PedidoVenda.Core.Funcoes.pas',
  PedidoVenda.Controller.Produtos in 'Source\Controller\PedidoVenda.Controller.Produtos.pas',
  PedidoVenda.Model.Produtos in 'Source\Model\PedidoVenda.Model.Produtos.pas',
  PedidoVenda.Componente.Utilitario in 'Source\Componente\PedidoVenda.Componente.Utilitario.pas' {DmUtil: TDataModule},
  PedidoVenda.Controller.Pedidos in 'Source\Controller\PedidoVenda.Controller.Pedidos.pas',
  PedidoVenda.Model.Pedido in 'Source\Model\PedidoVenda.Model.Pedido.pas',
  PedidoVenda.Model.PedidoItens in 'Source\Model\PedidoVenda.Model.PedidoItens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmTelaPedido, FrmTelaPedido);
  Application.CreateForm(TDmUtil, DmUtil);
  Application.Run;
end.
