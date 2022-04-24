object DM: TDM
  OldCreateOrder = False
  Height = 478
  Width = 540
  object CONEXAO: TFDConnection
    Params.Strings = (
      'Database=C:\Users\SCHUSTER\Desktop\rastreio\DADOS\RASTREIO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Left = 256
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Users\SCHUSTER\Desktop\rastreio\DADOS\fbclient.dll'
    Left = 80
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 168
    Top = 40
  end
end
