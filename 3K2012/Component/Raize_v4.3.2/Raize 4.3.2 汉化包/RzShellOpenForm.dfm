object RzShellOpenSaveForm: TRzShellOpenSaveForm
  Left = 387
  Top = 116
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Open'
  ClientHeight = 386
  ClientWidth = 552
  Color = clBtnFace
  Constraints.MinHeight = 413
  Constraints.MinWidth = 560
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  object PnlJumps: TPanel
    Left = 0
    Top = 0
    Width = 105
    Height = 386
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnPlace0: TRzToolButton
      Left = 8
      Top = 39
      Width = 87
      Height = 65
      AllowAllUp = True
      GroupIndex = 10
      Images = imlPlaces
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Caption = 'My Recent Documents'
      OnClick = btnPlaceClick
    end
    object btnPlace1: TRzToolButton
      Tag = 1
      Left = 8
      Top = 104
      Width = 87
      Height = 65
      AllowAllUp = True
      GroupIndex = 10
      Images = imlPlaces
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Caption = 'Desktop'
      OnClick = btnPlaceClick
    end
    object btnPlace2: TRzToolButton
      Tag = 2
      Left = 8
      Top = 169
      Width = 87
      Height = 65
      AllowAllUp = True
      GroupIndex = 10
      Images = imlPlaces
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Caption = 'My Documents'
      OnClick = btnPlaceClick
    end
    object btnPlace3: TRzToolButton
      Tag = 3
      Left = 8
      Top = 234
      Width = 87
      Height = 65
      AllowAllUp = True
      GroupIndex = 10
      Images = imlPlaces
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Caption = 'My Computer'
      OnClick = btnPlaceClick
    end
    object btnPlace4: TRzToolButton
      Tag = 4
      Left = 8
      Top = 299
      Width = 87
      Height = 65
      AllowAllUp = True
      GroupIndex = 10
      Images = imlPlaces
      Layout = blGlyphTop
      ShowCaption = True
      UseToolbarButtonLayout = False
      UseToolbarButtonSize = False
      UseToolbarShowCaption = False
      Caption = 'My Network Places'
      OnClick = btnPlaceClick
    end
    object lblLookIn: TLabel
      Left = 53
      Top = 12
      Width = 48
      Height = 12
      Alignment = taRightJustify
      Caption = 'Look &in:'
      FocusControl = ShellCombo
    end
  end
  object PnlWork: TPanel
    Left = 105
    Top = 0
    Width = 447
    Height = 386
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object btnList: TRzToolButton
      Tag = 2
      Left = 392
      Top = 8
      Width = 23
      Height = 22
      GroupIndex = 1
      Down = True
      ImageIndex = 4
      Images = imlToolbar
      OnClick = ViewBtnClick
    end
    object btnCreateNewFolder: TRzToolButton
      Left = 330
      Top = 8
      Width = 23
      Height = 22
      ImageIndex = 2
      Images = imlToolbar
      OnClick = btnCreateNewFolderClick
    end
    object btnDetails: TRzToolButton
      Tag = 3
      Left = 415
      Top = 8
      Width = 23
      Height = 22
      GroupIndex = 1
      ImageIndex = 5
      Images = imlToolbar
      OnClick = ViewBtnClick
    end
    object btnShowDesktop: TRzToolButton
      Left = 299
      Top = 8
      Width = 23
      Height = 22
      Hint = 'Show Desktop'
      ImageIndex = 1
      Images = imlToolbar
      OnClick = btnShowDesktopClick
    end
    object btnShowTree: TRzToolButton
      Left = 361
      Top = 8
      Width = 23
      Height = 22
      AllowAllUp = True
      GroupIndex = 2
      ImageIndex = 3
      Images = imlToolbar
      OnClick = btnShowTreeClick
    end
    object btnUpOneLevel: TRzToolButton
      Left = 268
      Top = 8
      Width = 23
      Height = 22
      ImageIndex = 0
      Images = imlToolbar
      OnClick = btnUpOneLevelClick
    end
    object ShellCombo: TRzShellCombo
      Left = 0
      Top = 8
      Width = 253
      Height = 22
      HelpContext = 28456
      DropDownCount = 16
      Options = [scoAutofill]
      ShellList = ShellList
      TabOrder = 1
    end
    object RzSplitter1: TRzSplitter
      Left = 0
      Top = 39
      Width = 441
      Height = 256
      Position = 160
      Percent = 37
      HotSpotVisible = True
      SplitterWidth = 7
      TabOrder = 2
      BarSize = (
        160
        0
        167
        256)
      UpperLeftControls = (
        ShellTree)
      LowerRightControls = (
        ShellList)
      object ShellTree: TRzShellTree
        Left = 0
        Top = 0
        Width = 160
        Height = 256
        Align = alClient
        DragMode = dmAutomatic
        HideSelection = False
        Indent = 19
        Options = [stoAutoFill, stoDefaultKeyHandling, stoContextMenus, stoDynamicRefresh]
        TabOrder = 0
        OnChange = ShellTreeChange
      end
      object ShellList: TRzShellList
        Left = 0
        Top = 0
        Width = 274
        Height = 256
        HelpContext = 28549
        Align = alClient
        HideSelection = False
        IconOptions.AutoArrange = True
        Options = [sloAutoFill, sloDefaultKeyHandling, sloContextMenus, sloDynamicRefresh]
        PopupMenu = LvPopup
        TabOrder = 0
        ViewStyle = vsList
        OnChange = ShellListChange
        OnFolderChanged = ShellListFolderChanged
      end
    end
    object PnlEdits: TPanel
      Left = 0
      Top = 296
      Width = 447
      Height = 90
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object lblFileName: TLabel
        Left = 0
        Top = 10
        Width = 60
        Height = 12
        Caption = 'File &name:'
        FocusControl = edtFileName
      end
      object lblFilesOfType: TLabel
        Left = 0
        Top = 38
        Width = 84
        Height = 12
        Caption = 'Files of &type:'
        FocusControl = cbxFileTypes
      end
      object edtFileName: TRzEdit
        Left = 80
        Top = 6
        Width = 277
        Height = 20
        TabOrder = 0
        OnChange = edtFileNameChange
      end
      object cbxFileName: TRzComboBox
        Left = 80
        Top = 6
        Width = 277
        Height = 20
        ItemHeight = 12
        TabOrder = 5
        TabStop = False
        Visible = False
      end
      object cbxFileTypes: TRzComboBox
        Left = 80
        Top = 34
        Width = 277
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 1
        OnSelEndOk = cbxFileTypesSelEndOk
      end
      object btnOpen: TRzBitBtn
        Left = 364
        Top = 6
        Height = 22
        HelpContext = 28529
        Default = True
        ModalResult = 1
        Caption = '&Open'
        TabOrder = 3
      end
      object btnCancel: TRzBitBtn
        Left = 364
        Top = 33
        Height = 22
        HelpContext = 28444
        Cancel = True
        ModalResult = 2
        Caption = 'Cancel'
        TabOrder = 4
      end
      object chkReadOnly: TRzCheckBox
        Left = 80
        Top = 60
        Width = 233
        Height = 17
        Caption = 'Open as &read-only'
        State = cbUnchecked
        TabOrder = 2
        OnClick = chkReadOnlyClick
      end
      object btnHelp: TRzBitBtn
        Left = 364
        Top = 60
        Height = 22
        Caption = '&Help'
        TabOrder = 6
        Visible = False
        OnClick = btnHelpClick
      end
    end
  end
  object LvPopup: TPopupMenu
    Left = 480
    Top = 48
    object View1Mitm: TMenuItem
      Caption = '&View'
      object LargeIcons1Mitm: TMenuItem
        Caption = 'Lar&ge icons'
        Enabled = False
        RadioItem = True
        OnClick = ViewBtnClick
      end
      object Smallicons1MItm: TMenuItem
        Tag = 1
        Caption = 'S&mall icons'
        Enabled = False
        RadioItem = True
        OnClick = ViewBtnClick
      end
      object List1Mitm: TMenuItem
        Tag = 2
        Caption = '&List'
        Checked = True
        RadioItem = True
        OnClick = ViewBtnClick
      end
      object Details1Mitm: TMenuItem
        Tag = 3
        Caption = '&Details'
        RadioItem = True
        OnClick = ViewBtnClick
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Paste1Mitm: TMenuItem
      Caption = '&Paste'
      OnClick = Paste1MitmClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object New1Mitm: TMenuItem
      Caption = 'Ne&w'
      object Folder1Mitm: TMenuItem
        Caption = '&Folder'
        OnClick = btnCreateNewFolderClick
      end
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Properties1Mitm: TMenuItem
      Caption = 'P&roperties'
      OnClick = Properties1MitmClick
    end
  end
  object imlPlaces: TImageList
    DrawingStyle = dsTransparent
    Height = 32
    Width = 32
    Left = 4
    Top = 4
  end
  object imlToolbar: TImageList
    Left = 420
    Top = 47
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF3300000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00B2B2
      B200B2B2B200FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00B2B2
      B200B2B2B200FFFFFF00FF3300000000000000000000FF330000FFFFFF009999
      9900FFFFFF009999990099999900FFFFFF009999990099999900FFFFFF009999
      990099999900FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF003366
      FF003366FF00FFFFFF00FFFFFF009933000099330000FFFFFF00FFFFFF00C8AC
      2800C8AC2800FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF003366
      FF003366FF00FFFFFF00FFFFFF009933000099330000FFFFFF00FFFFFF00C8AC
      2800C8AC2800FFFFFF00FF3300000000000000000000FF330000FFFFFF009999
      9900FFFFFF009999990099999900FFFFFF009999990099999900FFFFFF009999
      990099999900FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF3300000000000000000000FF330000FFFFFF00CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00B2B2
      B200B2B2B200FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00B2B2
      B200B2B2B200FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF009933
      660099336600FFFFFF00FFFFFF003333990033339900FFFFFF00FFFFFF000099
      000000990000FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF009999990099999900FFFFFF009999990099999900FFFFFF009999
      990099999900FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF009933
      660099336600FFFFFF00FFFFFF003333990033339900FFFFFF00FFFFFF000099
      000000990000FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF3300000000000000000000FF330000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF3300000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF3300000000000000000000FF330000FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FF330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFCC9900FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FFCC99000000000000000000FFCC9900FF330000FF33
      0000FF330000FF330000FF330000FF330000FF330000FF330000FF330000FF33
      0000FF330000FF330000FFCC9900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003399CC000066
      9900006699000066990000669900006699000066990000669900006699000066
      99000066990000669900000000000000000000000000C0C0C0009999990099A8
      AC00C0C0C000CCCCCC00CCCCCC00E5E5E5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC996600CC996600CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600CC996600CC996600CC996600000000003399CC0066CCFF003399
      CC0099FFFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CC
      FF003399CC0099FFFF000066990000000000CC99990099663300663333006666
      330066666600646F7100646F710080808000B2B2B200CCCCCC00CCCCCC00CCCC
      CC00E5E5E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000003399CC0066CCFF003399
      CC0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FF
      FF0066CCFF0099FFFF000066990000000000CC6600009933000099330000CC66
      3300CC663300CC663300CC6633006633330066666600646F7100646F71008080
      800099A8AC00CCCCCC00E2EFF10000000000000000003399CC00006699000066
      9900006699000066990000669900006699000066990000669900006699000066
      99000066990000000000000000000000000000000000CC996600FFFFFF009933
      0000FFFFFF00FFFFFF00FFFFFF0099330000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000003399CC0066CCFF003399
      CC0099FFFF0099FFFF00006600003399660099FFFF0099FFFF0099FFFF0099FF
      FF0066CCFF0099FFFF000066990000000000CC660000CC660000CCCCCC00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF00CC663300CC663300CC663300CC6633006633
      33004C4C4C0099999900E5E5E500000000003399CC0066CCFF003399CC0099FF
      FF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF0066CCFF003399
      CC0099FFFF0000669900000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000003399CC0066CCFF003399
      CC0099FFFF0099FFFF0033999900339933003399330099FFFF0099FFFF0099FF
      FF0066CCFF0099FFFF000066990000000000CC660000CCCCCC00CCFFFF00CCFF
      FF00CC663300CC663300CC663300CCFFFF00CCFFFF00CCFFFF00FFCC9900CC66
      0000CC660000646F7100CCCCCC00000000003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0099FFFF0000669900000000000000000000000000CC996600FFFFFF009933
      0000FFFFFF00FFFFFF00FFFFFF0099330000FFFFFF0099330000FFFFFF0000CC
      FF000066CC00FFFFFF00FFFFFF00CC996600000000003399CC0066CCFF003399
      CC0099FFFF0099FFFF0099FFCC003399330033CC66003399660099FFFF0099FF
      FF0066CCFF0099FFFF000066990000000000CC993300CCCCCC00CCFFFF00CCFF
      FF00FF993300F2EABF00F2EABF00CC663300CC663300CC663300CCFFFF00FFCC
      9900CC660000646F7100CCCCCC00000000003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0099FFFF0000669900000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000CC
      FF000066CC00FFFFFF00FFFFFF00CC996600000000003399CC0066CCFF003399
      CC0099FFFF0099FFFF0099FFFF000099330066FF99003399330099FFCC0099FF
      FF0066CCFF0099FFFF000066990000000000CC993300CCCCCC00CCFFFF00CCFF
      FF00FF993300F2EABF00F2EABF00F2EABF00F2EABF00CC663300CCFFFF00CCFF
      FF00CC660000646F7100CCCCCC00000000003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CC
      FF0099FFFF0000669900000000000000000000000000CC996600FFFFFF009933
      0000FFFFFF00FFFFFF00FFFFFF0099330000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000003399CC0099FFFF0099FF
      FF003399CC003399CC003399CC000066330033CC660033CC6600339966003399
      CC003399CC003399CC003399CC0000000000CC99330000000000CCFFFF00CCFF
      FF00FF993300FFFFFF000000000000000000CC993300CC993300CC993300CCFF
      FF00CC66000066666600C0C0C000000000003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099CC
      FF006699FF006699FF00CCCCFF000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC996600000000003399CC0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF000080000033CC660033CC66003399330099FF
      FF0000669900000000000000000000000000CC993300E2EFF100E2EFF100E2EF
      F100FF993300FFFFFF00FFFFCC0066999900F2EABF00FFCC9900CC993300CC99
      3300CC6600004C4C4C0080808000C0C0C0003399CC0066CCFF003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0099CCFF000033
      FF003399FF003366FF000033FF009999FF0000000000CC996600FFFFFF009933
      0000FFFFFF0099330000FFFFFF0000CCFF000066CC00FFFFFF00E5E5E500E5E5
      E500E5E5E500FFFFFF00FFFFFF00CC99660000000000000000003399CC0099FF
      FF0099FFFF0099FFFF0099FFFF000080000033CC660033CC6600339933003399
      CC0000000000000000000000000000000000CC993300E2EFF100E2EFF100E2EF
      F100FF993300FFFFFF00FFFFCC00FFFFFF00CC993300F2EABF00F2EABF00FFCC
      9900CC9933000033CC0066666600999999003399CC0099FFFF0099FFFF003399
      CC003399CC003399CC003399CC003399CC003399CC003399CC0099CCFF003399
      FF0033CCFF0033CCFF003399FF0099CCFF0000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000CCFF000066CC00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000003399
      CC003399CC003399CC003399CC000099330033CC660033CC6600339933000000
      000000000000000000000000000000000000CC993300E5E5E500E2EFF100E2EF
      F100FF993300FFFFFF00FFFFFF00FFFFCC00FFFFCC00CC993300CC993300F2EA
      BF003366CC003399FF000033CC00C0C0C0003399CC0099FFFF0099FFFF0099FF
      FF0099FFFF0099FFFF0099FFFF0099FFFF0099FFFF0066CCFF003366FF000066
      FF00CCFFFF0099FFFF003366FF003366FF0000000000CC996600FFFFFF009933
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      00000066000000800000008000003399330033CC660033CC6600336633000080
      000000800000000000000000000000000000CC993300CC993300FFFFFF00FFFF
      FF00FF993300FF993300FF993300FFFFFF00FFFFCC00CC663300FFFFFF00CC99
      3300CC99330033339900C0C0C00000000000000000003399CC0099FFFF0099FF
      FF0099FFFF0099FFFF003399CC003399CC003399CC003399CC003399CC000033
      FF000033FF003399FF000033FF00CCCCFF0000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      0000669966000080000033CC330033CC330033CC660033CC6600339933000066
      000066996600000000000000000000000000CC993300F2EABF00CC993300FFFF
      FF00FFFFFF00FFFFFF00F2EABF00FF993300FF993300CC663300FFFFFF00FFFF
      FF00CC993300646F7100CCCCCC000000000000000000000000003399CC003399
      CC003399CC003399CC00000000000000000000000000000000000033FF0099CC
      FF000033FF006699FF009999FF0099CCFF0000000000CC996600FFFFFF0000CC
      FF000066CC00FFFFFF00E5E5E500E5E5E500E5E5E500E5E5E500E5E5E500E5E5
      E500FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000000000000336633000099330033CC330033CC33000099330033663300C0C0
      C00000000000000000000000000000000000CC993300FF993300FF993300CC99
      3300FFCC9900F2EABF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF99
      3300CC993300646F7100CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099CCFF0099CCFF00000000000000000000000000CC996600FFFFFF0000CC
      FF000066CC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      00000000000099CC990000800000009900000080000066999900000000000000
      00000000000000000000000000000000000000000000CCCCCC00F2EABF00CCCC
      9900FF993300FF993300FF993300FF993300FFCC9900FFCC9900FF993300FFCC
      6600CC99330099999900E5E5E500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC996600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CC9966000000000000000000000000000000
      000000000000000000006699660033993300CCCCCC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF993300FF993300FF993300FF99
      3300FF993300E5E5E50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CC996600CC996600CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600CC996600CC996600CC996600CC996600424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000FFFFFFFF00000000C00380FFFFFF800080010007FFFF8000
      8001000180078000800100010003800080010001000380008001000100038000
      800100010003800080014001000180008007000000008000C00F000000008000
      E01F000000008000F007000180008000F0070001C3C08000F80F0001FFF38000
      F83F8001FFFF8000FC7FFF03FFFF800000000000000000000000000000000000
      000000000000}
  end
end
