object DBInternet: TAspDButton
  Left = 725
  Top = 739
  Width = 18
  Height = 17
  Hint = '41667C6D7A666D7C4D707864677A6D7A2649787864616B697C616766'
  OnDirectPaint = DBHelpDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBInternetClick
  OnInitialize = DBInternetInitialize
  Caption = 'e'
  DParent = DWBottomLeft
  Visible = True
  GTop = 69
  GLeft = 170
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBelt1: TAspDButton
  Left = 780
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 21
  GLeft = 82
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBelt2: TAspDButton
  Tag = 1
  Left = 816
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 125
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBelt3: TAspDButton
  Tag = 2
  Left = 852
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 169
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBelt4: TAspDButton
  Tag = 3
  Left = 888
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 212
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBelt5: TAspDButton
  Tag = 4
  Left = 924
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 256
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBelt6: TAspDButton
  Tag = 5
  Left = 960
  Top = 731
  Width = 33
  Height = 25
  OnDirectPaint = DBelt1DirectPaint
  OnMouseMove = DBelt1MouseMove
  OnDblClick = DBelt1DblClick
  OnClick = DBelt1Click
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 300
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DBotMiniMap: TAspDButton
  Left = 769
  Top = 761
  Width = 18
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotMiniMapClick
  OnInitialize = DBotMiniMapInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 8
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotTrade: TAspDButton
  Left = 788
  Top = 761
  Width = 18
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotTradeClick
  OnInitialize = DBotTradeInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 37
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotGuild: TAspDButton
  Left = 808
  Top = 761
  Width = 18
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotGuildClick
  OnInitialize = DBotGuildInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 66
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotGroup: TAspDButton
  Left = 832
  Top = 760
  Width = 18
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnMouseDown = DBotGroupMouseDown
  OnClick = DBotGroupClick
  OnInitialize = DBotGroupInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 95
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotPlusAbil: TAspDButton
  Left = 851
  Top = 760
  Width = 18
  Height = 17
  OnDirectPaint = DBotPlusAbilDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotPlusAbilClick
  OnInitialize = DBotPlusAbilInitialize
  Caption = #21152#23646#24615#28857
  DParent = DWBottomCenter
  Visible = False
  GTop = 64
  GLeft = 269
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotFriend: TAspDButton
  Left = 875
  Top = 760
  Width = 18
  Height = 17
  OnDirectPaint = DFrdFriendDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotFriendClick
  OnInitialize = DBotFriendInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 124
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object Challenge: TAspDButton
  Left = 899
  Top = 762
  Width = 18
  Height = 17
  OnDirectPaint = DFrdFriendDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = ChallengeClick
  OnInitialize = ChallengeInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 153
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotFaction: TAspDButton
  Left = 933
  Top = 760
  Width = 17
  Height = 17
  OnDirectPaint = DBJDSeeDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotFactionClick
  OnInitialize = DBotFactionInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 306
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object CharacterSranking: TAspDButton
  Left = 956
  Top = 760
  Width = 17
  Height = 17
  OnDirectPaint = DFrdFriendDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = CharacterSrankingClick
  OnInitialize = CharacterSrankingInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 182
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBWhisper: TAspDButton
  Left = 979
  Top = 760
  Width = 17
  Height = 17
  Hint = 'open'
  OnDirectPaint = DFrdFriendDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBWhisperClick
  OnInitialize = DBWhisperInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 211
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotStall: TAspDButton
  Left = 1002
  Top = 762
  Width = 17
  Height = 17
  OnDirectPaint = DFrdFriendDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotStallClick
  OnInitialize = DBotStallInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 240
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotLogout: TAspDButton
  Left = 1025
  Top = 762
  Width = 18
  Height = 16
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotLogoutClick
  OnInitialize = DBotLogoutInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 338
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBotExit: TAspDButton
  Left = 1049
  Top = 761
  Width = 18
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotExitClick
  OnInitialize = DBotExitInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 64
  GLeft = 368
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBHelp: TAspDButton
  Left = 1078
  Top = 784
  Width = 18
  Height = 17
  OnDirectPaint = DBHelpDirectPaint
  OnClick = DBHelpClick
  OnInitialize = DBHelpInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 68
  GLeft = 0
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBMission: TAspDButton
  Left = 1007
  Top = 741
  Width = 18
  Height = 17
  Hint = 'explorer.exe'
  OnDirectPaint = DBMissionDirectPaint
  OnClick = DBMissionClick
  OnInitialize = DBMissionInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 20
  GLeft = 350
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBCallHero: TAspDButton
  Left = 1083
  Top = 761
  Width = 17
  Height = 17
  OnDirectPaint = DCloseHeroStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBCallHeroClick
  OnInitialize = DBCallHeroInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 109
  GLeft = 38
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBHeroState: TAspDButton
  Left = 1100
  Top = 761
  Width = 17
  Height = 17
  OnDirectPaint = DCloseHeroStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBHeroStateClick
  OnInitialize = DBHeroStateInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 109
  GLeft = 60
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBHeroPackage: TAspDButton
  Left = 1117
  Top = 761
  Width = 17
  Height = 17
  OnDirectPaint = DCloseHeroStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBHeroPackageClick
  OnInitialize = DBHeroPackageInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 109
  GLeft = 84
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBCallDeputyHero: TAspDButton
  Left = 1134
  Top = 761
  Width = 17
  Height = 17
  OnDirectPaint = DCloseHeroStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBCallDeputyHeroClick
  OnInitialize = DBCallDeputyHeroInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 109
  GLeft = 109
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBXinfaExpAbsorb: TAspDButton
  Left = 1108
  Top = 781
  Width = 27
  Height = 18
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBXinfaExpAbsorbClick
  Caption = #21560#25910
  DParent = DWBottomRight
  Visible = True
  GTop = 174
  GLeft = 39
  GHeight = 28
  GWidth = 28
  EnableFocus = False
  ClickCount = csGlass
