program updater64;

uses
  Vcl.Forms,
  System.SysUtils,
  uParams in 'Units\uParams.pas',
  uStrUtilsExt in 'Units\uStrUtilsExt.pas',
  uConst in 'Units\uConst.pas',
  uTypes in 'Units\uTypes.pas',
  uFormMainUpdater in 'uFormMainUpdater.pas' {FormMainUpdater};

{$R *.res}

begin

  // ручной запуск updater.exe
  if ExtractFileName(Application.ExeName) = 'updater.exe' then
    Params.RunUpdater;

  // начинаем обновление только через подмену файла на tmp_updater.exe
  if ExtractFileName(Application.ExeName) <> 'tmp_updater.exe' then
    Exit;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainUpdater, FormMainUpdater);
  Application.Run;

end.
