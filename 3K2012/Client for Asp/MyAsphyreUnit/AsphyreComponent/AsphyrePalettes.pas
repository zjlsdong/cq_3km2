unit AsphyrePalettes;

//---------------------------------------------------------------------------
interface

//---------------------------------------------------------------------------
uses
 Classes, SysUtils, Math, StreamUtils, TrueColors, AsphyreUtils;

//---------------------------------------------------------------------------
type
 TNodeType = (ntPlain, ntSine, ntAccel, ntBrake);

//---------------------------------------------------------------------------
 PAsphyreColorNode = ^TAsphyreColorNode;
 TAsphyreColorNode = record
  Color   : TTrueColor;
  NodeType: TNodeType;
  Theta   : Single;
 end;

//---------------------------------------------------------------------------
 TAsphyrePalette = class
 private
  Data : array of TAsphyreColorNode;
  FTime: Single;
  FName: string;

  function GetCount(): Integer;
  function GetItem(Num: Integer): PAsphyreColorNode;
  function GetFirstColor(Theta: Single): PAsphyreColorNode;
  function GetColor(Theta: Single): TTrueColor;
  function GetNextColor(Theta: Single): PAsphyreColorNode;
  procedure SetTime(const Value: Single);
 public
  property Count: Integer read GetCount;
  property Items[Num: Integer]: PAsphyreColorNode read GetItem; default;
  property Color[Theta: Single]: TTrueColor read GetColor;
  property Time: Single read FTime write SetTime;
  property Name: string read FName write FName;

  function Add(Color: TTrueColor; NodeType: TNodeType; Theta: Single): Integer; overload;
  function Add(Diffuse: Longword; NodeType: TNodeType; Theta: Single): Integer; overload;
  function Add(Node: TAsphyreColorNode): Integer; overload;
  function Add(Diffuse: Longword; Theta: Single): Integer; overload;


  procedure Remove(Num: Integer);
  procedure Clear();

  procedure SaveToStream(Stream: TStream);
  procedure LoadFromStream(Stream: TStream);
  procedure SaveToFile(Filename: string);
  procedure LoadFromFile(Filename: string);

  procedure Assign(Source: TAsphyrePalette);

  constructor Create();
  destructor Destroy(); override;
 end;

//---------------------------------------------------------------------------
 TAsphyrePalettes = class
 private
  Data: array of TAsphyrePalette;
  FTitle: string;

  function GetCount(): Integer;
  procedure SetCount(const Value: Integer);
  function GetItem(Num: Integer): TAsphyrePalette;
  procedure SetItem(Num: Integer; const Value: TAsphyrePalette);
  function GetColor(Theta, Time: Single): TTrueColor;
  function GetFirstPal(Time: Single): TAsphyrePalette;
  function GetPrevPal(Time: Single): TAsphyrePalette;
  function GetSuccPal(Time: Single): TAsphyrePalette;
 public
  property Count: Integer read GetCount write SetCount;
  property Items[Num: Integer]: TAsphyrePalette read GetItem write SetItem; default;
  property Color[Theta, Time: Single]: TTrueColor read GetColor;
  property Title: string read FTitle write FTitle;

  function Add(): Integer; overload;
  procedure Add(Color0, Color1, Color2, Color3: Longword); overload;
  procedure Remove(Num: Integer);
  function Find(Name: string): Integer;

  procedure Clear();
  procedure Assign(Source: TAsphyrePalettes);

  procedure SaveToStream(Stream: TStream);
  procedure LoadFromStream(Stream: TStream);
  function LoadFromFile(const Name: string): Boolean;
  function SaveToFile(const Name: string): Boolean;

  constructor Create();
  destructor Destroy(); override;
 end;

//---------------------------------------------------------------------------
 TAsphyrePaletteSet = class
 private
  Data: array of TAsphyrePalettes;

  function GetCount(): Integer;
  function GetItem(Num: Integer): TAsphyrePalettes;
  procedure SetItem(Num: Integer; const Value: TAsphyrePalettes);
 public
  property Count: Integer read GetCount;
  property Item[Num: Integer]: TAsphyrePalettes read GetItem write SetItem; default;

  function Add(): Integer;
  procedure Remove(Num: Integer);
  procedure RemoveAll();
  function Find(Title: string): Integer;

  procedure SaveToStream(Stream: TStream);
  procedure LoadFromStream(Stream: TStream);
  function LoadFromFile(const Name: string): Boolean;
  function SaveToFile(const Name: string): Boolean;

  constructor Create();
  destructor Destroy(); override;
 end;


