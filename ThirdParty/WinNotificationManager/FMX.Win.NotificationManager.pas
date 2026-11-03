unit FMX.Win.NotificationManager;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections, System.DateUtils,
  System.Win.Registry,
  ///
  FMX.Win.Notification.XML,
  // Windows RT (Runtime)
  Win.WinRT, Winapi.DataRT, Winapi.Winrt, Winapi.Winrt.Utils, Winapi.UI.Notifications,
  // Winapi
  Winapi.Windows, Winapi.Messages, Winapi.CommonTypes, Winapi.Foundation;

{$SCOPEDENUMS ON}

type
  ENotification = class(Exception);

  ENotificationAlreadyPosted = class(ENotification);

  ENotificationNotPosted = class(ENotification);

  ENotificationTagNeeded = class(ENotification);

  ENotificationUpdate = class(ENotification);

  ENotificationNotInited = class(ENotification);

  TNotification = class;

  TUserInputMap = class;

  NotificationMirroring = Winapi.UI.Notifications.NotificationMirroring;

  ToastNotificationPriority = Winapi.UI.Notifications.ToastNotificationPriority;

  // Cardinals
  TSoundEventValue = (          //
    Default,                    //
    NotificationDefault,        //
    NotificationIM,             //
    NotificationMail,           //
    NotificationReminder,       //
    NotificationSMS,            //
    NotificationLoopingAlarm,   //
    NotificationLoopingAlarm2,  //
    NotificationLoopingAlarm3,  //
    NotificationLoopingAlarm4,  //
    NotificationLoopingAlarm5,  //
    NotificationLoopingAlarm6,  //
    NotificationLoopingAlarm7,  //
    NotificationLoopingAlarm8,  //
    NotificationLoopingAlarm9,  //
    NotificationLoopingAlarm10, //
    NotificationLoopingCall,    //
    NotificationLoopingCall2,   //
    NotificationLoopingCall3,   //
    NotificationLoopingCall4,   //
    NotificationLoopingCall5,   //
    NotificationLoopingCall6,   //
    NotificationLoopingCall7,   //
    NotificationLoopingCall8,   //
    NotificationLoopingCall9,   //
    NotificationLoopingCall10); //

  TSoundEventValueHelper = record helper for TSoundEventValue
    function ToString: string; inline;
  end;

  TImagePlacement = (Default, Hero, LogoOverride);

  TImageCrop = (Default, None, Circle);

  TInputType = (Text, Selection);

  TActivationType = (//
    /// <summary>
    /// Default
    /// </summary>
    Default,
    /// <summary>
    /// Default value. Your foreground app is launched.
    /// </summary>
    Foreground,
    /// <summary>
    /// Your corresponding background task is triggered, and you can execute code in the background without interrupting the user.
    /// </summary>
    Background,
    /// <summary>
    /// Launch a different app using protocol activation.
    /// </summary>
    Protocol,
    /// <summary>
    /// System
    /// </summary>
    System);

  TActivationTypeHelper = record helper for TActivationType
    function ToString: string; inline;
  end;

  /// <summary>
  /// The amount of time the toast should display.
  /// </summary>
  TToastDuration = (
    /// <summary>
    /// Use default: short
    /// </summary>
    Default,
    /// <summary>
    /// Show for 7s
    /// </summary>
    Short,
    /// <summary>
    /// Show for 25s
    /// </summary>
    Long);

  TToastDurationHelper = record helper for TToastDuration
    function ToString: string; inline;
  end;

  /// <summary>
  /// AudioMode
  /// </summary>
  TAudioMode = (
    /// <summary>
    /// The notification controls the audio
    /// </summary>
    Default,
    /// <summary>
    /// No audio
    /// </summary>
    Muted,
    /// <summary>
    /// Custom audio overrides all toast sounds
    /// </summary>
    Custom);

  TNotificationRank = (Default, Normal, High, Topmost);

  /// <summary>
  /// The scenario your toast is used for, like an alarm or reminder.
  /// </summary>
  TToastScenario = (
    /// <summary>
    /// Default notification behaviour
    /// </summary>
    Default,
    /// <summary>
    /// An alarm notification. This will be displayed pre-expanded and stay on the user's screen till dismissed. Audio will loop by default and will use alarm audio.
    /// </summary>
    Alarm,
    /// <summary>
    /// A reminder notification. This will be displayed pre-expanded and stay on the user's screen till dismissed. Note that this will be silently ignored unless there's a toast button action that activates in background.
    /// </summary>
    Reminder,
    /// <summary>
    /// An incoming call notification. This will be displayed pre-expanded in a special call format and stay on the user's screen till dismissed. Audio will loop by default and will use ringtone audio.
    /// </summary>
    IncomingCall,
    /// <summary>
    /// An important notification. This allows users to have more control over what apps can send them high-priority toast notifications that can break through Focus Assist (Do not Disturb). This can be modified in the notifications settings.
    /// </summary>
    Urgent);

  TToastScenarioHelper = record helper for TToastScenario
    function ToString: string; inline;
  end;

  TToastDismissReason = ToastDismissalReason;

  // Events
  TOnToastActivated = procedure(Sender: TNotification; Arguments: string; UserInput: TUserInputMap) of object;

  TOnToastDismissed = procedure(Sender: TNotification; Reason: TToastDismissReason) of object;

  TOnToastFailed = procedure(Sender: TNotification; ErrorCode: HRESULT) of object;

  INotificationEventHandler = interface
    ['{3E0F388D-6B7C-4FE7-A095-3E2822F84EB2}']
    procedure Unscribe;
  end;

  // Events
  TNotificationEventHandler = class(TInspectableObject, INotificationEventHandler)
  private
    FNotification: TNotification;
    FToken: EventRegistrationToken;
  public
    constructor Create(const ANotification: TNotification); virtual;
    procedure Unscribe; virtual; abstract;
    destructor Destroy; override;
  end;

  TNotificationActivatedHandler = class(TNotificationEventHandler, TypedEventHandler_2__IToastNotification__IInspectable)
    procedure Invoke(sender: IToastNotification; args: IInspectable); safecall;

    constructor Create(const ANotification: TNotification); override;
    procedure Unscribe; override;
  end;

  TNotificationDismissedHandler = class(TNotificationEventHandler, TypedEventHandler_2__IToastNotification__IToastDismissedEventArgs)
    procedure Invoke(sender: IToastNotification; args: IToastDismissedEventArgs); safecall;

    constructor Create(const ANotification: TNotification); override;
    procedure Unscribe; override;
  end;

  TNotificationFailedHandler = class(TNotificationEventHandler, TypedEventHandler_2__IToastNotification__IToastFailedEventArgs)
    procedure Invoke(sender: IToastNotification; args: IToastFailedEventArgs); safecall;

    constructor Create(const ANotification: TNotification); override;
    procedure Unscribe; override;
  end;

  // Notification data
  TNotificationData = class
  private
    Data: INotificationData;
    function GetValue(Key: string): string;
    procedure SetValue(Key: string; const Value: string);
    function GetSeq: Cardinal;
    procedure SetSeq(const Value: Cardinal);
  public
    property InterfaceValue: INotificationData read Data;
    // Seq
    property SequenceNumber: Cardinal read GetSeq write SetSeq;
    procedure IncreaseSequence;
    // Proc
    procedure Clear;
    function ValueCount: Cardinal;
    function ValueExists(Key: string): boolean;
    // Manage
    property Values[Key: string]: string read GetValue write SetValue; default;
    constructor Create;
    destructor Destroy; override;
  end;

  // User input parser
  TUserInputMap = class
  private
    FMap: IMap_2__HSTRING__HSTRING;
  public
    function HasValue(ID: string): boolean;
    function GetStringValue(ID: string): string;
    function GetIntValue(ID: string): integer;
    constructor Create(LookupMap: IMap_2__HSTRING__HSTRING); reintroduce;
    destructor Destroy; override;
  end;

  TToastContentBuilder = class;

  // Toast notification
  TNotification = class(TComponent)
  private
    FPosted: Boolean;
    FToast: IToastNotification;
    FToast2: IToastNotification2;
    FToast3: IToastNotification3;
    FToast4: IToastNotification4;
    FToast6: IToastNotification6;
    FToastScheduled: IScheduledToastNotification;
    FOnActivated: TOnToastActivated;
    FOnDismissed: TOnToastDismissed;
    FOnFailed: TOnToastFailed;
    FHandleActivated: INotificationEventHandler;
    FHandleDismissed: INotificationEventHandler;
    FHandleFailed: INotificationEventHandler;
    FData: TNotificationData;
    procedure FreeEvents;
    procedure Initiate(XML: Xml_Dom_IXmlDocument);
    function GetExpiration: TDateTime;
    procedure SetExpiration(const Value: TDateTime);
    function GetSuppress: Boolean;
    procedure SetSuppress(const Value: Boolean);
    function GetGroup: string;
    function GetTag: string;
    procedure SetGroup(const Value: string);
    procedure SetTag(const Value: string);
    function GetMirroring: NotificationMirroring;
    procedure SetMirroring(const Value: NotificationMirroring);
    function GetRemoteID: string;
    procedure SetRemoteID(const Value: string);
    procedure SetData(const Value: TNotificationData);
    function GetPriority: ToastNotificationPriority;
    procedure SetPriority(const Value: ToastNotificationPriority);
    function GetExireReboot: Boolean;
    procedure SetExpireReboot(const Value: Boolean);
    procedure SetEventActivated(const Value: TOnToastActivated);
    procedure SetEventDismissed(const Value: TOnToastDismissed);
    procedure SetEventFailed(const Value: TOnToastFailed);
  public
    /// <summary>
    /// Defines the time at which the popup will dissapear.
    /// </summary>
    property ExpirationTime: TDateTime read GetExpiration write SetExpiration;
    /// <summary>
    /// Defines wheather the popup is shown to the user on the screen or of It's placed directly in the action center.
    /// </summary>
    property SuppressPopup: Boolean read GetSuppress write SetSuppress;
    property Tag: string read GetTag write SetTag;
    property Group: string read GetGroup write SetGroup;
    property NotificationMirroring: NotificationMirroring read GetMirroring write SetMirroring;
    property RemoteId: string read GetRemoteID write SetRemoteID;
    property Data: TNotificationData read FData;
    property Toast: IToastNotification read FToast;
    /// <summary>
    /// Notification priority
    /// </summary>
    property Priority: ToastNotificationPriority read GetPriority write SetPriority;
    /// <summary>
    /// Expire notification after reboot
    /// </summary>
    property ExpiresOnReboot: boolean read GetExireReboot write SetExpireReboot;
  public
    property Posted: Boolean read FPosted;
    function Content: TXMLInterface;
    /// <summary>
    ///  Reset the notification to It's default state before being posted.
    /// </summary>
    procedure Reset;
  public
    property OnActivated: TOnToastActivated read FOnActivated write SetEventActivated;
    property OnDismissed: TOnToastDismissed read FOnDismissed write SetEventDismissed;
    property OnFailed: TOnToastFailed read FOnFailed write SetEventFailed;
    constructor Create(AOwner: TComponent; Content: TToastContentBuilder); reintroduce; virtual;
    destructor Destroy; override;
  end;

  /// <summary>
  /// The placement of the text.
  /// </summary>
  TToastTextPlacement = (
    /// <summary>
    /// An adaptive text element
    /// </summary>
    None,
    /// <summary>
    /// Attribution text displayed at the bottom of the toast notification.
    /// </summary>
    Attribution);

  TToastTextPlacementHelper = record helper for TToastTextPlacement
    function ToString: string; inline;
  end;

  TToastContentItem = class
  protected
    FNode: TWinXMLNode;
    function GetNodeAndFree: TWinXMLNode;
  public
    constructor Create; virtual;
    destructor Destroy; override;
  end;

  TToastContentItem<T> = class(TToastContentItem)
  end;

  TToastTextStyle = (
    /// <summary>
    /// Default value. Style is determined by the renderer.
    /// </summary>
    Default,
    /// <summary>
    /// Smaller than paragraph font size.
    /// </summary>
    Caption,
    /// <summary>
    /// Same as Caption but with subtle opacity.
    /// </summary>
    CaptionSubtle,
    /// <summary>
    /// Paragraph font size.
    /// </summary>
    Body,
    /// <summary>
    /// Same as Body but with subtle opacity.
    /// </summary>
    BodySubtle,
    /// <summary>
    /// Paragraph font size, bold weight. Essentially the bold version of Body.
    /// </summary>
    Base,
    /// <summary>
    /// Same as Base but with subtle opacity.
    /// </summary>
    BaseSubtle,
    /// <summary>
    /// H4 font size.
    /// </summary>
    Subtitle,
    /// <summary>
    /// Same as Subtitle but with subtle opacity.
    /// </summary>
    SubtitleSubtle,
    /// <summary>
    /// H3 font size.
    /// </summary>
    Title,
    /// <summary>
    /// Same as Title but with subtle opacity.
    /// </summary>
    TitleSubtle,
    /// <summary>
    /// Same as Title but with top/bottom padding removed.
    /// </summary>
    TitleNumeral,
    /// <summary>
    /// H2 font size.
    /// </summary>
    Subheader,
    /// <summary>
    /// Same as Subheader but with subtle opacity.
    /// </summary>
    SubheaderSubtle,
    /// <summary>
    /// Same as Subheader but with top/bottom padding removed.
    /// </summary>
    SubheaderNumeral,
    /// <summary>
    /// H1 font size.
    /// </summary>
    Header,
    /// <summary>
    /// Same as Header but with subtle opacity.
    /// </summary>
    HeaderSubtle,
    /// <summary>
    /// Same as Header but with top/bottom padding removed.
    /// </summary>
    HeaderNumeral);

  TToastTextStyleHelper = record helper for TToastTextStyle
    function ToString: string; inline;
  end;

  TToastTextAlign = (
    /// <summary>
    /// Default value. Alignment is automatically determined by the renderer.
    /// </summary>
    Default,
    /// <summary>
    /// Alignment determined by the current language and culture.
    /// </summary>
    Auto,
    /// <summary>
    /// Horizontally align the text to the left.
    /// </summary>
    Left,
    /// <summary>
    /// Horizontally align the text in the center.
    /// </summary>
    Center,
    /// <summary>
    /// Horizontally align the text to the right.
    /// </summary>
    Right);

  TToastTextAlignHelper = record helper for TToastTextAlign
    function ToString: string; inline;
  end;

  TToastText = class(TToastContentItem<TToastText>)
  public
    /// <summary>
    /// The text to display. Data binding support added in Creators Update, but only works for top-level text elements.
    /// </summary>
    function Text(const Value: string): TToastText;
    /// <summary>
    /// The style controls the text's font size, weight, and opacity. Only works for text elements inside a group/subgroup.
    /// </summary>
    function HintStyle(const Value: TToastTextStyle): TToastText; overload;
    /// <summary>
    /// Set this to true to enable text wrapping. Top-level text elements ignore this property and always wrap (you can use HintMaxLines = 1 to disable wrapping for top-level text elements). Text elements inside groups/subgroups default to false for wrapping.
    /// </summary>
    function HintWrap(const Value: Boolean): TToastText; overload;
    /// <summary>
    /// The maximum number of lines the text element is allowed to display.
    /// </summary>
    function HintMaxLines(const Value: Integer): TToastText;
    /// <summary>
    /// The minimum number of lines the text element must display. Only works for text elements inside a group/subgroup.
    /// </summary>
    function HintMinLines(const Value: Integer): TToastText;
    /// <summary>
    /// The horizontal alignment of the text. Only works for text elements inside a group/subgroup.
    /// </summary>
    function HintAlign(const Value: TToastTextAlign): TToastText;
    /// <summary>
    /// The target locale of the XML payload, specified as a BCP-47 language tags such as "en-US" or "fr-FR". The locale specified here overrides any other specified locale, such as that in binding or visual. If this value is a literal string, this attribute defaults to the user's UI language. If this value is a string reference, this attribute defaults to the locale chosen by Windows Runtime in resolving the string.
    /// </summary>
    function Language(const Value: string): TToastText;
    /// <summary>
    /// The placement of the text. Introduced in Anniversary Update. If you specify the value "attribution", the text is always displayed at the bottom of your notification, along with your app's identity or the notification's timestamp. On older versions of Windows that don't support attribution text, the text will simply be displayed as another text element (assuming you don't already have the maximum of three text elements). For more information, see Toast content.
    /// </summary>
    function Placement(const Value: TToastTextPlacement): TToastText;
    /// <summary>
    /// Set to "true" to center the text for incoming call notifications. This value is only used for notifications with with a scenario value of "incomingCall"; otherwise, it is ignored. For more information, see Toast content.
    /// </summary>
    function HintСallScenarioCenterAlign(const Value: Boolean): TToastText;
  end;

  TToastProgressBar = class(TToastContentItem<TToastProgressBar>)
  public
    /// <summary>
    /// Gets or sets an optional title string. Supports data binding.
    /// </summary>
    function Title(const Value: string): TToastProgressBar;
    /// <summary>
    /// Gets or sets the value of the progress bar. Supports data binding. Defaults to 0.
    /// </summary>
    function Value(const Value: Single): TToastProgressBar; overload;
    /// <summary>
    /// Gets or sets the name that maps to your binding data value.
    /// </summary>
    function Value(const Value: string): TToastProgressBar; overload;
    /// <summary>
    /// Gets or sets a value indicating whether the progress bar is indeterminate. If this is true, Value will be ignored.
    /// </summary>
    function ValueIndeterminate: TToastProgressBar;
    /// <summary>
    /// Gets or sets an optional string to be displayed instead of the default percentage string. If this isn't provided, something like "70%" will be displayed.
    /// </summary>
    function ValueStringOverride(const Value: string): TToastProgressBar;
    /// <summary>
    /// Gets or sets a status string (required), which is displayed underneath the progress bar on the left. This string should reflect the status of the operation, like "Downloading..." or "Installing..."
    /// </summary>
    function Status(const Value: string): TToastProgressBar;
    constructor Create; override;
  end;

  /// <summary>
  /// Specify audio to be played when the Toast notification is received.
  /// </summary>
  TToastAudio = class(TToastContentItem<TToastAudio>)
  public
    /// <summary>
    /// The media file to play in place of the default sound. Only ms-appx and ms-resource are supported. All else (ms-appdata, http, C:, etc.) is not supported.
    /// </summary>
    function Src(const Uri: string): TToastAudio; overload;
    /// <summary>
    /// The "ms-winsoundevent" audio to play in place of the default sound.
    /// </summary>
    function Src(const WinSoundEvent: TSoundEventValue): TToastAudio; overload;
    /// <summary>
    /// Set to true if the sound should repeat as long as the Toast is shown; false to play only once (default).
    /// </summary>
    function Loop(const Value: Boolean): TToastAudio;
    /// <summary>
    /// True to mute the sound; false to allow the toast notification sound to play (default).
    /// </summary>
    function Silent(const Value: Boolean): TToastAudio;
  end;

  /// <summary>
  /// A text box control that the user can type text into.
  /// </summary>
  TToastTextBox = class(TToastContentItem<TToastTextBox>)
  protected
    /// <summary>
    /// The ID associated with the content.
    /// </summary>
    function InputType(const Value: string): TToastTextBox;
  public
    /// <summary>
    /// The ID associated with the content.
    /// </summary>
    function Id(const Value: string): TToastTextBox;
    /// <summary>
    /// Title text to display above the text box.
    /// </summary>
    function Title(const Value: string): TToastTextBox;
    /// <summary>
    /// Placeholder text to be displayed on the text box when the user hasn't typed any text yet.
    /// </summary>
    function PlaceholderContent(const Value: string): TToastTextBox;
    /// <summary>
    /// The initial text to place in the text box. Leave this null for a blank text box.
    /// </summary>
    function DefaultInput(const Value: string): TToastTextBox;
    /// <summary>
    /// Add custom argument
    /// </summary>
    function AddArgument(const Name, Value: string): TToastTextBox;
  end;

  /// <summary>
  /// Specifies the id and text of a selection item.
  /// </summary>
  TToastSelectionBoxItem = record
  public
    /// <summary>
    /// The id of the selection item.
    /// </summary>
    Id: string;
    /// <summary>
    /// The content of the selection item.
    /// </summary>
    Content: string;
    class function Create(const Id, Content: string): TToastSelectionBoxItem; static;
  end;

  /// <summary>
  /// A selection box control, which lets users pick from a dropdown list of options.
  /// </summary>
  TToastSelectionBox = class(TToastContentItem<TToastSelectionBox>)
  protected
    /// <summary>
    /// The ID associated with the content.
    /// </summary>
    function InputType(const Value: string): TToastSelectionBox;
  public
    /// <summary>
    /// The ID associated with the content.
    /// </summary>
    function Id(const Value: string): TToastSelectionBox;
    /// <summary>
    /// Title text to display above the text box.
    /// </summary>
    function Title(const Value: string): TToastSelectionBox;
    /// <summary>
    /// Placeholder text to be displayed on the text box when the user hasn't typed any text yet.
    /// </summary>
    function PlaceholderContent(const Value: string): TToastSelectionBox;
    /// <summary>
    /// The initial text to place in the text box. Leave this null for a blank text box.
    /// </summary>
    function DefaultInput(const Value: string): TToastSelectionBox;
    /// <summary>
    /// Specifies the id and text of a selection item.
    /// </summary>
    function Items(const Values: TArray<TToastSelectionBoxItem>): TToastSelectionBox;
    /// <summary>
    /// Add custom argument
    /// </summary>
    function AddArgument(const Name, Value: string): TToastSelectionBox;
  end;

  /// <summary>
  /// The button style. useButtonStyle must be set to true in the toast element.
  /// </summary>
  TToastActionButtonStyle = (
    /// <summary>
    /// The button is green.
    /// </summary>
    Success,
    /// <summary>
    /// The button is red.
    /// </summary>
    Critical);

  TToastActionButtonStyleHelper = record helper for TToastActionButtonStyle
    function ToString: string; inline;
  end;

  /// <summary>
  /// Specifies the behavior that the toast should use when the user takes action on the toast.
  /// </summary>
  TToastActionActivationBehavior = (
    /// <summary>
    /// Default value. The toast will be dismissed when the user takes action on the toast.
    /// </summary>
    Default,
    /// <summary>
    /// After the user clicks a button on your toast, the notification will remain present, in a "pending update" visual state. You should immediately update your toast from a background task so that the user does not see this "pending update" visual state for too long.
    /// </summary>
    PendingUpdate);

  TToastActionActivationBehaviorHelper = record helper for TToastActionActivationBehavior
    function ToString: string; inline;
  end;

  /// <summary>
  /// Specifies a button shown in a toast.
  /// </summary>
  TToastAction = class(TToastContentItem<TToastAction>)
  public
    /// <summary>
    /// The content displayed on the button.
    /// </summary>
    function Content(const Value: string): TToastAction;
    /// <summary>
    /// App-defined string of arguments that the app will later receive if the user clicks this button.
    /// For system activation: "snooze" , "dismiss" , "video" , "voice" , "decline"
    /// </summary>
    function Arguments(const Value: string): TToastAction;
    /// <summary>
    /// An argument string that can be passed to the associated app to provide specifics about the action that it should execute in response to the user action.
    /// </summary>
    function ActionType(const Value: string): TToastAction;
    /// <summary>
    /// Decides the type of activation that will be used when the user interacts with a specific action.
    /// </summary>
    function ActivationType(const Value: TActivationType): TToastAction;
    /// <summary>
    /// Specifies the behavior that the toast should use when the user takes action on the toast.
    /// </summary>
    function AfterActivationBehavior(const Value: TToastActionActivationBehavior): TToastAction;
    /// <summary>
    /// When set to "contextMenu", the action becomes a context menu action added to the toast notification's context menu rather than a traditional toast button.
    /// </summary>
    function Placement(const Value: string): TToastAction;
    /// <summary>
    /// The URI of the image source for a toast button icon. These icons are white transparent 16x16 pixel images at 100% scaling and should have no padding included in the image itself. If you choose to provide icons on a toast notification, you must provide icons for ALL of your buttons in the notification, as it transforms the style of your buttons into icon buttons.
    /// Use one of the following protocol handlers:
    /// - http:// or https:// - A web-based image.
    /// - ms-appx:/// - An image included in the app package.
    /// - ms-appdata:///local/ - An image saved to local storage.
    /// - file:/// - A local image. (Supported only for desktop apps. This protocol cannot be used by UWP apps.)
    /// </summary>
    function ImageUri(const Value: string): TToastAction;
    /// <summary>
    /// Set to the Id of an input to position button beside the input.
    /// </summary>
    function HintInputId(const Value: string): TToastAction;
    /// <summary>
    /// The button style. useButtonStyle must be set to true in the toast element.
    /// - "Success" - The button is green
    /// - "Critical" - The button is red.
    /// Note that these values are case-sensitive.
    /// </summary>
    function HintButtonStyle(const Value: TToastActionButtonStyle): TToastAction;
    /// <summary>
    /// The tooltip for a button, if the button has an empty content string.
    /// </summary>
    function HintToolTip(const Value: string): TToastAction;
    /// <summary>
    /// Add custom argument
    /// </summary>
    function AddArgument(const Name, Value: string): TToastAction;
  end;

  /// <summary>
  /// The placement of the image.
  /// </summary>
  TToastImagePlacement = (
    /// <summary>
    /// The image replaces your app's logo in the toast notification.
    /// </summary>
    AppLogoOverride,
    /// <summary>
    /// The image is displayed as a hero image.
    /// </summary>
    Hero);

  TToastImagePlacementHelper = record helper for TToastImagePlacement
    function ToString: string; inline;
  end;

  /// <summary>
  /// The cropping of the image.
  /// </summary>
  TToastImageHintCrop = (
    /// <summary>
    /// Unspecified - The image is not cropped and displayed as a square.
    /// </summary>
    None,
    /// <summary>
    /// The image is cropped into a circle.
    /// </summary>
    Circle);

  TToastImageHintCropHelper = record helper for TToastImageHintCrop
    function ToString: string; inline;
  end;

  /// <summary>
  /// Specify audio to be played when the Toast notification is received.
  /// </summary>
  TToastImage = class(TToastContentItem<TToastAudio>)
  public
    /// <summary>
    /// Set to "true" to allow Windows to append a query string to the image URI supplied in the toast notification. Use this attribute if your server hosts images and can handle query strings, either by retrieving an image variant based on the query strings or by ignoring the query string and returning the image as specified without the query string. This query string specifies scale, contrast setting, and language; for instance, a value of
    /// "www.website.com/images/hello.png"
    /// given in the notification becomes
    /// "www.website.com/images/hello.png?ms-scale=100&ms-contrast=standard&ms-lang=en-us"
    /// </summary>
    function AddImageQuery(const Value: Boolean): TToastImage;
    /// <summary>
    /// A description of the image, for users of assistive technologies.
    /// </summary>
    function Alt(const Value: string): TToastImage;
    /// <summary>
    /// The image element in the toast template that this image is intended for. If a template has only one image, then this value is 1. The number of available image positions is based on the template definition.
    /// </summary>
    function Id(const Value: Integer): TToastImage;
    /// <summary>
    /// The URI of the image source, using one of these protocol handlers:
    /// A web-based image: http:// or https://
    /// An image included in the app package: ms-appx:///
    /// An image saved to local storage: ms-appdata:///local/
    /// A local image: file:///
    /// (Supported only for desktop apps. This protocol cannot be used by UWP apps.)
    /// </summary>
    function Src(const Value: string): TToastImage;
    /// <summary>
    /// The placement of the image.
    /// </summary>
    function Placement(const Value: TToastImagePlacement): TToastImage;
    /// <summary>
    /// The cropping of the image.
    /// Unspecified - The image is not cropped and displayed as a square.
    /// </summary>
    function HintCrop(const Value: TToastImageHintCrop): TToastImage;
    /// <summary>
    /// HintRemoveMargin
    /// </summary>
    function HintRemoveMargin(const Value: Boolean): TToastImage;
  end;

  /// <summary>
  /// Specifies a custom header that groups multiple notifications together within Action Center.
  /// </summary>
  TToastHeader = class(TToastContentItem<TToastHeader>)
  public
    /// <summary>
    /// A developer-created identifier that uniquely identifies this header. If two notifications have the same header id, they will be displayed underneath the same header in Action Center.
    /// </summary>
    function Id(const Value: string): TToastHeader;
    /// <summary>
    /// A title for the header.
    /// </summary>
    function Title(const Value: string): TToastHeader;
    /// <summary>
    /// A developer-defined string of arguments that is returned to the app when the user clicks this header. Cannot be null.
    /// </summary>
    function Arguments(const Value: string): TToastHeader;
    /// <summary>
    /// The type of activation this header will use when clicked.
    /// </summary>
    function ActivationType(const Value: TActivationType): TToastHeader;
  end;

  /// <summary>
  /// Specifies vertical columns that can contain text and images.
  /// </summary>
  TToastSubGroup = class(TToastContentItem<TToastSubGroup>)
    /// <summary>
    /// Specifies text used in the toast template.
    /// </summary>
    function AddText(const Value: TToastText): TToastSubGroup;
    /// <summary>
    /// Specifies an image used in the toast template.
    /// </summary>
    function AddImage(const Value: TToastImage): TToastSubGroup;
    /// <summary>
    /// Specifies an image used in the toast template.
    /// </summary>
    function HintWeight(const Value: Integer): TToastSubGroup;
  end;

  /// <summary>
  /// Semantically identifies that the content in the group must either be displayed as a whole, or not displayed if it cannot fit. Groups also allow creating multiple columns.
  /// </summary>
  TToastGroup = class(TToastContentItem<TToastGroup>)
  public
    /// <summary>
    /// Specifies vertical columns that can contain text and images.
    /// </summary>
    function SubGroups(const Values: TArray<TToastSubGroup>): TToastGroup;
  end;

  // Builder
  TToastContentBuilder = class
  protected
    FXML: TWinXMLDocument;
    FXMLVisual, FXMLBinding, FXMLActions: TWinXMLNode;
    function AddVisual(Item: TToastContentItem; const Name: string): TToastContentBuilder;
    function AddAction(Item: TToastContentItem; const Name: string): TToastContentBuilder;
    function AddGeneral(Item: TToastContentItem; const Name: string): TToastContentBuilder;
    function AddBinding(Item: TToastContentItem; const Name: string): TToastContentBuilder;
  public
    function GenerateXML: TDomXMLDocument;
    /// <summary>
    /// Specifies a progress bar for a toast notification. Only supported on toasts on Desktop, build 15063 or later.
    /// </summary>
    function AddProgressBar(Item: TToastProgressBar): TToastContentBuilder;
    /// <summary>
    /// Specifies text used in the toast template.
    /// </summary>
    function AddText(Item: TToastText): TToastContentBuilder;
    /// <summary>
    /// Specifies an input, either text box or selection menu, shown in a toast notification.
    /// </summary>
    function AddInputBox(Item: TToastTextBox): TToastContentBuilder;
    /// <summary>
    /// Specifies the id and text of a selection item.
    /// </summary>
    function AddSelectionBox(Item: TToastSelectionBox): TToastContentBuilder;
    /// <summary>
    /// Specifies a button shown in a toast.
    /// </summary>
    function AddButton(Item: TToastAction): TToastContentBuilder;
    /// <summary>
    /// Specifies an image used in the toast template.
    /// </summary>
    function AddImage(Item: TToastImage): TToastContentBuilder;
    /// <summary>
    /// Specifies a custom header that groups multiple notifications together within Action Center.
    /// </summary>
    function AddHeader(Item: TToastHeader): TToastContentBuilder;
    /// <summary>
    /// Semantically identifies that the content in the group must either be displayed as a whole, or not displayed if it cannot fit. Groups also allow creating multiple columns.
    /// </summary>
    function AddGroup(Item: TToastGroup): TToastContentBuilder;
    /// <summary>
    /// Specifies a sound to play when a toast notification is displayed. This element also allows you to mute any toast notification audio.
    /// </summary>
    function Audio(Item: TToastAudio): TToastContentBuilder;
    /// <summary>
    /// The amount of time the toast should display.
    /// </summary>
    /// <seealso>https://learn.microsoft.com/en-us/dotnet/api/microsoft.toolkit.uwp.notifications.toastcontentbuilder.settoastduration</seealso>
    function Duration(const Value: TToastDuration): TToastContentBuilder;
    /// <summary>
    /// The scenario your toast is used for, like an alarm or reminder.
    /// </summary>
    /// <seealso>https://learn.microsoft.com/en-us/dotnet/api/microsoft.toolkit.uwp.notifications.toastcontent.scenario</seealso>
    function Scenario(const Value: TToastScenario): TToastContentBuilder;
    /// <summary>
    /// The type of activation this header will use when clicked.
    /// </summary>
    function ActivationType(const Value: TActivationType): TToastContentBuilder;
    /// <summary>
    /// A string that is passed to the application when it is activated by the toast. The format and contents of this string are defined by the app for its own use. When the user taps or clicks the toast to launch its associated app, the launch string provides the context to the app that allows it to show the user a view relevant to the toast content, rather than launching in its default way.
    /// </summary>
    function Launch(const Value: string): TToastContentBuilder;
    /// <summary>
    /// Introduced in Creators Update: Overrides the default timestamp with a custom timestamp representing when your notification content was actually delivered, rather than the time the notification was received by the Windows platform.
    /// </summary>
    function DisplayTimestamp(const Value: TDateTime): TToastContentBuilder;
    /// <summary>
    /// Specifies whether styled buttons should be used. The styling of the button is determined by the **hint-buttonStyle** attribute of the action element.
    /// </summary>
    function UseButtonStyle(const Value: Boolean): TToastContentBuilder;
    /// <summary>
    /// The version of the toast XML schema this particular payload was developed for.
    /// </summary>
    function Version(const Value: Integer): TToastContentBuilder;
    /// <summary>
    /// The target locale of the XML payload, specified as BCP-47 language tags such as "en-US" or "fr-FR". This locale is overridden by any locale specified in binding or text. If this value is a literal string, this attribute defaults to the user's UI language. If this value is a string reference, this attribute defaults to the locale chosen by Windows Runtime in resolving the string.
    /// </summary>
    function Lang(const Value: string): TToastContentBuilder;
    /// <summary>
    /// A default base URI that is combined with relative URIs in image source attributes.
    /// </summary>
    function BaseUri(const Value: string): TToastContentBuilder;
    /// <summary>
    /// Set to "true" to allow Windows to append a query string to the image URI supplied in the toast notification. Use this attribute if your server hosts images and can handle query strings, either by retrieving an image variant based on the query strings or by ignoring the query string and returning the image as specified without the query string. This query string specifies scale, contrast setting, and language; for instance, a value of
    /// "www.website.com/images/hello.png"
    /// given in the notification becomes
    /// "www.website.com/images/hello.png?ms-scale=100&ms-contrast=standard&ms-lang=en-us"
    /// </summary>
    function AddImageQuery(const Value: Boolean): TToastContentBuilder;
    constructor Create;
    destructor Destroy; override;
  end;

  TNotificationManager = class(TComponent)
  private
    const
      VALUE_NAME = 'DisplayName';
      VALUE_ICON = 'IconUri';
      VALUE_ACTIVATOR = 'CustomActivator';
      VALUE_SETTINGS = 'ShowInSettings';
      VALUE_LAUNCH = 'LaunchUri';
  private
    FNotifier: IToastNotifier;
    FNotifier2: IToastNotifier2;
    FNotifierCollectionManager: IToastCollectionManager;
    FAppID: string;
    FRegPath: string;
    FRegistry: TRegistry;
    FRegSettingsPath: string;
    procedure RebuildNotifier;
    function HasRegistryRecord: boolean;
    function GetModuleName: string;
    function GetAppIcon: string;
    function GetAppName: string;
    function GetAppLaunch: string;
    function GetAppActivator: string;
    function GetShowSettings: boolean;
    function GetHideLockScreen: Boolean;
    function GetShowBanner: Boolean;
    function GetShowInActionCenter: Boolean;
    function GetRank: TNotificationRank;
    function GetStatusInteractionCount: integer;
    function GetStatusNotificationCount: integer;
    procedure SetAppID(const Value: string);
    procedure SetAppIcon(const Value: string);
    procedure SetAppName(const Value: string);
    procedure SetAppLaunch(const Value: string);
    procedure SetAppActivator(const Value: string);
    procedure SetShowSettings(const Value: Boolean);
    procedure SetHideLockScreen(const Value: Boolean);
    procedure SetShowBanner(const Value: Boolean);
    procedure SetShowInActionCenter(const Value: Boolean);
    procedure SetRank(const Value: TNotificationRank);
    procedure CreateRegistryRecord;
  protected {in work}
    // Collections
    function CreateToastCollection(const Id, DisplayName, LaunchArgs, IconUri: string): IToastCollection;
  public
    // Notificaitons
    procedure ShowNotification(Notification: TNotification);
    procedure HideNotification(Notification: TNotification);
    procedure UpdateNotification(Notification: TNotification);
    // App
    property ApplicationIdentifier: string read FAppID write SetAppID;
    property ApplicationName: string read GetAppName write SetAppName;
    property ApplicationIcon: string read GetAppIcon write SetAppIcon;
    property ApplicationLaunch: string read GetAppLaunch write SetAppLaunch;
    property CustomActivator: string read GetAppActivator write SetAppActivator;
    property ShowInSettings: Boolean read GetShowSettings write SetShowSettings;
    procedure CustomAudioMode(const AudioMode: TAudioMode; const SoundFilePath: string = '');
    // Action Center Settings
    property HideOnLockScreen: Boolean read GetHideLockScreen write SetHideLockScreen;
    property ShowBanner: Boolean read GetShowBanner write SetShowBanner;
    property ShowInActionCenter: Boolean read GetShowInActionCenter write SetShowInActionCenter;
    property Rank: TNotificationRank read GetRank write SetRank;
    // Status and telemetry
    property TotalNotificationCount: integer read GetStatusNotificationCount;
    property TotalInteractionCount: integer read GetStatusInteractionCount;
    // Utils
    procedure DeleteRegistryRecord;
    //
    constructor Create(AOwner: TComponent; const ApplicationID: string); reintroduce; virtual;
    destructor Destroy; override;
  end;

