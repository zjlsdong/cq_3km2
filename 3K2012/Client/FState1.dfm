object FrmDlg1: TFrmDlg1
  Left = 0
  Top = 0
  Caption = 'FrmDlg1'
  ClientHeight = 327
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DWRefineDrum: TDWindow
    Left = 8
    Top = 8
    Width = 120
    Height = 120
    OnInitialize = DWRefineDrumInitialize
    Caption = #28140#28860#20891#40723
    DParent = FrmDlg.DBackground
    Visible = False
    GTop = 124
    GLeft = 278
    GHeight = 0
    GWidth = 0
    EnableFocus = False
    ClickCount = csNone
    Floating = True
  end
  object RefineBtn2: TDButton
    Tag = 1
    Left = 31
    Top = 24
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 95
    GLeft = 46
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object RefineBtn1: TDButton
    Left = 62
    Top = 8
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 58
    GLeft = 104
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object RefineBtn4: TDButton
    Tag = 3
    Left = 31
    Top = 62
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 149
    GLeft = 73
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object RefineBtn5: TDButton
    Tag = 4
    Left = 103
    Top = 54
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 149
    GLeft = 139
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object RefineBtn3: TDButton
    Tag = 2
    Left = 93
    Top = 24
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 95
    GLeft = 165
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object RefineBtn6: TDButton
    Tag = 5
    Left = 62
    Top = 72
    Width = 25
    Height = 24
    OnDirectPaint = RefineBtn1DirectPaint
    OnMouseMove = RefineBtn1MouseMove
    OnClick = RefineBtn1Click
    DParent = DWRefineDrum
    Visible = True
    GTop = 207
    GLeft = 105
    GHeight = 31
    GWidth = 33
    EnableFocus = True
    ClickCount = csNone
  end
  object DBRefineDrumOKBtn: TDButton
    Left = 47
    Top = 102
    Width = 56
    Height = 13
    OnDirectPaint = DBRefineDrumOKBtnDirectPaint
    OnClick = DBRefineDrumOKBtnClick
    OnInitialize = DBRefineDrumOKBtnInitialize
    DParent = DWRefineDrum
    Visible = True
    GTop = 269
    GLeft = 91
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DBRefineDrumCloseBtn: TDButton
    Left = 111
    Top = 8
    Width = 17
    Height = 24
    OnDirectPaint = DBRefineDrumCloseBtnDirectPaint
    OnClick = DBRefineDrumCloseBtnClick
    OnInitialize = DBRefineDrumCloseBtnInitialize
    Caption = 'X'
    DParent = DWRefineDrum
    Visible = True
    GTop = 30
    GLeft = 224
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemNew: TDWindow
    Left = 184
    Top = 37
    Width = 233
    Height = 91
    OnDirectPaint = DWSignedItemNewDirectPaint
    OnMouseMove = DWSignedItemNewMouseMove
    OnInitialize = DWSignedItemNewInitialize
    Caption = #26032#37492#23450
    DParent = FrmDlg.DBackground
    Visible = False
    GTop = 150
    GLeft = 155
    GHeight = 0
    GWidth = 0
    EnableFocus = False
    ClickCount = csNone
    Floating = True
  end
  object DCHSignedItemValue1: TDCheckBox
    Left = 224
    Top = 54
    Width = 73
    Height = 20
    OnDirectPaint = DCHSignedItemValue1DirectPaint
    OnInitialize = DCHSignedItemValue1Initialize
    DParent = DWSignedItemNew
    Visible = True
    GTop = 77
    GLeft = 152
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    Alignment = taRightJustify
    Checked = False
    UpColor = clSilver
    HotColor = clWhite
    DownColor = clWhite
  end
  object DCHSignedItemValue2: TDCheckBox
    Tag = 1
    Left = 303
    Top = 54
    Width = 73
    Height = 20
    OnDirectPaint = DCHSignedItemValue1DirectPaint
    OnInitialize = DCHSignedItemValue1Initialize
    DParent = DWSignedItemNew
    Visible = True
    GTop = 77
    GLeft = 295
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    Alignment = taRightJustify
    Checked = False
    UpColor = clSilver
    HotColor = clWhite
    DownColor = clWhite
  end
  object DCHSignedItemValue3: TDCheckBox
    Tag = 2
    Left = 224
    Top = 80
    Width = 73
    Height = 20
    OnDirectPaint = DCHSignedItemValue1DirectPaint
    OnInitialize = DCHSignedItemValue1Initialize
    DParent = DWSignedItemNew
    Visible = True
    GTop = 103
    GLeft = 152
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    Alignment = taRightJustify
    Checked = False
    UpColor = clSilver
    HotColor = clWhite
    DownColor = clWhite
  end
  object DCHSignedItemValue4: TDCheckBox
    Tag = 3
    Left = 303
    Top = 80
    Width = 73
    Height = 20
    OnDirectPaint = DCHSignedItemValue1DirectPaint
    OnInitialize = DCHSignedItemValue1Initialize
    DParent = DWSignedItemNew
    Visible = True
    GTop = 103
    GLeft = 295
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    Alignment = taRightJustify
    Checked = False
    UpColor = clSilver
    HotColor = clWhite
    DownColor = clWhite
  end
  object DWSignedItemPage0: TDButton
    Left = 192
    Top = 37
    Width = 57
    Height = 16
    Hint = #23453#29289#37492#23450
    OnDirectPaint = DWSignedItemPage0DirectPaint
    OnClick = DWSignedItemPage1Click
    OnInitialize = DWSignedItemPage0Initialize
    Caption = #23453#29289#37492#23450
    DParent = DWSignedItemNew
    Visible = True
    GTop = 210
    GLeft = 38
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemPage1: TDButton
    Tag = 1
    Left = 192
    Top = 58
    Width = 57
    Height = 16
    Hint = #37492#23450#35268#21017
    OnDirectPaint = DWSignedItemPage0DirectPaint
    OnClick = DWSignedItemPage1Click
    OnInitialize = DWSignedItemPage0Initialize
    Caption = #37492#23450#35268#21017
    DParent = DWSignedItemNew
    Visible = True
    GTop = 230
    GLeft = 38
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemOk: TDButton
    Left = 351
    Top = 77
    Width = 57
    Height = 16
    Hint = #26222#36890#37492#23450
    OnDirectPaint = DWSignedItemOkDirectPaint
    OnClick = DWSignedItemOkClick
    OnInitialize = DWSignedItemOkInitialize
    Caption = #26222#36890#37492#23450
    DParent = DWSignedItemNew
    Visible = True
    GTop = 223
    GLeft = 352
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemNewNeed2: TDButton
    Tag = 2
    Left = 319
    Top = 106
    Width = 41
    Height = 16
    OnDirectPaint = DWSignedItemNewNeed1DirectPaint
    OnMouseMove = DWSignedItemNewNeed1MouseMove
    OnClick = DWSignedItemNewItemClick
    OnInitialize = DWSignedItemNewNeed1Initialize
    Caption = 'Need2'
    DParent = DWSignedItemNew
    Visible = True
    GTop = 215
    GLeft = 293
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemNewNeed1: TDButton
    Tag = 1
    Left = 279
    Top = 106
    Width = 34
    Height = 16
    OnDirectPaint = DWSignedItemNewNeed1DirectPaint
    OnMouseMove = DWSignedItemNewNeed1MouseMove
    OnClick = DWSignedItemNewItemClick
    OnInitialize = DWSignedItemNewNeed1Initialize
    Caption = 'Need1'
    DParent = DWSignedItemNew
    Visible = True
    GTop = 214
    GLeft = 227
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemNewItem: TDButton
    Left = 240
    Top = 106
    Width = 33
    Height = 16
    OnDirectPaint = DWSignedItemNewItemDirectPaint
    OnMouseMove = DWSignedItemNewNeed1MouseMove
    OnClick = DWSignedItemNewItemClick
    OnInitialize = DWSignedItemNewItemInitialize
    Caption = 'Need0'
    DParent = DWSignedItemNew
    Visible = True
    GTop = 209
    GLeft = 148
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DWSignedItemClose: TDButton
    Left = 406
    Top = 37
    Width = 11
    Height = 18
    OnDirectPaint = DWSignedItemCloseDirectPaint
    OnClick = DWSignedItemCloseClick
    OnInitialize = DWSignedItemCloseInitialize
    Caption = 'X'
    DParent = DWSignedItemNew
    Visible = True
    GTop = 2
    GLeft = 445
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    ClickCount = csNone
  end
  object DCHSignedItemAutoLockValue: TDCheckBox
    Tag = 3
    Left = 343
    Top = 99
    Width = 65
    Height = 16
    OnDirectPaint = DCHSignedItemAutoLockValueDirectPaint
    OnInitialize = DCHSignedItemAutoLockValueInitialize
    Caption = #37492#23450#19981#20877#30830#35748
    DParent = DWSignedItemNew
    Visible = True
    GTop = 255
    GLeft = 338
    GHeight = 0
    GWidth = 0
    EnableFocus = True
    Alignment = taRightJustify
    Checked = False
    UpColor = clSilver
    HotColor = clWhite
    DownColor = clWhite
  end
end
