object FrmConfig: TFrmConfig
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSizeToolWin
  Caption = 'Configura'#231#245'es'
  ClientHeight = 238
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 404
    Height = 201
    Align = alTop
    Caption = 'Op'#231#245'es'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    Checked = False
    object sSpeedButton1: TsSpeedButton
      Left = 254
      Top = 172
      Width = 27
      Height = 26
      Hint = 'Auto detectar '
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object Label1: TLabel
      Left = 8
      Top = 152
      Width = 163
      Height = 18
      Caption = 'Diret'#243'rio do Perfect world'
    end
    object sCheckBox1: TsCheckBox
      Left = 16
      Top = 28
      Width = 162
      Height = 22
      Caption = 'Iniciar com o windows'
      TabOrder = 0
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox2: TsCheckBox
      Left = 16
      Top = 48
      Width = 174
      Height = 22
      Caption = 'Auto checar atualiza'#231#227'o'
      TabOrder = 1
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox3: TsCheckBox
      Left = 16
      Top = 70
      Width = 170
      Height = 22
      Caption = 'Minimizar pera bandeja'
      TabOrder = 2
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox4: TsCheckBox
      Left = 16
      Top = 94
      Width = 125
      Height = 22
      Caption = 'Sempre no topo'
      TabOrder = 3
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sCheckBox5: TsCheckBox
      Left = 16
      Top = 118
      Width = 166
      Height = 22
      Caption = 'Auto renomear janela '
      TabOrder = 4
      ImgChecked = 0
      ImgUnchecked = 0
    end
    object sEdit1: TsEdit
      Left = 8
      Top = 172
      Width = 244
      Height = 26
      TabOrder = 5
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
    object sButton3: TsButton
      Left = 287
      Top = 172
      Width = 110
      Height = 26
      Hint = 'Escolher manualmente'
      Caption = 'Escolher'
      TabOrder = 6
      OnClick = sButton3Click
    end
  end
  object sButton1: TsButton
    Left = 245
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Feito'
    TabOrder = 1
    OnClick = sButton1Click
  end
  object sButton2: TsButton
    Left = 321
    Top = 207
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = sButton2Click
  end
  object sPathDialog1: TsPathDialog
    Root = 'rfDesktop'
    Caption = 'Selecione o diret'#243'rio do Perfect World'
    DialogOptions = []
    Left = 236
    Top = 18
  end
end