//---------------------------------------------------------------------------
implementation

//---------------------------------------------------------------------------
constructor TAsphyrePalette.Create();
begin
 inherited;

 SetLength(Data, 0);
 FTime:= 0.0;
 FName:= '';
end;

//---------------------------------------------------------------------------
destructor TAsphyrePalette.Destroy();
begin
 Clear();

 inherited;
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.GetCount(): Integer;
begin
 Result:= Length(Data);
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.GetItem(Num: Integer): PAsphyreColorNode;
begin
 if (Num < 0)or(Num >= Length(Data)) then
  begin
   Result:= nil;
   Exit;
  end;

 Result:= @Data[Num];
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.Add(Color: TTrueColor; NodeType: TNodeType; Theta: Single): Integer;
var
 Index: Integer;
begin
 Index:= Length(Data);
 SetLength(Data, Index + 1);

 Data[Index].Color:= Color;
 Data[Index].NodeType:= NodeType;
 Data[Index].Theta:= Theta;

 Result:= Index;
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.Add(Node: TAsphyreColorNode): Integer;
begin
 Result:= Add(Node.Color, Node.NodeType, Node.Theta);
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.Add(Diffuse: Longword; NodeType: TNodeType; Theta: Single): Integer;
begin
{$IFDEF VER185}
  Result:= Add(TrueColorsImplicit(Diffuse), NodeType, Theta);
{$ELSE}
  Result:= Add(Diffuse, NodeType, Theta);
{$ENDIF}
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.Remove(Num: Integer);
var
 i: Integer;
begin
 for i:= Num to Length(Data) - 2 do
  Data[i]:= Data[i + 1];

 SetLength(Data, Length(Data) - 1);
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.Add(Diffuse: Longword; Theta: Single): Integer;
begin
{$IFDEF VER185}
  Result:= Add(TrueColorsImplicit(Diffuse), ntPlain, Theta);
{$ELSE}
  Result:= Add(Diffuse, ntPlain, Theta);
{$ENDIF}
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.Clear();
begin
 SetLength(Data, 0);
end;

//--------------------------------------------------------------------------
function TAsphyrePalette.GetFirstColor(Theta: Single): PAsphyreColorNode;
var
 i, Frame, wIndex: Integer;
 Delta, NewDelta, WorstD: Single;
begin
 Delta:= High(Integer);
 Frame:= -1;
 wIndex:= -1;
 WorstD:= High(Integer);

 for i:= 0 to Length(Data) - 1 do
   begin
    NewDelta:= Abs(Theta - Data[i].Theta);

    if (Data[i].Theta <= Theta)and(NewDelta < Delta) then
     begin
      Frame:= i;
      Delta:= NewDelta;
     end;
    if (NewDelta < WorstD) then
     begin
      wIndex:= i;
      WorstD:= NewDelta;
     end;
   end;

 if (Frame = -1) then
  begin
   Result:= nil;
   if (wIndex <> -1) then Result:= @Data[wIndex];
  end else Result:= @Data[Frame];
end;

//--------------------------------------------------------------------------
function TAsphyrePalette.GetNextColor(Theta: Single): PAsphyreColorNode;
var
 i, Frame, wIndex: Integer;
 Delta, NewDelta, wDelta: Single;
begin
 Delta:= High(Integer);
 Frame:= -1;
 wIndex:= -1;
 wDelta:= High(Integer);

 for i:= 0 to Length(Data) - 1 do
   begin
    NewDelta:= Abs(Data[i].Theta - Theta);
    if (Data[i].Theta > Theta)and(NewDelta < Delta) then
     begin
      Frame:= i;
      Delta:= NewDelta;
     end;

    if (wDelta > NewDelta) then
     begin
      wDelta:= NewDelta;
      wIndex:= i;
     end;  
   end;

 if (Frame = -1) then
  begin
   Result:= nil;
   if (wIndex <> -1) then Result:= @Data[wIndex];
  end else Result:= @Data[Frame];
end;

//---------------------------------------------------------------------------
function TAsphyrePalette.GetColor(Theta: Single): TTrueColor;
const
 PiHalf = Pi * 0.5;
var
 First, Next: PAsphyreColorNode;
 MyTheta: Single;