end
object DBGlory: TAspDButton
  Left = 1163
  Top = 787
  Width = 32
  Height = 16
  OnDirectPaint = DBGloryDirectPaint
  Caption = #33635#35465
  DParent = DWBottomRight
  Visible = True
  GTop = 154
  GLeft = 121
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNone
end
object DMyState: TAspDButton
  Left = 1080
  Top = 731
  Width = 29
  Height = 25
  OnDirectPaint = DMyStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DMyStateClick
  OnInitialize = DMyStateInitialize
  Caption = 'State'
  DParent = DWBottomRight
  Visible = True
  GTop = 63
  GLeft = 43
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csGlass
  OnClickSound = DLoginNewClickSound
end
object DMyBag: TAspDButton
  Left = 1110
  Top = 731
  Width = 25
  Height = 25
  OnDirectPaint = DMyStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DMyStateClick
  OnInitialize = DMyBagInitialize
  Caption = 'Bag'
  DParent = DWBottomRight
  Visible = True
  GTop = 43
  GLeft = 82
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csGlass
  OnClickSound = DLoginNewClickSound
end
object DMyMagic: TAspDButton
  Left = 1136
  Top = 731
  Width = 29
  Height = 25
  OnDirectPaint = DMyStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DMyStateClick
  OnInitialize = DMyMagicInitialize
  Caption = 'Magic'
  DParent = DWBottomRight
  Visible = True
  GTop = 23
  GLeft = 122
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csGlass
  OnClickSound = DLoginNewClickSound
end
object DOption: TAspDButton
  Left = 1166
  Top = 731
  Width = 29
  Height = 25
  OnDirectPaint = DMyStateDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DMyStateClick
  OnInitialize = DOptionInitialize
  Caption = 'Option'
  DParent = DWBottomRight
  Visible = True
  GTop = 13
  GLeft = 164
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csGlass
  OnClickSound = DLoginNewClickSound
end
object DBRefuseguild: TAspDButton
  Left = 727
  Top = 831
  Width = 17
  Height = 17
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBRefuseguildClick
  OnInitialize = DBRefuseguildInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 182
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBRefuseWHISPER: TAspDButton
  Left = 727
  Top = 808
  Width = 17
  Height = 17
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBRefuseWHISPERClick
  OnInitialize = DBRefuseWHISPERInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 162
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBRefuseCRY: TAspDButton
  Left = 725
  Top = 785
  Width = 17
  Height = 17
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBRefuseCRYClick
  OnInitialize = DBRefuseCRYInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 142
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBRefusePublicChat: TAspDButton
  Left = 725
  Top = 762
  Width = 17
  Height = 17
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBRefusePublicChatClick
  OnInitialize = DBRefusePublicChatInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 122
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end
object DBLingMeiBelt: TAspDButton
  Left = 640
  Top = 753
  Width = 23
  Height = 17
  OnDirectPaint = DBLingMeiBeltDirectPaint
  OnMouseMove = DBLingMeiBeltMouseMove
  OnDblClick = DBLingMeiBeltDblClick
  OnClick = DBLingMeiBeltClick
  DParent = DWBottomLeft
  Visible = True
  GTop = 56
  GLeft = 1
  GHeight = 29
  GWidth = 32
  EnableFocus = False
  ClickCount = csNone
