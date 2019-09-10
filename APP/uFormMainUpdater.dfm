object FormMainUpdater: TFormMainUpdater
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103
  ClientHeight = 101
  ClientWidth = 414
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
  object lTitle: TLabel
    Left = 8
    Top = 12
    Width = 166
    Height = 13
    Caption = #1048#1076#1077#1090' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1103'...'
  end
  object lFiles: TLabel
    Left = 8
    Top = 66
    Width = 23
    Height = 13
    Caption = 'lFiles'
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 34
    Width = 396
    Height = 17
    TabOrder = 0
  end
  object ZipForge: TZipForge
    ExtractCorruptedFiles = False
    CompressionLevel = clFastest
    CompressionMode = 1
    CurrentVersion = '6.92 '
    SpanningMode = smNone
    SpanningOptions.AdvancedNaming = False
    SpanningOptions.FirstVolumeSize = 0
    SpanningOptions.VolumeSize = vsAutoDetect
    SpanningOptions.CustomVolumeSize = 65536
    Options.FlushBuffers = True
    Options.OEMFileNames = True
    InMemory = False
    OnFileProgress = ZipForgeFileProgress
    OnOverallProgress = ZipForgeOverallProgress
    Zip64Mode = zmDisabled
    UnicodeFilenames = False
    EncryptionMethod = caPkzipClassic
    Left = 352
    Top = 48
  end
end
