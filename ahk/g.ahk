#Warn
#SingleInstance Force
WINDOW_SELECTOR := "ahk_class UnityWndClass"
#HotIf WinActive(WINDOW_SELECTOR)
HotIfWinActive(WINDOW_SELECTOR)
SendMode("Input")
CoordMode("Pixel", "Client")

; DllCall("CascadeWindows", "uInt", 0, "Int", 4, "Int", 0, "Int", 0, "Int", 0)
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

HP_BAR_COLOR := 0xFF5A5A

TOP_0_KEY := "vk30"
TOP_1_KEY := "vk31"
TOP_2_KEY := "vk32"
TOP_3_KEY := "vk33"
TOP_4_KEY := "vk34"
TOP_5_KEY := "vk35"
TOP_6_KEY := "vk36"
TOP_7_KEY := "vk37"
TOP_8_KEY := "vk38"
TOP_9_KEY := "vk39"

SKILL_KEY := "vk45"
BURST_KEY := "vk51"
INTERACT_KEY := "vk46"
AIM_KEY := "vk52"
GO_FORWARD_KEY := "vk57"
GO_BACKWARD_KEY := "vk53"
GO_LEFT_KEY := "vk41"
GO_RIGHT_KEY := "vk44"
TEAM_SELECT_KEY := "vk4C"

; spam click
SPAM_CLICK_KEY := "F4"

; spam space
SPAM_SPACE_KEY := "F3"

; scroll down and spam F toggle
AUTO_INTERACT_TOGGLE_KEY := "XButton2"

; elemental vison toggle
ELEMENTAL_VISION_TOGGLE_KEY := "F15"

; middle click
ENTER_MODE_KEY := "MButton"
CHANGE_MODE_KEY := "^d"
MODE_FUNCS := [ChargeAttack, Wanderer, Nutvillette, Ficshl, Yoi, Cow]
curMode := 6

; charge attack
CHARGE_ATTACK_HOLD_DURATION := 350
CHARGE_ATTACK_RELEASE_DURATION := 10

; wanderer C spam
WANDERER_HOLD_DURATION := 300  ; it's wanderin time
WANDERER_RELEASE_DURATION := 55  ; haha, get it? timings for wanderer...? ba dum tss
WANDERER_SKILL_ANIM_DURATION := 460

; nutvellet
NUTVILLETTE_SPIN_SPEED := 1000

; timed screenshot
; SCREENSHOT_KEY := "!#{PrintScreen}"
SCREENSHOT_KEY := "^+p"
TIMED_SCREENSHOT_KEY := "F9"
DIALOGUE_KEY := "F14"
TIMED_SCREENSHOT_SEARCH_W := 1348 / 1440
TIMED_SCREENSHOT_SEARCH_H := 200 / 1440
TIMED_SCREENSHOT_SEARCH_VPOS := 111 / 144
TIMED_SCREENSHOT_SEARCH_COLOR := 0xffc300
; HIDE_HUD_X := 1178 / 6880
; HIDE_HUD_Y := 121 / 2880
; DIALOGUE_X := 4715 / 6880
; DIALOGUE_Y := 2070 / 2880
HIDE_HUD_X := 895 / 7680
HIDE_HUD_Y := 113 / 2160
DIALOGUE_X := 4715 / 7680
DIALOGUE_Y := 2070 / 2880

SIMPLE_SCREENSHOT_KEY := "F12"

; lag switch
LAG_SWITCH_KEY := "^."
NETWORK_ADAPTER_NAME := A_Args.Length ? A_Args[1] : "Ethernet"

; clicker
CLICKER_KEY := "^f"
CLICKER_X_POS := 3109.0 / 5120.0 ; relative x in 5120x1440 space
CLICKER_Y_POS := 676.0 / 1440.0 ; relative y in 5120x1440 space

; hit F10
HIT_F10_KEY := "^r"

; team switch
TEAM_SWITCH_KEY := "F11"

