unit PedidoVenda.Model.Conexao;

interface

uses
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.SysUtils,
  Vcl.StdCtrls,
  Vcl.Forms,
  System.Classes,
  PedidoVenda.Controller.Conexao;

type

  TModelConexao = class(TInterfacedObject, iModelConexao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexao;
    function Connection(AConnection: TFDConnection): iModelConexao;
  end;

implementation

{ TModelConexao }

uses
  PedidoVenda.componente.Conexao,
  Vcl.Dialogs;

constructor TModelConexao.Create;
begin
end;

destructor TModelConexao.Destroy;
begin
  inherited;
end;

class function TModelConexao.New: iModelConexao;
begin
  result := self.Create;
end;

function TModelConexao.Connection(AConnection: TFDConnection): iModelConexao;
begin
  result                := self;
  AConnection.Connected := false;
  try
    AConnection.Params.Clear;
    AConnection.Params.Values['DriverID']  := 'MySQL';
    AConnection.Params.Values['Server']    := 'localhost';
    AConnection.Params.Values['Port']      := '3306';
    AConnection.Params.Values['DataBase']  := 'wkpedidovenda';
    AConnection.Params.Values['User_name'] := 'root';
    AConnection.Params.Values['Password']  := '1234';
    AConnection.Connected                  := true;

  Except
    on E: Exception do
    begin
      ShowMessage('Erro ao conectar ao banco!' + sLineBreak + E.Message);
      Application.Terminate;
    end;
  end;

end;

end.