end
object DButtonHP: TAspDButton
  Left = 638
  Top = 793
  Width = 29
  Height = 25
  OnMouseMove = DBotFactionMouseMove
  Caption = 'HP'
  DParent = DWBottomLeft
  Visible = True
  GTop = 91
  GLeft = 40
  GHeight = 90
  GWidth = 45
  EnableFocus = False
  Color = clRed
  ClickCount = csGlass
end
object DDrunkScale: TAspDButton
  Left = 673
  Top = 824
  Width = 13
  Height = 21
  OnDirectPaint = DDrunkScaleDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnInitialize = DDrunkScaleInitialize
  Caption = #37257#37202#24230
  DParent = DWBottomLeft
  Visible = True
  GTop = 91
  GLeft = 79
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  Color = clYellow
  ClickCount = csGlass
end
object DButtonMP: TAspDButton
  Left = 692
  Top = 819
  Width = 29
  Height = 25
  OnMouseMove = DBotFactionMouseMove
  Caption = 'MP'
  DParent = DWBottomLeft
  Visible = True
  GTop = 91
  GLeft = 87
  GHeight = 90
  GWidth = 45
  EnableFocus = False
  Color = clBlue
  ClickCount = csGlass
end
object DWBottomLeft: TAspDWindow
  Left = 632
  Top = 730
  Width = 120
  Height = 123
  OnDirectPaint = DWBottomLeftDirectPaint
  OnMouseMove = DWBottomLeftMouseMove
  OnInitialize = DWBottomLeftInitialize
  Caption = #26032#24213#37096#29366#24577#26639'-'#24038
  DParent = DBackground
  Visible = False
  GTop = 349
  GLeft = 0
  GHeight = 252
  GWidth = 200
  EnableFocus = False
  ClickCount = csNone
  Floating = False
end
object DChatMemo: TAspDChatMemo
  Left = 782
  Top = 783
  Width = 258
  Height = 62
  OnMouseDown = DChatMemoMouseDown
  OnInRealArea = DChatMemoInRealArea
  OnInitialize = DChatMemoInitialize
  DParent = DWBottomCenter
  Visible = True
  GTop = 80
  GLeft = 14
  GHeight = 109
  GWidth = 397
  EnableFocus = False
  Position = 0
  OffSetX = 0
  OffSetY = 1
  ScrollImageIndex.Up = 0
  ScrollImageIndex.Hot = -1
  ScrollImageIndex.Down = -1
  ScrollImageIndex.Disabled = -1
  PrevImageIndex.Up = -1
  PrevImageIndex.Hot = -1
  PrevImageIndex.Down = -1
  PrevImageIndex.Disabled = -1
  NextImageIndex.Up = -1
  NextImageIndex.Hot = -1
  NextImageIndex.Down = -1
  NextImageIndex.Disabled = -1
  BarImageIndex.Up = -1
  BarImageIndex.Hot = -1
  BarImageIndex.Down = -1
  BarImageIndex.Disabled = -1
  ShowScroll = True
  ItemHeight = 12
  ItemIndex = -1
  ScrollSize = 16
  AutoScroll = True
  DrawLineCount = 10
  VisibleItemCount = 1
  ExpandSize = 0
  OnChange = DChatMemoChange
end
object DWBottomRight: TAspDWindow
  Left = 1078
  Top = 729
  Width = 120
  Height = 120
  OnDirectPaint = DWBottomRightDirectPaint
  OnMouseMove = DWBottomRightMouseMove
  OnInitialize = DWBottomRightInitialize
  Caption = #26032#24213#37096#29366#24577#26639'-'#21491
  DParent = DBackground
  Visible = False
  GTop = 349
  GLeft = 600
  GHeight = 252
  GWidth = 200
  EnableFocus = False
  ClickCount = csNone
  Floating = False