; blood mark search and skill trigger
BLOOD_MARK_SEARCH_KEY := "^h"
BLOOD_MARK_COLOR := 0xFDEEE2  ; dark red color (adjust as needed)
BLOOD_MARK_COLOR_VARIANCE := 0
BLOOD_MARK_SEARCH_Y := 360 / 1440
BLOOD_MARK_SEARCH_H := 270 / 1440
BLOOD_MARK_SEARCH_W := 128 / 1440
BLOOD_MARK_SHIELD_COLOR := 0xFFFFFF
BLOOD_MARK_SHIELD_COLOR_VARIANCE := 0
BLOOD_MARK_SHIELD_SEARCH_Y := 100 / 1440
BLOOD_MARK_SHIELD_SEARCH_H := 50 / 1440
BLOOD_MARK_SHIELD_SEARCH_W := 128 / 1440

; auto fish
AUTO_FISH_KEY := "^g"
AUTO_FISH_CAUGHT_TIMEOUT := 10
; AUTO_FISH_SEARCH           - search the region for the caret X coord
; AUTO_FISH_REEL_EARLY       - a white pixel on the pull rod icon (lower right, when no bite)
; AUTO_FISH_TARGET_GLOW      - the target zone yellow glow
; AUTO_FISH_CARET_GLOW       - the caret (the pointer that moves left and right) yellow glow
; AUTO_FISH_CARET_WIDTH      - the width of caret (extended part at top and bottom)
; AUTO_FISH_BAR_TARGET_DROP  - pixel distance from caret glow to target zone glow
AUTO_FISH_SEARCH_CONFIRMATION_THRESHOLD := 5  ; how many times to "double check" searched bar position
AUTO_FISH_TARGET_GLOW_COLOR := 0xFFFFC0
AUTO_FISH_CARET_GLOW_COLOR := 0xFFFFBE
AUTO_FISH_GLOW_COLOR_VARIANCE := 3  ; this value should ideally be 0, but just in case
AUTO_FISH_REEL_EARLY_VARIANCE := 64  ; decrease if you're not reeling, increase if you're reeling too early
; resolution configs
; 3840x2160
AUTO_FISH_RESOLUTION_W := 3840
AUTO_FISH_RESOLUTION_H := 2160
AUTO_FISH_SEARCH_LEFT_X := 1430
AUTO_FISH_SEARCH_TOP_Y := 146
AUTO_FISH_SEARCH_BOTTOM_Y := 350
AUTO_FISH_REEL_EARLY_X := 3246
AUTO_FISH_REAL_EARLY_Y := 2000
AUTO_FISH_CARET_WIDTH := 22
AUTO_FISH_BAR_TARGET_DROP := 8
; 3440x1440
AUTO_FISH_RESOLUTION_W := 3440
AUTO_FISH_RESOLUTION_H := 1440
AUTO_FISH_SEARCH_LEFT_X := 1395
AUTO_FISH_SEARCH_TOP_Y := 98
AUTO_FISH_SEARCH_BOTTOM_Y := 234
AUTO_FISH_REEL_EARLY_X := 2948
AUTO_FISH_REAL_EARLY_Y := 1334
AUTO_FISH_CARET_WIDTH := 14
AUTO_FISH_BAR_TARGET_DROP := 6
; 1920x1080
; AUTO_FISH_RESOLUTION_W := 1920
; AUTO_FISH_RESOLUTION_H := 1080
; AUTO_FISH_SEARCH_LEFT_X := 715
; AUTO_FISH_SEARCH_TOP_Y := 73
; AUTO_FISH_SEARCH_BOTTOM_Y := 175
; AUTO_FISH_REEL_EARLY_X := 1623
; AUTO_FISH_REAL_EARLY_Y := 1000
; AUTO_FISH_CARET_WIDTH := 11
; AUTO_FISH_BAR_TARGET_DROP := 4

; life death
LIFE_DEATH_KEY := "^y"
LIFE_DEATH_IS_HOST := 1

; ice fish
ICE_FISH_KEY := "^j"

; ugc

ClickUgcSavedLevel() {
    WinGetPos(, , &win_w, &win_h, "A")
    x := win_w * 80 / 1280
    y := win_h * 654 / 720
    Click(x, y)
}

