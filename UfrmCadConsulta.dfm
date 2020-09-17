object FrmCadConsultas: TFrmCadConsultas
  Left = 0
  Top = 0
  Caption = 'FrmCadConsultas'
  ClientHeight = 148
  ClientWidth = 527
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
    Width = 527
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
    Width = 527
    Height = 107
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 342
      Top = 6
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object LblDatanasc: TLabel
      Left = 328
      Top = 53
      Width = 83
      Height = 13
      Caption = 'Data da Consulta'
    end
    object Label3: TLabel
      Left = 3
      Top = 53
      Width = 94
      Height = 13
      Caption = 'Nome Do Residente'
    end
    object Label1: TLabel
      Left = 4
      Top = 7
      Width = 86
      Height = 13
      Caption = 'Nome do Paciente'
    end
    object EdtCpf: TMaskEdit
      Left = 328
      Top = 23
      Width = 84
      Height = 21
      EditMask = '000.000.000-00;1;_'
      MaxLength = 14
      TabOrder = 0
      Text = '   .   .   -  '
    end
    object DtmDataNasci: TDateTimePicker
      Left = 328
      Top = 72
      Width = 104
      Height = 21
      Date = 43692.000000000000000000
      Time = 0.867866018517816000
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 3
      Top = 70
      Width = 319
      Height = 21
      TabOrder = 2
    end
    object Button1: TButton
      Left = 438
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 438
      Top = 70
      Width = 75
      Height = 25
      Caption = 'Agendar'
      TabOrder = 4
    end
  end
  object EdtNomePaciente: TEdit
    Left = 3
    Top = 64
    Width = 301
    Height = 21
    TabOrder = 2
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
    Parameters = <>
    Left = 96
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = QryPaciente
    Left = 256
    Top = 80
  end
end
