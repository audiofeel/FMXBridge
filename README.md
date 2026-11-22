# FMXBridge

**FMXBridge — это проект DLL на Delphi, предоставляющий приложениям Windows доступ к формам, элементам управления, графике, эффектам и вспомогательным возможностям FireMonkey (FMX).** Проект в первую очередь предназначен для использования FMX-интерфейса из Inno Setup через интерфейс Pascal Script, без необходимости отдельно устанавливать каждый компонент в IDE.

Репозиторий содержит обе стороны интеграции:

- `FMXBridge.dpr` и Pascal-модули, из которых собирается DLL.
- [`FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) — подключаемый файл Inno Setup с соответствующими объявлениями интерфейсов Pascal Script, импортируемых функций, типов, констант и вспомогательных процедур.

## Возможности

Исходный код включает:

- **Формы и интеграция с Windows** — основные формы, формы сообщений, пользовательские элементы заголовка окна и вспомогательные средства для работы с окнами.
- **DWM и оформление окон** — эффекты фона, размытие, тёмный режим, цвет границ и скруглённые углы.
- **Стандартные и дополнительные элементы управления FMX** — кнопки, надписи, поля ввода, флажки, переключатели, панели, списки, деревья, меню, индикаторы выполнения, счётчики, элементы управления страницами и многое другое.
- **Анимация, эффекты и переходы** — анимация свойств, эффекты FMX и эффекты переходов.
- **Двухмерная и трёхмерная графика** — фигуры, текст, области просмотра, камеры, источники света, модели и источники материалов.
- **Работа с изображениями, документами и звуком** — SVG, GIF, WebP, собственный FMX-просмотрщик RTF-документов и дополнительная поддержка воспроизведения MP3.
- **Вспомогательные средства** — информация о накопителях и системе, таймеры, секундомер, загрузка данных по сети, диалоги и функции для работы с мультимедиа.
- **Уведомления Windows** — Toast-уведомления, отправляемые текущим процессом Inno Setup через Windows Runtime.
- **Дополнительные интеграции** — поддержка MP3 на основе FMXAudioLib, обёртки для Skia4Delphi и RadiantShapes.

Pascal-модули и [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) являются основными источниками информации о доступных интерфейсах, сигнатурах методов, типах параметров, идентификаторах интерфейсов и экспортируемых именах.

## Собственный RTF Viewer

FMXBridge включает собственный просмотрщик RTF-документов, реализованный на Delphi и FireMonkey. Движок поддерживает форматирование текста и абзацев, списки Word/WordPad, многоячеечные таблицы, гиперссылки, перенос длинных слов и URL, изображения DIB/WMF/EMF, выделение текста мышью и копирование в буфер обмена.

Исходный код движка находится в [`Custom/RTFViewer/`](Custom/RTFViewer/): парсер, модель документа, обработка изображений и FMX-представление разделены на отдельные модули. Inno Setup wrapper расположен в [`Custom/FMXBridge.RTFViewer.pas`](Custom/FMXBridge.RTFViewer.pas). Пример использования — [`Examples/Example_RTFViewer.iss`](Examples/Example_RTFViewer.iss).

## Примеры

FMXBridge включает **68 демонстрационных скриптов Inno Setup**, показывающих, как использовать формы FireMonkey, элементы управления, графику, анимацию и возможности интеграции с Windows из Pascal Script.

### Примеры FMXBridge

В каталоге [`Examples/`](Examples/) находятся 54 демонстрационных примера:

- **Формы и навигация** — [управление страницами (Page Control)](Examples/Example_PageControl.iss), [вкладки (Tab Controls)](Examples/Example_TabControls.iss), [форма деинсталлятора](Examples/Example_UninstallForm.iss).
- **Оформление окон и эффекты** — [размытый прямоугольник (Blur Rectangle)](Examples/Example_BlurRectangle.iss), [стеклянный прямоугольник (Glass Rectangle)](Examples/Example_GlassRectangle.iss) и [изменение цветов оформления](Examples/Example_ChangeStyleColor.iss).
- **Пользовательские элементы управления и анимация** — [эффекты PicShow](Examples/Example_PicShow.iss), [индикаторы (Spinners)](Examples/Example_Spinners.iss), [спрайтовые элементы управления](Examples/Example_SpriteControls.iss) и [шкала рейтинга](Examples/Example_RatingBar.iss).
- **Текст и документы** — [эффект печатной машинки](Examples/Example_TypedText.iss), демонстрирующий посимвольное появление текста с управлением воспроизведением, и [собственный RTF Viewer](Examples/Example_RTFViewer.iss) для просмотра форматированных RTF-документов.
- **Графика и мультимедиа** — [трёхмерная анимация](Examples/Example_3D_Anim.iss), [GIF-изображения](Examples/Example_GifImage.iss), [SVG-изображения](Examples/Example_SVGImage.iss), [анимация WebP](Examples/Example_WebPImageAnim.iss), [видеофон](Examples/Example_VideoBackground.iss) и [аудиоплеер](Examples/Example_AudioPlayer.iss) для воспроизведения MP3.
- **Вспомогательные средства и интеграция с системой** — [информация о накопителях](Examples/Example_StorageInfo.iss), [сведения о системе](Examples/Example_SystemInfo.iss), [уведомления Windows Toast](Examples/Example_WindowsToast.iss) и [загрузчик файлов](Examples/Example_Downloader.iss).

Ресурсы, используемые этими примерами, находятся в каталоге [`Examples/Files/`](Examples/Files/).

### Примеры Skia4Delphi

В каталоге [`Examples/Skia/`](Examples/Skia/) находятся ещё 14 демонстрационных примеров интеграции Skia4Delphi: анимированные изображения, пользовательские шрифты, отрисовка текста, SVG, эффекты контуров и интерактивные шейдеры.

Для начала можно посмотреть [анимированный Paint Box с взаимодействием мышью](Examples/Skia/Example_AnimPaintBox_InteractWithMouse.iss), [анимированные изображения](Examples/Skia/Example_AnimatedImage.iss) или [комбинирование контуров (Path Compose)](Examples/Skia/Example_Draw_Path_Compose.iss).

Ресурсы Skia, включая шейдеры, шрифты, стили и SVG-файлы, находятся в каталоге [`Examples/Skia/Files/`](Examples/Skia/Files/).

### Подготовка примеров

Демонстрационные скрипты являются исходными файлами, а не готовыми исполняемыми установщиками. Соберите DLL FMXBridge для нужной архитектуры либо поместите соответствующую предварительно собранную **32-разрядную (`FMXBridge_x86.dll`) или 64-разрядную (`FMXBridge_x64.dll`) библиотеку** в каталог модулей примеров.

Для обычных примеров используйте файл объявлений [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss). Для примеров Skia4Delphi в каталоге [`Examples/Skia/Modules/`](Examples/Skia/Modules/) находятся копия основного файла объявлений [`FMXBridgeHandle.iss`](Examples/Skia/Modules/FMXBridgeHandle.iss) и дополнительные объявления [`FMXSkiaHandle.iss`](Examples/Skia/Modules/FMXSkiaHandle.iss). Готовые DLL в репозиторий не включены: поместите сборку FMXBridge нужной архитектуры в каталог `Modules` соответствующего набора примеров. Скрипты Skia также могут требовать дополнительные DLL среды выполнения Skia4Delphi; точные имена и состав зависимостей указаны в секции `[Files]` каждого примера.

Некоторым примерам также могут потребоваться сторонние компоненты или дополнительные ресурсы. Подробности приведены в разделе требований проекта и в документе [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).

## Требования

- **Embarcadero RAD Studio / Delphi с FireMonkey (FMX).** Проект настроен для **Win32** и **Win64**. В заголовке включаемого файла [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss), находящегося в репозитории, указаны RAD Studio 13.2 и версия компилятора `37.0.60952.8797`.
- **Inno Setup 7.0.0 или новее** — требуется для использования текущего файла [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss). При компиляции этот файл проверяет версию Inno Setup.
- Совместимый пакет **RadiantShapes FMX** — необходим для сборки проекта в его текущем виде, как он указан в `FMXBridge.dpr`. Файл `ThirdParty/FMXBridge.RadiantShapes.pas` содержит обёртку и вызовы FMXBridge, но не реализацию RadiantShapes. Если у вас нет необходимого пакета и прав на его использование, перед сборкой удалите связанные с ним ссылки на модули и экспорты, а также объявления обёртки.
- Совместимая установка **Skia4Delphi** — требуется, если включена условная директива `SKIA`. Файл `ThirdParty/FMXBridge.Skia.pas` содержит обёртку со стороны FMXBridge; полная библиотека Skia4Delphi в этом репозитории не включена.
- **Дополнительная поддержка аудио MP3** использует модули из `ThirdParty/AudioPlayer/`, обёртку `ThirdParty/FMXBridge.AudioPlayer.pas`, аудио-модули из [FMXAudioLib](https://github.com/HemulGM/FMXAudioLib) и выходной слой [PCMAudio](https://github.com/HemulGM/PCMAudio). Сведения об авторах и лицензировании приведены в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).

Некоторые другие компоненты включены в виде исходного кода в каталоги `ThirdParty/` и `Custom/`. Объявления Media Foundation API в `ThirdParty/MfPack/` основаны на [MfPack](https://github.com/FactoryXCode/MfPack) от FactoryX и используются в слое воспроизведения видео FMXBridge, в том числе в `FVideoBackground`. Сведения об источниках компонентов и известных лицензионных ограничениях приведены в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md). Лицензия FMXBridge распространяется не на все зависимости проекта.

## Структура проекта

| Путь | Назначение |
| --- | --- |
| `FMXBridge.dpr` | Исходный файл проекта DLL, список модулей, суффиксы архитектур и подключение ресурсов. |
| `FMXBridge.dproj` | Настройки проекта RAD Studio. |
| [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) | Основные объявления интерфейсов и импортов FMXBridge для Inno Setup / Pascal Script. |
| [`Examples/Skia/Modules/FMXBridgeHandle.iss`](Examples/Skia/Modules/FMXBridgeHandle.iss) | Копия основного файла подключения FMXBridge, используемая демонстрационными скриптами Skia. |
| [`Examples/Skia/Modules/FMXSkiaHandle.iss`](Examples/Skia/Modules/FMXSkiaHandle.iss) | Дополнительные объявления Inno Setup для интеграции Skia4Delphi. |
| `FMX/` | Стандартные и дополнительные элементы управления FMX, компоновки, эффекты, графика, мультимедиа, сетевые функции и интерфейсы 3D. |
| `Forms/` | Формы, элементы заголовка окна, вспомогательные средства DWM и утилиты Windows. |
| `Custom/` | Пользовательские элементы управления и вспомогательные модули, включая RTF Viewer, GIF, WebP, TypedText и другие элементы управления. |
| [`Custom/RTFViewer/`](Custom/RTFViewer/) | Собственный RTF Viewer: парсер, модель документа, обработка изображений и FMX-представление. |
| [`Custom/FMXBridge.RTFViewer.pas`](Custom/FMXBridge.RTFViewer.pas) | Inno Setup wrapper для RTF Viewer. |
| `Helpers/` | Дополнительные вспомогательные модули. |
| `Fix/` | Модифицированный исходный код `FMX.Platform.Win.pas`. В нём сохранено уведомление об авторских правах Embarcadero; этот файл исключён из лицензии FMXBridge. |
| `ThirdParty/` | Сторонний исходный код и обёртки, включая аудиоподдержку, Input, SVG, Windows Toast, RadiantShapes и объявления Media Foundation API из MfPack. См. [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md). |
| `Examples/` | 54 демонстрационных примера FMXBridge для Inno Setup и вспомогательные ресурсы в `Examples/Files/`. |
| `Examples/Modules/` | Файл объявлений `FMXBridgeHandle.iss` и справочник по анимационным триггерам для обычных примеров. |
| `Examples/Skia/` | 14 демонстрационных примеров Skia4Delphi и соответствующие ресурсы. |
| `Examples/Skia/Modules/` | Копия `FMXBridgeHandle.iss`, дополнительные объявления `FMXSkiaHandle.iss` и справочник по анимационным триггерам для примеров Skia4Delphi. |

## Сборка DLL

1. Откройте `FMXBridge.dproj` в RAD Studio.
2. Выберите конфигурацию `Release`.
3. Выберите платформу **Win32** и соберите проект.
4. Выберите платформу **Win64** и повторно соберите проект.

В именах DLL используются суффиксы, соответствующие архитектуре:

- Win32: `FMXBridge_x86.dll`
- Win64: `FMXBridge_x64.dll`

Согласно настройкам вывода проекта, ожидаемые каталоги с результатами сборки — `Win32\Release\` и `Win64\Release\`. Для сборки на чистой системе могут потребоваться внешние пакеты, перечисленные выше. На момент подготовки этого README исходный код не проверялся независимой сборкой в чистом окружении.

## Использование FMXBridge из Inno Setup

Файл [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) входит в состав проекта. Поэтому вручную создавать все интерфейсы Pascal Script и объявления внешних функций не требуется.

### 1. Подключение файла интерфейсов

Файлы подключения находятся в каталогах с примерами, а не в корне репозитория.

Для демонстрационных скриптов, расположенных непосредственно в `Examples/`, подключите основной файл:

```iss
#include "Modules\\FMXBridgeHandle.iss"
```

Для скриптов Skia, расположенных в `Examples/Skia/`, подключите оба файла:

```iss
#include "Modules\\FMXBridgeHandle.iss"
#include "Modules\\FMXSkiaHandle.iss"
```

Основной файл подключения содержит собственную секцию `[Code]` и требует Inno Setup версии 7.0.0 или новее. Если скрипт установщика находится в другом каталоге, скорректируйте относительный путь подключения.

### 2. Добавление DLL в секцию `[Files]`

Файл подключения импортирует функции FMXBridge с помощью объявлений следующего вида:

```pascal
external 'InitFormHandle@files:FMXBridge.dll stdcall delayload';
```

Поэтому в секции `[Files]` установщика должна быть указана DLL соответствующей архитектуры под внутренним именем `FMXBridge.dll`. Обычно для этого используется флаг `dontcopy`, чтобы Inno Setup извлекал библиотеку во временный каталог при первом обращении к ней. Разрядность DLL должна соответствовать разрядности процесса, который её загружает. В результате сборки используются суффиксы `_x86` или `_x64`, тогда как файл подключения ожидает имя `FMXBridge.dll`. Выберите соответствующий файл сборки, переименуйте его или укажите `DestName: "FMXBridge.dll"` в подходящей записи секции `[Files]`.

Пример для сборки Win32 (при необходимости измените путь и выбор архитектуры в соответствии с настройками установщика):

```iss
[Files]
Source: "Win32\\Release\\FMXBridge_x86.dll"; DestName: "FMXBridge.dll"; Flags: dontcopy
```

Если используется сплошное сжатие (solid compression), поместите запись DLL ближе к началу секции `[Files]`, чтобы избежать лишних задержек при извлечении. См. [документацию Inno Setup по использованию DLL](https://jrsoftware.org/ishelp/topic_scriptdll.htm).

### 3. Создание формы

Например, после подключения [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) установщик может создать простую FMX-форму через объявленный интерфейс `FForm`:

```pascal
[Code]
var
  MainForm: FForm;

procedure InitializeWizard;
begin
  MainForm := InitFormHandle;
  MainForm.FCreateBlankForm(WizardForm.Handle, ALBlack, '', False);
  MainForm.Caption('FMXBridge test');
  MainForm.Show;
end;
```

Этот фрагмент демонстрирует только принцип взаимодействия через интерфейс. Он не является полноценным установщиком и не заменяет необходимость правильно выбрать архитектуру DLL и установить требуемые внешние пакеты. Другие методы и элементы управления см. в объявлениях интерфейсов файла [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss).

### 4. Вспомогательные процедуры завершения работы

В файле подключения определены вспомогательные процедуры `FMXBridgeShutDown` и `FMXBridgeShutDownUn`. Перед использованием изучите их реализацию: они вызывают экспортируемую функцию завершения работы FMXBridge и `EndTask` для окна выполнения установки или удаления. Это процедуры завершения работы со стороны хост-приложения, **а не универсальные процедуры безопасной выгрузки DLL**. Не следует считать ручную выгрузку DLL безопасной, пока импортированные функции или объекты FMX продолжают использоваться.

## Модель API

Основная часть API организована вокруг фабричных функций `Init...`, которые возвращают интерфейсы, производные от `IUnknown`. Например:

- `InitFormHandle` и `InitMsgFormHandle` — формы и формы сообщений.
- `InitToastHandle` — отправка уведомлений Windows Toast из текущего процесса Setup.
- `InitButtonHandle`, `InitRectangleHandle` — стандартные и графические элементы управления.
- `InitShadowEffect`, `InitViewport3DHandle` — эффекты и элементы 3D.
- `InitTimer`, `InitStopwatch` — таймер и секундомер.
- `InitTypedTextHandle` — элемент надписи с посимвольным выводом текста. Интерфейс `FTypedText` предоставляет методы `Text`, `AddLine`, `Interval`, `Play`, `Stop` и `Reset`.

Вспомогательные функции сгруппированы в отдельные интерфейсы:

| Интерфейс | Фабрика | Методы |
| --- | --- | --- |
| `FColorUtils` | `InitColorUtils` | `SetOpacity`, `Darker`, `Lighter`, `IsLight`, `AverageImageColor` |
| `FFileUtils` | `InitFileUtils` | `ReadAllText`, `WriteAllText`, `AppendAllText`, `CopyFiles`, `MoveFiles` |
| `FFormatUtils` | `InitFormatUtils` | `MbOrTb`, `MHzOrGHz` |
| `FDesktopInfo` | `InitDesktopInfo` | `GetWinAccentColor`, `GetDesktopImg`, `GetDisplayResolutionX`, `GetDisplayResolutionY`, `GetCurrentDPIValue` |
| `FSoundUtils` | `InitSoundUtils` | `PlayFile`, `Stop` |
| `FMessagePump` | `InitMessagePump` | `ProcessMessages`, `BeginHaltProc`, `EndHaltProc` |
| `FSystemExit` | `InitSystemExit` | `LogOff`, `Shutdown`, `Restart` |

Кроме интерфейсов, модуль Utils экспортирует отдельные функции и процедуры, в том числе `SetFileDropCallback`, `NotifyFileDrop`, `ExtractIconFromResource`, `VCLFontSizeToFMX`, `CnvtUTF32ToUTF16` и `GetFMXBridgeBuildDate`.

Соответствующие Pascal-модули объявляют интерфейсы, производные от `IUnknown`; методы интерфейсов используют соглашение о вызовах `stdcall`. В качестве параметров могут передаваться дескрипторы объектов FMX (`TFmxObject`), дескрипторы Windows (`HWND`), значения `WideString`, обратные вызовы и типы, специфичные для FMX. Это API на основе интерфейсов Delphi/FireMonkey, а не универсальный C ABI. Объявления на стороне хост-приложения должны точно соответствовать экспортам, идентификаторам интерфейсов, порядку методов, типам параметров и возвращаемых значений.

DLL и файл [`Examples/Modules/FMXBridgeHandle.iss`](Examples/Modules/FMXBridgeHandle.iss) содержат соответствующие друг другу части этого API. Копия файла для примеров Skia находится в [`Examples/Skia/Modules/FMXBridgeHandle.iss`](Examples/Skia/Modules/FMXBridgeHandle.iss), а дополнительные объявления Skia — в [`Examples/Skia/Modules/FMXSkiaHandle.iss`](Examples/Skia/Modules/FMXSkiaHandle.iss). При добавлении, удалении или изменении экспортируемой функции либо интерфейса в проекте Delphi необходимо соответственно обновить объявления Inno Setup. Дополнительные модули можно исключать из проекта, но при этом нужно согласованно удалить связанные с ними модули, экспорты, обёртки, ресурсы и ссылки на пакеты.

## Благодарности

FMXBridge — самостоятельный проект, на который повлияли работы сообщества Delphi и Inno Setup. Благодарность следующим авторам и проектам:

- **[ISFMXFW](https://github.com/Jivanewstone/ISFMXFW)** — источник вдохновения для идеи предоставления возможностей FireMonkey в Inno Setup через DLL. Это упоминание в качестве источника вдохновения, а не утверждение о том, что исходный код ISFMXFW включён в FMXBridge.
- **[FMXComponents](https://github.com/zhaoyipeng/FMXComponents)** от Zhao Yipeng — идеи и подходы к реализации компонентов. Спасибо за вклад в сообщество FMX.
- **[PicShow Components](https://www.delphiarea.com/products/delphi-components/picshow/)** от Delphi Area — источник идей для эффектов перехода между изображениями, используемых в `Custom/PicShow`. Исходный код PicShow не копировался и не включался в FMXBridge; реализация FMXBridge написана самостоятельно.
- **[FMXAudioLib](https://github.com/HemulGM/FMXAudioLib)** от HemulGM — декодирование MP3 и функциональность аудиоисточников. Сведения о лицензировании и авторстве компонентов приведены в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **[WindowsNotificationManager](https://github.com/HemulGM/WindowsNotificationManager)** от HemulGM — поддержка уведомлений Windows Toast; лицензия MIT. Информация о скопированном исходном коде и его лицензии приведена в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **[PCMAudio](https://github.com/HemulGM/PCMAudio)** от HemulGM — слой вывода PCM-аудио; лицензия MIT.
- **[FMXSVG](https://github.com/HemulGM/FMXSVG)** от HemulGM — поддержка SVG и соответствующий исходный код.
- **[Skia4Delphi](https://github.com/skia4delphi/skia4delphi)** — интеграция Skia и соответствующие обёртки.
- **[MfPack](https://github.com/FactoryXCode/MfPack)** от FactoryX — объявления Media Foundation API, используемые в слое воспроизведения видео FMXBridge. `FVideoBackground` — обёртка FMXBridge, построенная на основе `TVideoPlayer`, который использует объявления API из MfPack. Применимые лицензии и уведомления исходного проекта описаны в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).
- **Поддержка WebP** — автору FMXBridge не удалось установить исходный репозиторий и автора оригинальной реализации. Если вам известен источник, пожалуйста, создайте Issue, чтобы можно было дополнить или исправить сведения об авторстве.
- **RadiantShapes** — репозиторий FMXBridge содержит только код обёртки и вызовы RadiantShapes, но не саму реализацию RadiantShapes. Для использования необходим соответствующий пакет и права на его применение.
- **`FMX.Platform.Win.pas`** — этот платформенный модуль был изменён для FMXBridge. Подход к его модификации был изучен на примере работы [HemulGM](https://github.com/HemulGM); спасибо за публикацию этого решения.

Дополнительная информация приведена в [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md). Каждый сторонний компонент по-прежнему регулируется собственной лицензией или условиями правообладателя. Лицензия FMXBridge не заменяет эти условия.

## Стиль кода

В исходном коде намеренно используется минимальное количество комментариев. Предпочтение отдаётся комментариям, которые содержат непосредственно полезную информацию, а не пространным пояснениям, просто пересказывающим код.

## Лицензия

Файл [`LICENSE`](LICENSE) распространяется **только на оригинальный код FMXBridge, автором которого является audiofeel**. Он не предоставляет прав на сторонний код и бинарные файлы, модифицированный исходный код платформы Embarcadero, исходный код FMXAudioLib, для которого в upstream-репозитории не указана лицензия, объявления API из MfPack или пакет RadiantShapes. Исходный код MfPack сохраняет собственную лицензию MPL-2.0 и дополнительное уведомление об условиях распространения; эти условия не относятся к лицензии FMXBridge. Перед распространением полного дерева исходного кода или собранной на его основе DLL ознакомьтесь с [`THIRD-PARTY-NOTICES.md`](THIRD-PARTY-NOTICES.md).

Упоминание ISFMXFW является признанием источника вдохновения. Если какой-либо код был скопирован из этого проекта под лицензией GPL-3.0 или адаптирован на его основе, лицензионные последствия для соответствующих частей необходимо оценивать отдельно.

## Состояние проекта

Репозиторий содержит исходный проект DLL, файл подключения интерфейсов для Inno Setup и 68 демонстрационных скриптов в каталоге `Examples/`, включая отдельную подборку примеров Skia4Delphi.

В настоящее время автоматизированный процесс сборки и тестирования не настроен.

Вопросы, исправления и дополнения к сведениям об авторстве можно отправлять через [GitHub Issues](https://github.com/audiofeel/FMXBridge/issues).

