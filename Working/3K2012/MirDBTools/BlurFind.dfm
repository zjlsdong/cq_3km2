object FrmBlurFind: TFrmBlurFind
  Left = 328
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #27169#31946#26597#35810
  ClientHeight = 173
  ClientWidth = 189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 189
    Height = 173
    Align = alClient
    BorderOuter = fsFlat
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel26: TRzLabel
      Left = 8
      Top = 19
      Width = 48
      Height = 12
      Caption = #27880#20876'ID'#65306
      Transparent = True
    end
    object RzToolButton1: TRzToolButton
      Left = 8
      Top = 143
      Width = 42
      Height = 22
      GradientColorStyle = gcsSystem
      ImageIndex = 0
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      UseToolbarVisualStyle = False
      VisualStyle = vsGradient
      Caption = #26597#35810
      OnClick = RzToolButton1Click
    end
    object RzToolButton2: TRzToolButton
      Left = 59
      Top = 143
      Width = 67
      Height = 22
      GradientColorStyle = gcsSystem
      ImageIndex = 0
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      UseToolbarVisualStyle = False
      VisualStyle = vsGradient
      Caption = #36716#21040#35814#32454
      OnClick = RzToolButton2Click
    end
    object RzToolButton3: TRzToolButton
      Left = 135
      Top = 143
      Width = 42
      Height = 22
      GradientColorStyle = gcsSystem
      ImageIndex = 0
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      UseToolbarVisualStyle = False
      VisualStyle = vsGradient
      Caption = #20851#38381
      OnClick = RzToolButton3Click
    end
    object RzEdit1: TRzEdit
      Left = 54
      Top = 16
      Width = 121
      Height = 20
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
    end
    object ListBox: TRzListBox
      Left = 8
      Top = 40
      Width = 169
      Height = 97
      Hint = #21452#20987#36716#21040#35814#32454
      FrameHotTrack = True
      FrameVisible = True
      GroupFont.Charset = DEFAULT_CHARSET
      GroupFont.Color = clHighlight
      GroupFont.Height = -12
      GroupFont.Name = #23435#20307
      GroupFont.Style = [fsBold]
      ItemHeight = 14
      ParentShowHint = False
      ShowHint = True
      Style = lbOwnerDrawFixed
      TabOrder = 1
      OnDblClick = RzToolButton2Click
    end
  end
end
