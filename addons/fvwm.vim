" Vim syntax file
" Language:	FVWM2 configuration file
" Maintainer:	Maciej Delmanowski <harnir@linux.net.pl>
" Last Change:	2006 Mar 13
" Version:	0.2

" Some basic settings {{{1
"""""""""""""""""""""""""""
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syn clear
elseif exists("b:current_syntax")
    finish
endif

" Fvwm configuration files are case insensitive
syntax case ignore

" Identifiers in Fvwm can contain most characters, so we only
" include the most common ones here.
if version >= 600
    setlocal iskeyword=!,_,-,+,.,a-z,A-Z,48-57
else
    set iskeyword=!,_,-,+,.,a-z,A-Z,48-57
endif

" What characters can be used in the file names
setlocal isfname=@,48-57,/,.,-,_,+,#,$,%,~,=

" Read system colors from the color database (rgb.txt)
if exists("rgb_file")
    " We don't want any hit-return prompts, so we make sure that
    " &shortmess is set to `O'
    let __fvwm_oldshm = &shortmess
    set shortmess=O

    " And we set &report to a huge number, so that no hit-return prompts
    " will be given
    let __fvwm_oldreport = &report
    set report=10000

    " Append the color database to the fvwm configuration, and read the
    " colors from this buffer
    let __fvwm_i = line("$") + 1
    exe "$r" rgb_file
    let __fvwm_lastline = line("$")
    while __fvwm_i <= __fvwm_lastline
	let __fvwm_s = matchstr(getline(__fvwm_i), '^\s*\d\+\s\+\d\+\s\+\d\+\s\+\h.*$')
	if __fvwm_s != ""
	    exe "syn keyword fvwmColors ".substitute(__fvwm_s, '^\s*\d\+\s\+\d\+\s\+\d\+\s\+\(\h.*\)$', '\1', "")
	endif
	let __fvwm_i = __fvwm_i + 1
    endwhile

    " Remove the appended data
    undo

    " Goto first line again
    1

    " and restore the old values of the variables
    let &shortmess = __fvwm_oldshm
    let &report = __fvwm_oldreport
    unlet __fvwm_i __fvwm_s __fvwm_lastline __fvwm_oldshm __fvwm_oldreport
endif
" done reading colors


" Syntax definitions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General syntax {{{1
""""""""""""""""""""""
syn match   fvwmWhitespace	contained /\s\+/
syn match   fvwmVariable	/\$\[\w[0-9A-Za-z\-_\.]\+\]\|\$[\.0-9]\|\$\[gt\..*\]/
syn match   fvwmVariable	/\$left\|\$right\|\$top\|\$bottom/
syn match   fvwmVariable	/\$\-left\|\$\-right\|\$\-top\|\$\-bottom/
syn match   fvwmVariable	/\$width\|\$height\|\$fg\|\$bg/
syn keyword fvwmQuotes		contained " ' `
syn keyword fvwmParentheses	contained ( ) [ ] { }
syn keyword fvwmSemiColon	contained ; :
syn match   fvwmColon		contained /\,/
syn keyword fvwmBoolean		contained True False Always
syn region  fvwmQString		contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/"/ skip=/\\"/ end=/"\|$/
syn region  fvwmQString		contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/'/ skip=/\\'/ end=/'\|$/
syn region  fvwmQString		contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/`/ skip=/\\`/ end=/`\|$/
syn match   fvwmString		contained /\a\S\+\ze/
syn match   fvwmFilename	contained /\f\+\ze/
syn match   fvwmNumber		contained /\<[+\-][0-9]*\>\|\<[0-9]*\>/
syn match   fvwmGeometry	contained /\<\d\+x\d\+[+\-]\+\d\+[+\-]\+\d\+\>\|\<[+\-]\+\d\+[+\-]\+\d\+\>\|\<\d\+x\d\+\>/
syn match   fvwmRGBValue	"#\x\{3}"
syn match   fvwmRGBValue	"#\x\{6}"
syn match   fvwmRGBValue	"#\x\{9}"
syn match   fvwmRGBValue	"#\x\{12}"
syn match   fvwmRGBValue	"rgb:\x\{1,4}/\x\{1,4}/\x\{1,4}"
syn match   fvwmLineContinue	contained skipwhite /\s\\$/
syn match   fvwmComment		/^#.*$/

hi  link    fvwmVariable	Identifier
hi  link    fvwmQuotes		Type
hi  link    fvwmParentheses	Type
hi  link    fvwmSemiColon	Type
hi  link    fvwmColon		Type
hi  link    fvwmBoolean		Type
hi  link    fvwmQString		Constant
hi  link    fvwmString		Constant
hi  link    fvwmFilename	Constant
hi  link    fvwmNumber		Constant
hi  link    fvwmGeometry	Constant
hi  link    fvwmRGBValue	PreProc
hi  link    fvwmLineContinue	Special
hi  link    fvwmComment		Comment


" Read {{{1
" Syntax: Read Filename [Quiet]
""""""""""""""""""""""""""""""""
syn keyword fvwmRead		nextgroup=fvwmReadFilename skipwhite Read
syn region  fvwmReadFilename	nextgroup=fvwmReadQuiet contained skipwhite contains=fvwmVariable,fvwmQString start=/\S/ skip=/\\\s/ end=/\s\|$/
syn keyword fvwmReadQuiet	contained skipwhite Quiet

hi  link    fvwmRead		Statement
hi  link    fvwmReadFilename	Constant
hi  link    fvwmReadQuiet	Type

syn cluster fvwmButtonAction	add=fvwmRead


" PipeRead {{{1
" Syntax: PipeRead ['|"]command['|"] [Quiet]
"""""""""""""""""""""""""""""""""""""""""""""
syn keyword fvwmPipeRead	nextgroup=fvwmPipeReadCmd skipwhite PipeRead
syn region  fvwmPipeReadCmd	nextgroup=fvwmPipeReadQuiet contained skipwhite contains=NONE,fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/'/ skip=/\\'/ end=/'\|$/
syn region  fvwmPipeReadCmd	nextgroup=fvwmPipeReadQuiet contained skipwhite contains=NONE,fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/"/ skip=/\\"/ end=/"\|$/
syn region  fvwmPipeReadCmd	nextgroup=fvwmPipeReadQuiet contained skipwhite contains=NONE,fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/`/ skip=/\\`/ end=/`\|$/
syn keyword fvwmPipeReadQuiet	contained skipwhite Quiet

syn cluster fvwmButtonAction	add=fvwmPipeRead

hi  link    fvwmPipeRead	Statement
hi  link    fvwmPipeReadCmd	Constant
hi  link    fvwmPipeReadQuiet	Type



" Exec {{{1
" Syntax: Exec [exec] command
""""""""""""""""""""""""""""""
syn keyword fvwmExec		nextgroup=fvwmExecExec,fvwmExecCmd skipwhite Exec
syn match   fvwmExecExec	nextgroup=fvwmExecCmd contained skipwhite /\s\Cexec\s/
syn region  fvwmExecCmd		contained contains=fvwmVariable,fvwmLineContinue start=/\S/ end=/$/

syn cluster fvwmButtonAction	add=fvwmExec

