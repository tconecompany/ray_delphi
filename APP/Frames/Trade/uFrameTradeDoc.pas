{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFrameTradeDoc                    }
{            Базовый фрейм для документов Trade         }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

{
  Описание:
    Подходит:
      - счет-фактур;
      - требований на платеж;
      - расходных документов;
}

unit uFrameTradeDoc;

interface

uses
  // sys
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.Actions,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ExtCtrls,
  Vcl.ActnList,
  // ehlib
  DBCtrlsEh, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEhGrouping,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  // odac
  OraSmart, Ora, MemDS, Data.DB, DBAccess, OraCall,
  // my
  uFrameTitle,
  uFrameCUUser;

type
  TFrameTradeDoc = class(TFrame)
    lNumDoc: TLabel;
    lNumDocFrom: TLabel;
    lSourceDoc: TLabel;
    lFirm: TLabel;
    lDepartament: TLabel;
    lSender: TLabel;
    lRecipient: TLabel;
    lPrice: TLabel;
    lComment: TLabel;
    lDayReserve: TLabel;
    lEvent: TLabel;
    lDealType: TLabel;
    lResultDoc: TLabel;
    lBlockDoc: TLabel;
    fNumDoc: TDBEditEh;
    fDateDoc: TDBDateTimeEditEh;
    fSourceDoc: TDBEditEh;
    fFirm: TDBComboBoxEh;
    fFirmaCheck: TDBCheckBoxEh;
    fDepartament: TDBComboBoxEh;
    fSender: TDBComboBoxEh;
    fRecipient: TDBComboBoxEh;
    fPrice: TDBComboBoxEh;
    fCountDayReserve: TDBNumberEditEh;
    fResultDoc: TDBEditEh;
    fEvent: TDBComboBoxEh;
    fDealType: TDBComboBoxEh;
    fStatus: TDBEditEh;
    ImageList: TImageList;
    tDOC: TOraTable;
    dsDOC: TOraDataSource;
    pmGridIndicator: TPopupMenu;
    PageControl: TPageControl;
    tsGoods: TTabSheet;
    Grid: TDBGridEh;
    pGridTop: TPanel;
    atbGridRight: TActionToolBar;
    atbGrid: TActionToolBar;
    ActionList: TActionList;
    ActionAccounting: TAction;
    ActionSave: TAction;
    ActionProducts: TAction;
    ActionDiscount: TAction;
    ActionPrint: TAction;
    ActionHelp: TAction;
    ActionGridAllActions: TAction;
    ActionGridAppend: TAction;
    ActionGridDelete: TAction;
    ActionPaste: TAction;
    ActionCopy: TAction;
    Action1: TAction;
    Action2: TAction;
    ActionClose: TAction;
    fComm: TDBMemoEh;
    tDOC_GOODS: TOraTable;
    dsDOC_GOODS: TOraDataSource;
    N11: TMenuItem;
    ActionGridActionsExpToExcel: TAction;
    ActionGridActionsImpFromExcel: TAction;
    GridSummary: TDBGridEh;
    tDOC_GOODSDOC_ID: TFloatField;
    tDOC_GOODSVENDOR_CODE: TFloatField;
    tDOC_GOODSQNT: TFloatField;
    tDOC_GOODSPRICE_M_VAT: TFloatField;
    tDOC_GOODSSUM_M_VAT: TFloatField;
    tDOC_GOODSDISCOUNT: TFloatField;
    ActionDebug: TAction;
    tDOCDOC_ID: TFloatField;
    tDOCDOC_TYPE_ID: TFloatField;
    tDOCSTATUS_ID: TIntegerField;
    tDOCNUM_DOC: TFloatField;
    tDOCDATE_DOC: TDateTimeField;
    tDOCYEAR: TIntegerField;
    tDOCCREATE_USER_ID: TFloatField;
    tDOCCREATE_DATE: TDateTimeField;
    tDOCUPDATE_USER_ID: TFloatField;
    tDOCUPDATE_DATE: TDateTimeField;
    tDOCLINK_ID: TFloatField;
    tDOCLINK_SOURCE_ID: TFloatField;
    tDOCLINK_RESULT_ID: TFloatField;
    tDOCFIRM_ID: TFloatField;
    tDOCDEPARTAMENT_ID: TFloatField;
    tDOCSENDER_ID: TFloatField;
    tDOCRECIPIENT_ID: TFloatField;
    tDOCPRICE_ID: TFloatField;
    tDOCEVENT_ID: TFloatField;
    tDOCDEAL_TYPE_ID: TFloatField;
    tDOCCOUNT_DAY_RESERVE: TIntegerField;
    tDOCSIGN_FIRM_REG: TBooleanField;
    tDOCSIGN_DOC_BLOCK: TBooleanField;
    tDOCSIGN_PRICES_PROTECTION: TBooleanField;
    tDOCSUMMARY_QNT: TFloatField;
    tDOCSUMMARY_PRICE: TFloatField;
    tDOCSUMMARY_VAT20: TFloatField;
    tDOCSUMMARY_TOTAL: TFloatField;
    OraSession: TOraSession;
    ActionAllActions: TAction;
    TabSheet1: TTabSheet;
    tDOCL_CREATE_USER: TStringField;
    tDOCL_UPDATE_USER: TStringField;
    tDOCCOMM: TStringField;
    tDOCL_STATUS: TStringField;
    FrameTitle: TFrameTitle;
    lStatus: TLabel;
    FrameCUUser: TFrameCUUser;
    fSignPriceViewBlock: TDBCheckBoxEh;
    fSignDocBlock: TDBCheckBoxEh;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionDebugExecute(Sender: TObject);
    procedure ActionAllActionsExecute(Sender: TObject);
    procedure ActionGridAllActionsExecute(Sender: TObject);
    procedure ActionHelpExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure dsDOCStateChange(Sender: TObject);
  private
    { Private declarations }
    constructor Create(AOwner: TComponent); override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  // sys
  System.StrUtils,
  // my
  uDataModuleRay,
  uUser,
  uFormDebug;

