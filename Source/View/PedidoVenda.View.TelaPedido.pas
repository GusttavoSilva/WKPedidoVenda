unit PedidoVenda.View.TelaPedido;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  Vcl.WinXPanels,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TFrmTelaPedido = class(TForm)
    pa_TopPedido: TPanel;
    paBtn_Menu: TPanel;
    edt_CodCliente: TEdit;
    edt_NomCidade: TEdit;
    edt_NomCliente: TEdit;
    edt_NomUf: TEdit;
    lbl_CodCliente: TLabel;
    lbl_NomCidade: TLabel;
    lbl_NomUf: TLabel;
    lbl_NomCliente: TLabel;
    lbl_TitleCliente: TLabel;
    pa_ContainerDadosCliente: TPanel;
    pa_ContainerDadosProduto: TPanel;
    lbl_CodProduto: TLabel;
    lbl_ValProduto: TLabel;
    lbl_NomProduto: TLabel;
    lbl_QntProduto: TLabel;
    Label9: TLabel;
    edt_CodProduto: TEdit;
    edt_ValProduto: TEdit;
    edt_NomProduto: TEdit;
    edt_QntProduto: TEdit;
    Splitter1: TSplitter;
    db_ListProdutos: TDBGrid;
    btn_IncluiProd: TPanel;
    btn_DeleteProd: TPanel;
    edt_ValTotProd: TEdit;
    Label1: TLabel;
    lbl_ValorCompra: TLabel;
    btn_Salvar: TPanel;
    Panel1: TPanel;
    pa_Menu: TPanel;
    edt_CodPedido: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    procedure FormShow(Sender: TObject);
    procedure edt_CodProdutoChange(Sender: TObject);
    procedure edt_CodClienteChange(Sender: TObject);
    procedure edt_ValProdutoChange(Sender: TObject);
    procedure edt_NomProdutoChange(Sender: TObject);
    procedure btn_IncluiProdClick(Sender: TObject);
    procedure btn_DeleteProdClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure db_ListProdutosCellClick(Column: TColumn);
    procedure btn_SalvarClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    ordem, Produto: Integer;

    { Private declarations }
  public
    { Public declarations }
    procedure limpaCampos;
  end;

var
  FrmTelaPedido: TFrmTelaPedido;

implementation

{$R *.dfm}

uses
  PedidoVenda.Model.Clientes,
  PedidoVenda.Core.Funcoes,
  PedidoVenda.Model.Produtos,
  PedidoVenda.Componente.Utilitario,
  Vcl.Dialogs,
  PedidoVenda.Model.Pedido,
  PedidoVenda.Model.PedidoItens;

