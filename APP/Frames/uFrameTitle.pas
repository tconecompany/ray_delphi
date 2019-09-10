{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                      TFrameTitle                      }
{              Фрейм быстрого заголовка                 }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFrameTitle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.StdCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

{ TFrameTitle }

type
  TFrameTitle = class(TFrame)
    lTitle: TLabel;
    bButton: TBitBtn;
    atbMain: TActionToolBar;
    atbRight: TActionToolBar;
    ActionList: TActionList;
    ActionRecPost: TAction;
    ActionRecEdit: TAction;
    ActionRecCancel: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uDataModuleImages;

end.
