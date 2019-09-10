{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TFormPeriodTrade                   }
{ ‘орма дл€ установки отчетного периода в модуле Trade  }
{                                                       }
{        ƒата изменени€: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormPeriodTrade;

interface

uses
  // sys
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Forms, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Mask,
  // ehlib
  DBCtrlsEh,
  // tms
  AdvCombo, ColCombo,
  // my
  uTypes,
  uUser;

type
  TFormPeriodTrade = class(TForm)
    lBegin: TLabel;
    Label4: TLabel;
    bOK: TButton;
    dtpDateBeg: TDateTimePicker;
    dtpDateEnd: TDateTimePicker;
    cbPeriodChecked: TCheckBox;
    eStorage: TDBEditEh;
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

procedure TFormPeriodTrade.FormCreate(Sender: TObject);
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
  ccbPeriod.ComboItems.Items[4].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmCurQuarter).DateBeg);
  ccbPeriod.ComboItems.Items[4].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmCurQuarter).DateEnd);
  ccbPeriod.ComboItems.Items[5].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmCurYear).DateBeg);
  ccbPeriod.ComboItems.Items[5].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmCurYear).DateEnd);
  ccbPeriod.ComboItems.Items[6].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmPreMonth).DateBeg);
  ccbPeriod.ComboItems.Items[6].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmPreMonth).DateEnd);
  ccbPeriod.ComboItems.Items[7].Strings.Strings[1] := DateToStr(User.PeriodByMode(pmPreYear).DateBeg);
  ccbPeriod.ComboItems.Items[7].Strings.Strings[2] := DateToStr(User.PeriodByMode(pmPreYear).DateEnd);

  //
  dtpDateBeg.Date         := User.Period.DateBeg;
  dtpDateEnd.Date         := User.Period.DateEnd;
  cbPeriodChecked.Checked := User.PeriodChecked;

  case User.PeriodMode of
    pmCurDay     : ccbPeriod.ItemIndex := 0;
    pmPreDay     : ccbPeriod.ItemIndex := 1;
    pmCurWeek    : ccbPeriod.ItemIndex := 2;
    pmCurMonth   : ccbPeriod.ItemIndex := 3;
    pmCurQuarter : ccbPeriod.ItemIndex := 4;
    pmCurYear    : ccbPeriod.ItemIndex := 5;
    pmPreMonth   : ccbPeriod.ItemIndex := 6;
    pmPreYear    : ccbPeriod.ItemIndex := 7;
    pmCustom     : ccbPeriod.ItemIndex := 8;
  end;

  ccbPeriod.OnSelect(Self);

end;

procedure TFormPeriodTrade.ccbPeriodSelect(Sender: TObject);
begin

  case ccbPeriod.ItemIndex of
    0 : PeriodMode := pmCurDay;     // текущий день
    1 : PeriodMode := pmPreDay;     // предыдущий день
    2 : PeriodMode := pmCurWeek;    // текуща€ недел€
    3 : PeriodMode := pmCurMonth;   // текущий мес€ц
    4 : PeriodMode := pmCurQuarter; // текущий квартал
    5 : PeriodMode := pmCurYear;    // текущий год
    6 : PeriodMode := pmPreMonth;   // предыдущий мес€ц
    7 : PeriodMode := pmPreYear;    // предыдущий год
    8 : PeriodMode := pmCustom;     // пользовательский
  end;

  if PeriodMode = pmCustom then Exit;

  dtpDateBeg.Date := User.PeriodByMode(PeriodMode).DateBeg;
  dtpDateEnd.Date := User.PeriodByMode(PeriodMode).DateEnd;

end;

procedure TFormPeriodTrade.dtpDateBegChange(Sender: TObject);
begin

  // авто простановка пользовательського периода
  if ccbPeriod.ItemIndex <> ccbPeriod.Items.Count - 1 then
  begin
    ccbPeriod.ItemIndex := ccbPeriod.Items.Count - 1;
    PeriodMode := pmCustom;
  end;

end;

procedure TFormPeriodTrade.bOKClick(Sender: TObject);
var
  Period: TPeriod;
begin

  User.PeriodMode    := PeriodMode;
  User.PeriodChecked := cbPeriodChecked.Checked;

  if PeriodMode = pmCustom then
  begin
    Period.DateBeg := dtpDateBeg.Date;
    Period.DateEnd := dtpDateEnd.Date;
    User.Period    := Period;
  end;

  User.SavePeriod(); // сохран€ем в бд

  ModalResult := mrOk;

end;

end.
