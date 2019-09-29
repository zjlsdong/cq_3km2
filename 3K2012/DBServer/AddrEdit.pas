unit AddrEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Spin, Buttons, ExtCtrls, Grids;
type
  TFrmEditAddr = class(TForm)
    AddrGrid: TStringGrid;
    Panel1: TPanel;
    BtnApplyAndClose: TButton;
    ERowCount: TSpinEdit;
    Label1: TLabel;
    BtnApplyRow: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnApplyRowClick(Sender: TObject);
    procedure BtnApplyAndCloseClick(Sender: TObject);
    procedure Open();
  private
    procedure ClearCells();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditAddr: TFrmEditAddr;

  {This file is generated by DeDe Ver 3.50.02 Copyright (c) 1999-2002 DaFixer}

implementation

uses HUtil32, DBShare;

{$R *.DFM}

procedure TFrmEditAddr.FormCreate(Sender: TObject);
begin
  ERowCount.Value := 8;
  AddrGrid.Cells[0, 0] := '角色选择网关地址';
  AddrGrid.Cells[1, 0] := '游戏网关';
  AddrGrid.Cells[2, 0] := '端口';
  AddrGrid.Cells[3, 0] := '游戏网关';
  AddrGrid.Cells[4, 0] := '端口';
  AddrGrid.Cells[5, 0] := '游戏网关';
  AddrGrid.Cells[6, 0] := '端口';
  AddrGrid.Cells[7, 0] := '游戏网关';
  AddrGrid.Cells[8, 0] := '端口';
end;

procedure TFrmEditAddr.BtnApplyRowClick(Sender: TObject);
begin
  if ERowCount.Value < 1 then ERowCount.Value := 1;
  AddrGrid.RowCount := ERowCount.Value + 1;
end;

procedure TFrmEditAddr.BtnApplyAndCloseClick(Sender: TObject);
var
  i, ii: Integer;
  SaveList: TStringList;
  s14: string;
begin
  SaveList := TStringList.Create;
  for i := 1 to AddrGrid.RowCount - 1 do begin
    s14 := Trim(AddrGrid.Cells[0, i]);
    if s14 <> '' then begin
      s14 := s14 + ' ';
      for ii := 1 to AddrGrid.ColCount - 1 do begin
        s14 := s14 + Trim(AddrGrid.Cells[ii, i]) + ' ';
      end;
    end;
    SaveList.Add(s14);
  end;
  try
    SaveList.SaveToFile(sGateConfFileName);
  except
    ShowMessage(sGateConfFileName + ' 保存异常！！！');
  end;
  Self.Close;
end;

procedure TFrmEditAddr.ClearCells();
var
  i, ii: Integer;
begin
  for i := 1 to AddrGrid.RowCount - 1 do begin
    for ii := 0 to AddrGrid.ColCount - 1 do begin
      AddrGrid.Cells[ii, i] := '';
    end;
  end;
end;

procedure TFrmEditAddr.Open();
var
  LoadList: TStringList;
  i, n18, n1C: Integer;
  sStr: string;
  sStr1: string;
begin
  ClearCells();
  LoadList := TStringList.Create;
  try
    LoadList.LoadFromFile(sGateConfFileName);
  except
    ShowMessage(sGateConfFileName + ' 读取异常！！！');
  end;
  n1C := 1;
  for i := 0 to LoadList.Count - 1 do begin
    sStr := Trim(LoadList.Strings[i]);
    if (sStr <> '') and (sStr[1] <> ';') then begin
      sStr := GetValidStr3(sStr, sStr1, [#32, #9]);
      AddrGrid.Cells[0, n1C] := sStr1;
      n18 := 0;
      while (True) do begin
        if sStr <> '' then begin
          sStr := GetValidStr3(sStr, sStr1, [#32, #9]);
          AddrGrid.Cells[n18 * 2 + 1, n1C] := sStr1;
          sStr := GetValidStr3(sStr, sStr1, [#32, #9]);
          AddrGrid.Cells[n18 * 2 + 2, n1C] := sStr1;
          Inc(n18);
          if n18 <= 4 then Continue;
        end;
        Inc(n1C);
        if AddrGrid.RowCount <= n1C then
          AddrGrid.RowCount := AddrGrid.RowCount + 1;
        break;
      end;
    end;
  end;
  LoadList.Free;
  ShowModal;
end;

end.
