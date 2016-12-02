;Chord.ahk by Paul Pliska (ManaUser) - Version 2.0
MakeChord(Note1, Note2, Result, Delay = 0, Context = "")
{
   Local NewChord
   If Context
      HotKey IfWinActive, %Context%
   If Note1 In Ctrl,Alt,Shift
   {
      MakeChord("L" Note1, Note2, Result)
      MakeChord("R" Note1, Note2, Result)
      If Context
         HotKey IfWinActive
      Return
   }
   If Note2 In Ctrl,Alt,Shift
   {
      MakeChord(Note1, "L" Note2, Result)
      MakeChord(Note1, "R" Note2, Result)
      If Context
         HotKey IfWinActive
      Return
   }
   KeyWait % StripMods(Note1)
   KeyWait % StripMods(Note2)
   HotKey *$%Note1%, NoteDown
   HotKey *$%Note2%, NoteDown
   HotKey *$%Note1% Up, NoteUp
   HotKey *$%Note2% Up, NoteUp
   If Context
      HotKey IfWinActive
   NewChord := GetChordName(EscapeNote(Note1), EscapeNote(Note2))
   If NOT InStr(ChordList, NewChord)
   {
      If (ChordList != "")
         ChordList .= "|"
      ChordList .= NewChord
   }
   If NOT RegExMatch(Result, "^[a-zA-Z]\|")
   {
      If IsLabel(Result)
         Result := "L|" Result
      Else If (GetKeyState(Result) != "")
         Result := "K|" Result
      Else
         Result := "S|" Result
   }
   If (ConText = "")
      %NewChord% := Result
   else
   {
      Loop
      {
         Existing := %NewChord%_%A_Index%_Context
         If (Existing = "" OR Existing = Context)
         {
            %NewChord%_%A_Index%_Context := Context
            %NewChord%_%A_Index% := Result
            Break
         }
      }
   }
   If (Delay > 0)
      SetKeyDelay(Delay, Note1 " " Note2)
   If (DefaultKeyDelay = "")
      DefaultKeyDelay := 50
}

SetKeyDelay(Delay, Keys = "")
{
   Global
   If (Keys = "")
      DefaultKeyDelay := Delay
   Loop Parse, Keys, %A_Space%
   {
      Escaped := EscapeNote(A_LoopField)
      %Escaped%_Delay := Delay
   }
}

NoteDown:
   Critical
   ThisKey := GetThisKey()
   if (ThisKey = "$LButton" or ThisKey = "$RButton")
       MouseGetPos, init_x, init_y
   If ChordUsingNote(ThisKey)
      Return
   If (LastNote != "")
   {
      ChordName := GetChordName(LastNote, ThisKey)
      If (NoCreate(ChordName) OR NoCreate(ChordName "_1"))
      {
         Loop
         {
            ThisContext := %ChordName%_%A_Index%_Context
            If (ThisContext = "")
            {
               ThisContextNum = x
               MatchingChord := %ChordName%
               Break
            }
            If WinActive(ThisContext)
            {
               ThisContextNum := A_Index
               MatchingChord := %ChordName%_%A_Index%
               Break
            }
         }
         RegExMatch(MatchingChord, "^([a-zA-Z])\|(.*)$", ChordPart)
         If (ChordPart1 = "L")
            SetTimer %ChordPart2%, -1
         If (ChordPart1 = "S")
            Send %ChordPart2%
         If (ChordPart1 = "K")
            Send % "{blind}{" Ctrl2AltFix(ChordName, ChordPart2) " DownTemp}"
         %ChordName%_Down := ThisContextNum
         SetTimer PressIt, Off
         LastNote =

         Return
      }
      GoSub PressIt
   }
   LastNote := ThisKey
   If (NoCreate(ThisKey "_Delay"))
      SetTimer PressIt, % %ThisKey%_Delay
   else
      SetTimer PressIt, % DefaultKeyDelay
Return

