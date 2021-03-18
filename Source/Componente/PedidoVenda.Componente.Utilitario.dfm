object DmUtil: TDmUtil
  OldCreateOrder = False
  Height = 282
  Width = 436
  object mem_ListaProduto: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ORDEM'
        DataType = ftAutoInc
      end
      item
        Name = 'cod_produto'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'qtd_produtos'
        DataType = ftFloat
      end
      item
        Name = 'val_unitario'
        DataType = ftFloat
      end
      item
        Name = 'val_total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'ORDEM'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 24
    Top = 24
    object mem_ListaProdutoORDEM: TAutoIncField
      FieldName = 'ORDEM'
    end
    object mem_ListaProdutoCODIGO: TIntegerField
      DisplayLabel = 'COD. PROD'
      FieldName = 'cod_produto'
    end
    object mem_ListaProdutoPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 60
    end
    object mem_ListaProdutoQUANTIDADE: TFloatField
      FieldName = 'qtd_produtos'
    end
    object mem_ListaProdutoVALOR: TFloatField
      FieldName = 'val_unitario'
    end
    object mem_ListaProdutoTOTAL: TFloatField
      FieldName = 'val_total'
    end
  end
  object ds_ProdutosLista: TDataSource
    DataSet = mem_ListaProduto
    Left = 24
    Top = 80
  end
  object ds_ListaPedidos: TDataSource
    DataSet = mem_ListaProduto
    Left = 128
    Top = 136
  end
end
