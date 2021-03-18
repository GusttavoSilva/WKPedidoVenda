object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 230
  Width = 304
  object Mysql_Driver: TFDPhysMySQLDriverLink
    Left = 40
    Top = 64
  end
  object fd_Conn: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Password=1234'
      'Server=127.0.0.1'
      'Database=pedidovenda'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object fd_Transaction: TFDTransaction
    Connection = fd_Conn
    Left = 40
    Top = 112
  end
end
