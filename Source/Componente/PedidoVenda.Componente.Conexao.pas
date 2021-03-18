unit PedidoVenda.Componente.Conexao;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.MySQL,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  Data.DB;

type
  TDM = class(TDataModule)
    Mysql_Driver: TFDPhysMySQLDriverLink;
    fd_Conn: TFDConnection;
    fd_Transaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  PedidoVenda.Model.Conexao;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  TModelConexao.New.Connection(fd_Conn);
end;

end.