begin
 // no colors
 if (Length(Data) < 1) then
  begin
   Result.r:= 0.0;
   Result.g:= 0.0;
   Result.b:= 0.0;
   Result.a:= 0.0;
   Exit;
  end;

 // retreive initial color
 First:= GetFirstColor(Theta);

 // use First Color info directly if one of the following is met:
 //  1) Color has exact Theta match
 //  2) Color happens after the Theta (and is the first one)
 if (First.Theta = Theta)or(First.Theta > Theta) then
  begin
   Result:= First.Color;
   Exit;
  end;

 // retreive the next color (to interpolate with)
 Next:= GetNextColor(Theta);

 // if there is no difference in time between two frames, return the next one
 if (Next.Theta = First.Theta)or(Next.Theta = Theta)or(Next = First) then
  begin
   Result:= Next.Color;
   Exit;
  end;

 // calculate interpolation value
 MyTheta:= (Theta - First.Theta) / (Next.Theta - First.Theta);

 // --> initial sine curve
 if ((First.NodeType = ntSine)or(First.NodeType = ntAccel)) then
  begin
   if ((Next.NodeType = ntSine)or(Next.NodeType = ntBrake)) then
    MyTheta:= (Sin((MyTheta * Pi) - PiHalf) + 1.0) / 2.0
     else MyTheta:= Sin((MyTheta * PiHalf) - PiHalf) + 1.0;
  end else
  begin
   if ((Next.NodeType = ntSine)or(Next.NodeType = ntBrake)) then
    MyTheta:= Sin(MyTheta * PiHalf);
  end;

 Result:= AlphaBlendTC(First.Color, Next.Color, MyTheta);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.LoadFromFile(Filename: string);
var
 Stream: TStream;
begin
 Stream:= TFileStream.Create(Filename, fmOpenRead or fmShareDenyWrite);
 try
  LoadFromStream(Stream);
 finally
  Stream.Free();
 end; 
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.SaveToFile(Filename: string);
var
 Stream: TStream;
begin
 Stream:= TFileStream.Create(Filename, fmCreate or fmShareExclusive);
 try
  SaveToStream(Stream);
 finally
  Stream.Free();
 end;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.SaveToStream(Stream: TStream);
var
 Count, i: Integer;
begin
 stWriteString(Stream, FName);
 stWriteDouble(Stream, FTime);
 Count:= Length(Data);
 Stream.WriteBuffer(Count, SizeOf(Integer));

 for i:= 0 to Count - 1 do
  Stream.WriteBuffer(Data[i], SizeOf(TAsphyreColorNode));
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.LoadFromStream(Stream: TStream);
var
 Count, i: Integer;
begin
 FName:= stReadString(Stream);
 FTime:= stReadDouble(Stream);
 Stream.ReadBuffer(Count, SizeOf(Integer));
 SetLength(Data, Count);

 for i:= 0 to Count - 1 do
  Stream.ReadBuffer(Data[i], SizeOf(TAsphyreColorNode));
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.Assign(Source: TAsphyrePalette);
var
 i: Integer;
begin
 FName:= Source.Name;
 Time := Source.Time;
 Clear();

 for i:= 0 to Source.Count - 1 do
  Add(Source[i]^);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalette.SetTime(const Value: Single);
begin
 FTime:= Max(Min(Value, 1.0), 0.0);
end;

//---------------------------------------------------------------------------
constructor TAsphyrePalettes.Create();
begin
 inherited;

 SetLength(Data, 0);
end;

//---------------------------------------------------------------------------
destructor TAsphyrePalettes.Destroy();
begin
 Clear();

 inherited;
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.GetCount(): Integer;
begin
 Result:= Length(Data);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.SetCount(const Value: Integer);
begin
 while (Length(Data) > Value)and(Length(Data) > 0) do Remove(Length(Data) - 1);
 while (Length(Data) < Value) do Add();
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.GetItem(Num: Integer): TAsphyrePalette;
begin
 if (Num >= 0)and(Num < Length(Data)) then
  Result:= Data[Num] else Result:= nil;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.SetItem(Num: Integer; const Value: TAsphyrePalette);
begin
 if (Num >= 0)and(Num < Length(Data)) then
  Data[Num].Assign(Value);
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.Add(): Integer;
var
 Index: Integer;