hi  link    fvwmExec		Statement
hi  link    fvwmExecExec	Type
hi  link    fvwmExecCmd		Constant


" Command {{{1
" Syntax: Command
""""""""""""""""""
syn keyword fvwmCommand		skipwhite Nop Close Delete Destroy Raise RaiseLower Lower Beep Refresh RefreshWindow Quit QuitScreen QuitSession SaveSession SaveQuitSession

syn cluster fvwmButtonAction	add=fvwmCommand

hi  link    fvwmCommand		Statement


" Simple command {{{1
" Syntax: CommandName option
"""""""""""""""""""""""""""""
syn keyword fvwmSCommand	nextgroup=fvwmSCommandOption skipwhite DestroyFunc IgnoreModifiers ClickTime DesktopSize ExecUseShell ModuleTimeout Wait MoveThreshold OpaqueMoveSize
syn keyword fvwmSCommand	nextgroup=fvwmSCommandOption skipwhite Include Append Script LoadPreferences
syn match   fvwmSCommandOption	contained contains=fvwmVariable,fvwmQString,fvwmGeometry /\S\+\ze/

syn cluster fvwmButtonAction	add=fvwmSCommand

hi  link    fvwmSCommand	Statement
hi  link    fvwmSCommandOption	Constant


" Complex command {{{1
" Syntax: CommandName option option option ...
"""""""""""""""""""""""""""""""""""""""""""""""
syn keyword fvwmCCommand	nextgroup=fvwmCCommandOptions skipwhite Echo EWMHBaseStruts Restart SnapGrid AddToDecor
syn keyword fvwmCCommand	nextgroup=fvwmCCommandOptions skipwhite EWMH-Desktop EWMH-Panel EWMH-Panel-Top EWMH-Panel-Bottom EWMH-Panel-Left EMWH-Panel-Right Wallpaper-Random
syn match   fvwmCCommandOptions	contained contains=fvwmVariable,fvwmQString,fvwmLineContinue /\S.*\ze\|$/

syn cluster fvwmButtonAction	add=fvwmCCommand

hi  link    fvwmCCommand	Statement
hi  link    fvwmCCommandOptions	Constant


" Simple setting {{{1
""""""""""""""""""""""
syn keyword fvwmSetting		nextgroup=fvwmSettingValue skipwhite HideGeometryWindow EdgeScroll EdgeResistance EdgeThickness
syn match   fvwmSettingValue    contained skipwhite contains=fvwmSettingKeyword,fvwmQString,fvwmNumber,fvwmVariable /\S.*\ze/
syn keyword fvwmSettingKeyword  contained skipwhite Move Resize Never

hi  link    fvwmSetting		Statement
hi  link    fvwmSettingValue	Normal
hi  link    fvwmSettingKeyword	Type


" SetEnv {{{1
" Syntax: SetEnv EnvName ['|"]EnvValue['|"]
""""""""""""""""""""""""""""""""""""""""""""
syn keyword fvwmSetEnv		nextgroup=fvwmSetEnvName skipwhite SetEnv
syn match   fvwmSetEnvName	nextgroup=fvwmSetEnvValue contained skipwhite /\w[0-9A-Za-z\-_\.\$\[\]]\+/
syn match   fvwmSetEnvValue	contained skipwhite contains=fvwmQString,fvwmNumber,fvwmVariable,fvwmLineContinue /\S\+\ze\|\S\+$/
syn region  fvwmSetEnvValue	contained skipwhite contains=fvwmVariable,fvwmNumber,fvwmLineContinue matchgroup=fvwmQuotes start=/"/ skip=/\\"/ end=/"\|$/ 
syn region  fvwmSetEnvValue	contained skipwhite contains=fvwmVariable,fvwmNumber,fvwmLineContinue matchgroup=fvwmQuotes start=/'/ skip=/\\'/ end=/'\|$/ 

hi  link    fvwmSetEnv		Statement
hi  link    fvwmSetEnvName	Identifier
hi  link    fvwmSetEnvValue	Constant


" UnsetEnv {{{1
" Syntax: UnsetEnv EnvName
"""""""""""""""""""""""""""
syn keyword fvwmUnsetEnv	nextgroup=fvwmUnsetEnvName skipwhite UnsetEnv
syn match   fvwmUnsetEnvName	contained skipwhite /\w[0-9A-Za-z\-_\.\$\[\]]\+/

hi  link    fvwmUnsetEnv	Statement
hi  link    fvwmUnsetEnvName	Identifier


" Path {{{1
""""""""""""
syn keyword fvwmPath		nextgroup=fvwmPathURI skipwhite LocalePath ImagePath
syn region  fvwmPathURI		contained skipwhite contains=fvwmVariable,fvwmQString,fvwmPathOption start=/\S/ skip=/\\\s/ end=/\s\|$/
syn region  fvwmPathOption	contained matchgroup=fvwmSemiColon start=/;/ end=/:\|\s\|$/

hi  link    fvwmPath		Statement
hi  link    fvwmPathURI		Constant
hi  link    fvwmPathOption	Type


" Mouse/keyboard binding {{{1
" Syntax: BindType [(Window)] Button/Key Context Modifiers Function
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword	fvwmBinding		nextgroup=fvwmBindingWin,fvwmBindingKey skipwhite Mouse Key
syn region	fvwmBindingWin		nextgroup=fvwmBindingKey contained skipwhite matchgroup=fvwmParentheses start=/(/ end=/)/
syn match	fvwmBindingKey		nextgroup=fvwmBindingContext contained skipwhite /\<\w*\>/
syn match	fvwmBindingContext	nextgroup=fvwmBindingMod contained skipwhite /\<[RWDTSPM\[\]\-\_F\<\^>vI0-9A]*\>/
syn match	fvwmBindingMod		contained skipwhite contains=fvwmVariable /\<[NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\][NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\]/

hi  link    fvwmBinding		Statement
hi  link    fvwmBindingWin	Identifier
hi  link    fvwmBindingKey	Constant
hi  link    fvwmBindingContext	Type
hi  link    fvwmBindingMod	PreProc

" ColormapFocus {{{1
"""""""""""""""""""""
syn keyword	fvwmColormapFocus	nextgroup=fvwmColormapFocusValue skipwhite ColormapFocus
syn keyword	fvwmColormapFocusValue	contained skipwhite FollowsMouse FollowsFocus

hi  link	fvwmColormapFocus	Statement
hi  link	fvwmColormapFocusValue	Type


" SnapAttraction {{{1
""""""""""""""""""""""
syn keyword	fvwmSnapAttraction	    nextgroup=fvwmSnapAttractionValue skipwhite SnapAttraction
syn match	fvwmSnapAttractionValue	    nextgroup=fvwmSnapAttractionType,fvwmSnapAttractionScreen contained contains=fvwmNumber skipwhite /[0-9]\+/
syn keyword	fvwmSnapAttractionType	    nextgroup=fvwmSnapAttractionScreen contained skipwhite All SameType Windows Icons
syn keyword	fvwmSnapAttractionScreen    contained skipwhite Screen

hi  link	fvwmSnapAttraction	    Statement
hi  link	fvwmSnapAttractionValue	    Constant
hi  link	fvwmSnapAttractionType	    Type
hi  link	fvwmSnapAttractionScreen    PreProc


