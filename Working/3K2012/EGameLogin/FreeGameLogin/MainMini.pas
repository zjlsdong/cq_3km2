unit MainMini;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ImageProgressbar, StdCtrls, RzBmpBtn, RzLabel, ExtCtrls, Common,GameLoginShare,
  OleCtrls, SHDocVw, JSocket,HUtil32,Grobal2,EDcode, IdBaseComponent, IniFiles,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,Md5,GameMon,ComObj,Winsock,
  RzPanel, IdAntiFreezeBase, IdAntiFreeze, WinInet, WinHTTP, jpeg, Reg, EDcodeUnit, Main;

type
  TFrmMainMini = class(TFrmMain)
    MainImage: TImage;
    RzLabelStatus: TRzLabel;
    ButtonNewAccount: TRzBmpButton;
    ButtonHomePage: TRzBmpButton;
    ButtonChgPassword: TRzBmpButton;
    ButtonGetBackPassword: TRzBmpButton;
    BtnExitGame: TRzBmpButton;
    BtnClose: TRzBmpButton;
    StartButton: TRzBmpButton;
    ComboBox1: TComboBox;
    ProgressBarCurDownload: TImageProgressbar;
    ProgressBarAll: TImageProgressbar;
    ClientSocket: TClientSocket;
    ServerSocket: TServerSocket;
    ClientTimer: TTimer;
    IdHTTP1: TIdHTTP;
    Timer3: TTimer;
    RzPanel1: TRzPanel;
    WebBrowser1: TWebBrowser;
    IdAntiFreeze: TIdAntiFreeze;
    WinHTTP: TWinHTTP;
    TimerPatchSelf: TTimer;
    procedure BtnExitGameClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure MainImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClientTimerTimer(Sender: TObject);
    procedure TimeGetGameListTimer(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketConnecting(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure TimerPatchTimer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure TimerKillCheatTimer(Sender: TObject);
    procedure SecrchTimerTimer(Sender: TObject);
    procedure ButtonNewAccountClick(Sender: TObject);
    procedure ButtonHomePageClick(Sender: TObject);
    procedure ButtonChgPasswordClick(Sender: TObject);
    procedure ButtonGetBackPasswordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WinHTTPDone(Sender: TObject; const ContentType: String;
      FileSize: Integer; Stream: TStream);
    procedure WinHTTPHTTPError(Sender: TObject; ErrorCode: Integer;
      Stream: TStream);
    procedure WinHTTPHostUnreachable(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerPatchSelfTimer(Sender: TObject);
  private
    { Private declarations }
    dwClickTick: LongWord;
    procedure DecodeMessagePacket(datablock: string);
    procedure LoadGameMonList(str: TStream);
    procedure LoadPatchList(str: TStream);
    procedure AnalysisFile();
    function  WriteInfo(sPath: string): Boolean;
    procedure ServerActive();
    function DownLoadFile(sURL,sFName: string): boolean;  //下载文件
    function LoadOptions(): Boolean;
  public
    procedure LoadSelfInfo();
    procedure LoadServerList(str: TStream);
    procedure LoadServerListView();
    procedure ButtonActive; //按键激活   20080311
    procedure ButtonActiveF; //按键激活   20080311
    procedure SendCSocket(sendstr: string);
    procedure SendUpdateAccount(ue: TUserEntry; ua: TUserEntryAdd);override; //发送新建账号
    procedure SendChgPw(sAccount, sPasswd, sNewPasswd: string);override; //发送修改密码
    procedure SendGetBackPassword(sAccount, sQuest1, sAnswer1, sQuest2, sAnswer2, sBirthDay: string);override; //发送找回密码
    procedure CreateParams(var Params:TCreateParams);override;//设置程序的类名 20080412
  protected
    procedure SetEnabledServerList(Value: Boolean);override;
    procedure SetStatusString(const Value: string);override;
    procedure SetStatusColor(const Value: TColor);override;
  end;

var
  FrmMainMini: TFrmMainMini;
implementation

uses MsgBox, NewAccount, ChangePassword, GetBackPassword,Secrch, StrUtils;
{$R *.dfm}


procedure TFrmMainMini.SetEnabledServerList(Value: Boolean);
begin
  ComboBox1.Enabled := Value;
end;

procedure TFrmMainMini.SetStatusString(const Value: string);
begin
  RzLabelStatus.Caption := Value;
end;

procedure TFrmMainMini.SetStatusColor(const Value: TColor);
begin
  RzLabelStatus.Font.Color := Value;
end;

procedure TFrmMainMini.WinHTTPHTTPError(Sender: TObject; ErrorCode: Integer;
  Stream: TStream);
begin
  case GetUrlStep of
    ServerList, ReServerList: begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Add({'获取服务器列表失败...'}SetDate('逮钱格窿渗芜锯浓坑!!!'));
      ComboBox1.ItemIndex := 0;
    end;
    UpdateList: begin
      GetUrlStep := GameMonList;
      TimeGetGameList.Enabled := True;
    end;
    GameMonList: g_boGameMon := False;
  end;
end;

procedure TFrmMainMini.TimerPatchSelfTimer(Sender: TObject);
begin
  //修改更新Exe方式 By TasNat at: 2012-03-18 13:06:59
  //被老程序WinExec启动

  CopyFile(PChar(ParamStr(0)), PChar(g_sExeName), False);

  if DeleteFile(PChar(ParamStr(0))) then
    TimerPatchSelf.Enabled := False;

  if TimerPatchSelf.Tag > 10 then
    TimerPatchSelf.Enabled := False;
  TimerPatchSelf.Tag := TimerPatchSelf.Tag + 1;
end;

procedure TFrmMainMini.Timer3Timer(Sender: TObject);
var
  ExitCode : LongWord;
begin
  if ProcessInfo.hProcess <> 0 then begin
    GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
    if ExitCode <> STILL_ACTIVE then begin
      asm //关闭程序
        MOV FS:[0],0;
        MOV DS:[0],EAX;
      end;
    end;
  end;
end;

function TFrmMainMini.LoadOptions(): Boolean;
  //十进制数转换成十六进制数
  function CnIntToHex(Value: Longint; Digits: Integer): String;
  begin
    Result := IntToHex(Word(Value), Digits);
  end;
const
  JPEG_FLAG1 = $919B; //15728
  JPEG_FLAG2 = $E577; //15872
  JPEG_FLAG3 = $64B8; //16272
  JPEG_FLAG4 = $142C; //16496
  JPEG_FLAG5 = $A978; //16912
var
  str:TMemoryStream;
  Flag1, Flag2, Flag3, Flag4, Flag5: WORD;
begin
  str:=TMemoryStream.Create;
  try
    MainImage.Picture.Graphic.SaveToStream(str);
    str.Position := 15728;
    str.Read(Flag1, SizeOf(Flag1));
    str.Position := {str.Size - 2}15872;
    str.Read(Flag2, SizeOf(Flag2));
    str.Position := 16272;
    str.Read(Flag3, SizeOf(Flag3));
    str.Position := 16496;
    str.Read(Flag4, SizeOf(Flag4));
    str.Position := 16912;
    str.Read(Flag5, SizeOf(Flag5));
    Result := (Flag2 = JPEG_FLAG2) and (Flag1 = JPEG_FLAG1) and (Flag3 = JPEG_FLAG3) and (Flag4 = JPEG_FLAG4) and (Flag5 = JPEG_FLAG5);
//    Memo1.Lines.Add(CnIntToHex(Flag2, 4)+'   '+inttostr(str.Size));
  finally
    str.Free;
  end;
end;

//读出自身的信息
procedure TFrmMainMini.LoadSelfInfo();
var
  //StrList: TStringList;
  Source,str:TMemoryStream;
  RcSize:integer;    
begin     
  ExtractInfo(Application.ExeName, MyRecInfo);//读出自身的信息
  if MyRecInfo.GameListURL <> '' then begin
    LnkName := MyRecInfo.lnkName;
    {$if GVersion = 1}
    g_GameListURL := MyRecInfo.GameListURL;
    g_PatchListURL := MyRecInfo.PatchListURL;
    g_boGameMon := True;//MyRecInfo.boGameMon;
    g_GameMonListURL := MyRecInfo.GameMonListURL;
    GameESystemURL := MyRecInfo.GameESystemUrl;
    ClientFileName := MyRecInfo.ClientFileName;
    {$ifend}
    m_sLocalGameListName := MyRecInfo.ClientFileName;

    if MyRecInfo.TzHintListFileSize > 0 then begin//套装文件大小 20110305
      Source:=TMemoryStream.Create;
      str:=TMemoryStream.Create;
      try //读取套装文件
        try

          {$IF  Testing =1}
           Source.LoadFromFile('C:\1.exe');
          {$Else}
           Source.LoadFromFile(Application.ExeName);
          {$ifend}

          //LoadResToMemStream(Source);
          RcSize:= MyRecInfo.SourceFileSize;
          Source.Seek(RcSize,soFromBeginning);
          str.CopyFrom(Source, MyRecInfo.TzHintListFileSize);
          DeCompressStream(str);//解压流
          str.Position:= 0;
          str.SaveToFile(PChar(g_sMirPath)+Setdate(TzHintList));//TzHintList.txt 保存套装文件
        except
          FrmMessageBox.LabelHintMsg.Caption := '请检查传奇目录是否开启了只读属性！';
          FrmMessageBox.ShowModal;
        end;
      finally
        str.Free;
        Source.Free;
      end;
    end;
    if MyRecInfo.PulsDescFileSize > 0 then begin//经络文件大小 20110305
      Source:=TMemoryStream.Create;
      str:=TMemoryStream.Create;
      try //读取文件
        try

          {$IF  Testing =1}
           Source.LoadFromFile('C:\1.exe');
          {$Else}
           Source.LoadFromFile(Application.ExeName);
           {$ifend}

          //LoadResToMemStream(Source);
          RcSize:= MyRecInfo.SourceFileSize + MyRecInfo.TzHintListFileSize;
          Source.Seek(RcSize,soFromBeginning);
          str.CopyFrom(Source, MyRecInfo.PulsDescFileSize);
          DeCompressStream(str);//解压流
          str.Position:= 0;
          str.SaveToFile(PChar(g_sMirPath) +{'Data\PulsDesc.dat'}Setdate('Kn{nS_zc|Kj|l!kn{'));//保存经络文件PulsDesc.txt
        except
          FrmMessageBox.LabelHintMsg.Caption := '请检查传奇目录是否开启了只读属性！';
          FrmMessageBox.ShowModal;
        end;
      finally
        str.Free;
        Source.Free;
      end;
    end;
    if MyRecInfo.GameSdoFilterFileSize > 0 then begin//内挂文件 20110305
      Source:=TMemoryStream.Create;
      str:=TMemoryStream.Create;
      try //读取文件
        try

          {$IF  Testing =1}
           Source.LoadFromFile('C:\1.exe');
          {$Else}
           Source.LoadFromFile(Application.ExeName);
           {$ifend}

          //LoadResToMemStream(Source);
          RcSize:= MyRecInfo.SourceFileSize + MyRecInfo.TzHintListFileSize + MyRecInfo.PulsDescFileSize;
          Source.Seek(RcSize,soFromBeginning);
          str.CopyFrom(Source, MyRecInfo.GameSdoFilterFileSize);
          DeCompressStream(str);//解压流
          str.Position:= 0;
          str.SaveToFile(PChar(g_sMirPath)+Setdate(FilterItemNameList));//FilterItemNameList.dat
        except
          FrmMessageBox.LabelHintMsg.Caption := '请检查传奇目录是否开启了只读属性！';
          FrmMessageBox.ShowModal;
        end;
      finally
        str.Free;
        Source.Free;
      end;
    end;
    Application.Title := MyRecInfo.lnkName;
  end;
  {$if GVersion = 0}
  ClientFileName := '0.exe';
  m_sLocalGameListName := '1.txt';
  {$IFEND}
end;

procedure TFrmMainMini.BtnExitGameClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMainMini.BtnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmMainMini.MainImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

procedure TFrmMainMini.ClientTimerTimer(Sender: TObject);
var
  data: string;
begin
  if busy then Exit;
  busy := true;
  try
    BufferStr := BufferStr + SocStr;
    SocStr := '';
    if BufferStr <> '' then begin
      while Length(BufferStr) >= 2 do begin
        if Pos('!', BufferStr) <= 0 then break;
        BufferStr := ArrestStringEx(BufferStr, '#', '!', data);
        if data <> '' then begin
          DecodeMessagePacket(data);
        end else
          if Pos('!', BufferStr) = 0 then
          break;
      end;
    end;
  finally
    busy := FALSE;
  end;
end;

procedure TFrmMainMini.DecodeMessagePacket(datablock: string);
var
  head, body: string;
  Msg: TDefaultMessage;
begin
  if datablock[1] = '+' then begin
    Exit;
  end;
  if Length(datablock) < DEFBLOCKSIZE then begin
    Exit;
  end;
  head := Copy(datablock, 1, DEFBLOCKSIZE);
  body := Copy(datablock, DEFBLOCKSIZE + 1, Length(datablock) - DEFBLOCKSIZE);
  Msg := DecodeMessage(head);
  case Msg.Ident of
    SM_SENDLOGINKEY: begin//接收网关发送的随机密钥,处理后直接返回消息 20091121
        body := EncodeString(Format('$%.8x', [Msg.Recog xor 432]));
        ClientSocket.Socket.SendText('<IGEM2>' + body);
      end;  
    SM_NEWID_SUCCESS: begin
        FrmMessageBox.LabelHintMsg.Caption := {'您的帐号创建成功。'}SetDate('缩核谂凳换钵计订') + #13 +
          {'请妥善保管您的帐号和密码，'}SetDate('蠕仑粕粳队缩核谂凳德逃弯') + #13 + {'并且不要因任何原因把帐号和密码告诉任何其他人。'}SetDate('江容酱荪蔟橇盗邰蔟哭谂凳德逃弯烽男橇盗呻聂悄') + #13 +
          {'如果忘记了密码,你可以通过我们的主页重新找回。'}SetDate('氰遏麦橙文逃弯#遂捌蒇搂厄凛倘核嬴菁僮咄谳醋');
        FrmMessageBox.ShowModal;
        FrmNewAccount.close;
      end;
    SM_NEWID_FAIL: begin
        case Msg.Recog of
          0: begin
            FrmMessageBox.LabelHintMsg.Caption := {'帐号 "'}SetDate('谂凳/-') + MakeNewAccount + {'" 已被其他的玩家使用了。'}SetDate('-/蒉敬呻聂核麻齿哦芴文') + #13 + {'请选择其它帐号名注册。'}SetDate('蠕蕻埝呻捏谂凳挑丨筋');
            FrmMessageBox.ShowModal;
            end;
          -2: begin
            FrmMessageBox.LabelHintMsg.Caption := {'此帐号名被禁止使用！'}SetDate('荒谂凳挑敬掺俣哦芴');
            FrmMessageBox.ShowModal;
          end;
          -3: begin
            //By By TasNat at: 2012-03-31 18:51:48
            FrmMessageBox.LabelHintMsg.Caption := {'账号密码不能相同!!!'}SetDate('谀凳逃弯酱擞里拢...');
            FrmMessageBox.ShowModal;
          end;
          else begin
            FrmMessageBox.LabelHintMsg.Caption := {'帐号创建失败，请确认帐号是否包括空格、及非法字符！Code: '}SetDate('谂凳换钵浓坑蠕歉抢谂凳湃羹矿惜摆服晨溉抚刭隔L`kj5/') + IntToStr(Msg.Recog);
            FrmMessageBox.ShowModal;
          end;
        end;
        frmNewAccount.ButtonOK.Enabled := true;
        Exit;
      end;
    SM_CHGPASSWD_SUCCESS: begin
        FrmMessageBox.LabelHintMsg.Caption := {'密码修改成功。'}SetDate('逃弯哐匪计订');
        FrmMessageBox.ShowModal;
        FrmChangePassword.ButtonOK.Enabled := FALSE;
        Exit;
      end;
    SM_CHGPASSWD_FAIL: begin
        case Msg.Recog of
          0: begin
            FrmMessageBox.LabelHintMsg.Caption := {'输入的帐号不存在！！！'}SetDate('烹卿核谂凳酱婚壅');
            FrmMessageBox.ShowModal;
          end;
          -1: begin
            FrmMessageBox.LabelHintMsg.Caption := {'输入的原始密码不正确！！！'}SetDate('烹卿核邰懦逃弯酱隍歉');
            FrmMessageBox.ShowModal;
          end;
          -2: begin
            FrmMessageBox.LabelHintMsg.Caption := {'此帐号被锁定！！！'}SetDate('荒谂凳敬镊恭');
            FrmMessageBox.ShowModal;
          end;
          else begin
            FrmMessageBox.LabelHintMsg.Caption := {'输入的新密码长度小于四位！！！'}SetDate('烹卿核咄逃弯极骨弋苷乃链');
            FrmMessageBox.ShowModal;
          end;
        end;
        FrmChangePassword.ButtonOK.Enabled := true;
        Exit;
      end;
    SM_GETBACKPASSWD_SUCCESS: begin
        FrmGetBackPassword.EditPassword.Text := DecodeString(body);
        FrmMessageBox.LabelHintMsg.Caption := {'密码找回成功！！！'}SetDate('逃弯谳醋计订');
        FrmMessageBox.ShowModal;
        Exit;
      end;
    SM_GETBACKPASSWD_FAIL: begin
        case Msg.Recog of
          0: begin
            FrmMessageBox.LabelHintMsg.Caption := {'输入的帐号不存在！！！'}SetDate('烹卿核谂凳酱婚壅');
            FrmMessageBox.ShowModal;
          end;
          -1: begin
            FrmMessageBox.LabelHintMsg.Caption := {'问题答案不正确！！！'}SetDate('僚庙?糠酱隍歉');
            FrmMessageBox.ShowModal;
          end;
          -2: begin
            FrmMessageBox.LabelHintMsg.Caption := {'此帐号被锁定！！！'}SetDate('荒谂凳敬镊恭') + #13 + {'请稍候三分钟再重新找回。'}SetDate('蠕欺谍球纲佘壑僮咄谳醋');
            FrmMessageBox.ShowModal;
          end;
          -3: begin
            FrmMessageBox.LabelHintMsg.Caption := {'答案输入不正确！！！'}SetDate('?糠烹卿酱隍歉');
            FrmMessageBox.ShowModal;
          end;
          else begin
            FrmMessageBox.LabelHintMsg.Caption := {'未知错误！！！'}SetDate('粱佶烩咙');
            FrmMessageBox.ShowModal;
          end;
        end;
        FrmGetBackPassword.ButtonOK.Enabled := True;
        Exit;
      end;
  end;
end;

procedure TFrmMainMini.LoadGameMonList(str: TStream);
var
  sLineText{, sFileName}: string;
  sGameTile : TStringList;
  I: integer;
  sUserCmd,sUserNo :string;
begin
  {$if GVersion = 1}
  {sFileName := 'QKGameMonList.txt';
  if not FileExists(PChar(m_sqkeSoft)+sFileName) then begin
    g_boGameMon := False;
    Exit;
  end;}
  g_GameMonTitle := THashedStringList.Create;
  g_GameMonProcess := THashedStringList.Create;
  g_GameMonModule := THashedStringList.Create;
  sGameTile := THashedStringList.Create;
  try
    sGameTile.LoadFromStream(str);
    //sGameTile.LoadFromFile(PChar(m_sqkeSoft)+sFileName);
    for I := 0 to sGameTile.Count - 1 do begin
      sLineText := sGameTile.Strings[I];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText := GetValidStr3(sLineText, sUserCmd, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sUserNo, [' ', #9]);
        if (sUserCmd <> '') and (sUserNo <> '') then begin
          if sUserCmd = {'标题特征'}SetDate('惧庙米邙') then g_GameMonTitle.Add(sUserNo);
          if sUserCmd = {'进程特征'}SetDate('谗济米邙') then g_GameMonProcess.Add(sUserNo);
          if sUserCmd = {'模块特征'}SetDate('爽版米邙') then g_GameMonModule.Add(sUserNo);
        end;
      end;
    end;
  finally
    sGameTile.Free;
  end;
  {$ifend}
end;

procedure TFrmMainMini.LoadPatchList(str: TStream);
var
  I: Integer;
  {sFileName, }sLineText: string;
  LoadList: Classes.TStringList;
  //LoadList1: Classes.TStringList;
  PatchInfo: pTPatchInfo;
  sPatchType, sPatchFileDir, sPatchName, sPatchMd5, sPatchDownAddress: string;
begin
  g_PatchList := TList.Create();
  {sFileName := 'QKPatchList.txt';
  if not FileExists(PChar(m_sqkeSoft)+sFileName) then begin
    //Application.MessageBox();   //列表文件不存在
  end;}
  g_PatchList.Clear;
  LoadList := TStringList.Create();
  {LoadList1 := TStringList.Create();
  LoadList1.LoadFromFile(PChar(m_sqkeSoft)+sFileName);
  LoadList.Text := (decrypt(Trim(LoadList1.Text),CertKey('?-W')));
  LoadList1.Free;}
  try
    LoadList.LoadFromStream(str);
    for I := 0 to LoadList.Count - 1 do begin
      sLineText := LoadList.Strings[I];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText := GetValidStr3(sLineText, sPatchType, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sPatchFileDir, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sPatchName, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sPatchMd5, [' ', #9]);
        sLineText := GetValidStr3(sLineText, sPatchDownAddress, [' ', #9]);
        if (sPatchType <> '') and (sPatchFileDir <> '') and (sPatchMd5 <> '') then begin
            New(PatchInfo);
            PatchInfo.PatchType := strtoint(sPatchType);
            PatchInfo.PatchFileDir := sPatchFileDir;
            PatchInfo.PatchName := sPatchName;
            PatchInfo.ServerMd5 := sPatchMd5;
            PatchInfo.PatchDownAddress := sPatchDownAddress;
            g_PatchList.Add(PatchInfo);
        end;
      end;
    end;
  finally
    LoadList.Free;
  end;
  AnalysisFile();
end;

procedure TFrmMainMini.AnalysisFile();
var
  I,II: Integer;
  PatchInfo: pTPatchInfo;
  sTmpMd5, sExt, sFullLocalName :string;
  StrList: TStringList; //20080704
begin
  RzLabelStatus.Font.Color := $0040BBF1;
  RzLabelStatus.Caption := {'分析升级文件...'}SetDate('纲六乞彻了绸!!!');
  StrList := TStringList.Create;
  if not Fileexists(PChar(g_sMirPath) + MyRecInfo.ClientFileName) then begin
    StrList.Clear;
    StrList.SaveToFile(PChar(g_sMirPath) + MyRecInfo.ClientFileName);
  end;
  StrList.LoadFromFile(PChar(g_sMirPath) + MyRecInfo.ClientFileName);
  {for II := 0 to StrList.Count -1 do begin
    sTmpMd5 := StrList[II];
    for I := 0 to g_PatchList.Count - 1 do begin
       PatchInfo := pTPatchInfo(g_PatchList.Items[I]);
      if CompareText(PatchInfo.ServerMd5, sTmpMd5) = 0 then begin
        Dispose(PatchInfo); //20080720
        g_PatchList.Delete(I);
      end;
    end;
  end; }
  //修改.如果登陆器需要更新 就先更新登陆器 By TasNat at: 2012-03-18 17:17:38
  for I := g_PatchList.Count - 1 downto 0 do begin
    if g_PatchList.Count <= 0 then Break;    
    PatchInfo := pTPatchInfo(g_PatchList.Items[I]);
    case PatchInfo.PatchType of
      0: begin
        //普通文件
        for II := 0 to StrList.Count -1 do begin
          sTmpMd5 := StrList[II];
          if CompareText(PatchInfo.ServerMd5, sTmpMd5) = 0 then begin
            Dispose(PatchInfo);
            g_PatchList.Delete(I);
            //BUG 未退出循环 By TasNat at: 2012-03-27 10:19:50
            Break;
          end;
        end;
      end;
      1: begin
        //登陆器
        sTmpMd5 := RivestFile(ParamStr(0));
        if CompareText(PatchInfo.ServerMd5, sTmpMd5) <> 0 then begin
          //其它更新先不管
          for II := 0 to g_PatchList.Count - 1 do
            if II <> I then//不要释放错了哦 By TasNat at: 2012-03-18 17:20:50
              Dispose(pTPatchInfo(g_PatchList.Items[II]));
          g_PatchList.Clear;
          g_PatchList.Add(PatchInfo);
          Break;
        end else begin
          Dispose(PatchInfo); //删除哦
          g_PatchList.Delete(I);
        end;
      end;
      2: begin
        //压缩包
        sExt := Copy(PatchInfo.PatchDownAddress, Length(PatchInfo.PatchDownAddress) - 3, 4);
        //需要检测的文件为非压缩包文件
        //Zlib Zlib.zip 3db55f67b4391a5d418cfa5365fa1896 http://localhost/Zlib.zip
        //Zlib Data p1.wil 3db55f67b4391a5d418cfa5365fa1896 http://localhost/Zlib.zip
        if (CompareText(sExt, '.zip') = 0) and (CompareText(sExt, ExtractFileExt(PatchInfo.PatchName)) <> 0) then begin
          //下载文件为压缩包文件
          //本地文件 MD5
          sFullLocalName := g_sMirPath + PatchInfo.PatchFileDir + '\' + PatchInfo.PatchName;
          sTmpMd5 := RivestFile(sFullLocalName);
          if CompareText(sTmpMd5, PatchInfo.ServerMd5) = 0 then begin
            //此文件已经下载
            Dispose(PatchInfo);
            g_PatchList.Delete(I);
          end else begin
            PatchInfo.PatchType := 3;
            PatchInfo.PatchName := PatchInfo.PatchName + '.zip';
          end;
        end else
        for II := 0 to StrList.Count -1 do begin
          sTmpMd5 := StrList[II];
          if CompareText(PatchInfo.ServerMd5, sTmpMd5) = 0 then begin
            Dispose(PatchInfo);
            g_PatchList.Delete(I);
          end;
        end;
      end;
    end;
  end;
  StrList.Free;
  if g_PatchList.Count = 0 then begin
    RzLabelStatus.Font.Color := $0040BBF0;
    RzLabelStatus.Caption:={'当前没有新版本更新...'}SetDate('壕瓤檀苓咄块颈敷咄!!!');
    RzLabelStatus.Caption:={'请选择服务器登陆...'}SetDate('蠕蕻埝格窿渗喝筒!!!');
    for I:=0 to g_PatchList.Count - 1 do begin
      if pTPatchInfo(g_PatchList.Items[I]) <> nil then Dispose(g_PatchList.Items[I]); //20080720
    end;
    g_PatchList.Free;
  end else begin
    g_boIsGamePath := True;
    TimerPatch.Enabled:=True; //有升级文件，下载按钮可操作
    ComboBox1.Enabled := False;
  end;
end;

procedure TFrmMainMini.LoadServerList(str: TStream);
var
  I: Integer;
  {sFileName, }sLineText: string;
  LoadList: Classes.TStringList;
  LoadList1: Classes.TStringList;
  ServerInfo: pTServerInfo;
  sServerArray, sServerName, sServerIP, sServerPort, sServerNoticeURL, sServerHomeURL: string;
begin
  g_ServerList.Clear;
  LoadList := Classes.TStringList.Create();
  LoadList1 := Classes.TStringList.Create();
  try
    LoadList1.LoadFromStream(str);
    LoadList.Text := (decrypt(Trim(LoadList1.Text),CertKey('?-W')));
  finally
    LoadList1.Free;
  end;
  try
    for I := 0 to LoadList.Count - 1 do begin
      sLineText := LoadList.Strings[I];
      if (sLineText <> '') and (sLineText[1] <> ';') then begin
        sLineText := GetValidStr3(sLineText, sServerArray, ['|']);
        sLineText := GetValidStr3(sLineText, sServerName, ['|']);
        sLineText := GetValidStr3(sLineText, sServerIP, ['|']);
        sLineText := GetValidStr3(sLineText, sServerPort, ['|']);
        sLineText := GetValidStr3(sLineText, sServerNoticeURL, ['|']);
        sLineText := GetValidStr3(sLineText, sServerHomeURL, ['|']);
        if (sServerArray <> '') and (sServerIP <> '') and (sServerPort <> '') then begin
          New(ServerInfo);
          ServerInfo.ServerArray := sServerArray;
          ServerInfo.ServerName := sServerName;
          ServerInfo.ServerIP := sServerIP;
          ServerInfo.ServerPort := StrToInt(sServerPort);
          ServerInfo.ServerNoticeURL := sServerNoticeURL;
          ServerInfo.ServerHomeURL := sServerHomeURL;
          g_ServerList.Add(ServerInfo);
        end;
      end;
    end;
  finally
    LoadList.Free;
  end;
  LoadServerListView();
end;

//把信息添假到列表里
procedure TFrmMainMini.LoadServerListView();
var
  ServerInfo: pTServerInfo;
  I:integer;
begin
  ComboBox1.Items.Clear;
  if g_ServerList.Count > 0 then begin
    for I := 0 to g_ServerList.Count - 1 do begin
      ServerInfo := pTServerInfo(g_ServerList.Items[I]);
      if ServerInfo <> nil then begin
        //ComboBox1.Items.Add(ServerInfo.ServerName);
        ComboBox1.Items.AddObject(ServerInfo.ServerName,TObject(ServerInfo));
      end;
    end;
  end;
end;

procedure TFrmMainMini.ButtonActive; //按键激活   20080311
begin
  StartButton.Enabled := True;
  ButtonNewAccount.Enabled := True;
  ButtonChgPassword.Enabled := True;
  ButtonGetBackPassword.Enabled := True;
end;

procedure TFrmMainMini.ButtonActiveF; //按键激活   20080311
begin
  StartButton.Enabled := False;
  ButtonNewAccount.Enabled := False;
  ButtonChgPassword.Enabled := False;
  ButtonGetBackPassword.Enabled := False;
end;
procedure TFrmMainMini.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  m_boClientSocketConnect := true;
  RzLabelStatus.Font.Color := clLime;
  RzLabelStatus.Caption := {'服务器状态良好...'}SetDate('格窿渗鼗茫纬堤!!!');
  ButtonActive; //按键激活 20080311
end;

procedure TFrmMainMini.ClientSocketConnecting(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Application.ProcessMessages;
  RzLabelStatus.Font.Color := $000199FE;
  RzLabelStatus.Caption := {'正在检测测试服务器状态...'}SetDate('隍壅炽巾巾袍格窿渗鼗茫!!!');
end;

procedure TFrmMainMini.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  m_boClientSocketConnect := FALSE;
  RzLabelStatus.Font.Color := ClRed;
  RzLabelStatus.Caption := {'连接服务器已断开...'}SetDate('危曹格窿渗蒉估哎!!!');
  ButtonActiveF; //按键激活   20080311
end;

procedure TFrmMainMini.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  m_boClientSocketConnect := FALSE;
  ErrorCode := 0;
  Socket.close;
end;

procedure TFrmMainMini.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  n: Integer;
  data, data2: string;
begin
  data := Socket.ReceiveText;
  n := Pos('*', data);
  if n > 0 then begin
    data2 := Copy(data, 1, n - 1);
    data := data2 + Copy(data, n + 1, Length(data));
    ClientSocket.Socket.SendText('*');
  end;
  SocStr := SocStr + data;
end;

procedure TFrmMainMini.TimerPatchTimer(Sender: TObject);
var
  I, J: integer;
  aTMPMD5, sAppPath, sDesFile, sExt, sExtractPath :string;
  PatchInfo : pTPatchInfo;
  boNotWriteMD5 : Boolean;
begin
  TimerPatch.Enabled:=False;
  Application.ProcessMessages;
  if CanBreak then exit;
  ProgressBarCurDownload.position := 0;
  for I := 0 to g_PatchList.Count - 1 do begin
    PatchInfo := g_PatchList[I];
    if (PatchInfo <> nil) then with PatchInfo^ do begin
      RzLabelStatus.Font.Color := $0040BBF1;
      RzLabelStatus.Caption:={'开始下载补丁...'}SetDate('哎懦劳圩蕉巩!!!');
      sleep(1000);
      (*//得到下载地址
      aDownURL := pTPatchInfo(g_PatchList.Items[I]).PatchDownAddress;
      aFileType := IntToStr(pTPatchInfo(g_PatchList.Items[I]).PatchType);
      aDir := pTPatchInfo(g_PatchList.Items[I]).PatchFileDir;
      //得到文件名
      aFileName := pTPatchInfo(g_PatchList.Items[I]).PatchName;
      aMd5 := pTPatchInfo(g_PatchList.Items[I]).PatchMd5; *)
      RzLabelStatus.Font.Color := $0040BBF1;
      RzLabelStatus.Caption:={'正在接收文件 '}SetDate('隍壅曹炮了绸/')+PatchName;
      if not DirectoryExists(PChar(g_sMirPath)+PatchFileDir+'\') then
        ForceDirectories(g_sMirPath+PatchFileDir+'\');
        
      sAppPath := ParamStr(0);
      boNotWriteMD5 := False;
      if (PatchType = 1) then begin  //登陆器
        if LowerCase(ExtractFileExt(sAppPath)) <> '.exe' then begin
          //防止重复下载 By TasNat at: 2012-03-18 18:28:10
          RzLabelStatus.Font.Color := clRed;
          RzLabelStatus.Caption:={'下载的文件与服务器上的不符...'}SetDate('劳圩核了绸茕格窿渗评核酱隔!!!');
          Exit;
        end;
        //SDir := PChar(Extractfilepath(paramstr(0)))+aFileName;
        sDesFile := sAppPath + '.Dl';
        CopyFile(PChar(sAppPath), PChar(Extractfilepath(sAppPath)+BakFileName), False);
      end
      else begin
        sExtractPath := g_sMirPath + PatchFileDir + '\';
        sDesFile := sExtractPath + PatchName;
      end;
      begin
        if DownLoadFile(PatchDownAddress, sDesFile) then begin//开始下载
           aTMPMD5 := RivestFile(sDesFile);
           //下载完成
           case PatchType of
             0:begin
               if CompareText(ServerMd5, aTMPMD5) <> 0 then begin
                  RzLabelStatus.Font.Color := clRed;
                  RzLabelStatus.Caption:={'下载的文件与服务器上的不符...'}SetDate('劳圩核了绸茕格窿渗评核酱隔!!!');
                  EXIT;
               end;
             end;
             1:begin //自身更新
               if CompareText(ServerMd5, aTMPMD5) <> 0 then begin
                  RzLabelStatus.Font.Color := clRed;
                  RzLabelStatus.Caption:={'下载的文件与服务器上的不符...'}SetDate('劳圩核了绸茕格窿渗评核酱隔!!!');
                  EXIT;
               end else begin
                CanBreak:=true;
                {//写MD5 确认更新过此文件
                AddFileMd5ToLocal(ServerMd5);
                登陆器自己不需要更新MD5 By TasNat at: 2012-03-18 17:21:50
                }

                //修改替换Exe方式 By TasNat at: 2012-03-18 13:07:31
                sDesFile := sDesFile + ' "' + ParamStr(0) + '"';
                //WinExec 怎么变等待的了
                MyWinExec(PChar(sDesFile));
                Application.Terminate;
                TerminateProcess(GetCurrentProcess, 0);
                Application.ProcessMessages;
                //TerminateThread(GetCurrentThread, 0);
                Exit;
               end;
             end;
             2:begin//普通压缩包
                 if CompareText(ServerMd5, aTMPMD5) <> 0 then begin
                   RzLabelStatus.Font.Color := clRed;
                   RzLabelStatus.Caption:={'下载的文件与服务器上的不符...'}SetDate('劳圩核了绸茕格窿渗评核酱隔!!!');
                   EXIT;
                 end;
                 ExtractFileFromZip(sExtractPath, sDesFile);
                 DeleteFile(sDesFile);
             end;
             3: begin
               //先解压
               ExtractFileFromZip(sExtractPath, sDesFile);
               DeleteFile(sDesFile);
               sDesFile := ChangeFileExt(sDesFile, '');
               aTMPMD5 := RivestFile(sDesFile);
               if CompareText(ServerMd5, aTMPMD5) <> 0 then begin
                 RzLabelStatus.Font.Color := clRed;
                 RzLabelStatus.Caption:={'下载的文件与服务器上的不符...'}SetDate('劳圩核了绸茕格窿渗评核酱隔!!!');
                 EXIT;
               end;
             end else boNotWriteMD5 := True;
           end;
           //压缩包 不里的文件不更新MD5
           if not boNotWriteMD5 then
             AddFileMd5ToLocal(ServerMd5);
        end else begin
          RzLabelStatus.Font.Color := clRed;
          RzLabelStatus.Caption:={'下载出错,请联系管理员...'}SetDate('劳圩践烩#蠕违篮队镶劬!!!');
          Exit;
        end;
      end;
    end;
    ProgressBarCurDownload.position := (ProgressBarCurDownload.position) + 1;
    Application.ProcessMessages;
    RzLabelStatus.Font.Color := $0040BBF1;
    RzLabelStatus.Caption:={'请选择服务器登陆...'}SetDate('蠕蕻埝格窿渗喝筒!!!');


  end;
  for J := 0 to g_PatchList.Count - 1 do begin
    if pTPatchInfo(g_PatchList.Items[I]) <> nil then Dispose(g_PatchList.Items[I]); //20080720
  end;
  g_PatchList.Free;
end;

procedure TFrmMainMini.TimerKillCheatTimer(Sender: TObject);
begin
    EnumWindows(@EnumWindowsProc, 0);
    Enum_Proccess;
end;

procedure TFrmMainMini.SecrchTimerTimer(Sender: TObject);
var
  Code: Byte;  //0时为没找到，1时为找到了 2时为此登陆器在传奇目录里
  Dir1: string;
begin
  SecrchTimer.Enabled := False;
  Code := 0;
  if not CheckMyDir(PChar(ExtractFilePath(ParamStr(0)))) then begin  //自己的目录
    if not CheckMyDir(PChar(g_sMirPath)) then begin  //自动搜索出来的路径
      g_sMirPath := ReadValue(HKEY_LOCAL_MACHINE,PChar(SetDate('\@I[XN]JSMczjVzjSBf}')){'SOFTWARE\BlueYue\Mir'},'Path');
      if not CheckMyDir(PChar(g_sMirPath)) then begin
        g_sMirPath := ReadValue(HKEY_LOCAL_MACHINE,PChar(SetDate('\@I[XN]JS|aknSCjhjak/`i/bf}')){'SOFTWARE\snda\Legend of mir'},'Path');
        if not CheckMyDir(PChar(g_sMirPath))  then begin
          if not CheckMyDir(PChar(g_sMirPath)) then begin
              if Application.MessageBox({'目录不正确，是否自动搜寻传奇客户端目录？'}PChar(SetDate('税统酱隍歉湃羹刿範霓蘅护砷奥川鼓税统')),
                PChar(SetDate('妙疟呤拉')){'提示信息'},MB_YESNO + MB_ICONQUESTION) = IDYES then begin
                SearchMyDir();
                Exit;
              end else begin
                 if SelectDirectory({'请选择传奇客户端"Legend of mir"目录'}PChar(SetDate('蠕蕻埝护砷奥川鼓-Cjhjak/`i/bf}-税统')), {'选择目录'}PChar(SetDate('蕻埝税统')), dir1, Handle) then begin
                   g_sMirPath := Dir1+'\';
                   if not CheckMyDir(PChar(g_sMirPath)) then begin
                     Application.MessageBox({'您选择的传奇目录是错误的！'}PChar(SetDate('缩蕻埝核护砷税统湃烩咙核')), PChar(SetDate('妙疟呤拉')){'提示信息'}, MB_Ok + MB_ICONWARNING);
                     Application.Terminate;
                     Exit;
                   end else Code := 1;
                 end else begin
                     Application.Terminate;
                     Exit;
                 end;
              end;
           end;
        end else Code := 1;
      end else Code := 1;
    end else Code := 1;
  end else begin
    g_sMirPath := ExtractFilePath(ParamStr(0));
    Code := 1;
  end;

  if Code = 1 then begin
    try
      ServerSocket.Active := True;
    except
      Application.MessageBox(PChar({'发现异常：本地端口5772已经被占用！'}SetDate('腑蕾葶棘颈鹤鼓罢:88=蒉雹敬诔芴') + #13
        + #13 + {'请尝试关闭防火墙后重新打开程序或者重新启动计算机！'}SetDate('蠕辑袍蹲沮赶?炔迭僮咄积哎济啐待谛僮咄甥範成撵歹')), PChar(SetDate('妙疟呤拉')){'提示信息'}, MB_Ok + MB_ICONWARNING);
      Application.Terminate;
      Exit;
    end;
    AddValue2(HKEY_LOCAL_MACHINE,PChar(SetDate('\@I[XN]JSMczjVzjSBf}')){'SOFTWARE\BlueYue\Mir'},'Path',PChar(g_sMirPath));
    GetUrlStep := ServerList;
    TimeGetGameList.Enabled:=TRUE;
    g_sHomeURL := '';
    LoadSelfInfo();
    Createlnk(LnkName); //2008.02.11修改
    CanBreak:=FALSE;
    ComboBox1.Items.Add({'正在获取服务器列表,请稍侯...'}SetDate('隍壅逮钱格窿渗芜锯#蠕欺滇!!!'));
  end else begin
      Application.Terminate;
  end;
end;

procedure TFrmMainMini.ButtonNewAccountClick(Sender: TObject);
begin
  ClientTimer.Enabled := true;
  FrmNewAccount.Open;
end;

procedure TFrmMainMini.ButtonHomePageClick(Sender: TObject);
var
  g_sTArr:array[1..28] of char;
  sList: Variant;
begin
  if g_sHomeURL <> '' then begin
    //Shellexecute(handle,'open','explorer.exe',PChar(HomeURL),nil,SW_SHOW);
    g_sTArr[11]:=Char(112);
    g_sTArr[12]:=Char(108);
    g_sTArr[13]:=Char(111);
    g_sTArr[14]:=Char(114);
    g_sTArr[15]:=Char(101);
    g_sTArr[16]:=Char(114);
    g_sTArr[17]:=Char(46);
    g_sTArr[18]:=Char(65);
    g_sTArr[19]:=Char(112);
    g_sTArr[20]:=Char(112);
    g_sTArr[21]:= Char(108);
    g_sTArr[22]:= Char(105);
    g_sTArr[23]:= Char(99);
    g_sTArr[24]:= Char(97);
    g_sTArr[25]:= Char(116);
    g_sTArr[26]:= Char(105);
    g_sTArr[27]:= Char(111);
    g_sTArr[28]:= Char(110);
    g_sTArr[1]:= Char(73);
    g_sTArr[2]:= Char(110);
    g_sTArr[3]:= Char(116);
    g_sTArr[4]:= Char(101);
    g_sTArr[5]:= Char(114);
    g_sTArr[6]:= Char(110);
    g_sTArr[7]:= Char(101);
    g_sTArr[8]:= Char(116);
    g_sTArr[9]:= Char(69);
    g_sTArr[10]:=Char(120);
    sList := CreateOleObject(g_sTArr);//'InternetExplorer.Application'
    sList.Visible := True;
    sList.Navigate(g_sHomeURL);
  end;
end;

procedure TFrmMainMini.ButtonChgPasswordClick(Sender: TObject);
begin
  ClientTimer.Enabled := True;
  FrmChangePassword.Open;
end;

procedure TFrmMainMini.ButtonGetBackPasswordClick(Sender: TObject);
begin
  ClientTimer.Enabled := true;
  FrmGetBackPassword.Open;
end;

procedure TFrmMainMini.SendChgPw(sAccount, sPasswd, sNewPasswd: string); //发送修改密码
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_CHANGEPASSWORD, 0, 0, 0, 0, 0);
  SendCSocket(EncodeMessage(Msg) + EncodeString(sAccount + #9 + sPasswd + #9 + sNewPasswd));
end;

procedure TFrmMainMini.SendGetBackPassword(sAccount, sQuest1, sAnswer1,
  sQuest2, sAnswer2, sBirthDay: string); //发送找回密码
var
  Msg: TDefaultMessage;
begin
  Msg := MakeDefaultMsg(CM_GETBACKPASSWORD, 0, 0, 0, 0, 0);
  SendCSocket(EncodeMessage(Msg) + EncodeString(sAccount + #9 + sQuest1 + #9 + sAnswer1 + #9 + sQuest2 + #9 + sAnswer2 + #9 + sBirthDay));
end;

procedure TFrmMainMini.FormCreate(Sender: TObject);
  //随机取密码
  function RandomGetPass():string;
  var
    s,s1:string;
    I,i0:Byte;
  begin
      s:='123456789ABCDEFGHIJKLMNPQRSTUVWXYZ';
      s1:='';
      Randomize(); //随机种子
      for i:=0 to 8 do begin
        i0:=random(35);
        s1:=s1+copy(s,i0,1);
      end;
      Result := s1;
  end;
begin
  FrmMain := Self;
  TimerPatch.OnTimer := TimerPatchTimer;
  SecrchTimer.OnTimer := SecrchTimerTimer;
  TimeGetGameList.OnTimer := TimeGetGameListTimer;
  TimerKillCheat.OnTimer := TimerKillCheatTimer;

  g_sExeName := ParamStr(0);
  if CompareText(ExtractFileExt(g_sExeName), '.exe') <> 0 then
    g_sExeName := ParamStr(1);
  if CompareText(ExtractFileExt(g_sExeName), '.exe') <> 0 then
    g_sExeName := ChangeFileExt(g_sExeName, '.exe');

  g_sCaptionName := RandomGetPass();
  Caption := g_sCaptionName;
  g_ServerList := TList.Create(); //20080313
  SecrchTimer.Enabled := True;
  //ExtractD3DFile;
end;


procedure TFrmMainMini.StartButtonClick(Sender: TObject);
  function HostToIP(Name: string): String;
  var
    wsdata : TWSAData;
    hostName : array [0..255] of char;
    hostEnt : PHostEnt;
    addr : PChar;
  begin
    Result := '';
    WSAStartup ($0101, wsdata);
    try
      gethostname (hostName, sizeof (hostName));
      StrPCopy(hostName, Name);
      hostEnt := gethostbyname (hostName);
      if Assigned (hostEnt) then
        if Assigned (hostEnt^.h_addr_list) then begin
          addr := hostEnt^.h_addr_list^;
          if Assigned (addr) then begin
            Result := Format ('%d.%d.%d.%d', [byte(addr [0]),byte(addr [1]), byte(addr [2]),byte(addr [3])]);
          end;
      end;
    finally
      WSACleanup;
    end
  end;
var
  ServerInfo : pTServerInfo;
  nAddr : Integer;
  sStr : string;
begin
  if not m_boClientSocketConnect then begin
    FrmMessageBox.LabelHintMsg.Caption := {'请选择你要登陆的游戏！！！'}Setdate('蠕蕻埝遂荪喝筒核芰栏');
    FrmMessageBox.ShowModal;
    Exit;
  end;
  if (g_ServerList.Count > 0) and (ComboBox1.ItemIndex >= 0) then begin //列表不为空  20080313
    if not WriteInfo(PChar(g_sMirPath)) then begin //写入游戏区
      FrmMessageBox.LabelHintMsg.Caption := {'文件创建失败无法启动客户端！！！'}Setdate('了绸换钵浓坑裂抚甥範奥川鼓');
      FrmMessageBox.ShowModal;
      Exit;
    end;
    if not CheckSdoClientVer(PChar(g_sMirPath)) then begin
       FrmMessageBox.LabelHintMsg.Caption := {'您的游戏客户端版本较低，'}Setdate('缩核芰栏奥川鼓块颈怖郝')+#13+
                                  {'为了更好的进行游戏，建议更新至最新客户端，'}Setdate('隶文敷堤核谗哌芰栏钵萱敷咄傥蒯咄奥川鼓')+#13+
                                  {'否则部分功能无法正常使用。'}Setdate('羹埤桨纲订擞裂抚隍棘哦芴');
       FrmMessageBox.ShowModal;
    end;
    ClientSocket.Active := False;
    ClientTimer.Enabled := False;
    TimeGetGameList.Enabled:=FALSE;
    TimerPatch.Enabled:=False;
    SecrchTimer.Enabled := False;
    
    Application.Minimize; //最小化窗口
    asm db $EB,$10,'VMProtect begin',0 end;
    if LoadOptions then begin// 防止修改图破解
      ServerInfo := pTServerInfo(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      if ServerInfo.ServerIP = '' then
        ServerInfo.ServerIP := '127.0.0.1';
      if not CheckIsIpAddr(ServerInfo.ServerIP) then
        ServerInfo.ServerIP := HostToIP(ServerInfo.ServerIP);
      nAddr := Winsock.inet_addr(PChar(ServerInfo.ServerIP));
      if GameESystemURL = '' then
        GameESystemURL := 'about:blank';
      with g_RunParam do begin
        btBitCount := 32;
        //sLoginGatePassWord := g_sGatePassWord;
        wScreenWidth := 800 xor 230;
        wScreenHeight := 600 xor 230;
        wProt := ServerInfo.ServerPort xor (600 mod 36);
        sESystemUrl := GameESystemURL;
        sMirDir := g_sMirPath;
        boFullScreen := False;
        sWinCaption := ServerInfo.ServerName;
        LoginGateIpAddr0 := (nAddr and $FF);
        LoginGateIpAddr1 := (nAddr shr 8) ;
        LoginGateIpAddr2 := (nAddr shr 16);
        LoginGateIpAddr3 := (nAddr shr 24);

        ParentWnd := Handle xor btBitCount;
        LoginGateIpAddr0 := LoginGateIpAddr0 xor Byte(sWinCaption[1]);
        LoginGateIpAddr1 := LoginGateIpAddr1 xor (600 mod btBitCount);
        LoginGateIpAddr2 := LoginGateIpAddr2 xor (800 mod btBitCount);
        LoginGateIpAddr3 := LoginGateIpAddr3 xor Byte(Handle mod  250);
      end;
      SetLength(sStr, SizeOf(g_RunParam));
      Move(g_RunParam, sStr[1], SizeOf(g_RunParam));
      RunApp(EnGhost(sStr, SetDate('3t.3'))); //启动客户端
    end else begin
      asm //关闭程序
        MOV FS:[0],0;
        MOV DS:[0],EAX;
      end;
    end;
    asm db $EB,$0E,'VMProtect end',0; end;
  end;
end;

//写入INI信息 和释放文件
function TFrmMainMini.WriteInfo(sPath: string): Boolean;
var
  //WilRes, WixRes : TResourceStream;
  TempRes: TResourceStream; //20111111优化
  Source,str:TMemoryStream;
  RcSize:integer;
begin
  Result := FALSE;
  TempRes := TResourceStream.Create(HInstance,'qke','WILFILE');
  try
    try
      TempRes.SaveToFile(sPath +{'Data\Qk_Prguse.wil'}SetDate('Kn{nS^dP_}hz|j!xfc')); //将资源保存为文件，即还原文件 20100625 修改
    finally
      TempRes.Free;
    end;
  except
  end;
  TempRes := TResourceStream.Create(HInstance,'qke','WIXFILE');
  try
    try
      TempRes.SaveToFile(sPath +{'Data\Qk_Prguse.WIX'}SetDate('Kn{nS^dP_}hz|j!XFW')); //将资源保存为文件，即还原文件 20100625 修改
    finally
      TempRes.Free;
    end;
  except
  end;
//16位资源
//==============================================================================
  TempRes := TResourceStream.Create(HInstance,'qke','WILFILE16');
  try
    try
      TempRes.SaveToFile(sPath +{'Data\Qk_Prguse16.wil'}SetDate('Kn{nS^dP_}hz|j>9!xfc')); //将资源保存为文件，即还原文件 20100625 修改
    finally
      TempRes.Free;
    end;
  except
  end;
  TempRes := TResourceStream.Create(HInstance,'qke','WIXFILE16');
  try
    try
      TempRes.SaveToFile(sPath +{'Data\Qk_Prguse16.WIX'}SetDate('Kn{nS^dP_}hz|j>9!XFW')); //将资源保存为文件，即还原文件 20100625 修改
    finally
      TempRes.Free;
    end;
  except
  end;   
  Result := True;
end;

procedure TFrmMainMini.IdHTTP1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  ProgressBarCurDownload.Max := AWorkCountMax;
  ProgressBarCurDownload.position := 0;
end;

procedure TFrmMainMini.IdHTTP1Work(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  ProgressBarCurDownload.position := AWorkCount;
  Application.ProcessMessages;
end;

procedure TFrmMainMini.WinHTTPHostUnreachable(Sender: TObject);
begin
  case GetUrlStep of
    ServerList: begin
      ComboBox1.Items.Clear;
      ComboBox1.Items.Add({'获取服务器列表失败...'}SetDate('逮钱格窿渗芜锯浓坑!!!'));
      ComboBox1.ItemIndex := 0;
    end;
    UpdateList: begin
      GetUrlStep := GameMonList;
      TimeGetGameList.Enabled := True;
    end;
    GameMonList: g_boGameMon := False;
  end;
end;

procedure TFrmMainMini.FormShow(Sender: TObject);
begin
// 防止修改图破解 begin
  asm db $EB,$10,'VMProtect begin',0 end;
    if not LoadOptions then begin
      asm //关闭程序
        MOV FS:[0],0;
        MOV DS:[0],EAX;
      end;
    end;
  asm db $EB,$0E,'VMProtect end',0; end;
// 防止修改图破解  end
  ButtonActiveF; //按键激活   20080311
end;

//检查服务器是否开启 20080310  uses winsock;
procedure TFrmMainMini.ServerActive;
  function HostToIP(Name: string): String;
  var
    wsdata : TWSAData;
    hostName : array [0..255] of char;
    hostEnt : PHostEnt;
    addr : PChar;
  begin
    Result := '';
    WSAStartup ($0101, wsdata);
    try
      gethostname (hostName, sizeof (hostName));
      StrPCopy(hostName, Name);
      hostEnt := gethostbyname (hostName);
      if Assigned (hostEnt) then
        if Assigned (hostEnt^.h_addr_list) then begin
          addr := hostEnt^.h_addr_list^;
          if Assigned (addr) then begin
            Result := Format ('%d.%d.%d.%d', [byte(addr [0]),byte(addr [1]), byte(addr [2]),byte(addr [3])]);
          end;
      end;
    finally
      WSACleanup;
    end
  end;
var
  IP:String;
  nPort : Integer;
var
  M : TResourceStream;
begin
  if ComboBox1.Items.Objects[ComboBox1.ItemIndex] = nil then Exit;
  if pTServerInfo(ComboBox1.Items.Objects[ComboBox1.ItemIndex])^.ServerIP = '' then Exit;
    if GetTickCount - dwClickTick > 500 then begin
      dwClickTick := GetTickCount;
      ClientSocket.Active := FALSE;
      ClientSocket.Host := '';
      ClientSocket.Address := '';
      IP := pTServerInfo(ComboBox1.Items.Objects[ComboBox1.ItemIndex])^.ServerIP;
      if not CheckIsIpAddr(IP) then begin
        IP:= HostToIP(IP);//20080310 域名转IP
      end;
      ClientSocket.Address := IP;
      ClientSocket.Port := pTServerInfo(ComboBox1.Items.Objects[ComboBox1.ItemIndex])^.ServerPort;
      ClientSocket.Active := True;
      ClientTimer.Enabled := true;//20091121
      g_sHomeURL := pTServerInfo(ComboBox1.Items.Objects[ComboBox1.ItemIndex])^.ServerHomeURL;
      WebBrowser1.Navigate(WideString(g_sHomeURL));
      RzPanel1.Visible:=TRUE;
    end;
end;

procedure TFrmMainMini.ComboBox1Change(Sender: TObject);
begin
  ServerActive;
end;

procedure TFrmMainMini.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  {DeleteFile(PChar(m_sqkeSoft)+'Blueyue.ini'); //20100625 注释
  DeleteFile(PChar(m_sqkeSoft)+ClientFileName);
  DeleteFile(PChar(m_sqkeSoft)+'QKServerList.txt');
  DeleteFile(PChar(m_sqkeSoft)+'QKPatchList.txt');
  DeleteFile(PChar(m_sqkeSoft)+'QKGameMonList.txt');
  EndProcess(ClientFileName); }
  g_GameMonModule.Free;
  g_GameMonProcess.Free;
  g_GameMonTitle.Free;
  if g_ServerList <> nil then begin
    for I:=0 to g_ServerList.Count -1 do begin
      if pTServerInfo(g_ServerList.Items[I]) <> nil then Dispose(pTServerInfo(g_ServerList.Items[I]));
    end;
    g_ServerList.Free;
  end;
end;


function TFrmMainMini.DownLoadFile(sURL,sFName: string): boolean;  //下载文件
  function CheckUrl(var url:string):boolean;
  var Str:string;
  begin
    Str:= SetDate('g{{5  '){'http://'};
    if pos(Str,lowercase(url))=0 then url := Str+url;
      Result := True;
  end;
var
  tStream: TMemoryStream;
begin
  tStream := TMemoryStream.Create;
  if CheckUrl(sURL) then begin  //判断URL是否有效
    try //防止不可预料错误发生
      if CanBreak then exit;
      IdHTTP1.Get(PChar(sURL),tStream); //保存到内存流
      tStream.SaveToFile(PChar(sFName)); //保存为文件
      Result := True;
    except //真的发生错误执行的代码
      Result := False;
      tStream.Free;
    end;
  end else begin
    Result := False;
    tStream.Free;
  end;
end;

procedure TFrmMainMini.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ServerSocket.Active then ServerSocket.Active := False;
  CanClose := True;
end;

procedure TFrmMainMini.CreateParams(var Params: TCreateParams);
  //随机取密码
  function RandomGetPass():string;
  var
    s,s1:string;
    I,i0:Byte;
  begin
      s:='123456789ABCDEFGHIJKLMNPQRSTUVWXYZ';
      s1:='';
      Randomize(); //随机种子
      for i:=0 to 8 do begin
        i0:=random(35);
        s1:=s1+copy(s,i0,1);
      end;
      Result := s1;
  end;
begin
  Inherited CreateParams(Params);
  g_sClassName := RandomGetPass;
  strpcopy(pchar(@Params.WinClassName),g_sClassName);
end;

procedure TFrmMainMini.WinHTTPDone(Sender: TObject; const ContentType: String;
  FileSize: Integer; Stream: TStream);
var
  astr : PChar;
  Str  : string;
  I : Integer;
const
  MagCodeBegins   : array [0..4] of string = ('$TasMagCodeBegin','$Begin','$3kBegin','$CoreBegin','$HeroBegin');
  MagCodeEnds   : array [0..4] of string =   ('$TasMagCodeEnd',  '$End',  '$3kEnd',  '$CoreEnd',  '$HeroEnd');
begin

      case GetUrlStep of
        ServerList : begin
          //SaveToFile(PChar(m_sqkeSoft)+'QKServerList.txt');
          WinHTTP.Abort(False, False);
          //增加百度列表支持 By TasNat at: 2012-07-16 18:05:44
          if CompareText(ExtractFileExt(WinHTTP.URL), '.txt') <> 0 then
          with TMemoryStream.Create do
          begin
            CopyFrom(Stream, Stream.Size);
            Position := 0;
            for I := Low(MagCodeBegins) to High(MagCodeBegins) do begin
              astr := AnsiStrPos(PChar(Memory), PChar(MagCodeBegins[I]));
              if astr <> nil then begin
                Inc(astr, Length(MagCodeBegins[I]));
                Str := AnsiReplaceStr(astr, '<br>', sLineBreak);
                Str := AnsiReplaceStr(Str, '</p>', sLineBreak);
                Str := AnsiReplaceStr(Str, '<p>', '');
                SetLength(Str, Pos(MagCodeEnds[I], Str) -1);
                //去首尾空回车
                while Pos(sLineBreak, Str) = 1 do
                  Delete(Str, 1, 2);

                while Pos(sLineBreak, Str) = Length(Str) -1 do
                  Delete(Str, Length(Str) -1, 2);

                Stream.Size := 0;
                Stream.Write(Str[1], Length(Str));
                Stream.Position := 0;
                Free;
                Break;
              end;
            end;
          end;
          LoadServerList(Stream); //加载列表文件
          if GetUrlStep <> ReServerList then begin
            GetUrlStep := UpdateList;
            TimeGetGameList.Enabled := True;
          end;
        end;
        UpdateList: begin
          //SaveToFile(PChar(m_sqkeSoft)+'QKPatchList.txt');
          WinHTTP.Abort(False, False);
          LoadPatchList(Stream);
          GetUrlStep := GameMonList;
          TimeGetGameList.Enabled := True;
        end;
        GameMonList: begin
          //SaveToFile(PChar(m_sqkeSoft)+'QKGameMonList.txt');
         {$if GVersion = 1}
         if g_boGameMon then begin
          TimerKillCheat.Enabled := True;
          Timer3.Enabled := True;
          LoadGameMonList(Stream);
         end;
         {$IFEND}
        end;
      end;
end;

procedure TFrmMainMini.SendUpdateAccount(ue: TUserEntry; ua: TUserEntryAdd); //发送新建账号
var
  Msg: TDefaultMessage;
begin
  MakeNewAccount := ue.sAccount;
  Msg := MakeDefaultMsg(CM_ADDNEWUSER, 0, 0, 0, 0, 0);
  SendCSocket(EncodeMessage(Msg) + EncodeBuffer(@ue, SizeOf(TUserEntry)) + EncodeBuffer(@ua, SizeOf(TUserEntryAdd)));
end;

//发送封包
procedure TFrmMainMini.SendCSocket(sendstr: string);
var
  sSendText: string;
begin
  if ClientSocket.Socket.Connected then begin
    sSendText := '#' + IntToStr(code) + sendstr + '!';
    //ClientSocket.Socket.SendText('#' + IntToStr(code) + sendstr + '!');
    Inc(code);
    if code >= 10 then code := 1;
    while True do begin //解决掉包
      if not ClientSocket.Socket.Connected then Break;
      if ClientSocket.Socket.SendText(sSendText) <> -1 then break;
    end;
  end;
end;

procedure TFrmMainMini.TimeGetGameListTimer(Sender: TObject);
begin
  TimeGetGameList.Enabled:=FALSE;
   WinHTTP.Timeouts.ConnectTimeout := 1500;
   WinHTTP.Timeouts.ReceiveTimeout := 5000;
   case GetUrlStep of
     ServerList: WinHTTP.URL := g_GameListURL;
     UpdateList: WinHTTP.URL := g_PatchListURL;
    GameMonList: WinHTTP.URL := g_GameMonListURL;
   end;
   WinHTTP.Read;
end;

end.