begin
 Index:= Length(Data);
 SetLength(Data, Index + 1);

 Data[Index]:= TAsphyrePalette.Create();
 Result:= Index;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.Remove(Num: Integer);
var
 i: Integer;
begin
 if (Num < 0)or(Num >= Length(Data)) then Exit;

 if (Assigned(Data[Num])) then
  begin
   Data[Num].Free();
   Data[Num]:= nil;
  end; 

 for i:= Num to Length(Data) - 2 do
  Data[i]:= Data[i + 1];

 SetLength(Data, Length(Data) - 1);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.Clear();
var
 i: Integer;
begin
 for i:= 0 to Length(Data) - 1 do
  if (Assigned(Data[i])) then
   begin
    Data[i].Free();
    Data[i]:= nil;
   end;

 SetLength(Data, 0);
end;

//--------------------------------------------------------------------------
function TAsphyrePalettes.GetFirstPal(Time: Single): TAsphyrePalette;
var
 i, LowerIndex, BestIndex: Integer;
 LowerDelta, Delta, BestDelta: Single;
begin
 LowerDelta:= High(Integer);
 BestDelta := High(Integer);
 LowerIndex:= -1;
 BestIndex := -1;

 for i:= 0 to Length(Data) - 1 do
   begin
    Delta:= Abs(Time - Data[i].Time);

    // -> lower index
    if (Data[i].Time <= Time)and(Delta < LowerDelta) then
     begin
      LowerIndex:= i;
      LowerDelta:= Delta;
     end;

    // -> best index
    if (Delta < BestDelta) then
     begin
      BestIndex:= i;
      BestDelta:= Delta;
     end;
   end;

 if (LowerIndex = -1) then
  begin
   Result:= nil;
   if (BestIndex <> -1) then Result:= Data[BestIndex];
  end else Result:= Data[LowerIndex];
end;

//--------------------------------------------------------------------------
function TAsphyrePalettes.GetPrevPal(Time: Single): TAsphyrePalette;
var
 i, LowerIndex, BestIndex: Integer;
 LowerDelta, Delta, BestDelta: Single;
begin
 LowerDelta:= High(Integer);
 BestDelta := High(Integer);
 LowerIndex:= -1;
 BestIndex := -1;

 for i:= 0 to Length(Data) - 1 do
   begin
    Delta:= Abs(Time - Data[i].Time);

    // -> lower index
    if (Data[i].Time < Time)and(Delta < LowerDelta) then
     begin
      LowerIndex:= i;
      LowerDelta:= Delta;
     end;

    // -> best index
    if (Delta < BestDelta) then
     begin
      BestIndex:= i;
      BestDelta:= Delta;
     end;
   end;

 if (LowerIndex = -1) then
  begin
   Result:= nil;
   if (BestIndex <> -1) then Result:= Data[BestIndex];
  end else Result:= Data[LowerIndex];
end;

//--------------------------------------------------------------------------
function TAsphyrePalettes.GetSuccPal(Time: Single): TAsphyrePalette;
var
 i, HigherIndex, BestIndex: Integer;
 HigherDelta, BestDelta, Delta: Single;
begin
 HigherDelta:= High(Integer);
 BestDelta := High(Integer);
 HigherIndex:= -1;
 BestIndex := -1;

 for i:= 0 to Length(Data) - 1 do
   begin
    Delta:= Abs(Data[i].Time - Time);

    // -> higher index
    if (Data[i].Time > Time)and(Delta < HigherDelta) then
     begin
      HigherIndex:= i;
      HigherDelta:= Delta;
     end;

    // -> best index
    if (Delta < BestDelta) then
     begin
      BestIndex:= i;
      BestDelta:= Delta;
     end;
   end;

 if (HigherIndex = -1) then
  begin
   Result:= nil;
   if (BestIndex <> -1) then Result:= Data[BestIndex];
  end else Result:= Data[HigherIndex];
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.GetColor(Theta, Time: Single): TTrueColor;
const
 PiHalf = Pi * 0.5;
var
 First, Second, Left, Right: TAsphyrePalette;
 Alpha: Single;
 Color0, Color1, Color2, Color3: TTrueColor;
