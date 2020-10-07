object FrmCadConsultas: TFrmCadConsultas
  Left = 0
  Top = 0
  Caption = 'FrmCadConsultas'
  ClientHeight = 150
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 41
    Align = alTop
    Caption = 'Cadastro de consultas'
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -19
    Font.Name = '@Malgun Gothic'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 557
    Height = 109
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 372
      Top = 4
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object LblDatanasc: TLabel
      Left = 283
      Top = 52
      Width = 83
      Height = 13
      Caption = 'Data da Consulta'
    end
    object Label1: TLabel
      Left = 4
      Top = 7
      Width = 86
      Height = 13
      Caption = 'Nome do Paciente'
    end
    object Label4: TLabel
      Left = 384
      Top = 50
      Width = 23
      Height = 13
      Caption = 'Hora'
    end
    object Residente: TLabel
      Left = 4
      Top = 50
      Width = 48
      Height = 13
      Caption = 'Residente'
    end
    object EdtCpf: TMaskEdit
      Left = 372
      Top = 23
      Width = 84
      Height = 21
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 0
      Text = '   .   .   -  '
    end
    object DtmDatacons: TDateTimePicker
      Left = 274
      Top = 71
      Width = 104
      Height = 21
      Date = 43692.000000000000000000
      Time = 0.867866018517816000
      TabOrder = 1
    end
    object Button1: TButton
      Left = 464
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 464
      Top = 65
      Width = 75
      Height = 25
      Caption = 'Agendar'
      TabOrder = 3
      OnClick = Button2Click
    end
    object MaskHora: TMaskEdit
      Left = 384
      Top = 69
      Width = 38
      Height = 21
      EditMask = '00:00'
      MaxLength = 5
      TabOrder = 4
      Text = '  :  '
    end
  end
  object EdtNomePaciente: TEdit
    Left = 3
    Top = 64
    Width = 363
    Height = 21
    TabOrder = 2
  end
  object DbLResidente: TDBLookupComboBox
    Left = 3
    Top = 110
    Width = 198
    Height = 21
    KeyField = 'Nome'
    ListField = 'Nome'
    ListSource = DsResidente
    TabOrder = 3
  end
  object QryPaciente: TADOQuery
    Connection = DataTabelas.ADOMasterSysMed
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 192
    object QryPacienteNome: TStringField
      FieldName = 'Nome'
      Size = 1000
    end
  end
  object CmmdConsulta: TADOCommand
    CommandText = 
      'insert into Consultas(Nome, CPFCNPJ, DATAcons, Residente, Hora)'#13 +
      #10'values(:Nome, :CPFCNPJ, :DATAcons, :Residente, :Hora)'
    Connection = DataTabelas.ADOMasterSysMed
    Parameters = <
      item
        Name = 'Nome'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 200
        Value = Null
      end
      item
        Name = 'CPFCNPJ'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'DATAcons'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'Residente'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'Hora'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    Left = 96
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = QryPaciente
    Left = 272
    Top = 16
  end
  object QryResidente: TADOQuery
    Connection = DataTabelas.ADOMasterSysMed
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from dbo.CadastroResidente')
    Left = 336
    Top = 8
    object QryResidenteNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object QryResidenteAtividade: TStringField
      FieldName = 'Atividade'
      Size = 100
    end
  end
  object DsResidente: TDataSource
    DataSet = QryResidente
    Left = 408
    Top = 8
  end
end
