unit FMXBridge.GIF.Types;

interface

uses
  System.SysUtils;

type
  TGIFDisposalMethod = (
    gdmUnspecified,
    gdmDoNotDispose,
    gdmRestoreBackground,
    gdmRestorePrevious
  );

  TGIFFrameInfo = record
    Left: Integer;
    Top: Integer;
    Width: Integer;
    Height: Integer;
    DelayMS: Cardinal;
    Disposal: TGIFDisposalMethod;
    HasTransparency: Boolean;
    TransparentIndex: Byte;
  end;

  TGIFRawFrame = record
    Info: TGIFFrameInfo;
    Pixels: TBytes; // Premultiplied BGRA, decoded by WIC
  end;

  TGIFComposedFrame = record
    Index: Integer;
    DelayMS: Cardinal;
    Pixels: TBytes; // Full logical-screen canvas, premultiplied BGRA
  end;

  TGIFFramePacketKind = (
    gfpkFrame,
    gfpkCompleted,
    gfpkError
  );

  TGIFFramePacket = record
    Kind: TGIFFramePacketKind;
    Generation: Cardinal;
    Frame: TGIFComposedFrame;
    FrameCount: Integer;
    CanvasWidth: Integer;
    CanvasHeight: Integer;
    ErrorMessage: string;
  end;

implementation

end.