begin
 // no palettes
 if (Length(Data) < 1) then
  begin
   Result.r:= 0.0;
   Result.g:= 0.0;
   Result.b:= 0.0;
   Result.a:= 0.0;
   Exit;
  end;

 // retreive initial palette
 First:= GetFirstPal(Time);

 // use First Palette directly if one of the following is met:
 //  1) Palette has exact Time match
 //  2) Palette appears after the Time
 if (First.Time = Time)or(First.Time > Time) then
  begin
   Result:= First.Color[Theta];
   Exit;
  end;

 // retreive the second palette
 Second:= GetSuccPal(Time);

 // if there is no difference in time between two palettes, return the next one
 if (Second.Time = First.Time)or(Second.Time = Time)or(Second = First) then
  begin
   Result:= Second.Color[Theta];
   Exit;
  end;

 // retreive another two palettes for cubic interpolation
 Left := GetPrevPal(First.Time);
 Right:= GetSuccPal(Second.Time);

 // calculate interpolation value
 Alpha:= (Time - First.Time) / (Second.Time - First.Time);

 // retreive all four colors
 Color0:= Left.Color[Theta];
 Color1:= First.Color[Theta];
 Color2:= Second.Color[Theta];
 Color3:= Right.Color[Theta];

 // interpolate the result
 Result.r:= CatmullRom(Color0.r, Color1.r, Color2.r, Color3.r, Alpha);
 Result.g:= CatmullRom(Color0.g, Color1.g, Color2.g, Color3.g, Alpha);
 Result.b:= CatmullRom(Color0.b, Color1.b, Color2.b, Color3.b, Alpha);
 Result.a:= CatmullRom(Color0.a, Color1.a, Color2.a, Color3.a, Alpha);

{ Result.r:= SineTheta(Color1.r, Color2.r, Alpha);
 Result.g:= SineTheta(Color1.g, Color2.g, Alpha);
 Result.b:= SineTheta(Color1.b, Color2.b, Alpha);
 Result.a:= SineTheta(Color1.a, Color2.a, Alpha);}

 Result.r:= Abs(Result.r);
 Result.g:= Abs(Result.g);
 Result.b:= Abs(Result.b);
 Result.a:= Abs(Result.a);
 if (Result.r > 1.0) then Result.r:= 2.0 - Result.r;
 if (Result.g > 1.0) then Result.g:= 2.0 - Result.g;
 if (Result.b > 1.0) then Result.b:= 2.0 - Result.b;
 if (Result.a > 1.0) then Result.a:= 2.0 - Result.a;

{ Result.r:= Min(Max(Result.r, 0.0), 1.0);
 Result.g:= Min(Max(Result.g, 0.0), 1.0);
 Result.b:= Min(Max(Result.b, 0.0), 1.0);
 Result.a:= Min(Max(Result.a, 0.0), 1.0);}
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.SaveToStream(Stream: TStream);
var
 Count, i: Integer;
begin
 stWriteString(Stream, FTitle);

 Count:= Length(Data);
 Stream.WriteBuffer(Count, SizeOf(Integer));

 for i:= 0 to Length(Data) - 1 do
  Data[i].SaveToStream(Stream);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.LoadFromStream(Stream: TStream);
var
 Count, i: Integer;
begin
 FTitle:= stReadString(Stream);

 Stream.ReadBuffer(Count, SizeOf(Integer));

 Clear();

 SetLength(Data, Count);
 for i:= 0 to Length(Data) - 1 do Data[i]:= nil;

 for i:= 0 to Length(Data) - 1 do
  begin
   Data[i]:= TAsphyrePalette.Create();
   Data[i].LoadFromStream(Stream);
  end;
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.SaveToFile(const Name: string): Boolean;
var
 Stream: TStream;
begin
 Result:= True;
 try
  Stream:= TFileStream.Create(Name, fmCreate or fmShareExclusive);
  try
   SaveToStream(Stream);
  finally
   Stream.Free();
  end; 
 except
  Result:= False;
 end;
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.LoadFromFile(const Name: string): Boolean;
var
 Stream: TStream;
begin
 Result:= True;
 try
  Stream:= TFileStream.Create(Name, fmOpenRead or fmShareDenyWrite);
  try
   LoadFromStream(Stream);
  finally
   Stream.Free();
  end;
 except
  Result:= False;
 end;
end;

//---------------------------------------------------------------------------
function TAsphyrePalettes.Find(Name: string): Integer;
var
 Index: Integer;
