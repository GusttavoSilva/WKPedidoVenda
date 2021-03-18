object FrmTelaPedido: TFrmTelaPedido
  Left = 0
  Top = 0
  Caption = 'Tela de Pedido WK'
  ClientHeight = 736
  ClientWidth = 1308
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 0
    Width = 1308
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = -16
    ExplicitTop = 267
    ExplicitWidth = 1306
  end
  object pa_ContainerDadosCliente: TPanel
    Left = 0
    Top = 148
    Width = 1308
    Height = 177
    Align = alTop
    TabOrder = 0
    ExplicitTop = 145
    ExplicitWidth = 1306
    object lbl_CodCliente: TLabel
      Left = 104
      Top = 64
      Width = 89
      Height = 21
      Caption = 'Cod. Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_NomCidade: TLabel
      Left = 541
      Top = 64
      Width = 51
      Height = 21
      Caption = 'Cidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_NomCliente: TLabel
      Left = 256
      Top = 64
      Width = 124
      Height = 21
      Caption = 'Nome do Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_NomUf: TLabel
      Left = 823
      Top = 64
      Width = 19
      Height = 21
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_TitleCliente: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 1300
      Height = 25
      Margins.Top = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'La'#231'amentos de dados do cliente'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 273
    end
    object edt_CodCliente: TEdit
      Left = 104
      Top = 87
      Width = 137
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnChange = edt_CodClienteChange
    end
    object edt_NomCidade: TEdit
      Left = 541
      Top = 87
      Width = 273
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edt_NomCliente: TEdit
      Left = 256
      Top = 87
      Width = 273
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edt_NomUf: TEdit
      Left = 823
      Top = 87
      Width = 273
      Height = 26
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object pa_ContainerDadosProduto: TPanel
    Left = 0
    Top = 325
    Width = 1308
    Height = 330
    Align = alClient
    TabOrder = 1
    ExplicitTop = 148
    ExplicitWidth = 1306
    ExplicitHeight = 328
    object lbl_CodProduto: TLabel
      Left = 104
      Top = 32
      Width = 98
      Height = 21
      Caption = 'Cod. Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_ValProduto: TLabel
      Left = 749
      Top = 32
      Width = 148
      Height = 21
      Caption = 'Valor do Produto R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_NomProduto: TLabel
      Left = 256
      Top = 32
      Width = 133
      Height = 21
      Caption = 'Nome do Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lbl_QntProduto: TLabel
      Left = 542
      Top = 32
      Width = 85
      Height = 21
      Caption = 'Quantidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 1300
      Height = 25
      Margins.Top = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'La'#231'amentos de produtos'
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 210
    end
    object Label1: TLabel
      Left = 956
      Top = 32
      Width = 58
      Height = 21
      Caption = 'Total R$'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object edt_CodProduto: TEdit
      Left = 104
      Top = 55
      Width = 137
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      OEMConvert = True
      ParentFont = False
      TabOrder = 0
      Text = '0'
      OnChange = edt_CodProdutoChange
    end
    object edt_ValProduto: TEdit
      Left = 749
      Top = 55
      Width = 196
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnChange = edt_ValProdutoChange
    end
    object edt_NomProduto: TEdit
      Left = 256
      Top = 55
      Width = 273
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnChange = edt_NomProdutoChange
    end
    object edt_QntProduto: TEdit
      Left = 542
      Top = 55
      Width = 196
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = '1'
      OnChange = edt_ValProdutoChange
    end
    object db_ListProdutos: TDBGrid
      Left = 1
      Top = 159
      Width = 1306
      Height = 170
      Align = alBottom
      DataSource = DmUtil.ds_ProdutosLista
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = db_ListProdutosCellClick
    end
    object btn_IncluiProd: TPanel
      Left = 416
      Top = 87
      Width = 185
      Height = 41
      Caption = 'Incluir Item'
      Color = 5329233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = btn_IncluiProdClick
    end
    object btn_DeleteProd: TPanel
      Left = 629
      Top = 87
      Width = 185
      Height = 41
      Caption = 'Deletar Item'
      Color = 5329233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 6
      OnClick = btn_DeleteProdClick
    end
    object edt_ValTotProd: TEdit
      Left = 956
      Top = 55
      Width = 196
      Height = 26
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI '
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  object pa_TopPedido: TPanel
    Left = 0
    Top = 3
    Width = 1308
    Height = 145
    Align = alTop
    Color = 13290186
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 0
    ExplicitWidth = 1306
    object pa_Menu: TPanel
      Left = 1
      Top = 1
      Width = 1306
      Height = 143
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 1304
      object Label2: TLabel
        Left = 523
        Top = 31
        Width = 89
        Height = 21
        Caption = 'Cod. Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
      end
      object edt_CodPedido: TEdit
        Left = 523
        Top = 58
        Width = 137
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI '
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0'
        OnChange = edt_CodClienteChange
      end
      object Panel1: TPanel
        Left = 425
        Top = 97
        Width = 185
        Height = 41
        Caption = 'Selecionar Pedido'
        Color = 5329233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = Panel1Click
      end
      object Panel3: TPanel
        Left = 616
        Top = 97
        Width = 185
        Height = 41
        Caption = 'Cancelar Pedido'
        Color = 5329233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = Panel3Click
      end
    end
  end
  object paBtn_Menu: TPanel
    Left = 0
    Top = 655
    Width = 1308
    Height = 81
    Align = alBottom
    Color = 13290186
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 331
    ExplicitWidth = 1306
    object lbl_ValorCompra: TLabel
      Left = 1136
      Top = 24
      Width = 166
      Height = 25
      Alignment = taRightJustify
      Caption = 'Valor Total: R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object btn_Salvar: TPanel
      Left = 508
      Top = 24
      Width = 202
      Height = 41
      Caption = 'Salvar/Replicar Compra'
      Color = 5329233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = btn_SalvarClick
    end
  end
end
