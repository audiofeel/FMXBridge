
unit FMXBridge.Localize;

interface

uses
  System.SysUtils, FMX.Types;

procedure ConfigureContextMenuLanguage(const ALang: WideString);

implementation

var
  FContextMenuLanguage: WideString;
  FOriginalTranslateProc: TCustomTranslateProc;
  FTranslateInstalled: Boolean;

function IsRussianLanguage(const Lang: WideString): Boolean;
begin
  Result :=
    SameText(Lang, 'ru') or
    SameText(Lang, 'rus') or
    SameText(Lang, 'russian') or
    SameText(Lang, 'ru-RU');
end;

function FMXBridgeTranslate(const AText: string): string;
begin
  if Assigned(FOriginalTranslateProc) then
  begin
    Result := FOriginalTranslateProc(AText);
    if Result <> '' then
      Exit;
  end;

  if IsRussianLanguage(FContextMenuLanguage) then
  begin
    if SameText(AText, 'Undo') then
      Exit('Отменить');

    if SameText(AText, 'Redo') then
      Exit('Повторить');

    if SameText(AText, 'Copy') then
      Exit('Копировать');

    if SameText(AText, 'Cut') then
      Exit('Вырезать');

    if SameText(AText, 'Paste') then
      Exit('Вставить');

    if SameText(AText, 'Delete') then
      Exit('Удалить');

    if SameText(AText, 'Select All') then
      Exit('Выделить всё');
  end;

  Result := '';
end;

procedure ConfigureContextMenuLanguage(const ALang: WideString);
begin
  FContextMenuLanguage := ALang;

  if not FTranslateInstalled then
  begin
    FOriginalTranslateProc := CustomTranslateProc;

    CustomTranslateProc := FMXBridgeTranslate;

    FTranslateInstalled := True;
  end;
end;

end.