" MenuStyle {{{1
"""""""""""""""""
syn keyword	fvwmMenuStyle		nextgroup=fvwmMenuStyleName skipwhite MenuStyle
syn match	fvwmMenuStyleName	nextgroup=fvwmMenuStyleCommand contained skipwhite contains=fvwmString,fvwmQString /\S\+/
syn region	fvwmMenuStyleCommand	contained skipwhite contains=fvwmMenuStyleOption,fvwmLineContinue start=/\S/ skip=/\s\\$/ end=/$/

syn keyword	fvwmMenuStyleOption	nextgroup=fvwmMenuStyleColon contained skipwhite Fvwm Mwm Win Foreground Background Greyed HilightBack HilightBackOff ActiveFore ActiveForeOff Hiligh3DThick Hilight3DThin Hilight3DOff Hilight3DThickness Animation AnimationOff MenuFace PopupDelay TitleWarp TitleWarpOff TitleUnderlines0 TitleUnderlines1 TitleUnderlines2 SeparatorsLong SeparatorsShort TrianglesSolid TrianglesRelief PopupImmediately PopupDelayed PopdownImmediately PopdownDelayed PopupActiveArea DoubleClickTime SidePic SideColor PopupAsRootMenu PopupAsSubmenu PopupIgnore PopupClose RemoveSubmenus HoldSubmenus SubmenusRight SubmenusLeft SelectOnRelease AutomaticHotkeys AutomaticHotkeysOff MouseWheel ScrollOffPage !ScrollOffPage TrianglesUseFore !TrianglesUseFore

syn keyword	fvwmMenuStyleOption	nextgroup=fvwmMenuStyleNumber contained skipwhite BorderWidth MenuColorset ActiveColorset GreyedColorset PopupDelay PopdownDelay
syn keyword	fvwmMenuStyleOption	nextgroup=fvwmMenuStyle2Numbers contained skipwhite PopupOffset VerticalItemSpacing VerticalTitleSpacing
syn keyword	fvwmMenuStyleOption	nextgroup=fvwmMenuStyleQString contained skipwhite Font ItemFormat

syn match	fvwmMenuStyleNumber	nextgroup=fvwmMenuStyleColon contained skipwhite contains=fvwmVariable,fvwmNumber /\$\[\w[0-9A-Za-z\-_\.]\+\]\|\d\+/
syn match	fvwmMenuStyle2Numbers	nextgroup=fvwmMenuStyleColon contained skipwhite contains=fvwmVariable,fvwmNumber /[+\-0-9]\+\s\+[+\-0-9]\+/

syn region  fvwmMenuStyleQString	nextgroup=fvwmMenuStyleColon contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/"/ skip=/\\"/ end=/"/
syn region  fvwmMenuStyleQString	nextgroup=fvwmMenuStyleColon contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/'/ skip=/\\'/ end=/'/
syn region  fvwmMenuStyleQString	nextgroup=fvwmMenuStyleColon contained keepend contains=fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/`/ skip=/\\`/ end=/`/

syn match	fvwmMenuStyleColon	nextgroup=fvwmMenuStyleOption contained skipwhite /,/

hi  link	fvwmMenuStyle		Statement
hi  link	fvwmMenuStyleName	Constant
hi  link	fvwmMenuStyleCommand	Normal
hi  link	fvwmMenuStyleOption	Type
hi  link	fvwmMenuStyleNumber	Constant
hi  link	fvwmMenuStyle2Numbers	Constant
hi  link	fvwmMenuStyleQString	Constant
hi  link	fvwmMenuStyleColon	Comment


" Style {{{1
"""""""""""""
syn keyword	fvwmStyle		nextgroup=fvwmStyleName skipwhite Style
syn match	fvwmStyleName		nextgroup=fvwmStyleCommand contained skipwhite contains=fvwmString,fvwmQString /\S\+/
syn region	fvwmStyleCommand	contained skipwhite contains=fvwmStyleOption,fvwmLineContinue start=/\S/ skip=/\s\\$/ end=/$/

" Style options {{{2
syn keyword	fvwmStyleOption		nextgroup=fvwmStyleColon contained skipwhite NoIcon IconBox IconGrid IconFill IconSize !Title NoTitle Title TitleAtBottom TitleAtLeft TitleAtRight TitleAtTop LeftTitleRotatedCW LeftTitleRotatedCCW RightTitleRotatedCCW RightTitleRotatedCW TopTitleRotated TopTitleNotRotated BottomTitleRotated BottomTitleNotRotated !UseTitleDecorRotation UseTitleDecorRotation StippledTitle StippledTitleOff IndexedWindowName ExactWindowName IndexedIconName ExactIconName !Borders Borders !Handles NoHandles Handles WindowListSkip WindowListHit CirculateSkip CirculateHit CirculateSkipShaded CirculateHitShaded CirculateSkipIcon CirculateHitIcon Layer StaysOnTop StaysOnBottom StaysPut Sticky Slippery StickyAcrossPages !StickyAcrossPages StickyAcrossDesks !StickyAcrossDesks StartIconic StartNormal Color ForeColor BackColor HilightFore HilightBack IconTitleRelief IconBackgroundRelief IconBackgroundPadding Font IconFont StartsOnDesk StartsOnPage StartsAnyWhere StartsOnScreen ManualPlacementHonorsStartsOnPage ManualPlacementIgnoresStartsOnPage CaptureHonorsStartsOnPage CaptureIgnoresStartsOnPage RecaptureHonorsStartsOnPage RecaptureIgnoresStartsOnPage StartsOnPageIncludesTransients StartsOnPageIgnoresTransients IconTitle NoIconTitle MwmButtons FvwmButtons MwmBorder FvwmBorder MwmDecor NoDecorHint MwmFunctions NoFuncHint HintOverride NoOverride ResizeHintOverride NoResizeOverride OLDecor NoOLDecor GNOMEUseHints GNOMEIgnoreHints StickyIcon SlipperyIcon StickyAcrossPagesIcon !StickyAcrossPagesIcon StickyAcrossDesksIcon !StickyAcrossDesksIcon ManualPlacement CascadePlacement MinOverlapPlacement MinOverlapPercentPlacement TileManualPlacement TileCascadePlacement CenterPlacement DecorateTransient NakedTransient DontRaiseTransient RaiseTransient DontLowerTransient LowerTransient DontStackTransientParent StackTransientParent SkipMapping ShowMapping ScatterWindowGroups KeepWindowGroupsOnDesk UseDecor NoPPosition UsePPosition NoUSPosition UseUSPosition NoTransientPPosition UseTransientPPosition NoTransientUSPosition UseTransientUSPosition NoIconPosition UseIconPosition Lenience NoLenience ClickToFocus SloppyFocus MouseFocus FocusFollowsMouse NeverFocus ClickToFocusPassesClickOff ClickToFocusPassesClick ClickToFocusRaisesOff ClickToFocusRaises MouseFocusClickRaises MouseFocusClickRaisesOff GrabFocus GrabFocusOff GrabFocusTransientOff GrabFocusTransient FPFocusClickButtons FPFocusClickModifiers !FPSortWindowlistByFocus FPSortWindowlistByFocus FPClickRaisesFocused !FPClickRaisesFocused FPClickDecorRaisesFocused !FPClickDecorRaisesFocused FPClickIconRaisesFocuesd !FPClickIconRaisesFocused !FPClickRaisesUnfocused FPClickRaisesUnfocused FPClickDecorRaisesUnfocused !FPClickDecorRaisesUnfocused FPClickIconRaisesUnfocused !FPClickIconRaisesUnfocused FPClickToFocus !FPClickToFocus FPClickDecorToFocus !FPClickDecorToFocus FPClickIconToFocus !FPClickIconToFocus !FPEnterToFocus FPEnterToFocus !FPLeaveToUnfocus FPLeaveToUnfocus !FPFocusByProgram FPFocusByProgram !FPFocusByFunction FPFocusByFunction FPFocusByFunctionWarpPointer !FPFocusByFunctionWarpPointer FPLenient !FPLenient !FPPassFocusClick FPPassFocusClick !FPPassRaiseClick / FPPassRaiseClick, FPIgnoreFocusClickMotion !FPIgnoreFocusClickMotion FPIgnoreRaiseClickMotion !FPIgnoreRaiseClickMotion !FPAllowFocusClickFunction FPAllowFocusClickFunction !FPAllowRaiseClickFunction FPAllowRaiseClickFunction FPGrabFocus !FPGrabFocus !FPGrabFocusTransient FPGrabFocusTransient FPOverrideGrabFocus !FPOverrideGrabFocus FPReleaseFocus !FPReleaseFocus !FPReleaseFocusTransient FPReleaseFocusTransient FPOverrideReleaseFocus !FPOverrideReleaseFocus StartsLowered StartsRaised IgnoreRestack AllowRestack FixedPosition VariablePosition FixedUSPosition VariableUSPosition FixedPPosition VariablePPosition FixedSize VariableSize FixedUSSize VariableUSSize FixedPSize VariablePSize !Closable Closable !Iconifiable Iconifiable !Maximizable Maximizable !AllowMaximizeFixedSize AllowMaximizeFixedSize IconOverride NoIconOverride NoActiveIconOverride DepressableBorder FirmBorder MaxWindowSize IconifyWindowGroups IconifyWindowGroupsOff ResizeOpaque ResizeOutline BackingStore BackingStoreOff BackingStoreWindowDefault Opacity ParentalRelativity SaveUnder SaveUnderOff WindowShadeShrinks WindowShadeScrolls WindowShadeAlwaysLazy WindowShadeBusy WindowShadeLazy EWMHDonateIcon EWMHDontDonateIcon EWMHDonateMiniIcon EWMHDontDonateMiniIcon EWMHMiniIconOverride EWMHNoMiniIconOverride EWMHUseStackingOrderHints EWMHIgnoreStackingOrderHints EWMHIgnoreStateHints EWMHUseStateHints EWMHIgnoreStrutHints EWMHUseStrutHints EWMHIgnoreWindowType !EWMHIgnoreWindowType EWMHMaximizeIgnoreWorkingArea EWMHMaximizeUseWorkingArea EWMHMaximizeUseDynamicWorkingArea EWMHPlacementIgnoreWorkingArea EWMHPlacementUseWorkingArea EWMHPlacementUseDynamicWorkingArea MoveByProgramMethod Unmanaged State
syn keyword	fvwmStyleOption		nextgroup=fvwmStyleNumber contained skipwhite BorderWidth HandleWidth Colorset HilightColorset BorderColorset HilightBorderColorset IconTitleColorset HilightIconTitleColorset IconBackgroundColorset WindowShadeSteps Button NoButton

syn keyword	fvwmStyleOption		nextgroup=fvwmStyleFilename contained skipwhite Icon MiniIcon UseStyle

syn keyword	fvwmStyleOption		nextgroup=fvwmStylePenalties contained skipwhite MinOverlapPlacementPenalties
syn keyword	fvwmStyleOption		nextgroup=fvwmStylePercentPenalties contained skipwhite MinOverlapPercentPlacementPenalties

" Style parameters {{{2
syn match	fvwmStyleNumber		nextgroup=fvwmStyleColon contained skipwhite contains=fvwmVariable,fvwmNumber /\$\[\w[0-9A-Za-z\-_\.]\+\]\|p\d\+\|\d\+/
syn match	fvwmStyleFilename	nextgroup=fvwmStyleColon contained skipwhite contains=fvwmFilename /.\f\+\ze/

syn match	fvwmStylePenalties nextgroup=fvwmStylePenalties1 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePenalties1 nextgroup=fvwmStylePenalties2 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePenalties2 nextgroup=fvwmStylePenalties3 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePenalties3 nextgroup=fvwmStylePenalties4 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePenalties4 nextgroup=fvwmStylePenalties5 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePenalties5 nextgroup=fvwmStyleColon contained skipwhite /[0-9\.]\+/

syn match	fvwmStylePercentPenalties nextgroup=fvwmStylePercentPenalties1 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePercentPenalties1 nextgroup=fvwmStylePercentPenalties2 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePercentPenalties2 nextgroup=fvwmStylePercentPenalties3 contained skipwhite /[0-9\.]\+/
syn match	fvwmStylePercentPenalties3 nextgroup=fvwmStyleColon contained skipwhite /[0-9\.]\+/

syn match	fvwmStyleColon		nextgroup=fvwmStyleOption contained skipwhite /,/

" Colors {{{2
hi  link	fvwmStyle		Statement
hi  link	fvwmStyleName		Constant
hi  link	fvwmStyleCommand	Normal
hi  link	fvwmStyleOption		Type
hi  link	fvwmStyleNumber		Constant
hi  link	fvwmStylePenalties	Constant
hi  link	fvwmStylePenalties1	Type
hi  link	fvwmStylePenalties2	PreProc
hi  link	fvwmStylePenalties3	Constant
hi  link	fvwmStylePenalties4	Type
hi  link	fvwmStylePenalties5	PreProc
hi  link	fvwmStylePercentPenalties  Constant
hi  link	fvwmStylePercentPenalties1 Type
hi  link	fvwmStylePercentPenalties2 PreProc
hi  link	fvwmStylePercentPenalties3 Constant
hi  link	fvwmStyleColon		Comment


" Stroke binding {{{1
" Syntax: Stroke [(Window)] Sequence Button Context Modifiers Function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword	fvwmStroke		nextgroup=fvwmStrokeWin,fvwmStrokeSequence skipwhite Stroke
syn region	fvwmStrokeWin		nextgroup=fvwmStrokeSequence contained skipwhite matchgroup=fvwmParentheses start=/(/ end=/)/
syn match	fvwmStrokeSequence	nextgroup=fvwmStrokeButton contained skipwhite /\<[N0-9]*\>/
syn match	fvwmStrokeButton	nextgroup=fvwmStrokeContext contained skipwhite /\<[0-9]\>/
syn match	fvwmStrokeContext	nextgroup=fvwmStrokeMod contained skipwhite /\<[RWDTSPM\[\]\-\_F\<\^>vI0-9A]*\>/
syn match	fvwmStrokeMod		contained skipwhite contains=fvwmVariable /\<[NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\][NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\]/

hi  link    fvwmStroke		Statement
hi  link    fvwmStrokeWin	Identifier
hi  link    fvwmStrokeSequence	PreProc
hi  link    fvwmStrokeButton	Constant
hi  link    fvwmStrokeContext	Type
hi  link    fvwmStrokeMod	PreProc


" StrokeFunc {{{1
""""""""""""""""""
syn keyword	fvwmStrokeFunc	    nextgroup=fvwmStrokeFuncOpts    skipwhite StrokeFunc
syn keyword	fvwmStrokeFuncOpts  nextgroup=fvwmStrokeFuncOpts    contained skipwhite NoStayPressed EchoSequence DrawMotion FeedBack
syn keyword	fvwmStrokeFuncOpts  nextgroup=fvwmStrokeFuncWidth   contained skipwhite StrokeWidth
syn match	fvwmStrokeFuncWidth nextgroup=fvwmStrokeFuncOpts    contained skipwhite /\d\+/

hi  link	fvwmStrokeFunc	    Statement
hi  link	fvwmStrokeFuncOpts  Type
hi  link	fvwmStrokeFuncWidth Constant


" Conditional commands {{{1
" Syntax: Function (Condition, !Condition, "Window1|Window2", !"Window3|Window4", ...)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword fvwmCondition	    nextgroup=fvwmConditionList skipwhite All Any Break Current Direction KeepRc Next None NoWindow Pick PointerWindow Prev Test TestRc ThisWindow WindowId
syn region  fvwmConditionList	    contained contains=fvwmConditionKeywords,fvwmConditionNegated,fvwmConditionBool,fvwmQString skipwhite matchgroup=fvwmParentheses start=/(/ end=/)/
syn keyword fvwmConditionKeywords   nextgroup=fvwmConditionOptions contained skipwhite AcceptsFocus AnyScreen CurculateHit CirculateHitShaded Closable CurrentDesk CurrentGlobalPage CurrentGlobalPageAnyDesk CurrentPage CurrentPageAnyDesk CurrentScreen FixedPosition FixedSize Focused HasHandles HasPointer Iconic Iconifiable Layer Maximizable Maximized Overlapped PlacedByButton PlacedByButton3 PlacedByFvwm Raised Shaded State Sticky StickyAcrossDesks StickyAcrossPages Transient Visible Match NoMatch Error Break Version EnvIsSet EnvMatch EdgeHasPointer EdgeIsActive Start Init Restart Exit Quit ToRestart True False F R W X I
syn keyword fvwmConditionOptions    contained Any North Top Up West Left South Bottom Down Right East
syn match   fvwmConditionOptions    contained />=\|>/
syn match   fvwmConditionOptions    contained /<=\|</
syn match   fvwmConditionOptions    contained /==\|\!=/
syn match   fvwmConditionBool	    contained /\,\||/
syn match   fvwmConditionNegated    nextgroup=fvwmConditionOptions contained skipwhite /![a-zA-Z0-9_\-]\+\ze/
syn region  fvwmConditionNegated    contained start=/!"/ skip=/\\"/ end=/"/
syn region  fvwmConditionNegated    contained start=/!'/ skip=/\\'/ end=/'/

syn cluster fvwmButtonAction    add=fvwmCondition

hi  link    fvwmCondition	    Statement
hi  link    fvwmConditionList	    Constant
hi  link    fvwmConditionKeywords   PreProc
hi  link    fvwmConditionOptions    Identifier
hi  link    fvwmConditionBool	    Type
hi  link    fvwmConditionNegated    Comment


" BugOpts {{{1
"""""""""""""""
syn keyword fvwmBugOpts		nextgroup=fvwmBugOptsOption skipwhite BugOpts
syn keyword fvwmBugOptsOption	nextgroup=fvwmBugOptsBool contained skipwhite FlickeringMoveWorkaround MixedVisualWorkaround ModalityIsEvil RaiseOverNativeWindows RaiseOverUnmanaged FlickeringQtDialogsWorkaround EWMHIconicStateWorkaround DisplayNewWindowNames ExplainWindowPlacement DebugCRMotionMethod
syn keyword fvwmBugOptsBool	contained skipwhite True False Toggle