const
  IID_IToastNotifier2: TGUID = '{354389C6-7C01-4BD5-9C20-604340CD2B74}';
  IID_IToastNotification2: TGUID = '{9DFB9FD1-143A-490E-90BF-B9FBA7132DE7}';
  IID_IToastNotification3: TGUID = '{31E8AED8-8141-4F99-BC0A-C4ED21297D77}';
  IID_IToastNotification4: TGUID = '{15154935-28EA-4727-88E9-C58680E2D118}';
  IID_IToastNotification6: TGUID = '{43EBFE53-89AE-5C1E-A279-3AECFE9B6F54}';
  IID_IScheduledToastNotifier: TGUID = '{79F577F8-0DE7-48CD-9740-9B370490C838}';

implementation

function FactoryCreateInstance(const Name: string): IInspectable;
begin
  Result := nil;
  // Activate the instance
  if Failed(RoActivateInstance(TWindowsString.Create(Name), Result)) then
    raise Exception.Create('Could not create notification data.');
end;

function BooleanToXml(const Value: Boolean): string;
begin
  if Value then
    Exit('true')
  else
    Exit('false');
end;

{ TNotificationManager }

constructor TNotificationManager.Create(AOwner: TComponent; const ApplicationID: string);
begin
  inherited Create(AOwner);
  // Generate default ID
  ApplicationIdentifier := GetModuleName;
  FRegistry := TRegistry.Create(KEY_ALL_ACCESS);
  FRegistry.RootKey := HKEY_CURRENT_USER;
  FRegistry.LazyWrite := False;
  SetAppID(ApplicationID);
