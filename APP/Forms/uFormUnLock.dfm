object FormUnLock: TFormUnLock
  Left = 0
  Top = 0
  Align = alCustom
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1089#1077#1072#1085#1089
  ClientHeight = 107
  ClientWidth = 254
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 82
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object Image1: TImage
    Left = 19
    Top = 25
    Width = 48
    Height = 48
    AutoSize = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F98700000006624B474400FF00FF00FFA0BDA793000003
      C44944415478DAED966B48145114C7EF9D5157851EB059911411D1933E94657D
      080211DBDE8519253D56CAB5A87477ADDC35AD21D35DA31C1F3D98D1DE689095
      986C98851FA220AC2482A2C20F09FAA12CCBB25C75666E67D7AD34896C9B6D76
      620F5CEE993BF7FCE7FCEEDC17462A372CA7D8EEDDC59AEE61622C22240EA427
      40D318CFABD798A06684A5BA76CDA7DB950CD3E3570049D6E288602464819C1E
      1E87FFA67B07C09CEBC174EE595B6A9BE200C999056998E01C7087F56B6E2308
      BD04717782E047608CA68233AA5F9F8FD096C5E5994A14013018B860ACFD7C82
      209CEC691240ED8C6B74DB9B221B2A2BD789FDFB27245CA6B5935B174818E901
      24099A68CF2B6E9CA66317C330C23F0420D8602DAA807ABD67841B3012B7F0B6
      3DCF87129D622D9E4190781EDCB99E342A785BDA46A8C93F013058D88310C978
      042E873B899E65CD5D7FA2613215847586E20B10BFB64F07677336E3619F036C
      B3144551587AE08A85E07AF22E5CC7F329BD5E0D044C43A4FD720BDC45502482
      5154699EE9B14F010C56D6F5C158286DA2864C3BCD98DBBD49FEBB5EFAD15128
      84764D3D2D247393B399743E0330580BE7C38CBFEFF20926C6D23C73D1DF24FF
      5D37B3201D048FBA75098E2EB51B1FF80880CD876A1F940F9A4E7A6C49496AB7
      1C007A86090DE91EF11AB9CF106CE76D46AB6F002CEC7388980A41E5F0AB37CA
      91FC8FC129BCD4B7AB9167BCCD3C537600CF8273824BC1BE99CCDB4D657202A4
      5858032C620E5CF17D53A4E6E773E4EF01328A26204A6A760711B284B39B6BE5
      0448CE6497C02970C3E54B223DBEEC486A8BAC00DB2DC7664B986A740751641E
      976B7E2827C04EEB716D2F1162DC0FC459C7E75B3A6405F0ECFFEEA42542CD2D
      B3A73D9213C05B0B00286D8300CE1E5A3A2B2C54C38685864C0CA229CDB73E12
      A2827BC4A0D12E3F8416DE5048F2EAFAE0851151929C5DCEDE575D5DBD46FD81
      9AA7BF04B898A35B39764CC4C9E8D9532221796586F417268812BADFF8A2F5CD
      DBF7299BF63B1C8300B88CD811A3C7691BE316CE9AE4BEA6F9A311826EDD7BD2
      F4AEA575CED623F73E0D00389FBB7CEFA2E8E9F911DA917E9A7D9FB5BDED90EE
      343C4DDF9CE5281C00506E5F5DB522366A354DF9D7D4F9D904514437EA1F5EDB
      90713D7E0040857D556D42A26EB1D2090EC52A2B6A6F265AAA7583003618D6AA
      02E0127F2500E09F00ABE2A25501505DD71000F04F80F8F81855005CBD5AFF9F
      2EE20080D2006B562C54054055CDDDFF7417523D80EAA790EA177100406900D5
      5F2554BF0B050094043897B36C475010BD4CE9E4866282203AF4D98E530300D4
      6AAA07F80A78BFF240CF4E6BFC0000000049454E44AE426082}
  end
  object ePass: TEdit
    Left = 88
    Top = 35
    Width = 150
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    OnKeyDown = ePassKeyDown
  end
  object bOK: TButton
    Left = 88
    Top = 65
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = bOKClick
  end
end
