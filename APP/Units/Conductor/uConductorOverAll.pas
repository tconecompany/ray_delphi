{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                   TConductorOverAll                   }
{     Кондуктор ввода и чтения записей БД в таблице     }
{                                                       }
{        Дата изменения: 05.09.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uConductorOverAll;

interface

uses
  // sys
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  // odac
  Ora,
  OraSmart,
  // my
  uConductor,
  uTypes;

{ TConductorOverAll }

type
  TConductorOverAll = class(TConductor)
    private

      FForm            : TForm;
      FTitleLabel      : TLabel;
      FTitleCapInitial : string;
      FTitleField      : string;
      FTitlePrefix     : char;
      FDateOfOperField : string;
      FMarkerDateTitle : boolean;

      procedure SetTitleField(TitleField: string);
      procedure SetTitlePrefix(TitlePrefix: char);

    public

      constructor Create(AForm       : TForm;                                   // форма связи
                         ATable      : TOraTable;                               // таблица
                         ADataSource : TOraDataSource;                          // датасет
                         Param       : string;                                  // параметры формы
                         ATitle      : TLabel);                                 // заголовок формы

      procedure RefleshTitle;                                                   // обновить заголовок

      procedure Append; override;                                               // добавить
      procedure Read; override;
      procedure Edit; override;                                                 // перевести в режим редактирование

      property TitleField: string write SetTitleField;                          // имя поля номер/счет/идентивикатор записи
      property TitlePrefix: char write SetTitlePrefix;                          //
      property MarkerDateTitle: boolean write FMarkerDateTitle;                 // включать дату в заголовок
      property DateOfOperField: string write FDateOfOperField;                  // имя поля которое отвечает за дату документа/операции

  end;

implementation

uses
  // sys
  SysUtils,
  Vcl.Graphics,
  // my
  uStrUtilsExt,
  uConst;

{ TConductorOverAll }

constructor TConductorOverAll.Create(AForm       : TForm;
                                     ATable      : TOraTable;
                                     ADataSource : TOraDataSource;
                                     Param       : string;
                                     ATitle      : TLabel);
begin

  FForm            := AForm;
  FTitleLabel      := ATitle;
  FTitleCapInitial := ATitle.Caption;
  FTitlePrefix     := '№';
  MarkerDateTitle  := False;

  inherited Create(ATable, ADataSource, Param);

end;

procedure TConductorOverAll.RefleshTitle;
var
  s: string;
begin

  s := FTitleCapInitial;

  // ставим маркер * при редактировании или создании
  if Editing then
    s := '*' + s;

  // дописываем номер
  if     (Mode <> cmAppend)
     and (FTitleField <> '')
  then
    case FTitlePrefix of
      '№' : s := s + ' № ' + FTable.FieldByName(FTitleField).AsString;
      '"' : s := s + ' "' + FTable.FieldByName(FTitleField).AsString + '"';
    end;

  // дописываем дату
  if FMarkerDateTitle then
    if FDateOfOperField <> '' then
      s := FTitleCapInitial  + ' от ' + FTable.FieldByName(FDateOfOperField).AsString
    else
      s := FTitleCapInitial  + ' от ' + DateToStr(Date);

  // дописываем приставку "создается/редактируется"
  case Mode of
    cmAppend : s := s + ' (создается)';
    cmEdit   : s := s + ' (редактируется)';
  end;

  //
  FForm.Caption       := s;
  FTitleLabel.Caption := s;

  // подписываем вкладку на форме и меняем иконку
  Application.MainForm.Perform(WM_MAIN_MDI_CHILD, 0, 2);

end;

procedure TConductorOverAll.Append;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_new.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.Read;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_read.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.Edit;
begin

  inherited;

  FForm.Icon.LoadFromFile('img\doc_edit.ico');

  RefleshTitle();

end;

procedure TConductorOverAll.SetTitleField(TitleField: string);
begin

  FTitleField := TitleField;

  RefleshTitle();

end;


procedure TConductorOverAll.SetTitlePrefix(TitlePrefix: char);
begin

  FTitlePrefix := TitlePrefix;

  RefleshTitle();

end;

end.