end;

procedure TNotificationManager.CreateRegistryRecord;
begin
  if not HasRegistryRecord then
  begin
    FRegistry.CreateKey(FRegPath);
    SetAppName(''); // module name
  end;
end;

function TNotificationManager.CreateToastCollection(const Id, DisplayName, LaunchArgs, IconUri: string): IToastCollection;
begin
  Result := TToastCollection.CreateInstance(
    TWindowsString.Create(Id),
    TWindowsString.Create(DisplayName),
    TWindowsString.Create(LaunchArgs),
    TUri.CreateUri(TWindowsString.Create(IconUri)));

  //var Mgr := TToastCollectionManager.Create;
       {
  var Instance := FactoryCreateInstance('Windows.UI.Notifications.ToastNotificationManagerForUser');
  var Mgr: IToastNotificationManagerForUser;
  Instance.QueryInterface(IToastNotificationManagerForUser, Mgr);
}
end;

procedure TNotificationManager.CustomAudioMode(const AudioMode: TAudioMode; const SoundFilePath: string);
begin
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;

  const VAL = 'SoundFile';
  case AudioMode of
    TAudioMode.Default:
      if FRegistry.ValueExists(VAL) then
        FRegistry.DeleteValue(VAL);
    TAudioMode.Muted:
      FRegistry.WriteString(VAL, '');
    TAudioMode.Custom:
      FRegistry.WriteString(VAL, SoundFilePath);
  end;
