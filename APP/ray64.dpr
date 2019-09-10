program ray64;

uses
  Vcl.Forms,
  System.SysUtils,
  uRegisterClasses in 'Units\uRegisterClasses.pas',
  uTypes in 'Units\uTypes.pas',
  uConst in 'Units\uConst.pas',
  uStrUtilsExt in 'Units\uStrUtilsExt.pas',
  uInit in 'Units\uInit.pas',
  uParams in 'Units\uParams.pas',
  uUser in 'Units\uUser.pas',
  uRegForms in 'Units\uRegForms.pas',
  uRepository in 'Units\uRepository.pas',
  uMenuXML in 'Units\uMenuXML.pas',
  uShortCut in 'Units\uShortCut.pas',
  uMessage in 'Units\uMessage.pas',
  uConductor in 'Units\Conductor\uConductor.pas',
  uConductorOverAll in 'Units\Conductor\uConductorOverAll.pas',
  uTradeDoc in 'Units\Trade\uTradeDoc.pas',
  uNumberInWords in 'Units\uNumberInWords.pas',
  uEnvVariables in 'Units\uEnvVariables.pas',
  uDataModuleRay in 'DataModule\uDataModuleRay.pas' {DataModuleRay: TDataModule},
  uDataModuleRBI in 'DataModule\uDataModuleRBI.pas' {DataModuleRBI: TDataModule},
  uDataModuleTrade in 'DataModule\uDataModuleTrade.pas' {DataModuleTrade: TDataModule},
  uDataModuleTre in 'DataModule\uDataModuleTre.pas' {DataModuleTre: TDataModule},
  uDataModuleFin in 'DataModule\uDataModuleFin.pas' {DataModuleFin: TDataModule},
  uFormMain in 'uFormMain.pas' {FormMain},
  uFormSplash in 'Forms\uFormSplash.pas' {FormSplash},
  uFormRegistration in 'Forms\uFormRegistration.pas' {FormRegistration},
  uFormChangePass in 'Forms\uFormChangePass.pas' {FormChangePass},
  uFormUnLock in 'Forms\uFormUnLock.pas' {FormUnLock},
  uFormUserSettings in 'Forms\uFormUserSettings.pas' {FormUserSettings},
  uFormList in 'Forms\List\uFormList.pas' {FormList},
  uFormPick in 'Forms\List\uFormPick.pas' {FormPick},
  uFormPeriodTrade in 'Forms\Periods\uFormPeriodTrade.pas' {FormPeriodTrade},
  uFormPeriodTre in 'Forms\Periods\uFormPeriodTre.pas' {FormPeriodTre},
  uFormDebug in 'Forms\Dialogs\uFormDebug.pas' {FormDebug},
  uFormQuickSearch in 'Forms\Dialogs\uFormQuickSearch.pas' {FormQuickSearch},
  uFormRayUser in 'Forms\Ray\uFormRayUser.pas' {FormRayUser},
  uFormTradeInvoice in 'Forms\Trade\uFormTradeInvoice.pas' {FormTradeInvoice},
  uFormTradeSalesInvoice in 'Forms\Trade\uFormTradeSalesInvoice.pas' {FormTradeSalesInvoice},
  uFormTradePaymentRequest in 'Forms\Trade\uFormTradePaymentRequest.pas' {FormTradePaymentRequest},
  uFormTradeRozetkaXML in 'Forms\Trade\uFormTradeRozetkaXML.pas' {FormTradeRozetkaXML},
  uFormTreAccount in 'Forms\Tre\uFormTreAccount.pas' {FormTreAccount},
  uFormReading in 'Forms\List\uFormReading.pas' {FormReading},
  uFormTrePayDoc in 'Forms\Tre\uFormTrePayDoc.pas' {FormTrePayDoc},
  uFormTreAccountNav in 'Forms\Tre\uFormTreAccountNav.pas' {FormTreAccountNav},
  uFormTreBudgPay in 'Forms\Tre\uFormTreBudgPay.pas' {FormTreBudgPay},
  uFrameTitle in 'Frames\uFrameTitle.pas' {FrameTitle: TFrame},
  uFrameCUUser in 'Frames\uFrameCUUser.pas' {FrameCUUser: TFrame},
  uFrameTradeDoc in 'Frames\Trade\uFrameTradeDoc.pas' {FrameTradeDoc: TFrame},
  uFrameSmartNav in 'Frames\uFrameSmartNav.pas' {FrameSmartNav: TFrame},
  uFormTreAccountStatement in 'Forms\Tre\uFormTreAccountStatement.pas' {FormTreAccountStatement},
  uAssembly in 'Units\uAssembly.pas',
  uDataModuleImages in 'DataModule\uDataModuleImages.pas' {DataModuleImages: TDataModule};

{$R *.res}

var
  FormSplash: TFormSplash;

begin

  // проверяем обновления
  Params.RunUpdater;

  // форма заставка
  FormSplash := TFormSplash.Create(nil);
  FormSplash.Show;

  // регистрация
  if not ExecRegistration() then
  begin
    FormSplash.Destroy;
    Exit;  { TODO : сделать легальный выход }
  end;

  // активация справочников (временно)
  FormSplash.Status('Загрузка справочников...');

  DataModuleRay.ActivateDataSets;
  DataModuleRBI.ActivateDataSets;
  DataModuleTrade.ActivateDataSets;
  DataModuleTre.ActivateDataSets;

  // количество допустимых окон/сессий для пользователя
  RegForms.LimitChildWindows := User.Settings.QNTSession;

  // убираем форму-заставку
  FormSplash.Destroy;

  // запуск приложения
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.

