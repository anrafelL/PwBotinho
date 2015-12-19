object frmAutoPotion: TfrmAutoPotion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'AutoPotion de %s'
  ClientHeight = 461
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object sScrollBox1: TsScrollBox
    Left = 0
    Top = 58
    Width = 315
    Height = 403
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL_LOW'
  end
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 72
      Height = 19
      Align = alLeft
      Caption = 'Id do jogador: '
      ExplicitHeight = 13
    end
  end
  object sPanel2: TsPanel
    Left = 0
    Top = 29
    Width = 315
    Height = 29
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object sButton1: TsButton
      Left = 2
      Top = 2
      Width = 31
      Height = 25
      Align = alLeft
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = sButton1Click
    end
  end
end