end;

procedure TNotificationManager.DeleteRegistryRecord;
begin
  FRegistry.DeleteKey(FRegPath);
end;

destructor TNotificationManager.Destroy;
begin
  FRegistry.Free;
  FNotifier := nil;
  inherited;
end;

function TNotificationManager.GetAppActivator: string;
begin
  Result := '';
  if not FRegistry.OpenKeyReadOnly(FRegPath) then
    Exit;
  if HasRegistryRecord then
    if FRegistry.ValueExists(VALUE_ACTIVATOR) then
      Result := FRegistry.ReadString(VALUE_ACTIVATOR);
end;

function TNotificationManager.GetAppIcon: string;
begin
  Result := '';
  if not FRegistry.OpenKeyReadOnly(FRegPath) then
    Exit;
  if HasRegistryRecord then
    if FRegistry.ValueExists(VALUE_ICON) then
      Result := FRegistry.ReadString(VALUE_ICON);
end;

function TNotificationManager.GetAppLaunch: string;
begin
  Result := '';
  if not FRegistry.OpenKeyReadOnly(FRegPath) then
    Exit;
  if HasRegistryRecord then
    if FRegistry.ValueExists(VALUE_LAUNCH) then
      Result := FRegistry.ReadString(VALUE_LAUNCH);
