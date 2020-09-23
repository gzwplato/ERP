object FrmCadResidente: TFrmCadResidente
  Left = 0
  Top = 0
  Caption = 'FrmCadResidente'
  ClientHeight = 223
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 41
    Align = alTop
    Caption = 'Cadastro de Residentes'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 152
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 304
    Height = 182
    Align = alClient
    TabOrder = 1
    ExplicitTop = 45
    ExplicitWidth = 352
    ExplicitHeight = 141
    object Label1: TLabel
      Left = 16
      Top = 1
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 16
      Top = 39
      Width = 43
      Height = 13
      Caption = 'Matricula'
    end
    object Label3: TLabel
      Left = 16
      Top = 84
      Width = 45
      Height = 13
      Caption = 'Atividade'
    end
    object EdtNome: TEdit
      Left = 16
      Top = 18
      Width = 249
      Height = 17
      TabOrder = 0
    end
    object EdtMatricula: TEdit
      Left = 16
      Top = 58
      Width = 249
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 104
      Top = 146
      Width = 75
      Height = 25
      Caption = 'Confirmar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object EdtAtividade: TEdit
      Left = 16
      Top = 103
      Width = 249
      Height = 21
      TabOrder = 3
    end
  end
  object QryResidente: TADOQuery
    Connection = DataTabelas.ADOMasterSysMed
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 32
    Top = 176
    object QryResidenteNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object QryResidenteRE: TIntegerField
      FieldName = 'RE'
    end
    object QryResidenteAtividade: TStringField
      FieldName = 'Atividade'
      Size = 100
    end
  end
  object CmmdRsidente: TADOCommand
    CommandText = 
      'insert into CadastroResidente(Nome, RE, Atividade)'#13#10'values (:Nom' +
      'e, :RE, :Atividade)'
    Connection = DataTabelas.ADOMasterSysMed
    Parameters = <
      item
        Name = 'Nome'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'RE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'Atividade'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end>
    Left = 216
    Top = 176
  end
end
