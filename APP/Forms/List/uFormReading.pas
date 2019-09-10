{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                       TFormReading                    }
{               Навигационная форма для списка          }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uFormReading;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  // my
  uRepository;

type
  TFormReading = class(TForm)
    Panel: TPanel;
    bOK: TButton;
    bCancel: TButton;
    ListBox: TListBox;
    procedure PanelClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }

    FRecReading: TRecReading;

    constructor Create(ARecReading: TRecReading);

  public
    { Public declarations }
  end;

{ ExecReading }

procedure ExecReading(ARecReading: TRecReading);

implementation

{$R *.dfm}

uses
  // my
  uStrUtilsExt,
  uTypes,
  uRegForms;

{ ExecReading }

procedure ExecReading(ARecReading: TRecReading);
var
  FormReading: TFormReading;
begin

  FormReading := TFormReading.Create(ARecReading);
  FormReading.ShowModal;
  FormReading.Release;

end;

{ TFormReading }

constructor TFormReading.Create(ARecReading: TRecReading);
var
  i: integer;
begin

  inherited Create(nil);

  FRecReading := ARecReading;

  Caption:= ARecReading.Caption;

  for i := 0 to High(ARecReading.Items) do
    ListBox.Items.Add(ARecReading.Items[i].Caption);

  ListBox.ItemIndex := 0;

end;

procedure TFormReading.bOKClick(Sender: TObject);
begin

  if FRecReading.Items[ListBox.ItemIndex].ID > 0 then
    case FRecReading.Items[ListBox.ItemIndex].ShowMode of
      smChild : Repository.Exec(FRecReading.Items[ListBox.ItemIndex].ID, DynParamsToStr(FRecReading.Items[ListBox.ItemIndex].Params));
      smModal : Repository.ExecModal(FRecReading.Items[ListBox.ItemIndex].ID, DynParamsToStr(FRecReading.Items[ListBox.ItemIndex].Params));
    end
  else if FRecReading.Items[ListBox.ItemIndex].Signature <> '' then
    case FRecReading.Items[ListBox.ItemIndex].ShowMode of
      smChild : RegForms.ShowChild(FRecReading.Items[ListBox.ItemIndex].Signature,
                                   FRecReading.Items[ListBox.ItemIndex].ID,
                                   DynParamsToStr(FRecReading.Items[ListBox.ItemIndex].Params));
      smModal : RegForms.ShowModal(FRecReading.Items[ListBox.ItemIndex].Signature,
                                   FRecReading.Items[ListBox.ItemIndex].ID,
                                   DynParamsToStr(FRecReading.Items[ListBox.ItemIndex].Params))
    end;

  ModalResult := mrOk;

end;

procedure TFormReading.PanelClick(Sender: TObject);
begin
  //ShowMessage(DynParamsToStr(FRecReading.Items[ListBox.ItemIndex].Params));
end;

end.

