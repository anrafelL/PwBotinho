object FrmPlayer: TFrmPlayer
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#227'o de %s'
  ClientHeight = 317
  ClientWidth = 356
  Color = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object sGauge1: TsGauge
    Left = 66
    Top = 73
    Width = 107
    Height = 16
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clRed
    Suffix = '%'
  end
  object sGauge2: TsGauge
    Left = 66
    Top = 95
    Width = 107
    Height = 16
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlue
    Suffix = '%'
  end
  object sGauge3: TsGauge
    Left = 66
    Top = 117
    Width = 107
    Height = 16
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clYellow
    Suffix = '%'
  end
  object sImage1: TsImage
    Left = 305
    Top = 40
    Width = 32
    Height = 32
    Picture.Data = {07544269746D617000000000}
    Transparent = True
    Images = FrmSharedUI.ImgList_PlayerInfoIcon
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sImage2: TsImage
    Left = 7
    Top = 242
    Width = 32
    Height = 32
    Picture.Data = {07544269746D617000000000}
    Transparent = True
    Images = FrmSharedUI.ImgList_PlayerInfoIcon
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sImage3: TsImage
    Left = 82
    Top = 242
    Width = 32
    Height = 32
    Picture.Data = {07544269746D617000000000}
    Transparent = True
    Images = FrmSharedUI.ImgList_PlayerInfoIcon
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sImage4: TsImage
    Left = 172
    Top = 242
    Width = 32
    Height = 32
    Picture.Data = {07544269746D617000000000}
    Transparent = True
    Images = FrmSharedUI.ImgList_PlayerInfoIcon
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sImage5: TsImage
    Left = 252
    Top = 242
    Width = 32
    Height = 32
    Picture.Data = {07544269746D617000000000}
    Transparent = True
    Images = FrmSharedUI.ImgList_PlayerInfoIcon
    SkinData.SkinSection = 'CHECKBOX'
  end
  object sLabel1: TsLabel
    Left = 14
    Top = 47
    Width = 129
    Height = 18
    AutoSize = False
    Caption = 'Classe'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel10: TsLabel
    Left = 179
    Top = 147
    Width = 158
    Height = 18
    Caption = 'Fama: 999.999.999.999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel11: TsLabel
    Left = 7
    Top = 167
    Width = 145
    Height = 18
    Caption = 'Exp: 999.999.999.999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel12: TsLabel
    Left = 7
    Top = 187
    Width = 161
    Height = 18
    Caption = 'Pr'#243'x. N'#237'vel: 999.999.999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel13: TsLabel
    Left = 7
    Top = 211
    Width = 172
    Height = 18
    Caption = 'Dinheiro: 999.999.999.999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel14: TsLabel
    Left = 213
    Top = 211
    Width = 78
    Height = 18
    Caption = 'Pontos: 999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel15: TsLabel
    Left = 10
    Top = 287
    Width = 16
    Height = 18
    Caption = 'ID'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel16: TsLabel
    Left = 42
    Top = 249
    Width = 16
    Height = 18
    Caption = 'ID'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel17: TsLabel
    Left = 120
    Top = 249
    Width = 16
    Height = 18
    Caption = 'ID'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel18: TsLabel
    Left = 210
    Top = 249
    Width = 16
    Height = 18
    Caption = 'ID'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel19: TsLabel
    Left = 290
    Top = 249
    Width = 16
    Height = 18
    Caption = 'ID'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel2: TsLabel
    Left = 154
    Top = 49
    Width = 135
    Height = 18
    AutoSize = False
    Caption = 'Cultivo:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel3: TsLabel
    Left = 14
    Top = 71
    Width = 46
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'HP:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel4: TsLabel
    Left = 14
    Top = 93
    Width = 46
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'MP:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel5: TsLabel
    Left = 14
    Top = 117
    Width = 46
    Height = 18
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'CHI:'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel6: TsLabel
    Left = 7
    Top = 147
    Width = 153
    Height = 18
    Caption = 'Alma: 999.999.999.999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel7: TsLabel
    Left = 179
    Top = 69
    Width = 70
    Height = 18
    Caption = '9999/9999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel8: TsLabel
    Left = 179
    Top = 93
    Width = 70
    Height = 18
    Caption = '9999/9999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabel9: TsLabel
    Left = 179
    Top = 115
    Width = 70
    Height = 18
    Caption = '9999/9999'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object sLabelFX1: TsLabelFX
    Left = 10
    Top = 4
    Width = 158
    Height = 37
    Caption = 'Nome do char'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = -3
    Shadow.OffsetKeeper.RightBottom = 5
  end
  object sLabelFX2: TsLabelFX
    Left = 245
    Top = 4
    Width = 47
    Height = 37
    Caption = '105'
    ParentFont = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    Angle = 0
    Shadow.OffsetKeeper.LeftTop = -3
    Shadow.OffsetKeeper.RightBottom = 5
  end
end
