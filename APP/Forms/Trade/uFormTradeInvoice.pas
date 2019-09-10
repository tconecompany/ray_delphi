{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFormTradeInvoice                    }
{                   ����� ����-�������                  }
{                                                       }
{        ���� ���������: 29.07.2019 (Build 1.0.01)      }
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

    TRDoc: TTRDoc;                                                              // ������ ��������

    procedure WMFormPrint(var Message: TMessage); message WM_FORM_PRINT;        // ������
    procedure ChangeDBFields(Modified: boolean);                                // ������������ ������/������������� ������. ����������� ���������
    procedure WMDBPost(var Message: TMessage); message WM_DB_POST;              // ���������� � ��

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

  // ���������� ����� ��������� ������/�������� �� ����������
  if TRDoc.ParamDocID = 0 then
    TRDoc.New()
  else
    TRDoc.Read();

end;

procedure TFormTradeInvoice.ChangeDBFields(Modified: boolean);
begin

  // ��������� �����
  Caption := TRDoc.GetTitle(Frame.tDOC.FieldByName('num_doc').AsInteger,
                            Frame.tDOC.FieldByName('date_doc').AsDateTime,
                            Modified);

  // ��������� ����� � �������� ���������
  Frame.FrameTitle.lTitle.Caption := Caption;

  // ������ ��������� �� ��������� �������
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
