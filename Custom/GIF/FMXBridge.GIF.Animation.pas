unit FMXBridge.GIF.Animation;

interface

uses
  System.Classes,
  FMX.Ani;

type
  TGIFAnimationClock = class(TAnimation)
  private
    FOnTick: TNotifyEvent;
  protected
    procedure ProcessAnimation; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure StartClock;
    procedure StopClock;
    property OnTick: TNotifyEvent read FOnTick write FOnTick;
  end;

implementation

constructor TGIFAnimationClock.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // A looping TAnimation is used only as a Display Link driven clock.
  // Frame timing is calculated separately from GIF frame delays.
  Duration := 1.0;
  Loop := True;
  AutoReverse := False;
end;

procedure TGIFAnimationClock.ProcessAnimation;
begin
  if Assigned(FOnTick) then
    FOnTick(Self);
end;

procedure TGIFAnimationClock.StartClock;
begin
  if not Enabled then
    Start;
end;

procedure TGIFAnimationClock.StopClock;
begin
  if Enabled then
    Stop;
end;

end.