end;

function TNotificationManager.GetAppName: string;
begin
  Result := '';
  if not FRegistry.OpenKeyReadOnly(FRegPath) then
    Exit;
  if HasRegistryRecord then
    if FRegistry.ValueExists(VALUE_NAME) then
      Result := FRegistry.ReadString(VALUE_NAME);
end;

function TNotificationManager.GetHideLockScreen: Boolean;
begin
  Result := False;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'AllowContentAboveLock';

  if FRegistry.ValueExists(VAL) then
    Result := FRegistry.ReadBool(VAL);
end;

function TNotificationManager.GetModuleName: string;
begin
  Result := ExtractFileName(ParamStr(0));
end;

function TNotificationManager.GetRank: TNotificationRank;
begin
  Result := TNotificationRank.Default;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'ShowInActionCenter';

  if FRegistry.ValueExists(VAL) then
    case FRegistry.ReadInteger(VAL) of
      0:
        Result := TNotificationRank.Normal;
      1..98:
        Result := TNotificationRank.High;
      99..1000:
        Result := TNotificationRank.Topmost;
    end;
end;

function TNotificationManager.GetShowBanner: Boolean;
begin
  Result := False;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'ShowBanner';

  if FRegistry.ValueExists(VAL) then
    Result := FRegistry.ReadBool(VAL);
end;

function TNotificationManager.GetShowInActionCenter: Boolean;
begin
  Result := False;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'ShowInActionCenter';

  if FRegistry.ValueExists(VAL) then
    Result := FRegistry.ReadBool(VAL);
end;

function TNotificationManager.GetShowSettings: boolean;
begin
  Result := true;
  if not FRegistry.OpenKeyReadOnly(FRegPath) then
    Exit;
  if HasRegistryRecord then
    if FRegistry.ValueExists(VALUE_SETTINGS) then
      Result := FRegistry.ReadInteger(VALUE_SETTINGS) = 1;
end;

function TNotificationManager.GetStatusInteractionCount: integer;
begin
  Result := 0;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'PeriodicInteractionCount';

  if FRegistry.ValueExists(VAL) then
    Result := FRegistry.ReadInteger(VAL);
end;

function TNotificationManager.GetStatusNotificationCount: integer;
begin
  Result := 0;
  if not FRegistry.OpenKeyReadOnly(FRegSettingsPath) then
    Exit;
  const VAL = 'PeriodicNotificationCount';

  if FRegistry.ValueExists(VAL) then
    Result := FRegistry.ReadInteger(VAL);
end;

function TNotificationManager.HasRegistryRecord: boolean;
begin
  Result := FRegistry.KeyExists(FRegPath);
end;

procedure TNotificationManager.HideNotification(Notification: TNotification);
begin
  if not Notification.Posted then
    Exit;

  FNotifier.Hide(Notification.Toast);
end;

procedure TNotificationManager.RebuildNotifier;
begin
  FNotifier := nil;
  FNotifier2 := nil;
  FNotifierCollectionManager := nil;

  // Create IToastInterface
  try
    FNotifier := TToastNotificationManager.CreateToastNotifier(TWindowsString.Create(FAppID));
  except
    raise ENotificationNotInited.Create('Can''t to use IToastNotifier. Not initiated');
  end;

  // Query IToastInterace2
  if not Supports(FNotifier, IToastNotifier2, FNotifier2) then
    raise ENotificationNotInited.Create('Can''t to use IToastNotifier2. Not initiated');
end;

procedure TNotificationManager.SetAppActivator(const Value: string);
begin
  CreateRegistryRecord;
  if not FRegistry.OpenKey(FRegPath, True) then
    Exit;

  FRegistry.WriteString(VALUE_ACTIVATOR, Value);
end;

procedure TNotificationManager.SetAppIcon(const Value: string);
begin
  CreateRegistryRecord;
  if not FRegistry.OpenKey(FRegPath, True) then
    Exit;

  if Value <> '' then
    FRegistry.WriteString(VALUE_ICON, Value)
  else if FRegistry.ValueExists(VALUE_ICON) then
    FRegistry.DeleteValue(VALUE_ICON);
end;

procedure TNotificationManager.SetAppID(const Value: string);
var
  PreviousPath, PreviousSettingPath: string;
  PreviousRecord: boolean;
begin
  if FAppID = Value then
    Exit;

  // Previous
  PreviousRecord := (FAppID <> '') and HasRegistryRecord;
  PreviousPath := FRegPath;
  PreviousSettingPath := FRegSettingsPath;

  // Set
  FAppID := Value;
  FRegPath := Format('\Software\Classes\AppUserModelId\%S', [FAppID]);
  FRegSettingsPath := Format('\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\%S', [FAppID]);
  RebuildNotifier;

  // Rename App Identifier
  if PreviousRecord then
  begin
    if FRegistry.KeyExists(PreviousPath) then
      FRegistry.MoveKey(PreviousPath, FAppID, True);
    if FRegistry.KeyExists(PreviousSettingPath) then
      FRegistry.MoveKey(PreviousSettingPath, FRegSettingsPath, True);
  end;
end;

procedure TNotificationManager.SetAppLaunch(const Value: string);
begin
  CreateRegistryRecord;
  if not FRegistry.OpenKey(FRegPath, True) then
    Exit;

  if Value <> '' then
    FRegistry.WriteString(VALUE_LAUNCH, Value)
  else if FRegistry.ValueExists(VALUE_LAUNCH) then
    FRegistry.DeleteValue(VALUE_LAUNCH);
end;

procedure TNotificationManager.SetAppName(const Value: string);
begin
  CreateRegistryRecord;
  if not FRegistry.OpenKey(FRegPath, True) then
    Exit;

  if Value <> '' then
    FRegistry.WriteString(VALUE_NAME, Value)
  else
    FRegistry.WriteString(VALUE_NAME, GetModuleName);
end;

procedure TNotificationManager.SetShowBanner(const Value: Boolean);
begin
  const VAL = 'ShowBanner';
  if not FRegistry.OpenKey(FRegSettingsPath, True) then
    Exit;

  FRegistry.WriteBool(VAL, Value);
end;

procedure TNotificationManager.SetShowInActionCenter(const Value: Boolean);
begin
  const VAL = 'ShowInActionCenter';
  if not FRegistry.OpenKey(FRegSettingsPath, True) then
    Exit;

  FRegistry.WriteBool(VAL, Value);
end;

procedure TNotificationManager.SetShowSettings(const Value: Boolean);
begin
  CreateRegistryRecord;
  if not FRegistry.OpenKey(FRegPath, True) then
    Exit;

  if Value = false then
    FRegistry.WriteInteger(VALUE_SETTINGS, 0)
  else if FRegistry.ValueExists(VALUE_SETTINGS) then
    FRegistry.DeleteValue(VALUE_SETTINGS);
end;

procedure TNotificationManager.SetHideLockScreen(const Value: Boolean);
begin
  const VAL = 'AllowContentAboveLock';
  if not FRegistry.OpenKey(FRegSettingsPath, True) then
    Exit;

  FRegistry.WriteBool(VAL, Value);
end;

procedure TNotificationManager.SetRank(const Value: TNotificationRank);
begin
  const VAL = 'ShowInActionCenter';
  if not FRegistry.OpenKey(FRegSettingsPath, True) then
    Exit;

  case Value of
    TNotificationRank.Default:
      if FRegistry.ValueExists(VAL) then
        FRegistry.DeleteValue(VAL);
    TNotificationRank.Normal:
      FRegistry.WriteInteger(VAL, 0);
    TNotificationRank.High:
      FRegistry.WriteInteger(VAL, 1);
    TNotificationRank.Topmost:
      FRegistry.WriteInteger(VAL, 99);
  end;
end;

procedure TNotificationManager.ShowNotification(Notification: TNotification);
begin
  if Notification.Posted then
    raise ENotificationAlreadyPosted.Create('Notification has already been posted.');

  // Register
  CreateRegistryRecord;

  // Show
  FNotifier.Show(Notification.Toast);

  // Status
  Notification.FPosted := True;
end;

procedure TNotificationManager.UpdateNotification(Notification: TNotification);
begin
  if not Notification.Posted then
    raise ENotificationNotPosted.Create('Notification is not active.');

  if Notification.Tag.IsEmpty then
    raise ENotificationTagNeeded.Create('Tag is required to update notification.');

  // Get data
  var Data := Notification.Data;

  var Result: NotificationUpdateResult;
  if Notification.Group.IsEmpty then
    Result := FNotifier2.Update(Data.Data, TWindowsString.Create(Notification.Tag))
  else
    Result := FNotifier2.Update(Data.Data, TWindowsString.Create(Notification.Tag), TWindowsString.Create(Notification.Group));

  if Result <> NotificationUpdateResult.Succeeded then
    raise ENotificationUpdate.CreateFmt('Update procedure or IToastNotifier2 failed, with a result of: %D', [integer(Result)]);
end;

{ TNotificationActivatedHandler }

constructor TNotificationActivatedHandler.Create(const ANotification: TNotification);
begin
  inherited;
  FToken := FNotification.Toast.add_Activated(Self);
end;

procedure TNotificationActivatedHandler.Invoke(sender: IToastNotification; args: IInspectable);
begin
  const Data = args as IToastActivatedEventArgs;
  const Data2 = args as IToastActivatedEventArgs2;

  const Map = TUserInputMap.Create(Data2.UserInput as IMap_2__HSTRING__HSTRING);
  try
    if Assigned(FNotification.FOnActivated) then
      FNotification.FOnActivated(FNotification, Data.Arguments.ToString, Map);
  finally
    Map.Free;
  end;
end;

procedure TNotificationActivatedHandler.Unscribe;
begin
  FNotification.Toast.remove_Activated(FToken);
end;

{ TNotificationDismissedHandler }

constructor TNotificationDismissedHandler.Create(const ANotification: TNotification);
begin
  inherited;
  FToken := FNotification.Toast.add_Dismissed(Self);
end;

procedure TNotificationDismissedHandler.Invoke(sender: IToastNotification; args: IToastDismissedEventArgs);
begin
  if Assigned(FNotification.FOnDismissed) then
    FNotification.FOnDismissed(FNotification, args.Reason);
end;

procedure TNotificationDismissedHandler.Unscribe;
begin
  FNotification.Toast.remove_Dismissed(FToken);
end;

{ TNotificationFailedHandler }

constructor TNotificationFailedHandler.Create(const ANotification: TNotification);
begin
  inherited;
  FToken := FNotification.Toast.add_Failed(Self);
end;

