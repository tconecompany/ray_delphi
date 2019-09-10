object FrameCUUser: TFrameCUUser
  Left = 0
  Top = 0
  Width = 280
  Height = 48
  Anchors = [akLeft, akBottom]
  TabOrder = 0
  object lCreateUserID: TLabel
    Left = 0
    Top = 3
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #1057#1086#1079#1076#1072#1083':'
    Visible = False
  end
  object lUpdateUserID: TLabel
    Left = 0
    Top = 29
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #1048#1079#1084#1077#1085#1080#1083':'
    Visible = False
  end
  object fCreateUserDate: TDBText
    Left = 178
    Top = 3
    Width = 101
    Height = 17
  end
  object fUpdateUserDate: TDBText
    Left = 178
    Top = 29
    Width = 101
    Height = 17
  end
  object fCreateUserID: TDBEditEh
    Left = 52
    Top = 0
    Width = 120
    Height = 21
    Color = clBtnFace
    DataField = 'L_CREATE_USER'
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    ReadOnly = True
    TabOrder = 0
    Visible = False
  end
  object fUpdateUserID: TDBEditEh
    Left = 52
    Top = 26
    Width = 120
    Height = 21
    Color = clBtnFace
    DataField = 'L_UPDATE_USER'
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
      end>
    ReadOnly = True
    TabOrder = 1
    Visible = False
  end
end
