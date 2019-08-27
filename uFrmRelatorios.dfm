object FrmRelAtestado: TFrmRelAtestado
  Left = 398
  Top = 281
  ClientHeight = 240
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitTop = -5
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 521
    Height = 199
    Align = alClient
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 144
    ExplicitTop = 112
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 181
      Top = 1
      Width = 339
      Height = 197
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      ExplicitLeft = 192
      ExplicitTop = 6
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 180
      Height = 197
      Align = alLeft
      TabOrder = 1
      object Label1: TLabel
        Left = 13
        Top = 18
        Width = 75
        Height = 13
        Caption = 'Nome Completo'
      end
      object Label2: TLabel
        Left = 13
        Top = 59
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object SBTTipoPessoa: TSpeedButton
        Left = 13
        Top = 160
        Width = 36
        Height = 22
        OnClick = SBTTipoPessoaClick
      end
      object MaskEdit1: TMaskEdit
        Left = 12
        Top = 37
        Width = 121
        Height = 21
        TabOrder = 0
        Text = ''
      end
      object MEDTipoPessoa: TMaskEdit
        Left = 13
        Top = 78
        Width = 84
        Height = 21
        EditMask = '000.000.000-00;1;_'
        MaxLength = 14
        TabOrder = 1
        Text = '   .   .   -  '
      end
    end
  end
end