hi  link    fvwmBugOpts		Statement
hi  link    fvwmBugOptsOption	Constant
hi  link    fvwmBugOptsBool	Type


" CursorStyle {{{1
"""""""""""""""""""
syn keyword fvwmCursorStyle	    nextgroup=fvwmCursorStyleContext skipwhite CursorStyle
syn keyword fvwmCursorStyleContext  nextgroup=fvwmCursorStyleValue contained skipwhite Position Title Default Sys Move Resize Wait Menu Select Destroy Top Right Bottom Left Top_Left Top_Right Bottom_Left Bottom_Right Top_Edge Right_Edge Bottom_Edge Left_Edge Root Stroke
syn match   fvwmCursorStyleValue    nextgroup=fvwmCursorStyleColors contained skipwhite /\S\+/
syn match   fvwmCursorStyleColors   contained contains=fvwmRGBValue skipwhite /\S\+\s\S\+/

hi  link    fvwmCursorStyle	    Statement
hi  link    fvwmCursorStyleContext  Type
hi  link    fvwmCursorStyleValue    Constant
hi  link    fvwmCursorStyleColors   Special

" DestroyDecor {{{1
""""""""""""""""""""
syn keyword fvwmDestroyDecor		nextgroup=fvwnDestroyDecorName,fvwmDestroyDecorRecreate skipwhite DestroyDecor
syn keyword fvwmDestroyDecorRecreate	nextgroup=fvwmDestroyDecorName contained skipwhite Recreate
syn match   fvwmDestroyDecorName	contained skipwhite /\S\+/

