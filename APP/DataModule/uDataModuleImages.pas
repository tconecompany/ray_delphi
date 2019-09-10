{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                    TDataModuleImages                  }
{              Модуль-колекция изображений, иконок...   }
{                                                       }
{        Дата изменения: 29.07.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uDataModuleImages;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls;

{ TDataModuleImages }

type
  TDataModuleImages = class(TDataModule)
    ImageList: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleImages: TDataModuleImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

initialization
  DataModuleImages := TDataModuleImages.Create(nil);

end.