{ TFrameTCDoc }

constructor TFrameTradeDoc.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);

  // создаем сессию
  DataModuleRay.SetSession(OraSession, 'trade', 'tr', User.ID);

end;

procedure TFrameTradeDoc.dsDOCStateChange(Sender: TObject);
begin
{  FrameCUUser.fCreateUserID.Visible   := IfThen(FrameCUUser.fCreateUserID.Text <> '', 'True', 'False').ToBoolean();
  FrameCUUser.fCreateUserDate.Visible := IfThen(FrameCUUser.fCreateUserID.Text <> '', 'True', 'False').ToBoolean();
  FrameCUUser.fUpdateUserID.Visible   := IfThen(FrameCUUser.fUpdateUserID.Text <> '', 'True', 'False').ToBoolean();
  FrameCUUser.fUpdateUserDate.Visible := IfThen(FrameCUUser.fUpdateUserID.Text <> '', 'True', 'False').ToBoolean();   }
end;

procedure TFrameTradeDoc.ActionCloseExecute(Sender: TObject);
begin
  //TForm(TAction(Sender).Owner.Owner).Close;
end;

procedure TFrameTradeDoc.ActionDebugExecute(Sender: TObject);
var
  StringList: TStringList;
begin

  StringList := TStringList.Create;
  StringList.Add('doc_id: ' + tDOC.FieldByName('doc_id').AsString);
  StringList.Add('link_id: ' + tDOC.FieldByName('link_id').AsString);
  StringList.Add('link_source_id: ' + tDOC.FieldByName('link_source_id').AsString);
  StringList.Add('link_result_id: ' + tDOC.FieldByName('link_result_id').AsString);

  // показываем форму отладки
  ShowDebug('Отладочная информация', 'Лог', StringList.Text);

  StringList.Free;

end;

procedure TFrameTradeDoc.ActionAllActionsExecute(Sender: TObject);
begin
// включить пункт Все действия
end;

procedure TFrameTradeDoc.ActionGridAllActionsExecute(Sender: TObject);
begin
// включить пункт Все действия
end;

procedure TFrameTradeDoc.ActionHelpExecute(Sender: TObject);
begin
//
end;

procedure TFrameTradeDoc.ActionPrintExecute(Sender: TObject);
begin
  ShowMessage('Print');
end;

end.

