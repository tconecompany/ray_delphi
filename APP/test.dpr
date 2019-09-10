program test;

uses
  Vcl.Forms,
  uFormMainTest in 'uFormMainTest.pas' {FormMainTest},
  uStrUtilsExt in 'Units\uStrUtilsExt.pas',
  uTypes in 'Units\uTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMainTest, FormMainTest);
  Application.Run;
end.
