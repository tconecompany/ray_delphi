program keymaker;

uses
  Vcl.Forms,
  uTypes in 'Units\uTypes.pas',
  uStrUtilsExt in 'Units\uStrUtilsExt.pas',
  uParams in 'Units\uParams.pas',
  uConst in 'Units\uConst.pas',
  uDataModuleRay in 'DataModule\uDataModuleRay.pas' {DataModuleRay: TDataModuleRay},
  uFormMainKeymaker in 'uFormMainKeymaker.pas' {FormMainKeymaker},
  uFormSectionAdd in 'Forms\uFormSectionAdd.pas' {FormSectionAdd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainKeymaker, FormMainKeymaker);
  Application.Run;
end.

