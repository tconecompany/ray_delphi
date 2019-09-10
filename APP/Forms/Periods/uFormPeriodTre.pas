{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                     TFormPeriodTre                    }
{  Форма для установки отчетного периода в модуле Tre   }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormPeriodTre;

interface

uses
  // sys
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  // tms
  AdvCombo, ColCombo,
  // My
  uTypes,
  uUser;

type
  TFormPeriodTre = class(TForm)
    lBegin: TLabel;
    Label4: TLabel;
    bOK: TButton;
    dtpDateBeg: TDateTimePicker;
    dtpDateEnd: TDateTimePicker;
    cbPeriodChecked: TCheckBox;
    ccbPeriod: TColumnComboBox;
    procedure bOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpDateBegChange(Sender: TObject);
    procedure ccbPeriodSelect(Sender: TObject);
  private
    { Private declarations }
    PeriodMode: TPeriodMode;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormPeriodTre.FormCreate(Sender: TObject);
begin

  //
  ccbPeriod.ComboItems.Items[0].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmCurDay).DateBeg);
  ccbPeriod.ComboItems.Items[0].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmCurDay).DateEnd);
  ccbPeriod.ComboItems.Items[1].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmPreDay).DateBeg);
  ccbPeriod.ComboItems.Items[1].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmPreDay).DateEnd);
  ccbPeriod.ComboItems.Items[2].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmCurWeek).DateBeg);
  ccbPeriod.ComboItems.Items[2].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmCurWeek).DateEnd);
  ccbPeriod.ComboItems.Items[3].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmCurMonth).DateBeg);
  ccbPeriod.ComboItems.Items[3].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmCurMonth).DateEnd);

  //
  dtpDateBeg.Date         := User.Period.DateBeg;
  dtpDateEnd.Date         := User.Period.DateEnd;
  cbPeriodChecked.Checked := User.PeriodChecked;

  case User.PeriodMode of
    pmCurDay   : ccbPeriod.ItemIndex := 0;
    pmPreDay   : ccbPeriod.ItemIndex := 1;
    pmCurWeek  : ccbPeriod.ItemIndex := 2;
    pmCurMonth : ccbPeriod.ItemIndex := 3;
    pmCustom   : ccbPeriod.ItemIndex := 4;
  end;

  ccbPeriod.OnSelect(Self);

end;

procedure TFormPeriodTre.ccbPeriodSelect(Sender: TObject);
begin

  case ccbPeriod.ItemIndex of
    0 : PeriodMode := pmCurDay;   // текущий день
    1 : PeriodMode := pmPreDay;   // предыдущий день
    2 : PeriodMode := pmCurWeek;  // текущая неделя
    3 : PeriodMode := pmCurMonth; // текущий месяц
    4 : PeriodMode := pmCustom;   // пользовательский
  end;

  if PeriodMode = pmCustom then Exit;

  dtpDateBeg.Date := User.PeriodByMode(PeriodMode).DateBeg;
  dtpDateEnd.Date := User.PeriodByMode(PeriodMode).DateEnd;

end;

procedure TFormPeriodTre.dtpDateBegChange(Sender: TObject);
begin

  // авто простановка пользовательського периода
  if ccbPeriod.ItemIndex <> ccbPeriod.Items.Count - 1 then
  begin
    ccbPeriod.ItemIndex := ccbPeriod.Items.Count - 1;
    PeriodMode := pmCustom;
  end;

end;

procedure TFormPeriodTre.bOKClick(Sender: TObject);
var
  Period: TPeriod;
begin

  User.PeriodMode    := PeriodMode;
  User.PeriodChecked := cbPeriodChecked.Checked;

  if PeriodMode = pmCustom then
  begin
    Period.DateBeg := dtpDateBeg.Date;
    Period.DateEnd := dtpDateEnd.Date;
    User.Period := Period;
  end;

  User.SavePeriod(); // сохраняем в бд

  ModalResult := mrOk;

end;

end.

