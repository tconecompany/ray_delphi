{*******************************************************}
{                                                       }
{                          Ray                          }
{                                                       }
{                        TMessage                       }
{                       Сообщения                       }
{                                                       }
{        Дата изменения: 21.08.2019 (Build 1.0.01)      }
{                                                       }
{        Copyright (c) 2019-2019 by Zaviruha A.         }
{                                                       }
{*******************************************************}

unit uMessage;

interface

type
  TMessage = class
  private
  public
  end;

var
  Message: TMessage;

implementation

initialization
  Message := TMessage.Create;

finalization
  Message.Free;
end.
