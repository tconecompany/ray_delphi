program mconf;

uses
  Vcl.Forms,
  uDataModuleRay in 'DataModule\uDataModuleRay.pas' {DataModuleRay: TDataModule},
  uTypes in 'Units\uTypes.pas',
  uStrUtilsExt in 'Units\uStrUtilsExt.pas',
  uParams in 'Units\uParams.pas',
  uInit in 'Units\uInit.pas',
  uUser in 'Units\uUser.pas',
  uDataModuleImages in 'DataModule\uDataModuleImages.pas' {DataModuleImages: TDataModule},
  uFormMainMConf in 'uFormMainMConf.pas' {FormMainMConf},
  uFormDebug in 'Forms\Dialogs\uFormDebug.pas' {FormDebug};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainMConf, FormMainMConf);
  Application.Run;

end.
