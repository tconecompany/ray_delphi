{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFormTradeInvoice                    }
{                   ‘орма счет-фактуры                  }
{                                                       }
{        ƒата изменени€: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormTradeInvoice;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList,
  Vcl.ActnMan, Vcl.StdCtrls, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.ActnPopup,
  // odac
  OraSmart, Ora, Data.DB, MemDS, DBAccess,
  // my
  uConst,
  uTradeDoc,
  uFrameTradeDoc,
  uFrameCUUser;

{ TFormTradeInvoice }

type
  TFormTradeInvoice = class(TForm)
    Frame: TFrameTradeDoc;
    ActionManager: TActionManager;
    procedure FormCreate(Sender: TObject);
    procedure FramedsDOCDataChange(Sender: TObject; Field: TField);
    procedure FramefDateDocChange(Sender: TObject);
    procedure FrameActionSaveExecute(Sender: TObject);
    procedure FrameActionPrintExecute(Sender: TObject);
    procedure FrameActionCloseExecute(Sender: TObject);
  private
    { Private declarations }

    TRDoc: TTRDoc;                                                              // обьект документ

    procedure WMFormPrint(var Message: TMessage); message WM_FORM_PRINT;        // печать
    procedure ChangeDBFields(Modified: boolean);                                // пользователь тронул/модифицировал данные. обновл€ютс€ заголовки
    procedure WMDBPost(var Message: TMessage); message WM_DB_POST;              // сохранение в Ѕƒ

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uUser,
  uRepository;

{ TFormTRInvoice }

procedure TFormTradeInvoice.WMFormPrint(var Message: TMessage);
begin
  Frame.ActionPrint.Execute();
end;

procedure TFormTradeInvoice.WMDBPost(var Message: TMessage);
begin
  TRDoc.Save(User.ID);
end;

procedure TFormTradeInvoice.FormCreate(Sender: TObject);
begin

  //
//  TRDoc := TTRDoc.Create(Frame.tDOC, Repository.ConfForm.Param);

  Frame.tDOC.Open;

  // определ€ем режим документа чтение/создание по параментам
  if TRDoc.ParamDocID = 0 then
    TRDoc.New()
  else
    TRDoc.Read();

end;

procedure TFormTradeInvoice.ChangeDBFields(Modified: boolean);
begin

  // заголовок формы
  Caption := TRDoc.GetTitle(Frame.tDOC.FieldByName('num_doc').AsInteger,
                            Frame.tDOC.FieldByName('date_doc').AsDateTime,
                            Modified);

  // заголовок формы с маркером изменений
  Frame.FrameTitle.lTitle.Caption := Caption;

  // кнопка сохранить по состо€нию таблицы
  Frame.ActionSave.Enabled := Modified;

end;

procedure TFormTradeInvoice.FrameActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormTradeInvoice.FrameActionPrintExecute(Sender: TObject);
begin
  Frame.ActionPrintExecute(Sender);
end;

procedure TFormTradeInvoice.FrameActionSaveExecute(Sender: TObject);
begin
  TRDoc.SaveEd(User.ID);
end;

procedure TFormTradeInvoice.FramedsDOCDataChange(Sender: TObject; Field: TField);
begin
  ChangeDBFields(Frame.tDOC.Modified);
end;

procedure TFormTradeInvoice.FramefDateDocChange(Sender: TObject);
begin
  ChangeDBFields(True);
end;

end.