procedure TFrmTelaPedido.btn_DeleteProdClick(Sender: TObject);
begin
  if MessageDlg('Deseja Apagar o Registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TModelProdutos.new.DeleteItemTabTemporaria(DmUtil.mem_ListaProduto);
  end;
end;

procedure TFrmTelaPedido.btn_IncluiProdClick(Sender: TObject);
begin

  if (DmUtil.mem_ListaProduto.Locate('ORDEM', ordem, [loCaseInsensitive, loPartialKey])) and
    (StrToInt(edt_CodProduto.Text) = Produto) then
  begin
    if MessageDlg('Deseja alterar esse produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      TModelProdutos.new.ordem(ordem).CodProduto(StrToInt(edt_CodProduto.Text))
        .ValorUnitario(StrParaDouble(edt_ValProduto.Text)).Quantidade(StrParaDouble(edt_QntProduto.Text))
        .ValorTotal(StrParaDouble(edt_ValTotProd.Text)).EditaItemTabTemporaria(DmUtil.mem_ListaProduto)
    end;
  end
  else
    TModelProdutos.new.CodProduto(StrToInt(edt_CodProduto.Text)).NomeProduto(edt_NomProduto.Text)
      .ValorUnitario(StrParaDouble(edt_ValProduto.Text)).Quantidade(StrParaDouble(edt_QntProduto.Text))
      .ValorTotal(StrParaDouble(edt_ValTotProd.Text)).PopulaItemTabTemporaria(DmUtil.mem_ListaProduto);

  ordem   := 0;
  Produto := 0;

  lbl_ValorCompra.Caption := 'Valor Total: R$' + TModelProdutos.new.ValorTotalCompra(DmUtil.mem_ListaProduto);

  edt_CodProduto.Text := EmptyStr;
  edt_NomProduto.Text := EmptyStr;
  edt_ValProduto.Text := '0';
  edt_QntProduto.Text := '1';
  edt_ValTotProd.Text := '0';

end;

procedure TFrmTelaPedido.btn_SalvarClick(Sender: TObject);
begin
  if ((edt_CodCliente.Text <> '0') or (edt_CodCliente.Text <> EmptyStr)) and (DmUtil.mem_ListaProduto.RecordCount <> 0)
  then
  begin
    TModelPedido.new.CodCliente(StrToInt(edt_CodCliente.Text)).DataPedido(now)
      .ValPedido(StrParaDouble(TModelProdutos.new.ValorTotalCompra(DmUtil.mem_ListaProduto))).InsertPedidoDB;

    TmodelPedidoItens.new.InsertProdutosDB(DmUtil.mem_ListaProduto);

    limpaCampos;
  end;
end;

procedure TFrmTelaPedido.db_ListProdutosCellClick(Column: TColumn);
begin
  ordem               := db_ListProdutos.DataSource.DataSet.FieldByName('ORDEM').AsInteger;
  Produto             := db_ListProdutos.DataSource.DataSet.FieldByName('cod_produto').AsInteger;
  edt_CodProduto.Text := IntToStr(Produto);
  edt_QntProduto.Text := db_ListProdutos.DataSource.DataSet.FieldByName('qtd_produtos').AsString;
  edt_ValProduto.Text := db_ListProdutos.DataSource.DataSet.FieldByName('val_unitario').AsString;
  edt_ValProdutoChange(self);
end;

procedure TFrmTelaPedido.edt_CodClienteChange(Sender: TObject);
var
  List: TStringList;
begin
  if (edt_CodCliente.Text = '0') or (edt_CodCliente.Text = EmptyStr) then
  begin
    pa_Menu.Visible := true;
    limpaCampos;
  end
  else
    pa_Menu.Visible := false;

  edt_NomCliente.Text := EmptyStr;
  edt_NomCidade.Text  := EmptyStr;
  edt_NomUf.Text      := EmptyStr;

  List := TStringList.Create;
  try
    if edt_CodCliente.Text <> '' then
    begin
      TModelClientes.new.CodCliente(StrToInt(edt_CodCliente.Text)).PopulaInfoClientes(List);

      edt_NomCliente.Text := List[1];
      edt_NomCidade.Text  := List[2];
      edt_NomUf.Text      := List[3];

    end;
  finally
    FreeAndNil(List);
  end;

end;

procedure TFrmTelaPedido.edt_CodProdutoChange(Sender: TObject);
var
  List: TStringList;
begin
  edt_NomProduto.Text := EmptyStr;
  edt_ValProduto.Text := '0';
  edt_QntProduto.Text := '1';
  edt_ValTotProd.Text := '0';

  List := TStringList.Create;
  try
    if edt_CodProduto.Text <> '' then
    begin
      TModelProdutos.new.CodProduto(StrToInt(edt_CodProduto.Text)).PopulaInfoProdutos(List);

      edt_ValProduto.Text := List[2];
      edt_NomProduto.Text := List[1];

    end;
  finally
    FreeAndNil(List);
  end;
end;

procedure TFrmTelaPedido.edt_NomProdutoChange(Sender: TObject);
begin
  edt_QntProduto.Text := '1';
  edt_ValProdutoChange(self);
end;

procedure TFrmTelaPedido.edt_ValProdutoChange(Sender: TObject);
begin
  if (edt_QntProduto.Text = '0') or (edt_QntProduto.Text = EmptyStr) then
    edt_QntProduto.Text := '1';
  if edt_ValProduto.Text = '' then
    edt_ValProduto.Text := '0';

  edt_ValTotProd.Text := TModelProdutos.new.Quantidade(StrParaDouble(edt_QntProduto.Text))
    .ValorUnitario(StrParaDouble(edt_ValProduto.Text)).SomaValorTotalProduto;
end;

procedure TFrmTelaPedido.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if Key = 13 then
  begin
    db_ListProdutosCellClick(db_ListProdutos.Columns[0]);
  end;

  if (Key = vk_delete) and (db_ListProdutos.Focused) then
  begin
    btn_DeleteProdClick(self);
  end;

  if (Key = vk_up) or (Key = vk_down) then
  begin
    db_ListProdutos.SetFocus;
  end;

end;

procedure TFrmTelaPedido.FormShow(Sender: TObject);
begin
  pa_Menu.Visible     := true;
  edt_CodCliente.Text := '0'
end;

procedure TFrmTelaPedido.limpaCampos;
begin
  edt_CodCliente.Text := EmptyStr;
  edt_NomCidade.Text  := EmptyStr;
  edt_NomCliente.Text := EmptyStr;
  edt_NomUf.Text      := EmptyStr;

  edt_CodProduto.Text := EmptyStr;
  edt_NomProduto.Text := EmptyStr;
  edt_ValProduto.Text := '0';
  edt_ValTotProd.Text := '0';
  edt_QntProduto.Text := '1';

  DmUtil.mem_ListaProduto.EmptyDataSet;
  lbl_ValorCompra.Caption := 'Valor Total: R$0,00';
end;

procedure TFrmTelaPedido.Panel1Click(Sender: TObject);
begin
  if edt_CodPedido.Text = EmptyStr then
    edt_CodPedido.Text := '0';

  edt_CodCliente.Text := TModelPedido.new.CodPedido(StrToInt(edt_CodPedido.Text)).SelectPedidoDB;

  TmodelPedidoItens.new.CodPedido(StrToInt(edt_CodPedido.Text)).SelectProdutosDB(DmUtil.mem_ListaProduto);

  lbl_ValorCompra.Caption := 'Valor Total: R$' + TModelProdutos.new.ValorTotalCompra(DmUtil.mem_ListaProduto);

end;

procedure TFrmTelaPedido.Panel3Click(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TmodelPedidoItens.new.CodPedido(StrToInt(edt_CodPedido.Text)).DeleteProdutosDB;
    TModelPedido.new.CodPedido(StrToInt(edt_CodPedido.Text)).DeletePedido;
    lbl_ValorCompra.Caption := 'Valor Total: R$0,00';
  end;
end;

end.