begin
 Name:= LowerCase(Name);
 Result:= -1;
 for Index:= 0 to Length(Data) - 1 do
  if (Name = LowerCase(Data[Index].Name)) then
   begin
    Result:= Index;
    Break;
   end;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.Assign(Source: TAsphyrePalettes);
var
 i: Integer;
begin
 FTitle:= Source.Title;
 Count:= Source.Count;

 for i:= 0 to Length(Data) - 1 do
  Data[i].Assign(Source[i]);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePalettes.Add(Color0, Color1, Color2, Color3: Longword);
var
 Index: Integer;
begin
 Index:= Add();
 Data[Index].Clear();
 Data[Index].Add(Color0, 0.0);
 Data[Index].Add(Color1, 0.333);
 Data[Index].Add(Color2, 0.667);
 Data[Index].Add(Color3, 1.0);
end;

//---------------------------------------------------------------------------
constructor TAsphyrePaletteSet.Create();
begin
 inherited;

 SetLength(Data, 0);
end;

//---------------------------------------------------------------------------
destructor TAsphyrePaletteSet.Destroy();
begin
 RemoveAll();

 inherited;
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.GetCount(): Integer;
begin
 Result:= Length(Data);
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.GetItem(Num: Integer): TAsphyrePalettes;
begin
 if (Num >= 0)and(Num < Length(Data)) then
  Result:= Data[Num] else Result:= nil;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePaletteSet.SetItem(Num: Integer; const Value: TAsphyrePalettes);
begin
 if (Num >= 0)and(Num < Length(Data)) then
  Data[Num].Assign(Value);
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.Add(): Integer;
var
 Index: Integer;
begin
 Index:= Length(Data);
 SetLength(Data, Index + 1);

 Data[Index]:= TAsphyrePalettes.Create();
 Result:= Index;
end;

//---------------------------------------------------------------------------
procedure TAsphyrePaletteSet.Remove(Num: Integer);
var
 i: Integer;
begin
 if (Num < 0)or(Num >= Length(Data)) then Exit;

 Data[Num].Free();
 for i:= Num to Length(Data) - 2 do
  Data[i]:= Data[i + 1];

 SetLength(Data, Length(Data) - 1); 
end;

//---------------------------------------------------------------------------
procedure TAsphyrePaletteSet.RemoveAll();
var
 i: Integer;
begin
 for i:= 0 to Length(Data) - 1 do
  if (Data[i] <> nil) then
   begin
    Data[i].Free();
    Data[i]:= nil;
   end;

 SetLength(Data, 0);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePaletteSet.SaveToStream(Stream: TStream);
var
 Count, i: Integer;
begin
 Count:= Length(Data);
 Stream.WriteBuffer(Count, SizeOf(Integer));

 for i:= 0 to Length(Data) - 1 do
  Data[i].SaveToStream(Stream);
end;

//---------------------------------------------------------------------------
procedure TAsphyrePaletteSet.LoadFromStream(Stream: TStream);
var
 Count, i: Integer;
begin
 Stream.ReadBuffer(Count, SizeOf(Integer));

 RemoveAll();

 SetLength(Data, Count);
 for i:= 0 to Length(Data) - 1 do Data[i]:= nil;

 for i:= 0 to Length(Data) - 1 do
  begin
   Data[i]:= TAsphyrePalettes.Create();
   Data[i].LoadFromStream(Stream);
  end;
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.SaveToFile(const Name: string): Boolean;
var
 Stream: TStream;
begin
 Result:= True;
 try
  Stream:= TFileStream.Create(Name, fmCreate or fmShareExclusive);
  try
   SaveToStream(Stream);
  finally
   Stream.Free();
  end; 
 except
  Result:= False;
 end;
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.LoadFromFile(const Name: string): Boolean;
var
 Stream: TStream;
begin
 Result:= True;
 try
  Stream:= TFileStream.Create(Name, fmOpenRead or fmShareDenyWrite);
  try
   LoadFromStream(Stream);
  finally
   Stream.Free();
  end;
 except
  Result:= False;
 end;
end;

//---------------------------------------------------------------------------
function TAsphyrePaletteSet.Find(Title: string): Integer;
var
 i: Integer;
begin
 Title:= LowerCase(Title);
 Result:= -1;
 
 for i:= 0 to Length(Data) - 1 do
  if (Title = LowerCase(Data[i].Title)) then
   begin
    Result:= i;
    Break;
   end; 
end;

//---------------------------------------------------------------------------
end.