procedure TNotificationFailedHandler.Invoke(sender: IToastNotification; args: IToastFailedEventArgs);
begin
  if Assigned(FNotification.FOnFailed) then
    FNotification.FOnFailed(FNotification, args.ErrorCode);
end;

procedure TNotificationFailedHandler.Unscribe;
begin
  FNotification.Toast.remove_Failed(FToken);
end;

{ TToastContentBuilder }

function TToastContentBuilder.ActivationType(const Value: TActivationType): TToastContentBuilder;
begin
  FXML.Attributes['activationType'] := Value.ToString;
  Result := Self;
end;

function TToastContentBuilder.AddAction(Item: TToastContentItem; const Name: string): TToastContentBuilder;
begin
  var Node := Item.GetNodeAndFree;
  Node.TagName := Name;
  FXMLActions.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastContentBuilder.AddBinding(Item: TToastContentItem; const Name: string): TToastContentBuilder;
begin
  var Node := Item.GetNodeAndFree;
  Node.TagName := Name;
  FXMLBinding.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastContentBuilder.AddButton(Item: TToastAction): TToastContentBuilder;
begin
  Result := AddAction(Item, 'action');
end;

function TToastContentBuilder.AddGeneral(Item: TToastContentItem; const Name: string): TToastContentBuilder;
begin
  var Node := Item.GetNodeAndFree;
  Node.TagName := Name;
  FXML.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastContentBuilder.AddGroup(Item: TToastGroup): TToastContentBuilder;
begin
  Result := AddBinding(Item, 'group');
end;

function TToastContentBuilder.AddHeader(Item: TToastHeader): TToastContentBuilder;
begin
  Result := AddGeneral(Item, 'header');
end;

function TToastContentBuilder.AddImage(Item: TToastImage): TToastContentBuilder;
begin
  Result := AddBinding(Item, 'image');
end;