ClickUgcSavedLevelFirst() {
    WinGetPos(, , &win_w, &win_h, "A")
    x := win_w * 266 / 1280
    y := win_h * 556 / 720
    Click(x, y)
}

ClickUgcStartLevel() {
    WinGetPos(, , &win_w, &win_h, "A")
    x := win_w * 1007 / 1280
    y := win_h * 586 / 720
    Click(x, y)
}

ClickUgcAcceptLevel() {
    WinGetPos(, , &win_w, &win_h, "A")
    x := win_w * 900 / 1280
    y := win_h * 590 / 720
    Click(x, y)
}

ClickUgcReturnToLobby() {
    WinGetPos(, , &win_w, &win_h, "A")
    x := win_w * 1147 / 1280
    y := win_h * 680 / 720
    Click(x, y)
}

IsInLoadingScreen() {
    WinGetPos(, , &win_w, &win_h, "A")
    return PixelSearch(&foundX, &foundY, win_w // 4, win_h // 2, win_w // 4 + 1, win_h // 2 + 1, 0xFFFFFF, 1)
}

SpamClick(ThisHotkey) {
    while (GetKeyState(SPAM_CLICK_KEY, "P")) {
        Click
        Sleep(50)
    }
    return
}
Hotkey(SPAM_CLICK_KEY, SpamClick)

SpamSpace(ThisHotkey) {
    while (GetKeyState(SPAM_SPACE_KEY, "P")) {
        Send(" ")
        Sleep(50)
    }
    return
}
Hotkey(SPAM_SPACE_KEY, SpamSpace)

AutoInteract(ThisHotkey) {
    while (GetKeyState(AUTO_INTERACT_TOGGLE_KEY, "P")) {
        Sleep(5)
    }

    loop {
        Send("{" INTERACT_KEY "}")
        Sleep(2)
        Click("WheelDown")
        Sleep(2)

        if (GetKeyState(AUTO_INTERACT_TOGGLE_KEY, "P")) {
            break
        }
    }
    return
}
Hotkey(AUTO_INTERACT_TOGGLE_KEY, AutoInteract)

ELEMENTAL_VISION_HOLD_DURATION := 3300
ELEMENTAL_VISION_RELEASE_DURATION := 50

ElementalVesionToggle(ThisHotkey) {
    global ELEMENTAL_VISION_STATE_HELD := 0
    global ELEMENTAL_VISION_STATE_RELEASE := 1

    while (GetKeyState(ELEMENTAL_VISION_TOGGLE_KEY, "P")) {
        Sleep(5)
    }

    Send("{MButton down}")
    curState := ELEMENTAL_VISION_STATE_HELD
    curTick := A_TickCount

    loop {
        if (GetKeyState(ELEMENTAL_VISION_TOGGLE_KEY, "P")) {
            break
        }

        deltaTick := A_TickCount - curTick

        if (curState == ELEMENTAL_VISION_STATE_HELD) {
            if (deltaTick > ELEMENTAL_VISION_HOLD_DURATION) {
                Send("{MButton up}")
                curState := ELEMENTAL_VISION_STATE_RELEASE
                curTick := A_TickCount
            }

        } else {
            if (deltaTick > ELEMENTAL_VISION_RELEASE_DURATION) {
                Send("{MButton down}")
                curState := ELEMENTAL_VISION_STATE_HELD
                curTick := A_TickCount
            }
        }

        Sleep(5)
    }

    Send("{MButton up}")
    return
}
; Hotkey(ELEMENTAL_VISION_TOGGLE_KEY, ElementalVesionToggle)

ChangeMode(ThisHotkey) {
    global curMode += 1
    if (curMode > MODE_FUNCS.Length) {
        curMode := 1
    }
}
Hotkey(CHANGE_MODE_KEY, ChangeMode)

EnterMode(ThisHotkey) {
    MODE_FUNCS[curMode].Call()
}
Hotkey(ENTER_MODE_KEY, EnterMode)

Wanderer() {
    Send("{" SKILL_KEY "}")
    Sleep(WANDERER_SKILL_ANIM_DURATION)
    loop 30 {
        Send("{Click down}")
        Sleep(WANDERER_HOLD_DURATION)
        Send("{Click up}")

        if (GetKeyState(ENTER_MODE_KEY, "P")) {
            break
        }

        Sleep(WANDERER_RELEASE_DURATION)
    }
    return
}

ChargeAttack() {
    loop {
        Send("{Click down}")
        Sleep(CHARGE_ATTACK_HOLD_DURATION)
        Send("{Click up}")

        if (!GetKeyState(ENTER_MODE_KEY, "P")) {
            break
        }

        Sleep(CHARGE_ATTACK_RELEASE_DURATION)
    }
}

NUTVILLETTE_SPIN_STRUCT_SIZE := 0x28
MOUSE_INPUT := Buffer(NUTVILLETTE_SPIN_STRUCT_SIZE, 0)
NumPut("Int", NUTVILLETTE_SPIN_SPEED, MOUSE_INPUT, 8)
NumPut("UInt", 1, MOUSE_INPUT, 0x14)

Nutvillette() {
    global MOUSE_INPUT
    Click("Down")
    loop {
        DllCall("SendInput", "UInt", 1, "Ptr", MOUSE_INPUT, "Int", NUTVILLETTE_SPIN_STRUCT_SIZE)
        if (!GetKeyState(ENTER_MODE_KEY, "P")) {
            Click("Up")
            break
        }

        Sleep(5)
    }
}

Ficshl() {
    loop {
        Click
        Sleep(50)
        ; if (!GetKeyState(ENTER_MODE_KEY, "P")) {
        ;     Break
        ; }

        Send("{" AIM_KEY "}")
        Sleep(70)
        Send("{" AIM_KEY "}")
        Sleep(30)
        if (!GetKeyState(ENTER_MODE_KEY, "P")) {
            break
        }
    }
}

Yoi() {
    loop {
        Send("{" AIM_KEY " down}")
        Sleep(50)
        Click("Down")
        Sleep(50)
        Click("Up")
        Sleep(50)
        Send("{" AIM_KEY " up}")
        Sleep(120)
        Send("{" AIM_KEY " down}")
        loop 30 {
            Sleep(1)
            Click
        }
        Send("{" AIM_KEY " up}")
        if (!GetKeyState(ENTER_MODE_KEY, "P")) {
            break
        }
        Sleep(50)
    }
}

Cow() {
    while (GetKeyState(ENTER_MODE_KEY, "P")) {
        Sleep(5)
    }
    loop {
        Click
        Sleep(5)
        Send("{" SKILL_KEY "}")
        Sleep(5)
        Send("{" BURST_KEY "}")
        Sleep(5)
        if (GetKeyState(ENTER_MODE_KEY, "P")) {
            break
        }
    }
}

TimedScreenShot(ThisHotkey) {
    global SCREENSHOT_KEY, HIDE_HUD_X, HIDE_HUD_Y
    ; global TIMED_SCREENSHOT_SEARCH_W, TIMED_SCREENSHOT_SEARCH_H, TIMED_SCREENSHOT_SEARCH_VPOS
    WinGetPos(, , &win_w, &win_h, "A")
    searchX := (win_w - win_h * TIMED_SCREENSHOT_SEARCH_W) / 2
    searchY := win_h * TIMED_SCREENSHOT_SEARCH_VPOS
    searchW := win_h * TIMED_SCREENSHOT_SEARCH_W
    searchH := win_h * TIMED_SCREENSHOT_SEARCH_H
    ; Send("{Space}")
    ; Click
    ; Sleep(200)
    ; if PixelSearch(&foundX, &foundY, searchX, searchY, searchX + searchW, searchY + searchH, TIMED_SCREENSHOT_SEARCH_COLOR) {
    ;     Return
    ; }

    Click(HIDE_HUD_X * win_w, HIDE_HUD_Y * win_h)
    ; MsgBox("searchX: " searchX ", searchY: " searchY ", searchW: " searchW ", searchH: " searchH)
    while (PixelSearch(&foundX, &foundY, searchX, searchY, searchX + searchW, searchY + searchH,
        TIMED_SCREENSHOT_SEARCH_COLOR, 3)) {
        Sleep(5)
    }
    Send(SCREENSHOT_KEY)
    Sleep(25)
    Click(win_w * 0.8, win_h * 0.8)
    ; MouseMove(0.8 * win_w, 0.8 * win_h)
    while (GetKeyState(ThisHotkey, "P")) {
        Sleep(5)
    }
    return
}
Hotkey(TIMED_SCREENSHOT_KEY, TimedScreenShot)

SimpleScreenshot(ThisHotkey) {
    global SCREENSHOT_KEY
    Send(SCREENSHOT_KEY)
    while (GetKeyState(ThisHotkey, "P")) {
        Sleep(5)
    }
    return
}
Hotkey(SIMPLE_SCREENSHOT_KEY, SimpleScreenshot)

LagSwitch(ThisHotkey) {
    global NETWORK_ADAPTER_NAME
    RunWait("netsh interface set interface `"" NETWORK_ADAPTER_NAME "`" disable", , "Hide")
    Sleep(26000)
    RunWait("netsh interface set interface `"" NETWORK_ADAPTER_NAME "`" enable", , "Hide")
    return
}
Hotkey(LAG_SWITCH_KEY, LagSwitch)

Clicker(ThisHotkey) {
    global CLICKER_X_POS, CLICKER_Y_POS

    hWnd := WinExist("A")
    rect := Buffer(16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", rect)
    clientW := NumGet(rect, 8, "int")
    clientH := NumGet(rect, 12, "int")

    clickerX := Round(CLICKER_X_POS * clientW)
    clickerY := Round(CLICKER_Y_POS * clientH)

    loop {
        if (GetKeyState("RButton", "P")) {
            ; MsgBox("Cliiiicker stopped")
            break
        }

        if (GetKeyState("LButton", "P")) {
            while (GetKeyState("LButton", "P")) {
                Sleep(5)
            }
            Sleep(50)
            ; MsgBox("Clicker stopped")
            MouseGetPos(&x, &y)
            Click(clickerX, clickerY)
            Sleep(50)
            MouseMove(x, y)
            Sleep(100)
            Click
        }

        ; s := GetKeyState("RButton", "P")
        ; Tooltip(s)

        Sleep(5)
    }
}
Hotkey(CLICKER_KEY, Clicker)

TeamSwitch(ThisHotkey) {
    global TEAM_SWITCH_KEY
    Send("{" TEAM_SELECT_KEY "}")
    Sleep(2100)
    return
}
Hotkey(TEAM_SWITCH_KEY, TeamSwitch)

AutoFish(ThisHotkey) {
    ; get game resolution
    hWnd := WinExist("A")
    rect := Buffer(16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", rect)
    clientW := NumGet(rect, 8, "int")
    clientH := NumGet(rect, 12, "int")

    if (clientW != AUTO_FISH_RESOLUTION_W or clientH != AUTO_FISH_RESOLUTION_H) {
        MsgBox("Current resolution is not configured.")
        return
    }

    searchRightX := clientW - AUTO_FISH_SEARCH_LEFT_X
    caretPad := AUTO_FISH_CARET_WIDTH / 2
    caretUpperY := -1
    caretLowerY := -1
    barTargetUpperY := -1
    barTargetLowerY := -1

    ; check for pull-rod icon to detect bite
    reelEarlyColor := PixelGetColor(AUTO_FISH_REEL_EARLY_X, AUTO_FISH_REAL_EARLY_Y,) ;V1toV2: Switched from BGR to RGB values
    recastKey := SubStr(AUTO_FISH_KEY, -1 * (1))
    loop {
        ErrorLevel := !PixelSearch(&Px, &Py, AUTO_FISH_REEL_EARLY_X, AUTO_FISH_REAL_EARLY_Y, AUTO_FISH_REEL_EARLY_X,
            AUTO_FISH_REAL_EARLY_Y, reelEarlyColor, AUTO_FISH_REEL_EARLY_VARIANCE) ;V1toV2: Switched from BGR to RGB values
        if (ErrorLevel == 1) {
            break
        }
        if (GetKeyState("Space", "P") or GetKeyState("LButton", "P")) {
            return
        }
        Sleep(16)
    }
    Click()

    ; search for bar location (yes, this sometimes moves around for some reason)
    ; thanks, syn! <3
    lastFoundY := -1
    lastFoundSameCount := 0
    loop {
        ErrorLevel := !PixelSearch(&Px, &Py, AUTO_FISH_SEARCH_LEFT_X, AUTO_FISH_SEARCH_TOP_Y, searchRightX,
            AUTO_FISH_SEARCH_BOTTOM_Y, AUTO_FISH_CARET_GLOW_COLOR, AUTO_FISH_GLOW_COLOR_VARIANCE) ;V1toV2: Switched from BGR to RGB values

        ; make sure the same pos is found multiple times to avoid reading from the starting animation
        if (!ErrorLevel) {
            if (Py == lastFoundY) {
                lastFoundSameCount := lastFoundSameCount + 1
            } else {
                lastFoundY := Py
                lastFoundSameCount := 0
            }
        }

        if (lastFoundSameCount > AUTO_FISH_SEARCH_CONFIRMATION_THRESHOLD) {
            caretUpperY := Py - AUTO_FISH_BAR_TARGET_DROP
            caretLowerY := Py + AUTO_FISH_BAR_TARGET_DROP / 4
            barTargetUpperY := Py + AUTO_FISH_BAR_TARGET_DROP
            barTargetLowerY := Py + AUTO_FISH_BAR_TARGET_DROP * 2
            break
        }
        lastFoundY := Py

        if (GetKeyState("Space", "P")) {
            return
        }

        ; if entered this loop by mistake and hangs, user might try to activate auto fish again
        if (GetKeyState(recastKey, "P")) {
            AutoFish(ThisHotkey)
            return
        }

        Sleep(20)
    }

    curTimeOutCycleCount := 0
    loop {
        ; check for exit
        if (GetKeyState("Space", "P") or curTimeOutCycleCount > AUTO_FISH_CAUGHT_TIMEOUT) {
            Send("{Click up}")
            return
        }

        ; search color for caret/target positions
        failedToFind := false

        ErrorLevel := !PixelSearch(&curCaretX, &Py, AUTO_FISH_SEARCH_LEFT_X, caretUpperY, searchRightX, caretLowerY,
            AUTO_FISH_CARET_GLOW_COLOR, AUTO_FISH_GLOW_COLOR_VARIANCE) ;V1toV2: Switched from BGR to RGB values
        failedToFind := ErrorLevel or failedToFind

        ErrorLevel := !PixelSearch(&curBarTargetXLeft, &Py, AUTO_FISH_SEARCH_LEFT_X, barTargetUpperY, searchRightX,
            barTargetLowerY, AUTO_FISH_TARGET_GLOW_COLOR, AUTO_FISH_GLOW_COLOR_VARIANCE) ;V1toV2: Switched from BGR to RGB values
        failedToFind := ErrorLevel or failedToFind

        ErrorLevel := !PixelSearch(&curBarTargetXRight, &Py, searchRightX, barTargetUpperY, AUTO_FISH_SEARCH_LEFT_X,
            barTargetLowerY, AUTO_FISH_TARGET_GLOW_COLOR, AUTO_FISH_GLOW_COLOR_VARIANCE) ;V1toV2: Switched from BGR to RGB values
        failedToFind := ErrorLevel or failedToFind

        if (failedToFind) {
            curTimeOutCycleCount := curTimeOutCycleCount + 1
            continue
        }

        curTimeOutCycleCount := 0

        ; hold or release based on searched coords
        if ((curBarTargetXLeft + curBarTargetXRight) / 2 > curCaretX + AUTO_FISH_CARET_WIDTH) {
            Send("{Click down}")
        } else {
            Send("{Click up}")
        }
    }
}
Hotkey(AUTO_FISH_KEY, AutoFish)

HitF10(ThisHotkey) {
    global HIT_F10_KEY
    Send("{F10}")
    MsgBox("F10 hit")
}
Hotkey(HIT_F10_KEY, HitF10)

ClickDialogue(ThisHotkey) {
    global DIALOGUE_X, DIALOGUE_Y
    WinGetPos(, , &win_w, &win_h, "A")
    Click(DIALOGUE_X * win_w, DIALOGUE_Y * win_h)
}
Hotkey(DIALOGUE_KEY, ClickDialogue)

YeetDong(ThisHotkey) {
    ; Get game window dimensions
    hWnd := WinExist("A")
    rect := Buffer(16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", rect)
    clientW := NumGet(rect, 8, "int")
    clientH := NumGet(rect, 12, "int")

    searchW := clientH * BLOOD_MARK_SEARCH_W
    searchH := clientH * BLOOD_MARK_SEARCH_H
    searchX := (clientW - searchW) / 2
    searchY := clientH * BLOOD_MARK_SEARCH_Y

    global BLOOD_MARK_COLOR, BLOOD_MARK_COLOR_VARIANCE, SKILL_KEY

    loop {
        ; Search for blood mark color across entire window
        if (PixelSearch(&foundX, &foundY, searchX, searchY, searchX + searchW, searchY + searchH, BLOOD_MARK_COLOR,
            BLOOD_MARK_COLOR_VARIANCE)) {
            ; Found blood mark, press skill key
            Sleep(12)
            Send("{" SKILL_KEY "}")
            ; MsgBox("searchX: " searchX ", searchY: " searchY ", searchW: " searchW ", searchH: " searchH)
            break
        }

        ; Check if hotkey is still pressed to exit
        if (GetKeyState("LButton", "P")) {
            ; MsgBox("bruh")
            break
        }
    }
}
; Hotkey(BLOOD_MARK_SEARCH_KEY, YeetDong)

TryYeetDong(ThisHotkey) {
    ; Get game window dimensions
    hWnd := WinExist("A")
    rect := Buffer(16)
    DllCall("GetClientRect", "ptr", hWnd, "ptr", rect)
    clientW := NumGet(rect, 8, "int")
    clientH := NumGet(rect, 12, "int")

    searchW := clientH * BLOOD_MARK_SEARCH_W
    searchH := clientH * BLOOD_MARK_SEARCH_H
    searchX := (clientW - searchW) / 2
    searchY := clientH * BLOOD_MARK_SEARCH_Y

    shieldSearchW := clientH * BLOOD_MARK_SHIELD_SEARCH_W
    shieldSearchH := clientH * BLOOD_MARK_SHIELD_SEARCH_H
    shieldSearchX := (clientW - shieldSearchW) / 2
    shieldSearchY := clientH * BLOOD_MARK_SHIELD_SEARCH_Y

    global BLOOD_MARK_COLOR, BLOOD_MARK_COLOR_VARIANCE, SKILL_KEY

    loop {
        randSleep := Random(1, 40)
        timeStart := A_TickCount

        loop {
            ; Search for blood mark color across entire window
            if (PixelSearch(&foundX, &foundY, searchX, searchY, searchX + searchW, searchY + searchH, BLOOD_MARK_COLOR,
                BLOOD_MARK_COLOR_VARIANCE)) {
                ; Found blood mark, press skill key
                Sleep(randSleep)
                Send("{" SKILL_KEY "}")
                ; MsgBox("searchX: " searchX ", searchY: " searchY ", searchW: " searchW ", searchH: " searchH)

                timeStart := A_TickCount
                loop {
                    if (!PixelSearch(&foundX, &foundY, shieldSearchX, shieldSearchY, shieldSearchX + shieldSearchW,
                        shieldSearchY + shieldSearchH, BLOOD_MARK_SHIELD_COLOR, BLOOD_MARK_SHIELD_COLOR_VARIANCE)) {
                        ; log to file
                        FileAppend("HIT," . randSleep . "`n", "blood_mark_log.txt")
                        break
                    }

                    if (A_TickCount - timeStart > 4000) {
                        ; log to file
                        FileAppend("MISS," . randSleep . "`n", "blood_mark_log.txt")
                        break
                    }
                }
                break
            }

            ; if blood mark not found in 10 seconds, exit
            if (A_TickCount - timeStart > 10000) {
                break
            }
        }

        Send("{Escape}")
        Sleep(500)
        Click

        loop {
            if (PixelSearch(&foundX, &foundY, shieldSearchX, shieldSearchY, shieldSearchX + shieldSearchW,
                shieldSearchY + shieldSearchH, HP_BAR_COLOR, 0)) {
                ; FileAppend("found hp bar" "`n", "blood_mark_log.txt")
                break
            }
        }

        Sleep(300)
        Send("{" SKILL_KEY "}")
        Sleep(600)
        Send("{3}")
        Sleep(2000)
    }
}
; Hotkey(BLOOD_MARK_SEARCH_KEY, TryYeetDong)

SpamWASD(ThisHotkey) {
    loop {
        Send("{" GO_FORWARD_KEY "}")
        Sleep(1)
        Send("{" GO_BACKWARD_KEY "}")
        Sleep(1)
        Send("{" GO_LEFT_KEY "}")
        Sleep(1)
        Send("{" GO_RIGHT_KEY "}")
        Sleep(1)
        if (GetKeyState("LButton", "P")) {
            break
        }
    }
}
Hotkey(BLOOD_MARK_SEARCH_KEY, SpamWASD)

LIFE_DEATH_HP_BAR_COLOR := 0x8CC422
LifeDeathHpBarX() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_w * 130 / 1280
}
LifeDeathHpBarY() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_h * 200 / 720
}
LifeDeathHpBarX2() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_w * 311 / 1280
}
LifeDeathHpBarY2() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_h * 266 / 720
}
LifeDeathDontVoteX() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_w * 441 / 1280
}
LifeDeathDontVoteY() {
    WinGetPos(, , &win_w, &win_h, "A")
    return win_h * 670 / 720
}
LifeDeathIsInGame() {
    global LIFE_DEATH_HP_BAR_COLOR
    loop 10 {
        Sleep(100)
        if (PixelSearch(&foundX, &foundY, LifeDeathHpBarX(), LifeDeathHpBarY(), LifeDeathHpBarX2(), LifeDeathHpBarY2(),
        LIFE_DEATH_HP_BAR_COLOR, 5)) {
            return true
        }
    }
    return false
}
LifeDeath(ThisHotkey) {
    global LIFE_DEATH_KEY, LIFE_DEATH_IS_HOST
    loop {
        if (LIFE_DEATH_IS_HOST) {
            ; click to find the level
            Send("{F6}")
            Sleep(200)
            Send("{F6}")
            Sleep(1200)

            ClickUgcSavedLevel()
            Sleep(200)
            ClickUgcSavedLevel()
            Sleep(1200)

            ClickUgcSavedLevelFirst()
            Sleep(200)
            ClickUgcSavedLevelFirst()
            Sleep(1200)

            ClickUgcStartLevel()
            Sleep(200)
            ClickUgcStartLevel()
            Sleep(1200)

            loop {
                if (LifeDeathIsInGame()) {
                    break
                } else {
                    Click(LifeDeathDontVoteX(), LifeDeathDontVoteY())
                    Sleep(500)
                }
            }
        } else {
            loop {
                ClickUgcAcceptLevel()
                Sleep(500)
                Click(LifeDeathDontVoteX(), LifeDeathDontVoteY())
                ; check if game is loaded
                if (LifeDeathIsInGame()) {
                    break
                } else {
                    Sleep(500)
                }
            }
        }

        ; f to ready
        Sleep(100)
        Send("{" INTERACT_KEY "}")
        Sleep(100)

        ; main shoot loop
        loop {
            if (!LifeDeathIsInGame()) {
                break
            }
            Send("{" SKILL_KEY "}")
            Sleep(500)
            if (LIFE_DEATH_IS_HOST) {
                Send("{" TOP_1_KEY "}")
            } else {
                Send("{" TOP_2_KEY "}")
            }
        }

        ; return to lobby
        loop {
            ClickUgcReturnToLobby()
            if (IsInLoadingScreen()) {
                break
            } else {
                Sleep(500)
            }
        }

        Sleep(8000)
        if (GetKeyState("RButton", "P")) {
            break
        }
    }
}
Hotkey(LIFE_DEATH_KEY, LifeDeath)

IceFishing(ThisHotkey) {

}
