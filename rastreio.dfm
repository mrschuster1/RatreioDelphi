object formRastreio: TformRastreio
  Left = 478
  Top = 119
  BorderStyle = bsNone
  Caption = 'Correios - C'#225'lculo de Pre'#231'os e Prazos de Encomendas'
  ClientHeight = 536
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Poppins'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object UCaptionBar1: TUCaptionBar
    Left = 0
    Top = 0
    Width = 565
    Caption = '                 Rastreio de encomendas'
    Color = 3030463
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Poppins'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    CustomBackColor.Enabled = True
    CustomBackColor.Color = 3030463
    CustomBackColor.LightColor = 3030463
    CustomBackColor.DarkColor = 3030463
    object UQuickButton1: TUQuickButton
      Left = 520
      Top = 0
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      CustomBackColor.Enabled = False
      CustomBackColor.Color = clBlack
      CustomBackColor.LightColor = 13619151
      CustomBackColor.DarkColor = 3947580
      ButtonStyle = qbsQuit
      Caption = #57610
      ExplicitTop = 16
    end
    object UQuickButton2: TUQuickButton
      Left = 475
      Top = 0
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe MDL2 Assets'
      Font.Style = []
      ParentFont = False
      CustomBackColor.Enabled = False
      CustomBackColor.Color = clBlack
      CustomBackColor.LightColor = 13619151
      CustomBackColor.DarkColor = 3947580
      ButtonStyle = qbsMin
      Caption = #57608
      ExplicitLeft = 520
      ExplicitTop = 16
    end
    object Label16: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 0
      Width = 30
      Height = 32
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Alignment = taCenter
      Caption = #62603
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Font Awesome 6 Free Solid'
      Font.Style = []
      Font.Quality = fqClearTypeNatural
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 24
    end
  end
  object pnlbaixo: TPanel
    Left = 0
    Top = 534
    Width = 565
    Height = 2
    Align = alBottom
    BevelOuter = bvNone
    Color = 3030463
    ParentBackground = False
    TabOrder = 1
  end
  object pnldireita: TPanel
    Left = 563
    Top = 32
    Width = 2
    Height = 502
    Align = alRight
    BevelOuter = bvNone
    Color = 3030465
    ParentBackground = False
    TabOrder = 2
  end
  object pnlesquerda: TPanel
    Left = 0
    Top = 32
    Width = 2
    Height = 502
    Align = alLeft
    BevelOuter = bvNone
    Color = 2964930
    ParentBackground = False
    TabOrder = 3
  end
  object pnlPrincipal: TPanel
    Left = 2
    Top = 32
    Width = 561
    Height = 502
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pgc: TPageControl
      Left = 0
      Top = 41
      Width = 561
      Height = 461
      ActivePage = tbLista
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 0
      object tbRastreio: TTabSheet
        Caption = 'tbRastreio'
        TabVisible = False
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 553
          Height = 451
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 553
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object UQuickButton3: TUQuickButton
              Left = 199
              Top = 6
              Width = 28
              Height = 27
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'dashicons'
              Font.Style = []
              ParentFont = False
              OnClick = UQuickButton3Click
              CustomBackColor.Enabled = False
              CustomBackColor.Color = clBlack
              CustomBackColor.LightColor = 13619151
              CustomBackColor.DarkColor = 3947580
              Caption = #62241
            end
            object EdtRastreio: TEdit
              Left = 8
              Top = 6
              Width = 185
              Height = 27
              CharCase = ecUpperCase
              MaxLength = 13
              TabOrder = 0
              TextHint = 'Informe o c'#243'digo de rastreio'
              OnChange = EdtRastreioChange
              OnExit = EdtRastreioExit
              OnKeyDown = EdtRastreioKeyDown
              OnKeyPress = EdtRastreioKeyPress
            end
            object UListButton1: TUListButton
              Left = 230
              Top = 6
              Width = 105
              Height = 27
              Caption = 'Rastrear'
              TabOrder = 1
              OnClick = Button1Click
              IconFont.Charset = DEFAULT_CHARSET
              IconFont.Color = clWindowText
              IconFont.Height = -20
              IconFont.Name = 'dashicons'
              IconFont.Style = []
              CustomBackColor.Enabled = False
              CustomBackColor.LightNone = 15132390
              CustomBackColor.LightHover = 13619151
              CustomBackColor.LightPress = 12105912
              CustomBackColor.LightSelectedNone = 127
              CustomBackColor.LightSelectedHover = 103
              CustomBackColor.LightSelectedPress = 89
              CustomBackColor.DarkNone = 2039583
              CustomBackColor.DarkHover = 3487029
              CustomBackColor.DarkPress = 5000268
              CustomBackColor.DarkSelectedNone = 89
              CustomBackColor.DarkSelectedHover = 103
              CustomBackColor.DarkSelectedPress = 127
              FontIcon = #61817
              Detail = ''
            end
            object btnSalvar: TUListButton
              Left = 341
              Top = 6
              Width = 105
              Height = 27
              Caption = 'Salvar'
              TabOrder = 2
              OnClick = btnSalvarClick
              IconFont.Charset = DEFAULT_CHARSET
              IconFont.Color = clWindowText
              IconFont.Height = -20
              IconFont.Name = 'Font Awesome 6 Free Solid'
              IconFont.Style = []
              CustomBackColor.Enabled = False
              CustomBackColor.LightNone = 15132390
              CustomBackColor.LightHover = 13619151
              CustomBackColor.LightPress = 12105912
              CustomBackColor.LightSelectedNone = 127
              CustomBackColor.LightSelectedHover = 103
              CustomBackColor.LightSelectedPress = 89
              CustomBackColor.DarkNone = 2039583
              CustomBackColor.DarkHover = 3487029
              CustomBackColor.DarkPress = 5000268
              CustomBackColor.DarkSelectedNone = 89
              CustomBackColor.DarkSelectedHover = 103
              CustomBackColor.DarkSelectedPress = 127
              FontIcon = #61639
              Detail = ''
            end
          end
          object boxList: TUScrollBox
            Left = 0
            Top = 41
            Width = 553
            Height = 410
            HorzScrollBar.Tracking = True
            VertScrollBar.Tracking = True
            Align = alClient
            DoubleBuffered = True
            Color = 15132390
            ParentColor = False
            ParentDoubleBuffered = False
            TabOrder = 1
            AniSet.AniKind = akOut
            AniSet.AniFunctionKind = afkQuintic
            AniSet.DelayStartTime = 0
            AniSet.Duration = 120
            AniSet.Step = 12
            CustomBackColor.Enabled = False
            CustomBackColor.Color = 15132390
            CustomBackColor.LightColor = 15132390
            CustomBackColor.DarkColor = 2039583
            LengthPerStep = 3
            MaxScrollCount = 5
          end
        end
      end
      object tbLista: TTabSheet
        Caption = 'tbLista'
        ImageIndex = 1
        TabVisible = False
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 553
          Height = 451
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel5: TPanel
            Left = 2
            Top = 0
            Width = 173
            Height = 33
            BevelOuter = bvNone
            Caption = 'Objeto'
            Color = 3030463
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Poppins'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object Panel6: TPanel
            Left = 168
            Top = 0
            Width = 358
            Height = 33
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = 'Status'
            Color = 3030463
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Poppins'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 1
          end
          object gridLista: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 553
            Height = 451
            Hint = 'Clique duplo para atualizar informa'#231#245'es de rastreio'
            Align = alClient
            AllowDelete = False
            AllowInsert = False
            Color = clBtnFace
            DataSource = dsSql
            PanelBorder = gbNone
            PanelHeight = 451
            PanelWidth = 526
            ParentColor = False
            ParentShowHint = False
            TabOrder = 2
            RowCount = 1
            SelectedColor = clWhite
            ShowHint = True
            OnDblClick = gridListaDblClick
            OnPaintPanel = gridListaPaintPanel
            object lblObjeto: TLabel
              Left = 55
              Top = 0
              Width = 44
              Height = 430
              Align = alLeft
              Caption = 'Objeto'
              Color = 1621979
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Poppins'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              OnDblClick = gridListaDblClick
              ExplicitHeight = 23
            end
            object lblStatus: TLabel
              AlignWithMargins = True
              Left = 109
              Top = 0
              Width = 417
              Height = 430
              Margins.Left = 10
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alClient
              Caption = 'Status'
              Color = 1621979
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Poppins'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              WordWrap = True
              OnDblClick = gridListaDblClick
              ExplicitWidth = 43
              ExplicitHeight = 23
            end
            object lblIcone: TLabel
              Left = 0
              Top = 0
              Width = 55
              Height = 430
              Align = alLeft
              Alignment = taCenter
              Color = 1621979
              Constraints.MinWidth = 55
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -29
              Font.Name = 'Font Awesome 6 Free Solid'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
              ExplicitHeight = 29
            end
            object lblDataHora: TLabel
              AlignWithMargins = True
              Left = 10
              Top = 430
              Width = 516
              Height = 19
              Margins.Left = 10
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alBottom
              Caption = 'Data'
              WordWrap = True
              OnDblClick = gridListaDblClick
              ExplicitWidth = 26
            end
            object Panel7: TPanel
              Left = 0
              Top = 449
              Width = 526
              Height = 2
              Align = alBottom
              BevelOuter = bvNone
              Color = clSilver
              ParentBackground = False
              TabOrder = 0
            end
          end
        end
      end
    end
    object pnlAbas: TPanel
      Left = 0
      Top = 0
      Width = 561
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnLista: TUListButton
        Left = 101
        Top = 0
        Width = 101
        Height = 41
        Align = alLeft
        Caption = 'Lista'
        TabOrder = 0
        OnClick = btnListaClick
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -24
        IconFont.Name = 'dashicons'
        IconFont.Style = []
        CustomBackColor.Enabled = True
        CustomBackColor.LightNone = 15132390
        CustomBackColor.LightHover = 13619151
        CustomBackColor.LightPress = 12105912
        CustomBackColor.LightSelectedNone = 5197647
        CustomBackColor.LightSelectedHover = 5197647
        CustomBackColor.LightSelectedPress = 5197647
        CustomBackColor.DarkNone = 15132390
        CustomBackColor.DarkHover = 13619151
        CustomBackColor.DarkPress = 12105912
        CustomBackColor.DarkSelectedNone = 5197647
        CustomBackColor.DarkSelectedHover = 5197647
        CustomBackColor.DarkSelectedPress = 5197647
        FontIcon = #61795
        Detail = ''
        SelectMode = smSelect
      end
      object btnRastreio: TUListButton
        Left = 0
        Top = 0
        Width = 101
        Height = 41
        Align = alLeft
        Caption = 'Rastreio'
        TabOrder = 1
        OnClick = btnRastreioClick
        IconFont.Charset = DEFAULT_CHARSET
        IconFont.Color = clWindowText
        IconFont.Height = -21
        IconFont.Name = 'Font Awesome 6 Free Solid'
        IconFont.Style = []
        IconFont.Quality = fqClearTypeNatural
        CustomBackColor.Enabled = True
        CustomBackColor.LightNone = 15132390
        CustomBackColor.LightHover = 13619151
        CustomBackColor.LightPress = 12105912
        CustomBackColor.LightSelectedNone = 5197647
        CustomBackColor.LightSelectedHover = 5197647
        CustomBackColor.LightSelectedPress = 5197647
        CustomBackColor.DarkNone = 15132390
        CustomBackColor.DarkHover = 13619151
        CustomBackColor.DarkPress = 12105912
        CustomBackColor.DarkSelectedNone = 5197647
        CustomBackColor.DarkSelectedHover = 5197647
        CustomBackColor.DarkSelectedPress = 5197647
        FontIcon = #61925
        Detail = ''
        SelectMode = smSelect
        Selected = True
      end
    end
  end
  object pnlHistorico: TPanel
    Left = 14
    Top = 104
    Width = 185
    Height = 4
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 5
    Visible = False
    object ListBox1: TListBox
      Left = 0
      Top = 0
      Width = 185
      Height = 4
      Align = alClient
      BevelOuter = bvNone
      BorderStyle = bsNone
      ItemHeight = 19
      TabOrder = 0
      OnClick = ListBox1Click
      OnKeyDown = ListBox1KeyDown
    end
  end
  object ACBrSedex1: TACBrSedex
    ProxyPort = '8080'
    Formato = TpfCaixaPacote
    Servico = Tps04510PAC
    UrlConsulta = 'http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?'
    Left = 440
    Top = 88
  end
  object ds: TDataSource
    DataSet = cds
    Left = 460
    Top = 40
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 508
    Top = 40
    object cdsData: TDateTimeField
      FieldName = 'Data'
    end
    object cdsLocal: TStringField
      FieldName = 'Local'
      Size = 100
    end
    object cdsSituacao: TStringField
      FieldName = 'Situacao'
      Size = 100
    end
    object cdsObservacao: TStringField
      FieldName = 'Observacao'
      Size = 200
    end
  end
  object sql: TFDQuery
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select * from RASTREIO')
    Left = 457
    Top = 196
    object sqlRAST_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'RAST_COD'
      Origin = 'RAST_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlRAST_RASTREIO: TStringField
      FieldName = 'RAST_RASTREIO'
      Origin = 'RAST_RASTREIO'
      Size = 13
    end
    object sqlRAST_DESCRICAO: TStringField
      FieldName = 'RAST_DESCRICAO'
      Origin = 'RAST_DESCRICAO'
      Size = 30
    end
    object sqlRAST_RETORNO: TMemoField
      FieldName = 'RAST_RETORNO'
      Origin = 'RAST_RETORNO'
      BlobType = ftMemo
    end
    object sqlRAST_SITUACAO: TStringField
      FieldName = 'RAST_SITUACAO'
      Origin = 'RAST_SITUACAO'
      Size = 50
    end
    object sqlRAST_DATARETORNO: TSQLTimeStampField
      FieldName = 'RAST_DATARETORNO'
      Origin = 'RAST_DATARETORNO'
    end
  end
  object dsSql: TDataSource
    DataSet = sql
    Left = 505
    Top = 220
  end
  object HISTORICO: TFDQuery
    AfterOpen = HISTORICOAfterOpen
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select * from HISTORICO_RASTREIO')
    Left = 401
    Top = 204
    object HISTORICOHIS_COD: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'HIS_COD'
      Origin = 'HIS_COD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object HISTORICOHIS_DESCRICAO: TStringField
      FieldName = 'HIS_DESCRICAO'
      Origin = 'HIS_DESCRICAO'
      Size = 13
    end
  end
  object dsHistorico: TDataSource
    DataSet = HISTORICO
    Left = 417
    Top = 260
  end
end
