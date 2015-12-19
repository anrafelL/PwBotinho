object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pw Botinho 2.0 Alpha RC'
  ClientHeight = 529
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Lv: TsListView
    Left = 0
    Top = 0
    Width = 546
    Height = 150
    BoundLabel.Indent = 0
    BoundLabel.Font.Charset = DEFAULT_CHARSET
    BoundLabel.Font.Color = clWindowText
    BoundLabel.Font.Height = -11
    BoundLabel.Font.Name = 'Tahoma'
    BoundLabel.Font.Style = []
    BoundLabel.Layout = sclLeft
    BoundLabel.MaxWidth = 0
    BoundLabel.UseSkinColor = True
    SkinData.SkinSection = 'EDIT'
    OnItemChecked = LvItemChecked
    Align = alTop
    Checkboxes = True
    Columns = <
      item
        Caption = 'ID'
        Width = 100
      end
      item
        Caption = 'Handle da janela'
        Width = 100
      end
      item
        Caption = 'Id Processo'
        Width = 100
      end
      item
        Caption = 'Titulo da janela'
        Width = 100
      end
      item
        Caption = 'Nome do char'
        Width = 100
      end
      item
        Caption = 'Congelado'
        Width = 100
      end
      item
        Caption = 'Ativo'
        Width = 100
      end
      item
        Caption = 'Quantidade AutoPotion'
      end>
    FullDrag = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PmLv
    SortType = stBoth
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = LvClick
  end
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 150
    Width = 546
    Height = 87
    Align = alTop
    Caption = 'A'#231#245'es'
    TabOrder = 1
    SkinData.SkinSection = 'GROUPBOX'
    Checked = False
    object sSpeedButton1: TsSpeedButton
      Left = 12
      Top = 18
      Width = 64
      Height = 64
      Hint = 'Adiciona o Perfect World '#13#10'Compat'#237'vel  em execu'#231#227'o. '
      Flat = True
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 0
      Images = FrmSharedUI.ImgList_MainMenuIcon
    end
    object sSpeedButton2: TsSpeedButton
      Left = 78
      Top = 18
      Width = 64
      Height = 64
      Hint = 'Renomeia a janela com o nome do Char logado.'
      Flat = True
      OnClick = sSpeedButton2Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 1
      Images = FrmSharedUI.ImgList_MainMenuIcon
    end
    object sSpeedButton3: TsSpeedButton
      Left = 144
      Top = 17
      Width = 64
      Height = 64
      Hint = 'Abre a janela de configura'#231#227'o'
      Flat = True
      OnClick = sSpeedButton3Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 2
      Images = FrmSharedUI.ImgList_MainMenuIcon
    end
    object sSpeedButton4: TsSpeedButton
      Left = 214
      Top = 17
      Width = 64
      Height = 64
      Hint = 'Abre a janela de informa'#231#227'o '#13#10'do char.'
      Flat = True
      OnClick = I1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 3
      Images = FrmSharedUI.ImgList_MainMenuIcon
    end
    object sSpeedButton5: TsSpeedButton
      Left = 474
      Top = 18
      Width = 64
      Height = 64
      Hint = 'Sobre.'
      Flat = True
      OnClick = sSpeedButton5Click
      SkinData.SkinSection = 'SPEEDBUTTON'
      ImageIndex = 4
      Images = FrmSharedUI.ImgList_MainMenuIcon
    end
  end
  object sGroupBox2: TsGroupBox
    Left = 0
    Top = 237
    Width = 289
    Height = 273
    Align = alLeft
    Caption = 'Gerais'
    TabOrder = 2
    SkinData.SkinSection = 'GROUPBOX'
    Checked = False
    object sScrollBox1: TsScrollBox
      Left = 2
      Top = 15
      Width = 285
      Height = 256
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      SkinData.SkinSection = 'PANEL_LOW'
      object EdAtv1: TsEdit
        Left = 91
        Top = 8
        Width = 72
        Height = 27
        TabOrder = 0
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv1: TsButton
        Left = 169
        Top = 8
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 1
        OnClick = BtnAtv1Click
      end
      object EdAtv2: TsEdit
        Left = 91
        Top = 38
        Width = 72
        Height = 27
        TabOrder = 2
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv2: TsButton
        Left = 169
        Top = 38
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 3
        OnClick = BtnAtv2Click
      end
      object EdAtv3: TsEdit
        Left = 91
        Top = 68
        Width = 72
        Height = 27
        TabOrder = 4
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv3: TsButton
        Left = 169
        Top = 68
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 5
        OnClick = BtnAtv3Click
      end
      object EdAtv4: TsEdit
        Left = 91
        Top = 98
        Width = 72
        Height = 27
        TabOrder = 6
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv4: TsButton
        Left = 169
        Top = 98
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 7
        OnClick = BtnAtv4Click
      end
      object EdAtv5: TsEdit
        Left = 91
        Top = 128
        Width = 72
        Height = 27
        TabOrder = 8
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv5: TsButton
        Left = 169
        Top = 128
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 9
        OnClick = BtnAtv5Click
      end
      object BtnAtv6: TsButton
        Left = 169
        Top = 158
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 10
        OnClick = BtnAtv6Click
      end
      object EdAtv6: TsEdit
        Left = 91
        Top = 158
        Width = 72
        Height = 27
        TabOrder = 11
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object EdAtv7: TsEdit
        Left = 91
        Top = 188
        Width = 72
        Height = 27
        TabOrder = 12
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object BtnAtv7: TsButton
        Left = 169
        Top = 188
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 13
        OnClick = BtnAtv7Click
      end
      object BtnAtv8: TsButton
        Left = 169
        Top = 218
        Width = 90
        Height = 29
        Caption = 'Ativar'
        TabOrder = 14
        OnClick = BtnAtv8Click
      end
      object EdAtv8: TsEdit
        Left = 91
        Top = 218
        Width = 72
        Height = 27
        TabOrder = 15
        Text = '1000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object CBoxAtv1: TComboBox
        Left = 8
        Top = 9
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 16
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv2: TComboBox
        Left = 8
        Top = 39
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 17
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv4: TComboBox
        Left = 8
        Top = 99
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 18
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv3: TComboBox
        Left = 8
        Top = 69
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 19
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv6: TComboBox
        Left = 8
        Top = 159
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 20
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv5: TComboBox
        Left = 8
        Top = 129
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 21
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv8: TComboBox
        Left = 8
        Top = 219
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 22
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
      object CBoxAtv7: TComboBox
        Left = 8
        Top = 189
        Width = 77
        Height = 27
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 23
        Text = 'F1'
        Items.Strings = (
          'F1'
          'F2'
          'F3'
          'F4'
          'F5'
          'F6'
          'F7'
          'F8'
          'NUM 1'
          'NUM 2'
          'NUM 3'
          'NUM 4'
          'NUM 5'
          'NUM 6'
          'NUM 7'
          'NUM 8'
          'NUM 9'
          '{SIM}'
          '{N'#195'O}')
      end
    end
  end
  object sStatusBar1: TsStatusBar
    Left = 0
    Top = 510
    Width = 546
    Height = 19
    Panels = <
      item
        Text = 'PwBotinho 2.0 Alpha Release'
        Width = 170
      end
      item
        Text = 'Copyright (C) 2015. Swellington Soares'
        Width = 300
      end
      item
        Width = 50
      end>
    SkinData.SkinSection = 'STATUSBAR'
  end
  object sSkinManager1: TsSkinManager
    ExtendedBorders = True
    Active = False
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'Tahoma'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'c:\Skins'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 322
    Top = 243
  end
  object PmLv: TPopupMenu
    Left = 322
    Top = 346
    object P1: TMenuItem
      Caption = 'PwBotinho 2.0'
      Enabled = False
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object L1: TMenuItem
      Caption = 'Limpar lista'
      Default = True
      OnClick = L1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object I1: TMenuItem
      Caption = 'Informa'#231#227'o do char'
      OnClick = I1Click
    end
    object A1: TMenuItem
      Caption = 'Auto Potion'
      OnClick = A1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object D1: TMenuItem
      Caption = 'Desativar tudo'
      OnClick = D1Click
    end
    object J1: TMenuItem
      Caption = 'Janela'
      object R2: TMenuItem
        Caption = 'Restaurar t'#237'tulo original'
        OnClick = R2Click
      end
      object R1: TMenuItem
        Caption = 'Restaurar'
        OnClick = R1Click
      end
      object M1: TMenuItem
        Caption = 'Renomear'
        OnClick = M1Click
      end
      object M2: TMenuItem
        Caption = 'Minimizar'
        OnClick = M2Click
      end
      object M3: TMenuItem
        Caption = 'Maximizar'
        OnClick = M3Click
      end
      object F1: TMenuItem
        Caption = 'Fechar'
        OnClick = F1Click
      end
      object T1: TMenuItem
        Caption = 'Tamanho'
        object N61: TMenuItem
          Caption = '640x480'
        end
        object N81: TMenuItem
          Caption = '800x600'
        end
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object E1: TMenuItem
      Caption = 'Encerrar'
      OnClick = E1Click
    end
  end
  object TrayIcon: TTrayIcon
    Animate = True
    BalloonHint = 'Pw Botinho foi minimizado'
    BalloonTimeout = 5000
    BalloonFlags = bfInfo
    PopupMenu = TrayPopup
    Left = 322
    Top = 294
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 324
    Top = 402
  end
  object TrayPopup: TPopupMenu
    Left = 322
    Top = 456
    object e2: TMenuItem
      Caption = 'Restaurar'
      Default = True
      OnClick = e2Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object S1: TMenuItem
      Caption = 'Sair'
      OnClick = S1Click
    end
  end
end