end
object DWBottomCenter: TAspDWindow
  Left = 763
  Top = 729
  Width = 308
  Height = 120
  OnDirectPaint = DWBottomCenterDirectPaint
  OnMouseMove = DWBottomCenterMouseMove
  OnMouseDown = DWBottomCenterMouseDown
  OnInRealArea = DWBottomCenterInRealArea
  Caption = #26032#24213#37096#29366#24577#26639'-'#20013
  DParent = DBackground
  Visible = False
  GTop = 389
  GLeft = 194
  GHeight = 211
  GWidth = 413
  EnableFocus = False
  ClickCount = csNone
  Floating = False
end

object DBCommandFrame: TAspDButton
  Left = 655
  Top = 826
  Width = 17
  Height = 24
  OnDirectPaint = DBCommandFrameDirectPaint
  OnMouseMove = DBCommandFrameMouseMove
  OnMouseUp = DBCommandFrameMouseUp
  DParent = DWBottomLeft
  Visible = False
  GTop = -143
  GLeft = 175
  GHeight = 385
  GWidth = 95
  EnableFocus = True
  ClickCount = csNone
end


object DBatterShowImg: TAspDButton
  Left = 1039
  Top = 818
  Width = 32
  Height = 20
  OnDirectPaint = DBatterShowImgDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnInitialize = DBatterShowImgInitialize
  DParent = DWBottomRight
  Visible = True
  GTop = 102
  GLeft = 5
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
end


object DBHeroSpleenImg: TAspDButton
  Left = 1016
  Top = 827
  Width = 14
  Height = 33
  OnDirectPaint = DBHeroSpleenImgDirectPaint
  Caption = #24594#27668
  DParent = DWBottomRight
  Visible = False
  GTop = 88
  GLeft = 3
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  Color = clYellow
  ClickCount = csNone
end

object DBotMemo: TAspDButton
  Left = 1103
  Top = 819
  Width = 27
  Height = 24
  OnDirectPaint = DBotMemoDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBotMemoClick
  OnInitialize = DBotMemoInitialize
  Caption = #21830#38138
  DParent = DWBottomRight
  Visible = True
  GTop = 204
  GLeft = 153
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csGlass
  OnClickSound = DLoginNewClickSound
end


object DHeroRoleIcon: TAspDButton
  Left = 587
  Top = 643
  Width = 20
  Height = 21
  OnDirectPaint = DHeroRoleIconDirectPaint
  OnClick = DHeroIconClick
  DParent = DHeroIcon
  Visible = True
  GTop = 0
  GLeft = 0
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNone
end
object DHeroIcon: TAspDWindow
  Left = 584
  Top = 639
  Width = 81
  Height = 25
  OnDirectPaint = DHeroIconDirectPaint
  OnMouseMove = DHeroIconMouseMove
  OnClick = DHeroIconClick
  OnInitialize = DHeroIconInitialize
  Caption = #33521#38596#22270#26631
  DParent = DBackground
  Visible = False
  GTop = 0
  GLeft = 0
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNone
  Floating = True
end

object DBAutoCRY: TAspDButton
  Left = 678
  Top = 836
  Width = 17
  Height = 17
  OnMouseMove = DBotFactionMouseMove
  OnClick = DBAutoCRYClick
  OnInitialize = DBAutoCRYInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 202
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = False
  ClickCount = csNorm
  OnClickSound = DLoginNewClickSound
end

object DBCommand: TAspDButton
  Left = 632
  Top = 839
  Width = 17
  Height = 17
  OnDirectPaint = DBotGroupDirectPaint
  OnMouseMove = DBotFactionMouseMove
  OnMouseUp = DBCommandMouseUp
  OnInitialize = DBCommandInitialize
  DParent = DWBottomLeft
  Visible = True
  GTop = 222
  GLeft = 175
  GHeight = 0
  GWidth = 0
  EnableFocus = True
  ClickCount = csNone
end

object DMemoXinFaHintScrollBar: TAspDMemoScrollBar
  Left = 1097
  Top = 225
  Width = 15
  Height = 37
  OnDirectPaint = DMemoXinFaHintScrollBarDirectPaint
  OnInitialize = DMemoXinFaHintScrollBarInitialize
  DParent = DMemoXinFaHint
  Visible = True
  GTop = 0
  GLeft = 195
  GHeight = 84
  GWidth = 16
  EnableFocus = False
end









