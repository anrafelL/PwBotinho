object FrmUpdate: TFrmUpdate
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Atualiza'#231#227'o'
  ClientHeight = 135
  ClientWidth = 447
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 18
  object sGauge1: TsGauge
    Left = 0
    Top = 91
    Width = 447
    Height = 44
    Align = alTop
    SkinData.SkinSection = 'GAUGE'
    ForeColor = clBlack
    Suffix = '%'
    ExplicitTop = 93
  end
  object sGroupBox1: TsGroupBox
    Left = 0
    Top = 0
    Width = 447
    Height = 91
    Align = alTop
    Caption = 'Informa'#231#227'o'
    TabOrder = 0
    SkinData.SkinSection = 'GROUPBOX'
    Checked = False
    object Label1: TLabel
      Left = 10
      Top = 22
      Width = 44
      Height = 18
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 10
      Top = 42
      Width = 50
      Height = 18
      Caption = 'Vers'#227'o:'
    end
    object Label3: TLabel
      Left = 10
      Top = 62
      Width = 74
      Height = 18
      Caption = 'Progresso: '
    end
  end
  object http: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 412
    Top = 16
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 340
    Top = 14
  end
end