function TToastContentBuilder.AddImageQuery(const Value: Boolean): TToastContentBuilder;
begin
  FXMLVisual.Attributes['addImageQuery'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastContentBuilder.AddVisual(Item: TToastContentItem; const Name: string): TToastContentBuilder;
begin
  var Node := Item.GetNodeAndFree;
  Node.TagName := Name;
  FXMLVisual.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastContentBuilder.AddInputBox(Item: TToastTextBox): TToastContentBuilder;
begin
  Item.InputType('text');
  Result := AddAction(Item, 'input');
end;

function TToastContentBuilder.AddProgressBar(Item: TToastProgressBar): TToastContentBuilder;
begin
  Result := AddBinding(Item, 'progress');
end;

function TToastContentBuilder.AddText(Item: TToastText): TToastContentBuilder;
begin
  Result := AddBinding(Item, 'text');
end;

function TToastContentBuilder.Audio(Item: TToastAudio): TToastContentBuilder;
begin
  Result := AddGeneral(Item, 'audio');
end;

function TToastContentBuilder.BaseUri(const Value: string): TToastContentBuilder;
begin
  FXMLVisual.Attributes['baseUri'] := Value;
  Result := Self;
end;

function TToastContentBuilder.AddSelectionBox(Item: TToastSelectionBox): TToastContentBuilder;
begin
  Item.InputType('selection');
  Result := AddAction(Item, 'input');
end;

constructor TToastContentBuilder.Create;
begin
  inherited;
  FXML := TWinXMLDocument.Create;
  FXML.TagName := 'toast';

  FXMLVisual := FXML.Nodes.AddNode('visual');
  FXMLBinding := FXMLVisual.Nodes.AddNode('binding');
  FXMLBinding.Attributes['template'] := 'ToastGeneric';
  FXMLActions := FXML.Nodes.AddNode('actions');
end;

destructor TToastContentBuilder.Destroy;
begin
  FXML.Free;
  inherited;
end;

function TToastContentBuilder.DisplayTimestamp(const Value: TDateTime): TToastContentBuilder;
begin
  FXML.Attributes['displayTimestamp'] := Value.ToISO8601;
  Result := Self;
end;

function TToastContentBuilder.GenerateXML: TDomXMLDocument;
begin
  Result := TDomXMLDocument.Create;
  Result.Parse(FXML.OuterXML);
end;

function TToastContentBuilder.Lang(const Value: string): TToastContentBuilder;
begin
  FXMLVisual.Attributes['lang'] := Value;
  Result := Self;
end;

function TToastContentBuilder.Launch(const Value: string): TToastContentBuilder;
begin
  FXML.Attributes['launch'] := Value;
  Result := Self;
end;

function TToastContentBuilder.UseButtonStyle(const Value: Boolean): TToastContentBuilder;
begin
  FXML.Attributes['useButtonStyle'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastContentBuilder.Version(const Value: Integer): TToastContentBuilder;
begin
  FXMLVisual.Attributes['version'] := Value.ToString;
  Result := Self;
end;

function TToastContentBuilder.Duration(const Value: TToastDuration): TToastContentBuilder;
begin
  FXML.Attributes['duration'] := Value.ToString;
  Result := Self;
end;

function TToastContentBuilder.Scenario(const Value: TToastScenario): TToastContentBuilder;
begin
  FXML.Attributes['scenario'] := Value.ToString;
  Result := Self;
end;

{ TNotification }

function TNotification.Content: TXMLInterface;
begin
  Result := FToast.Content;
end;

constructor TNotification.Create(AOwner: TComponent; Content: TToastContentBuilder);
begin
  try
    inherited Create(AOwner);
    var XML := Content.GenerateXML;
    try
      Initiate(XML.DomXML);
    finally
      XML.Free;
    end;
    SetData(TNotificationData.Create);
  finally
    Content.Free;
  end;
end;

destructor TNotification.Destroy;
begin
  FreeEvents;
  FToast := nil;
  FToast2 := nil;
  FToast3 := nil;
  FToast4 := nil;
  FToast6 := nil;
  FData.Free;

  inherited;
end;

procedure TNotification.FreeEvents;
begin
  if FHandleActivated <> nil then
  begin
    FHandleActivated.Unscribe;
    FHandleActivated := nil;
  end;
  if FHandleDismissed <> nil then
  begin
    FHandleDismissed.Unscribe;
    FHandleDismissed := nil;
  end;
  if FHandleFailed <> nil then
  begin
    FHandleFailed.Unscribe;
    FHandleFailed := nil;
  end;
end;

function TNotification.GetExireReboot: boolean;
begin
  Result := FToast6.ExpiresOnReboot;
end;

function TNotification.GetExpiration: TDateTime;
begin
  Result := DateTimeToTDateTime(FToast.ExpirationTime.Value);
end;

function TNotification.GetGroup: string;
begin
  const HStr = FToast2.Group;
  Result := HStr.ToString;
  WindowsDeleteString(HStr);
end;

function TNotification.GetMirroring: NotificationMirroring;
begin
  Result := FToast3.NotificationMirroring_;
end;

function TNotification.GetPriority: ToastNotificationPriority;
begin
  Result := FToast4.Priority;
end;

function TNotification.GetRemoteID: string;
begin
  const HStr = FToast3.RemoteId;
  Result := HStr.ToString;
  WindowsDeleteString(HStr);
end;

function TNotification.GetSuppress: boolean;
begin
  Result := FToast2.SuppressPopup;
end;

function TNotification.GetTag: string;
begin
  const HStr = FToast2.Tag;
  Result := HStr.ToString;
  WindowsDeleteString(HStr);
end;

procedure TNotification.Initiate(XML: Xml_Dom_IXmlDocument);
begin
  FToast := TToastNotification.CreateToastNotification(XML);

  if Supports(FToast, IID_IToastNotification2) then
    FToast.QueryInterface(IID_IToastNotification2, FToast2);
  if Supports(FToast, IID_IToastNotification3) then
    FToast.QueryInterface(IID_IToastNotification3, FToast3);
  if Supports(FToast, IID_IToastNotification4) then
    FToast.QueryInterface(IID_IToastNotification4, FToast4);
  if Supports(FToast, IID_IToastNotification6) then
    FToast.QueryInterface(IID_IToastNotification6, FToast6);

  if Supports(FToast, IID_IScheduledToastNotifier) then
    FToast.QueryInterface(IID_IScheduledToastNotifier, FToastScheduled);
end;

procedure TNotification.Reset;
begin
  const PrevToast = FToast;
  const PrevToast2 = FToast2;
  const PrevToast3 = FToast2;
  const PrevToast4 = FToast2;
  const PrevToast6 = FToast2;

  // Events
  FreeEvents;

  // Clear
  FPosted := false;

  FToast := nil;
  FToast2 := nil;
  FToast3 := nil;
  FToast4 := nil;
  FToast6 := nil;

  // Create
  Initiate(prevToast.Content);

  FToast.ExpirationTime := prevToast.ExpirationTime;
  if not PrevToast2.Tag.ToString.IsEmpty then
    FToast2.Tag := PrevToast2.Tag;
  if not PrevToast2.Group.ToString.IsEmpty then
    FToast2.Group := PrevToast2.Group;
  FToast2.SuppressPopup := PrevToast2.SuppressPopup;
  FToast3.NotificationMirroring_ := FToast3.NotificationMirroring_;
  if not FToast3.RemoteId.ToString.IsEmpty then
    FToast3.RemoteId := FToast3.RemoteId;
  FToast4.Priority := FToast4.Priority;
  FToast6.ExpiresOnReboot := FToast6.ExpiresOnReboot;

  // Reset data
  FToast4.Data := FData.Data;
end;

procedure TNotification.SetData(const Value: TNotificationData);
begin
  FData := Value;
  FToast4.Data := Value.Data;
end;

procedure TNotification.SetEventActivated(const Value: TOnToastActivated);
begin
  FOnActivated := Value;

  if @FOnActivated = nil then
    FHandleActivated := nil
  else
    FHandleActivated := TNotificationActivatedHandler.Create(Self);
end;

procedure TNotification.SetEventDismissed(const Value: TOnToastDismissed);
begin
  FOnDismissed := Value;

  if @FOnDismissed = nil then
    FHandleDismissed := nil
  else
    FHandleDismissed := TNotificationDismissedHandler.Create(Self);
end;

procedure TNotification.SetEventFailed(const Value: TOnToastFailed);
begin
  FOnFailed := Value;
  if @FOnFailed = nil then
    FHandleFailed := nil
  else
    FHandleFailed := TNotificationFailedHandler.Create(Self);
end;

procedure TNotification.SetExpiration(const Value: TDateTime);
var
  Reference: IReference_1__DateTime;
begin
  // Create a new instance of IReference_1__DateTime
  TPropertyValue.CreateDateTime(TDateTimeToDateTime(Value)).QueryInterface(IReference_1__DateTime, Reference);

  // Now you can assign this reference to ExpirationTime
  FToast.ExpirationTime := Reference;
end;

procedure TNotification.SetExpireReboot(const Value: boolean);
begin
  FToast6.ExpiresOnReboot := Value;
end;

procedure TNotification.SetGroup(const Value: string);
begin
  FToast2.Group := TWindowsString.Create(Value);
end;

procedure TNotification.SetMirroring(const Value: NotificationMirroring);
begin
  FToast3.NotificationMirroring_ := Value;
end;

procedure TNotification.SetPriority(const Value: ToastNotificationPriority);
begin
  FToast4.Priority := Value;
end;

procedure TNotification.SetRemoteID(const Value: string);
begin
  FToast3.RemoteId := TWindowsString.Create(Value);
end;

procedure TNotification.SetSuppress(const Value: boolean);
begin
  FToast2.SuppressPopup := Value;
end;

procedure TNotification.SetTag(const Value: string);
begin
  FToast2.Tag := TWindowsString.Create(Value);
end;

{ TNotificationData }

procedure TNotificationData.Clear;
begin
  Data.Values.Clear;
end;

constructor TNotificationData.Create;
begin
  inherited;
  FactoryCreateInstance('Windows.UI.Notifications.NotificationData').QueryInterface(INotificationData, Data);
end;

destructor TNotificationData.Destroy;
begin
  Data := nil;
  inherited;
end;

function TNotificationData.GetSeq: cardinal;
begin
  Result := Data.SequenceNumber;
end;

function TNotificationData.GetValue(Key: string): string;
begin
  const HKey = TWindowsString.Create(Key);
  if Data.Values.HasKey(HKey) then
  begin
    const HData = Data.Values.Lookup(HKey);
    try
      Result := HData.ToString;
    finally
      WindowsDeleteString(HData);
    end;
  end;
end;

procedure TNotificationData.IncreaseSequence;
begin
  SequenceNumber := SequenceNumber + 1;
end;

procedure TNotificationData.SetSeq(const Value: cardinal);
begin
  Data.SequenceNumber := Value;
end;

procedure TNotificationData.SetValue(Key: string; const Value: string);
begin
  const HKey = TWindowsString.Create(Key);
  const HData = TWindowsString.Create(Value);
  if Data.Values.HasKey(HKey) then
    Data.Values.Remove(HKey);

  Data.Values.Insert(HKey, HData);
end;

function TNotificationData.ValueCount: cardinal;
begin
  Result := Data.Values.Size;
end;

function TNotificationData.ValueExists(Key: string): boolean;
begin
  Result := Data.Values.HasKey(TWindowsString.Create(Key));
end;

{ TNotificationEventHandler }

constructor TNotificationEventHandler.Create(const ANotification: TNotification);
begin
  FNotification := ANotification;
  FToken.Value := -1;
end;

destructor TNotificationEventHandler.Destroy;
begin
  FNotification := nil;
  inherited;
end;

{ TUserInputMap }

constructor TUserInputMap.Create(LookupMap: IMap_2__HSTRING__HSTRING);
begin
  inherited Create;
  FMap := LookupMap;
end;

destructor TUserInputMap.Destroy;
begin
  FMap := nil;
  inherited;
end;

function TUserInputMap.GetIntValue(ID: string): integer;
begin
  const HStr = TWindowsString.Create(ID);
  if not FMap.HasKey(HStr) then
    Exit(0);
  Result := IPropertyValue(FMap.Lookup(HStr)).GetInt32;
end;

function TUserInputMap.GetStringValue(ID: string): string;
begin
  const HStr = TWindowsString.Create(ID);
  if not FMap.HasKey(HStr) then
    Exit('');
  const HRes = IPropertyValue(FMap.Lookup(HStr)).GetString;
  try
    Result := HRes.ToString;
  finally
    WindowsDeleteString(HRes);
  end;
end;

function TUserInputMap.HasValue(ID: string): boolean;
begin
  Result := FMap.HasKey(TWindowsString.Create(ID));
end;

{ TToastTextPlacementHelper }

function TToastTextPlacementHelper.ToString: string;
begin
  case Self of
    TToastTextPlacement.None:
      Exit('');
    TToastTextPlacement.Attribution:
      Exit('attribution');
  else
    Abort;
  end;
end;

{ TToastProgressBar }

constructor TToastProgressBar.Create;
begin
  inherited;
  FNode.Attributes['status'] := '';
end;

function TToastProgressBar.Status(const Value: string): TToastProgressBar;
begin
  FNode.Attributes['status'] := Value;
  Result := Self;
end;

function TToastProgressBar.Title(const Value: string): TToastProgressBar;
begin
  FNode.Attributes['title'] := Value;
  Result := Self;
end;

function TToastProgressBar.Value(const Value: Single): TToastProgressBar;
begin
  FNode.Attributes['value'] := Value.ToString;
  Result := Self;
end;

function TToastProgressBar.Value(const Value: string): TToastProgressBar;
begin
  FNode.Attributes['value'] := Value;
  Result := Self;
end;

function TToastProgressBar.ValueIndeterminate: TToastProgressBar;
begin
  FNode.Attributes['value'] := 'indeterminate';
  Result := Self;
end;

function TToastProgressBar.ValueStringOverride(const Value: string): TToastProgressBar;
begin
  FNode.Attributes['valueStringOverride'] := Value;
  Result := Self;
end;

{ TToastContentItem }

constructor TToastContentItem.Create;
begin
  inherited;
  FNode := TWinXMLNode.Create;
end;

destructor TToastContentItem.Destroy;
begin
  FNode.Free;
  inherited;
end;

function TToastContentItem.GetNodeAndFree: TWinXMLNode;
begin
  Result := FNode;
  FNode := nil;
  Free;
end;

{ TToastText }

function TToastText.HintAlign(const Value: TToastTextAlign): TToastText;
begin
  FNode.Attributes['hint-align'] := Value.ToString;
  Result := Self;
end;

function TToastText.HintMaxLines(const Value: Integer): TToastText;
begin
  FNode.Attributes['hint-maxLines'] := Value.ToString;
  Result := Self;
end;

function TToastText.HintMinLines(const Value: Integer): TToastText;
begin
  FNode.Attributes['hint-minLines'] := Value.ToString;
  Result := Self;
end;

function TToastText.HintStyle(const Value: TToastTextStyle): TToastText;
begin
  FNode.Attributes['hint-style'] := Value.ToString;
  Result := Self;
end;

function TToastText.HintWrap(const Value: Boolean): TToastText;
begin
  FNode.Attributes['hint-wrap'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastText.Language(const Value: string): TToastText;
begin
  FNode.Attributes['lang'] := Value;
  Result := Self;
end;

function TToastText.Placement(const Value: TToastTextPlacement): TToastText;
begin
  FNode.Attributes['placement'] := Value.ToString;
  Result := Self;
end;

function TToastText.Text(const Value: string): TToastText;
begin
  FNode.Contents := Value;
  Result := Self;
end;

function TToastText.HintСallScenarioCenterAlign(const Value: Boolean): TToastText;
begin
  FNode.Attributes['hint-callScenarioCenterAlign'] := BooleanToXml(Value);
  Result := Self;
end;

{ TToastTextStyleHelper }

function TToastTextStyleHelper.ToString: string;
begin
  case Self of
    TToastTextStyle.Default:
      Exit('');
    TToastTextStyle.Caption:
      Exit('caption');
    TToastTextStyle.CaptionSubtle:
      Exit('captionSubtle');
    TToastTextStyle.Body:
      Exit('body');
    TToastTextStyle.BodySubtle:
      Exit('bodySubtle');
    TToastTextStyle.Base:
      Exit('base');
    TToastTextStyle.BaseSubtle:
      Exit('baseSubtle');
    TToastTextStyle.Subtitle:
      Exit('subtitle');
    TToastTextStyle.SubtitleSubtle:
      Exit('subtitleSubtle');
    TToastTextStyle.Title:
      Exit('title');
    TToastTextStyle.TitleSubtle:
      Exit('titleSubtle');
    TToastTextStyle.TitleNumeral:
      Exit('titleNumeral');
    TToastTextStyle.Subheader:
      Exit('subheader');
    TToastTextStyle.SubheaderSubtle:
      Exit('subheaderSubtle');
    TToastTextStyle.SubheaderNumeral:
      Exit('subheaderNumeral');
    TToastTextStyle.Header:
      Exit('header');
    TToastTextStyle.HeaderSubtle:
      Exit('headerSubtle');
    TToastTextStyle.HeaderNumeral:
      Exit('headerNumeral');
  end;
end;

{ TToastTextAlignHelper }

function TToastTextAlignHelper.ToString: string;
begin
  case Self of
    TToastTextAlign.Default:
      Exit('');
    TToastTextAlign.Auto:
      Exit('auto');
    TToastTextAlign.Left:
      Exit('left');
    TToastTextAlign.Center:
      Exit('center');
    TToastTextAlign.Right:
      Exit('right');
  end;
end;

{ TToastAudio }

function TToastAudio.Loop(const Value: Boolean): TToastAudio;
begin
  FNode.Attributes['loop'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastAudio.Silent(const Value: Boolean): TToastAudio;
begin
  FNode.Attributes['silent'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastAudio.Src(const WinSoundEvent: TSoundEventValue): TToastAudio;
begin
  FNode.Attributes['src'] := WinSoundEvent.ToString;
  Result := Self;
end;

function TToastAudio.Src(const Uri: string): TToastAudio;
begin
  FNode.Attributes['src'] := Uri;
  Result := Self;
end;

{ TSoundEventValueHelper }

function TSoundEventValueHelper.ToString: string;
begin
  case Self of
    TSoundEventValue.NotificationDefault:
      Result := 'ms-winsoundevent:Notification.Default';
    TSoundEventValue.NotificationIM:
      Result := 'ms-winsoundevent:Notification.IM';
    TSoundEventValue.NotificationMail:
      Result := 'ms-winsoundevent:Notification.Mail';
    TSoundEventValue.NotificationReminder:
      Result := 'ms-winsoundevent:Notification.Reminder';
    TSoundEventValue.NotificationSMS:
      Result := 'ms-winsoundevent:Notification.SMS';
    TSoundEventValue.NotificationLoopingAlarm:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm';
    TSoundEventValue.NotificationLoopingAlarm2:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm2';
    TSoundEventValue.NotificationLoopingAlarm3:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm3';
    TSoundEventValue.NotificationLoopingAlarm4:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm4';
    TSoundEventValue.NotificationLoopingAlarm5:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm5';
    TSoundEventValue.NotificationLoopingAlarm6:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm6';
    TSoundEventValue.NotificationLoopingAlarm7:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm7';
    TSoundEventValue.NotificationLoopingAlarm8:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm8';
    TSoundEventValue.NotificationLoopingAlarm9:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm9';
    TSoundEventValue.NotificationLoopingAlarm10:
      Result := 'ms-winsoundevent:Notification.Looping.Alarm10';
    TSoundEventValue.NotificationLoopingCall:
      Result := 'ms-winsoundevent:Notification.Looping.Call';
    TSoundEventValue.NotificationLoopingCall2:
      Result := 'ms-winsoundevent:Notification.Looping.Call2';
    TSoundEventValue.NotificationLoopingCall3:
      Result := 'ms-winsoundevent:Notification.Looping.Call3';
    TSoundEventValue.NotificationLoopingCall4:
      Result := 'ms-winsoundevent:Notification.Looping.Call4';
    TSoundEventValue.NotificationLoopingCall5:
      Result := 'ms-winsoundevent:Notification.Looping.Call5';
    TSoundEventValue.NotificationLoopingCall6:
      Result := 'ms-winsoundevent:Notification.Looping.Call6';
    TSoundEventValue.NotificationLoopingCall7:
      Result := 'ms-winsoundevent:Notification.Looping.Call7';
    TSoundEventValue.NotificationLoopingCall8:
      Result := 'ms-winsoundevent:Notification.Looping.Call8';
    TSoundEventValue.NotificationLoopingCall9:
      Result := 'ms-winsoundevent:Notification.Looping.Call9';
    TSoundEventValue.NotificationLoopingCall10:
      Result := 'ms-winsoundevent:Notification.Looping.Call10';
  end;
end;

{ TToastTextBox }

function TToastTextBox.AddArgument(const Name, Value: string): TToastTextBox;
begin
  FNode.Attributes[Name] := Value;
  Result := Self;
end;

function TToastTextBox.DefaultInput(const Value: string): TToastTextBox;
begin
  FNode.Attributes['defaultInput'] := Value;
  Result := Self;
end;

function TToastTextBox.PlaceholderContent(const Value: string): TToastTextBox;
begin
  FNode.Attributes['placeHolderContent'] := Value;
  Result := Self;
end;

function TToastTextBox.Title(const Value: string): TToastTextBox;
begin
  FNode.Attributes['title'] := Value;
  Result := Self;
end;

function TToastTextBox.Id(const Value: string): TToastTextBox;
begin
  FNode.Attributes['id'] := Value;
  Result := Self;
end;

function TToastTextBox.InputType(const Value: string): TToastTextBox;
begin
  FNode.Attributes['type'] := Value;
  Result := Self;
end;

{ TToastSelectionBox }

function TToastSelectionBox.AddArgument(const Name, Value: string): TToastSelectionBox;
begin
  FNode.Attributes[Name] := Value;
  Result := Self;
end;

function TToastSelectionBox.DefaultInput(const Value: string): TToastSelectionBox;
begin
  FNode.Attributes['defaultInput'] := Value;
  Result := Self;
end;

function TToastSelectionBox.Id(const Value: string): TToastSelectionBox;
begin
  FNode.Attributes['id'] := Value;
  Result := Self;
end;

function TToastSelectionBox.InputType(const Value: string): TToastSelectionBox;
begin
  FNode.Attributes['type'] := Value;
  Result := Self;
end;

function TToastSelectionBox.Items(const Values: TArray<TToastSelectionBoxItem>): TToastSelectionBox;
begin
  for var Item in Values do
    with FNode.Nodes.AddNode('selection') do
    begin
      Attributes['id'] := Item.Id;
      Attributes['content'] := Item.Content;
    end;
  Result := Self;
end;

function TToastSelectionBox.PlaceholderContent(const Value: string): TToastSelectionBox;
begin
  FNode.Attributes['placeHolderContent'] := Value;
  Result := Self;
end;

function TToastSelectionBox.Title(const Value: string): TToastSelectionBox;
begin
  FNode.Attributes['title'] := Value;
  Result := Self;
end;

{ TToastSelectionBoxItem }

class function TToastSelectionBoxItem.Create(const Id, Content: string): TToastSelectionBoxItem;
begin
  Result.Id := Id;
  Result.Content := Content;
end;

{ TToastAction }

function TToastAction.ActionType(const Value: string): TToastAction;
begin
  FNode.Attributes['type'] := Value;
  Result := Self;
end;

function TToastAction.ActivationType(const Value: TActivationType): TToastAction;
begin
  FNode.Attributes['activationType'] := Value.ToString;
  Result := Self;
end;

function TToastAction.AddArgument(const Name, Value: string): TToastAction;
begin
  FNode.Attributes[Name] := Value;
  Result := Self;
end;

function TToastAction.AfterActivationBehavior(const Value: TToastActionActivationBehavior): TToastAction;
begin
  FNode.Attributes['afterActivationBehavior'] := Value.ToString;
  Result := Self;
end;

function TToastAction.Arguments(const Value: string): TToastAction;
begin
  FNode.Attributes['arguments'] := Value;
  Result := Self;
end;

function TToastAction.Content(const Value: string): TToastAction;
begin
  FNode.Attributes['content'] := Value;
  Result := Self;
end;

function TToastAction.HintButtonStyle(const Value: TToastActionButtonStyle): TToastAction;
begin
  FNode.Attributes['hint-buttonStyle'] := Value.ToString;
  Result := Self;
end;

function TToastAction.HintInputId(const Value: string): TToastAction;
begin
  FNode.Attributes['hint-inputId'] := Value;
  Result := Self;
end;

function TToastAction.HintToolTip(const Value: string): TToastAction;
begin
  FNode.Attributes['hint-toolTip'] := Value;
  Result := Self;
end;

function TToastAction.ImageURI(const Value: string): TToastAction;
begin
  FNode.Attributes['imageUri'] := Value;
  Result := Self;
end;

function TToastAction.Placement(const Value: string): TToastAction;
begin
  FNode.Attributes['placement'] := Value;
  Result := Self;
end;

{ TActivationTypeHelper }

function TActivationTypeHelper.ToString: string;
begin
  case Self of
    TActivationType.Default:
      Exit('foreground');
    TActivationType.Foreground:
      Exit('foreground');
    TActivationType.Background:
      Exit('background');
    TActivationType.Protocol:
      Exit('protocol');
    TActivationType.System:
      Exit('system');
  end;
end;

{ TToastActionButtonStyleHelper }

function TToastActionButtonStyleHelper.ToString: string;
begin
  case Self of
    TToastActionButtonStyle.Success:
      Exit('Success');
    TToastActionButtonStyle.Critical:
      Exit('Critical');
  end;
end;

{ TToastActionActivationBehaviorHelper }

function TToastActionActivationBehaviorHelper.ToString: string;
begin
  case Self of
    TToastActionActivationBehavior.Default:
      Exit('default');
    TToastActionActivationBehavior.PendingUpdate:
      Exit('pendingUpdate');
  end;
end;

{ TToastImagePlacementHelper }

function TToastImagePlacementHelper.ToString: string;
begin
  case Self of
    TToastImagePlacement.AppLogoOverride:
      Exit('appLogoOverride');
    TToastImagePlacement.Hero:
      Exit('hero');
  end;
end;

{ TToastImageHintCropHelper }

function TToastImageHintCropHelper.ToString: string;
begin
  case Self of
    TToastImageHintCrop.None:
      Exit('none');
    TToastImageHintCrop.Circle:
      Exit('circle');
  end;
end;

{ TToastImage }

function TToastImage.AddImageQuery(const Value: Boolean): TToastImage;
begin
  FNode.Attributes['addImageQuery'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastImage.Alt(const Value: string): TToastImage;
begin
  FNode.Attributes['alt'] := Value;
  Result := Self;
end;

function TToastImage.HintCrop(const Value: TToastImageHintCrop): TToastImage;
begin
  FNode.Attributes['hint-crop'] := Value.ToString;
  Result := Self;
end;

function TToastImage.HintRemoveMargin(const Value: Boolean): TToastImage;
begin
  FNode.Attributes['hint-removeMargin'] := BooleanToXml(Value);
  Result := Self;
end;

function TToastImage.Id(const Value: Integer): TToastImage;
begin
  FNode.Attributes['id'] := Value.ToString;
  Result := Self;
end;

function TToastImage.Placement(const Value: TToastImagePlacement): TToastImage;
begin
  FNode.Attributes['placement'] := Value.ToString;
  Result := Self;
end;

function TToastImage.Src(const Value: string): TToastImage;
begin
  FNode.Attributes['src'] := Value;
  Result := Self;
end;

{ TToastHeader }

function TToastHeader.ActivationType(const Value: TActivationType): TToastHeader;
begin
  FNode.Attributes['activationType'] := Value.ToString;
  Result := Self;
end;

function TToastHeader.Arguments(const Value: string): TToastHeader;
begin
  FNode.Attributes['arguments'] := Value;
  Result := Self;
end;

function TToastHeader.Id(const Value: string): TToastHeader;
begin
  FNode.Attributes['id'] := Value;
  Result := Self;
end;

function TToastHeader.Title(const Value: string): TToastHeader;
begin
  FNode.Attributes['title'] := Value;
  Result := Self;
end;

{ TToastDurationHelper }

function TToastDurationHelper.ToString: string;
begin
  case Self of
    TToastDuration.Default:
      Exit('');
    TToastDuration.Short:
      Exit('short');
    TToastDuration.Long:
      Exit('long');
  end;
end;

{ TToastGroup }

function TToastGroup.SubGroups(const Values: TArray<TToastSubGroup>): TToastGroup;
begin
  for var Item in Values do
  begin
    var Node := Item.GetNodeAndFree;
    Node.TagName := 'subgroup';
    FNode.Nodes.AttachNode(Node);
  end;
  Result := Self;
end;

{ TToastSubGroup }

function TToastSubGroup.AddImage(const Value: TToastImage): TToastSubGroup;
begin
  var Node := Value.GetNodeAndFree;
  Node.TagName := 'image';
  FNode.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastSubGroup.AddText(const Value: TToastText): TToastSubGroup;
begin
  var Node := Value.GetNodeAndFree;
  Node.TagName := 'text';
  FNode.Nodes.AttachNode(Node);
  Result := Self;
end;

function TToastSubGroup.HintWeight(const Value: Integer): TToastSubGroup;
begin
  FNode.Attributes['hint-weight'] := Value.ToString;
  Result := Self;
end;

{ TToastScenarioHelper }

function TToastScenarioHelper.ToString: string;
begin
  case Self of
    TToastScenario.Default:
      Exit('');
    TToastScenario.Alarm:
      Exit('alarm');
    TToastScenario.Reminder:
      Exit('reminder');
    TToastScenario.IncomingCall:
      Exit('incomingCall');
    TToastScenario.Urgent:
      Exit('urgent');
  end;
end;

end.

