{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    uRegisterClasses                   }
{         Регистрация сигнатурных форм вызова           }
{                                                       }
{        Дата изменения: 17.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uRegisterClasses;

interface

implementation

uses
  // sys
  System.Classes,

  // periods
  uFormPeriodTrade,
  uFormPeriodTre,

  // list
  uFormList,

  // admin
  uFormRayUser,

  // trade
  uFormTradeInvoice,
  uFormTradePaymentRequest,
  uFormTradeSalesInvoice,
  uFormTradeRozetkaXML,

  // tre
  uFormTreAccount,
  uFormTrePayDoc,
  uFormTreAccountStatement,
  uFormTreAccountNav,
  uFormTreBudgPay;

initialization

  // period
  RegisterClasses([TFormPeriodTrade,
                   TFormPeriodTre]);

  // list
  RegisterClasses([TFormList]);

  // ddf
  // резерв

  // admin
  RegisterClasses([TFormRayUser]);

  // trade
  RegisterClasses([TFormTradeInvoice,
                   TFormTradePaymentRequest,
                   TFormTradeSalesInvoice,
                   TFormTradeRozetkaXML]);

  // tre
  RegisterClasses([TFormTreAccount,
                   TFormTrePayDoc,
                   TFormTreAccountStatement,
                   TFormTreAccountNav,
                   TFormTreBudgPay]);

end.