hi  link    fvwmDestroyDecor		Statement
hi  link    fvwmDestroyDecorRecreate	PreProc
hi  link    fvwmDestroyDecorName	Constant


" Window decoration cluster {{{1
"""""""""""""""""""""""""""""""""
syn cluster fvwmWindowDecoration    contains=fvwmTitleStyle


" TitleStyle {{{1
""""""""""""""""""
syn keyword fvwmTitleStyle		nextgroup=fvwmTitleStyleState,fvwmTitleStyleHeight,fvwmTitleStyleJustify skipwhite TitleStyle
syn keyword fvwmTitleStyleJustify	nextgroup=fvwmTitleStyleHeight contained skipwhite Centered RightJustified LeftJustified
syn keyword fvwmTitleStyleHeight	nextgroup=fvwmTitleStyleHeightValue contained skipwhite Height MinHeight
syn match   fvwmTitleStyleHeightValue	nextgroup=fvwmTitleStyleHeight contained skipwhite /[0-9]\+/
syn keyword fvwmTitleStyleState		nextgroup=fvwmTitleStyleStyle contained skipwhite Active Inactive ActiveUp ActiveDown InactiveUp InactiveDown Toggled

hi  link    fvwmTitleStyle		Statement
hi  link    fvwmTitleStyleJustify	Type
hi  link    fvwmTitleStyleHeight	Statement
hi  link    fvwmTitleStyleHeightValue	Constant
hi  link    fvwmTitleStyleState		Type

" AddToFunc {{{1
"""""""""""""""""
syn keyword fvwmAddToFunc	nextgroup=fvwmAddToFuncName skipwhite AddToFunc
syn match   fvwmAddToFuncName	nextgroup=fvwmAddToFuncType contained skipwhite /[a-zA-Z0-9\-_]\+/
syn keyword fvwmAddToFuncType	contained skipwhite I M C H D

