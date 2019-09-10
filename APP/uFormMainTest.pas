unit uFormMainTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMainTest = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainTest: TFormMainTest;

implementation

{$R *.dfm}

uses
  uStrUtilsExt, uTypes;

procedure TFormMainTest.Button1Click(Sender: TObject);
var
  dp: TDynParams;
begin


  showmessage(ReplaceDynParamValuesInStr('‘ормирование платежных документов по счету :pAccount :pAccountName'));

end;

end.
