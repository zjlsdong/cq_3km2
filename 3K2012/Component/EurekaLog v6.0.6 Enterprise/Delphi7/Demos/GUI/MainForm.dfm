�
 TGUIFORM 0�  TPF0TGUIFormGUIFormLeft� Top� BorderStylebsDialogCaptionEurekaLog 6.x - GUI DemoClientHeighttClientWidth�Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.Style PositionpoScreenCenterOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TPageControlPageControl1Left Top Width�Heightt
ActivePage	TabSheet1AlignalClientTabOrder  	TTabSheet	TabSheet1CaptionExceptions and Leaks TBitBtnBitBtn1LeftTop0Width� Height!Caption&Execute selected actionModalResultTabOrder OnClickBitBtn1Click
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  	TGroupBox	GroupBox1LeftTopWidth� HeightCaptionActions typeTabOrder TLabelLabel1LeftTopWidth8HeightCaptionExceptions:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsUnderline 
ParentFont  TLabelLabel3LeftTop� WidthHHeightCaptionMemory Leaks:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsUnderline 
ParentFont  TRadioButtonE0LeftTop Width� HeightCaptionAccess violationChecked	TabOrder TabStop	OnClickE0Click  TRadioButtonE1LeftTop4Width� HeightCaptionDivision by zeroTabOrderOnClickE0Click  TRadioButtonE2LeftTopHWidth� HeightCaptionString convertion errorTabOrderOnClickE0Click  TRadioButtonE3LeftTop\Width� HeightCaptionRaise custom exceptionTabOrderOnClickE0Click  TRadioButtonE4LeftToppWidth� HeightCaptionList index out of boundsTabOrderOnClickE0Click  TRadioButtonE5LeftTop� Width� HeightCaptionThread access violationFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickE0Click  TRadioButtonE6LeftTop� Width� HeightCaptionDLL access violationFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickE0Click  TRadioButtonE7LeftTop� Width� HeightCaptionApplication freezeFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsBold 
ParentFontTabOrderOnClickE0Click  TRadioButtonE8LeftTop� Width� HeightCaptionGetMem LeakTabOrderOnClickE0Click  TRadioButtonE9LeftTop� Width� HeightCaptionTObject LeakTabOrder	OnClickE0Click  TRadioButtonE10LeftTop� Width� HeightCaption
TForm LeakTabOrder
OnClickE0Click   	TCheckBoxEurekaActiveLeftTopWidth� HeightCaption&Activate EurekaLogState	cbCheckedTabOrder  TPanelPanel1Left� TopWidth�Height
BevelOuter	bvLoweredColorclNavyTabOrder TImageImageLeftTopWidth�HeightAlignalClient   TPanelPanel2Left� TopWidth�Height5
BevelInner	bvLowered
BevelOuterbvNoneTabOrder TLabel
EmailLabelLeft� TopWidthLHeightCaption&Email addressesEnabled  TLabelWebLabelLeft� Top Width<HeightCaption&URL addressEnabled  	TCheckBox
EmailCheckLeftTopWidth� HeightCaption&Send the Log via EmailTabOrder OnClickEmailCheckClick  TEdit	EmailEditLeft� TopWidthHeightEnabledTabOrder  	TCheckBoxWebCheckLeftTopWidth� HeightCaption&Send the Log via WebTabOrderOnClickWebCheckClick  TEditWebEditLeft� TopWidthHeightEnabledTabOrder    	TTabSheet	TabSheet2CaptionWeb server side TLabelLabel2Left
Top
Width�HeightCaptionKA PHP example usable, at Web server side, to store EurekLog uploaded files:Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameTahoma
Font.StylefsUnderline 
ParentFont  	TRichEditWebRTFLeft Top��Width Height0AlignalBottomColor��� ReadOnly	TabOrder     
TEurekaLog	EurekaLogOnExceptionNotifyEurekaLogExceptionNotifyLeftTopP   