hi  link    fvwmAddToFunc	Statement
hi  link    fvwmAddToFuncName	Constant
hi  link    fvwmAddToFuncType	Type

" Next line {{{1
"""""""""""""""""
syn keyword fvwmNextLine	nextgroup=fvwmAddToFuncType,fvwmMenuEntry,@fvwmWindowDecoration skipwhite +

hi  link    fvwmNextLine	PreProc

" SendToModule {{{1
""""""""""""""""""""
syn keyword fvwmSendToModule	    nextgroup=fvwmSendToModuleName skipwhite SendToModule
syn match   fvwmSendToModuleName    nextgroup=fvwmSendToModuleString contained skipwhite /[a-zA-Z\-\*]\+/
syn match   fvwmSendToModuleString  contained skipwhite /\S.*$/

syn cluster fvwmButtonAction	add=fvwmSendToModule

hi  link    fvwmSendToModule	    Statement
hi  link    fvwmSendToModuleName    Type
hi  link    fvwmSendToModuleString  Constant


" DestroyModuleConfig {{{1
"""""""""""""""""""""""""""
syn keyword fvwmDestroyModuleConfig	    nextgroup=fvwmDestroyModuleConfigName skipwhite DestroyModuleConfig
syn match   fvwmDestroyModuleConfigName	    contained skipwhite /[a-zA-Z\-]\+\*/
syn match   fvwmDestroyModuleConfigName	    nextgroup=fvwmDestroyModuleConfigValue contained skipwhite /[a-zA-Z\-]\+\:\s/
syn match   fvwmDestroyModuleConfigValue    contained skipwhite /\S.*$/

hi  link    fvwmDestroyModuleConfig	    Statement
hi  link    fvwmDestroyModuleConfigName	    Constant
hi  link    fvwmDestroyModuleConfigValue    Type


" Start/Kill specified module {{{1
" Syntax: CommandName ModuleName [ModuleAlias] [options]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn keyword fvwmModule		nextgroup=fvwmModuleAlias skipwhite KillModule Module
syn keyword fvwmModuleAlias	nextgroup=fvwmModuleOptions contained skipwhite FvwmAnimate FvwmAuto FvwmBacker FvwmBanner FvwmButtons FvwmCommandS FvwmConsole FvwmCpp FvwmDebug FvwmDragWell FvwmEvent FvwmForm FvwmGtk FvwmIconBox FvwmIconMan FvwmIdent FvwmM4 FvwmPager FvwmProxy FvwmRearrange FvwmSave FvwmSaveDesk FvwmScript FvwmScroll FvwmTabs FvwmTaskBar FvwmWinList FvwmWharf
syn match   fvwmModuleOptions	contained /\S.*$/

syn cluster fvwmButtonAction	add=fvwmModule

hi  link    fvwmModule		Statement
hi  link    fvwmModuleAlias	Type
hi  link    fvwmModuleOptions	Constant


" DestroyMenu {{{1
"""""""""""""""""""
syn keyword fvwmDestroyMenu		nextgroup=fvwmDestroyMenuRecreate,fvwmDestroyMenuName skipwhite DestroyMenu
syn keyword fvwmDestroyMenuRecreate	nextgroup=fvwmDestroyMenuName contained skipwhite recreate
syn match   fvwmDestroyMenuName		contained skipwhite /\S\+\ze/

hi  link    fvwmDestroyMenu		Statement
hi  link    fvwmDestroyMenuRecreate	Type
hi  link    fvwmDestroyMenuName		Constant


" AddToMenu {{{1
"""""""""""""""""
syn keyword fvwmAddToMenu	    nextgroup=fvwmAddToMenuName skipwhite AddToMenu
syn match   fvwmAddToMenuName	    nextgroup=fvwmMenuEntry contained skipwhite /\S\+/
syn keyword fvwmAddToMenuTitle	    nextgroup=fvwmAddToMenuTitleTop contained skipwhite Title
syn keyword fvwmAddToMenuTitleTop   contained skipwhite Top

hi  link    fvwmAddToMenu	    Statement
hi  link    fvwmAddToMenuName	    Constant
hi  link    fvwmAddToMenuTitle	    Type
hi  link    fvwmAddToMenuTitleTop   PreProc


" Menu entries {{{1
""""""""""""""""""""
syn keyword fvwmMenuEntry	    nextgroup=fvwmMenuEntryMissingSubmenuFunction contained skipwhite MissingSubmenuFunction
syn match   fvwmMenuEntryMissingSubmenuFunction contained skipwhite /\S\+/
syn region  fvwmMenuEntry	    nextgroup=fvwmAddToMenuTitle contained skipwhite contains=fvwmMenuEntryIcon,fvwmMenuEntrySideColor,fvwmMenuEntryString start=/\S/ end=/\s/
syn match   fvwmMenuEntryIcon	    contained /%\f\+%\|\*\f\+\*\|@\f\+@/
syn match   fvwmMenuEntrySideColor  contained contains=fvwmRGBValue /\^\f\+\^/
syn region  fvwmMenuEntryString	    contained keepend contains=fvwmMenuEntryHotkey,fvwmMenuEntryIcon,fvwmMenuEntrySideColor,fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/"/ skip=/\\"/ end=/"\|$/
syn region  fvwmMenuEntryString	    contained keepend contains=fvwmMenuEntryHotkey,fvwmMenuEntryIcon,fvwmMenuEntrySideColor,fvwmVariable,fvwmLineContinue matchgroup=fvwmQuotes start=/'/ skip=/\\'/ end=/'\|$/
syn match   fvwmMenuEntryHotkey	    contained /&\w/


hi  link    fvwmMenuEntry	    Statement
hi  link    fvwmMenuEntryMissingSubmenuFunction Constant
hi  link    fvwmMenuEntryIcon	    Special
hi  link    fvwmMenuEntrySideColor  PreProc
hi  link    fvwmMenuEntryString	    Constant
hi  link    fvwmMenuEntryHotkey	    Type


" MenuPopup {{{1
"""""""""""""""""
syn keyword fvwmMenuPopup	    nextgroup=fvwmMenuPopupName skipwhite Menu Popup
syn match   fvwmMenuPopupName	    nextgroup=fvwmMenuPopupContext,fvwmMenuPopupPosition,fvwmMenuPopupOpts contained skipwhite /\S\+/
syn keyword fvwmMenuPopupContext    nextgroup=fvwmMenuPopupPosition contained skipwhite Root XineramaRoot Mouse Window Interior Title Button0 Button1 Button2 Button3 Button4 Button5 Button6 Button7 Button8 Button9 Icon Menu Item Context This
syn keyword fvwmMenuPopupContext    nextgroup=fvwmMenuPopupRectangle contained skipwhite Rectangle
syn match   fvwmMenuPopupRectangle  nextgroup=fvwmMenuPopupPosition contained skipwhite contains=fvwmVariable,fvwmGeometry /\S\+/
syn match   fvwmMenuPopupPosition   nextgroup=fvwmMenuPopupOpts contained skipwhite contains=fvwmNumber,fvwmGeometry /[0-9+\-mpoc]\+\s[0-9+\-mpoc]\+/
syn keyword fvwmMenuPopupOpts	nextgroup=fvwmMenuPopupOpts contained skipwhite TearOffImmediately Fixed SelectInPlace SelectWarp WarpTitle NoWarp