NoteUp:
   Critical
   ThisKey := GetThisKey()
   ChordName := ChordUsingNote(ThisKey)
   If ChordName
   {
      ThisContext := %ChordName%_Down
      If (ThisContext)
      {
         If (ThisContext = "x")
            MatchingChord := %ChordName%
         Else
            MatchingChord := %ChordName%_%ThisContext%

         If (ChordPart1 = "L" AND IsLabel(ChordPart2 "_Up"))
            SetTimer %ChordPart2%_Up, -1
         If (ChordPart1 = "K")
            Send % "{blind}{" ChordPart2 " Up}"
         %ChordName%_Down =
      }
   } 
   If (LastNote != "")
      GoSub PressIt
   If GetKeyState(UnescapeNote(ThisKey, 1))
      Send % "{blind}{" UnescapeNote(ThisKey, 1) " Up}"
Return

PressIt:
   Critical
   if (LastNote = "$LButton" or LastNote = "$RButton")
       MouseMove, init_x, init_y, 0
   Send % "{blind}{" UnescapeNote(LastNote, 1) " Down}"
   SetTimer PressIt, Off
   LastNote =
Return

GetThisKey()
{
   Return EscapeNote(RegExReplace(A_ThisHotkey, "i)[~*$]*(\S+)( Up)?", "$1"))
}

GetChordName(Note1, Note2)
{
   If (Note2 < Note1)
      Return Note2 "_" Note1
   Else
      Return Note1 "_" Note2
}

StripMods(Note)
{
   Return RegExReplace(Note, "^[+^!#]*")
}

EscapeNote(Note)
{
   Scaw = +^!#scaw
   Symbols = !EX@AT#NM$DS`%PC^CT&ND*AS(OP)CP``BT~TL_US+PL-MN=EQ|VB\BK/FW?QM[OS]CS{OC}CC:CN;SC"DQ'SQ,CM.PD<LT>GT
   ModKeys := RegExReplace(Note, "(([#^!+])(?=.)|.+$)", "$2")
   MainKey := SubStr(Note, StrLen(ModKeys) + 1)
   Loop 4
      If InStr(ModKeys, SubStr(Scaw, A_Index, 1))
         Escaped .= SubStr(Scaw, A_Index + 4, 1)
   Match := InStr(Symbols, MainKey, 1)
   If Mod(Match, 3) = 1
      MainKey := SubStr(Symbols, Match + 1, 2)
   Escaped .= "$" MainKey
   Return Escaped
}

UnescapeNote(Note, StripMods = 0)
{
   Scaw = +^!#scaw
   Symbols = !EX@AT#NM$DS`%PC^CT&ND*AS(OP)CP``BT~TL_US+PL-MN=EQ|VB\BK/FW?QM[OS]CS{OC}CC:CN;SC"DQ'SQ,CM.PD<LT>GT
   StringSplit Keys, Note, $
   Match := InStr(Symbols, Keys2, 1)
   If Mod(Match, 3) = 2
      Keys2 := SubStr(Symbols, Match - 1, 1)
   If NOT StripMods
   {
      Loop 4
         If InStr(Keys1, SubStr(Scaw, A_Index + 4, 1))
            Unescaped .= SubStr(Scaw, A_Index, 1)
   }
   Unescaped .= Keys2
   Return Unescaped
}

ChordUsingNote(Note)
{
   Global
   Loop Parse, ChordList, |
   {
      If SubStr("_" A_LoopField "_", "_" Note "_") AND %A_LoopField%_Down
         Return A_LoopField
   }
   Return ""
}

Ctrl2AltFix(Chord, Key)
{
   Local Fix
   Fix =
   If SubStr(Key, "Alt")
   {
      If InStr(Chord, "LCtrl")
         Fix .= "LCtrl Up}{"
      If InStr(Chord, "RCtrl")
         Fix .= "RCtrl Up}{"
   }
   Fix .= Key
   Return Fix
}

NoCreate(TestVar)
{
   Global
   If %TestVar% =
      Return ""
   Else
      Return (%TestVar%)
}