syn cluster fvwmButtonAction	add=fvwmMenuPopup

hi  link    fvwmMenuPopup	    Statement
hi  link    fvwmMenuPopupName	    Constant
hi  link    fvwmMenuPopupContext    Type
hi  link    fvwmMenuPopupRectangle  Constant
hi  link    fvwmMenuPopupPosition   PreProc
hi  link    fvwmMenuPopupOpts	    Statement

" Module configuration line {{{1
" Syntax: *ModuleAlias: ModuleOption parameter parameter ...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn match   fvwmModConf		    nextgroup=fvwmModConfOption skipwhite /\s*\*[a-zA-Z\-]\+\:/

" FvwmAnimate {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite Color Pixmap Delay Iterations Twist Width Effect Stop Save
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite Frame Lines Flip Turn Zoom3D Twist Random None	

" FvwmBacker {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite Command RetainPixmap DoNotRetainPixmap

" FvwmBanner {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite NoDecor Pixmap Timeout

" FvwmButtons {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite Back Colorset ActiveColorset PressColorset Columns File Font Fore Frame Geometry ButtonGeometry Padding Pixmap Rows
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords contained skipwhite BoxSize
syn region  fvwmModConfOption	    contained skipwhite contains=fvwmModConfButton,fvwmLineContinue matchgroup=fvwmParentheses keepend start=/(/ skip=/\s\\$/ end=/$\|)$/
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite dumb fixed smart
syn region  fvwmModConfButton	    contained skipwhite contains=fvwmModConfButtonOption,fvwmGeometry keepend start=/\S/ skip=/(\(\S*\s*\,\s*\S*\)*)/ matchgroup=fvwmQuotes end=/\,/
syn keyword fvwmModConfButtonOption contained skipwhite ActionIgnoresClientWindow ActionOnPress Center End Left NoSize Right
syn keyword fvwmModConfButtonOption nextgroup=fvwmString,fvwmQString,fvwmNumber contained skipwhite Back Colorset ActiveColorset PressColorset Font Fore Frame Icon ActiveIcon PressIcon Id Size ActiveTitle PressTitle
syn keyword fvwmModConfButtonOption nextgroup=fvwmModConfButtonPadding contained skipwhite Padding Size
syn keyword fvwmModConfButtonOption nextgroup=fvwmModConfButtonTitle,fvwmString,fvwmQString contained skipwhite Title
syn keyword fvwmModConfButtonOption nextgroup=fvwmModConfButtonSwallow,fvwmModConfButtonParams contained skipwhite Swallow
syn keyword fvwmModConfButtonOption nextgroup=fvwmModConfButtonPanel,fvwmModConfButtonParams contained skipwhite Panel
syn keyword fvwmModConfButtonOption nextgroup=fvwmModConfButtonAction,fvwmModConfButtonActionCmd contained skipwhite Action
syn match   fvwmModConfButtonPadding	contained contains=fvwmNumber /\d\+\s\d\+/
syn region  fvwmModConfButtonTitle	nextgroup=fvwmString,fvwmQString contained skipwhite contains=fvwmModConfButtonTitleOpts matchgroup=fvwmParentheses start=/(/ end=/)/
syn keyword fvwmModConfButtonTitleOpts	contained Left Center Right Side
syn region  fvwmModConfButtonSwallow	nextgroup=fvwmModConfButtonParams contained skipwhite contains=fvwmModConfButtonSwallowOpts matchgroup=fvwmParentheses start=/(/ end=/)/
syn keyword fvwmModConfButtonSwallowOpts	contained skipwhite NoClose Close NoHints Hints NoKill Kill NoRespawn Respawn SwallowNew NoOld UseOld NoTitle UseTitle NoFvwmModule FvwmModule
syn region  fvwmModConfButtonPanel	nextgroup=fvwmModConfButtonParams contained skipwhite contains=fvwmModConfButtonPanelOpts,fvwmNumber matchgroup=fvwmParentheses start=/(/ end=/)/
syn keyword fvwmModConfButtonPanelOpts	contained NoClose Close NoHints Hints NoKill Kill NoRespawn Respawn SwallowNew NoOld UseOld NoTitle UseTitle NoFvwmModule FvwmModule Left Right Up Down Steps Delay Smooth NoBorder Indicator Padding

syn region  fvwmModConfButtonAction	nextgroup=fvwmModConfButtonActionCmd contained skipwhite contains=fvwmModConfButtonActionOpts,fvwmNumber keepend matchgroup=fvwmParentheses start=/(/ end=/)/
syn keyword fvwmModConfButtonActionOpts	contained Mouse
syn region  fvwmModConfButtonActionCmd	contained skipwhite contains=fvwmModConfButtonAction,@fvwmButtonAction,fvwmVariable start=/\S/ matchgroup=fvwmQuotes end=/\,/

syn region   fvwmModConfButtonParams	contained skipwhite contains=fvwmString,fvwmQString start=/['"]\w/ end=/\S/




" FvwmDragWell {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite Geometry DragWellGeometry Colorset Fore Back Shadow Hilite

" FvwmEvent {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite Cmd PassId startup shutdown unknown new_page new_desk old_add_window raise_window lower_window old_configure_window focus_change enter_window leave_window destroy_window iconify deiconify window_name icon_name visible_icon_name res_class res_name end_windowlist icon_location map error config_info end_config_info icon_file default_icon string mini_icon windowshade dewindowshade visible_name sendconfig restack add_window configure_window visible_icon enter_window leave_window property_change beep toggle_paging Delay StartDelay RplayHost RplayPriority RplayVolume PlayCmd Dir
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite builtin-rplay exec

" FvwmForm {{{2
" FIXME: Finish
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite GrabServer WarpPointer Geometry Position Colorset Back Fore ItemColorset ItemBack ItemFore Font ButtonFont InputFont TimeoutFont Line Message PadVText Text Title Input Choice
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfFvwmFormSelection contained skipwhite Selection
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite left right center expand
syn match   fvwmModConfFvwmFormSelection nextgroup=fvwmModConfFvwmFormSelectionType contained skipwhite /\S\+\ze/
syn keyword fvwmModConfFvwmFormSelectionType contained single multiple

" FvwmGtk {{{2

" FvwmIconBox {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite Fore Colorset IconColorset IconHiColorset Back IconFore IconBack IconHiFore IconHiBack Pixmap Font SortIcons PaddingSBWidth Placement UseSkipList Lines HideSC Geometry MaxIconSize Mouse Key SetWMIconSize HilightFocusWin Resolution FrameWidth NoIconAction NoIconifiedParentheses NormalTitleRelief IconifiedTitleRelief NormalTitleInvertedRelief IconifiedTitleInvertedRelief
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters,fvwmModConfKeywords contained skipwhite WindowName IconName ResClass ResName Left Right Top Bottom Horizontal Vertical Click DoubleClick Next Prev

" FvwmIconMan {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite NumManagers Background ButtonGeometry Colorset FocusAndSelectButton FocusAndSelectColorset FocusButton FocusColorset Font Foreground Format IconName IconButton IconColorset ManagerGeometry MaxButtonWidth MaxButtonWidthByColumns NoIconAction PlainButton PlainColorset ReliefThickness Resolution Reverse SelectButton SelectColorset Sort SortWeight Title TitleButton Tips TipsDelays TipsFont TipsColorset TipsFormat TipsBorderWidth TipsPlacement TipsJustification TipsOffsets
syn keyword fvwmModConfOption	    nextgroup=fvwmBoolean contained skipwhite DrawIcons FollowFocus Shape UseWinList ShowTransient ShowOnlyIcons ShowNoIcons
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfAction contained skipwhite Action
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfFvwmIconManShow contained skipwhite Show DontShow
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite Flat Up Down RaisedEdge SunkEdge Global Desk Page Screen !Desk !Page !Screen Icon Normal None Name NameWithCase Id Weighted Always Needed False Right Left UpDown LeftRight LeftUp RightDown Center
syn keyword fvwmModConfAction	    nextgroup=fvwmModConfFvwmIconManActionKey contained skipwhite Key Mouse
syn keyword fvwmModConfAction	    nextgroup=fvwmModConfFvwmIconManActionFunc contained skipwhite Select
syn match   fvwmModConfFvwmIconManActionKey nextgroup=fvwmModConfFvwmIconManActionMod contained skipwhite /\<\w*\>/
syn match   fvwmModConfFvwmIconManActionMod nextgroup=fvwmModConfFvwmIconManActionFunc contained skipwhite contains=fvwmVariable /\<[NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\][NCSMLA1-5]*\>\|\$\[\w[0-9A-Za-z\-_\.]\+\]/
" FIXME: Better handling of command groups
syn region  fvwmModConfFvwmIconManActionFunc contained skipwhite contains=fvwmModConfFvwmIconManActionKeyword,fvwmLineContinue keepend start=/\S/ skip=/\s\\$/ end=/$/
syn keyword fvwmModConfFvwmIconManActionKeyword	nextgroup=fvwmModConfFvwmIconManActionOpts contained skipwhite bIf biFN GotoButton GotoManager Jmp Label Print Quit Ret Select SendCommand Warp
syn keyword fvwmModConfFvwmIconManActionKeyword	nextgroup=fvwmModConfFvwmIconManActionCmd contained skipwhite SendCommand
syn region  fvwmModConfFvwmIconManActionOpts	contained skipwhite contains=fvwmVariable,fvwmQString keepend start=/\S/ matchgroup=fvwmQuotes end=/\,/
syn region  fvwmModConfFvwmIconManActionCmd	contained skipwhite contains=@fvwmButtonAction keepend start=/\S/ matchgroup=fvwmQuotes end=/\,/
syn region  fvwmModConfFvwmIconManShow		contained skipwhite matchgroup=fvwmQuotes start=/Class=\|Resource=\|Title=\|Icon=/ end=/$/

" FvwmIdent {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite Colorset Fore Back Font MinimalLayer

" FvwmPager {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfKeywords,fvwmModConfParameters contained skipwhite Geometry Rows Columns IconGeometry Font SmallFont Fore Back Hilight HilightPixmap WindowColors WindowLabelFormat Label DeskColor Pixmap DeskPixmap DesktopScape MoveThreshold Balloons BalloonFore BalloonBack BalloonFont BalloonBorderWidth BalloonBorderColor BalloonYOffset BalloonStringFormat Colorset BalloonColorset HilightColorset WindowColorsets WindowBorderWidth
syn keyword fvwmModConfOption	    contained skipwhite StartIconic NoStartIconic LabelsBelow LabelsAbove ShapeLabels NoShapeLabels DeskHilight NoDeskHilight MiniIcons SloppyFocus SolidSeparators NoSeparators Window3DBorders UseSkipList
syn keyword fvwmModConfKeywords	    nextgroup=fvwmModConfParameters contained skipwhite Pager Icon

" FvwmProxy {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite Colorset SelectColorset IconifiedColorset Font Width Height Separation
syn keyword fvwmModConfOption	    nextgroup=fvwmBoolean contained skipwhite ShowMiniIcons EnterSelect ProxyMove ProxyIconified
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfAction contained skipwhite Action
syn keyword fvwmModConfAction	    nextgroup=fvwmModConfParameters contained skipwhite Select Show Hide Abort Mark Unmark ModifierRelease

" FvwmScript {{{2
syn keyword fvwmModConfOption	    nextgroup=fvwmModConfParameters contained skipwhite DefaultFont DefaultFore DefaultBack DefaultHilight DefaultShadow DefaultColorset

" FvwmTabs {{{2

" FvwmTaskBar {{{2

" FvwmWinList {{{2

" FvwmWharf {{{2

" Other options {{{2
syn match   fvwmModConfParameters   contained skipwhite contains=fvwmRGBValue,fvwmNumber,fvwmString,fvwmQString,fvwmVariable,fvwmGeometry /\S.*$/

" Colors {{{2
hi  link    fvwmModConf				Constant
hi  link    fvwmModConfOption			Statement
hi  link    fvwmModConfAction			Type
hi  link    fvwmModConfKeywords			Type
hi  link    fvwmModConfButtonOption		Statement
hi  link    fvwmModConfButtonTitle		Normal
hi  link    fvwmModConfButtonTitleOpts		PreProc
hi  link    fvwmModConfButtonSwallow		Normal
hi  link    fvwmModConfButtonSwallowOpts	PreProc
hi  link    fvwmModConfButtonPanel		Normal
hi  link    fvwmModConfButtonPanelOpts		PreProc
hi  link    fvwmModConfButtonAction		Normal
hi  link    fvwmModConfButtonActionOpts		PreProc
hi  link    fvwmModConfFvwmFormSelection	Constant
hi  link    fvwmModConfFvwmFormSelectionType	Type
hi  link    fvwmModConfFvwmIconManActionKey	Constant
hi  link    fvwmModConfFvwmIconManActionMod	PreProc
hi  link    fvwmModConfFvwmIconManActionKeyword	Statement
hi  link    fvwmModConfFvwmIconManShow		Constant


" CheckPreferences {{{1
syn keyword fvwmCPrefs		CheckPreferences nextgroup=fvwmCPrefs1 skipwhite
syn match   fvwmCPrefs1	/\S\+/ contained nextgroup=fvwmCPrefs2 skipwhite
syn region  fvwmCPrefs2	start=/\s\"/ end=/\"/ contained contains=fvwmCPrefs3
syn region  fvwmCPrefs3	start=/\'/ end=/\'/ contained

hi  link    fvwmCPrefs		Statement
hi  link    fvwmCPrefs1		Constant
hi  link    fvwmCPrefs2		Identifier
hi  link    fvwmCPrefs3		Type


" Syntax options {{{1
let b:current_syntax = "fvwm"
" vim: sts=4 sw=4 ts=8
