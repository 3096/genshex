@echo off

rem Request admin privileges if not already elevated.
net session >nul 2>&1
if %errorlevel% neq 0 (
	echo Requesting administrative privileges...
	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath 'cmd.exe' -ArgumentList '/c """%~f0"" %*' -Verb RunAs"
	exit /b 1
)

rem Parse optional skip args.
set "SKIP_XXMI=0"
set "SKIP_AHK=0"
set "SKIP_MAP=0"
set "SKIP_CHECKIN=0"
set "SKIP_FPS_UNLOCK=0"
:parse_args
if "%~1"=="" goto args_done
if /I "%~1"=="--skip-xxmi" set "SKIP_XXMI=1" & shift & goto parse_args
if /I "%~1"=="--skip-ahk" set "SKIP_AHK=1" & shift & goto parse_args
if /I "%~1"=="--skip-map" set "SKIP_MAP=1" & shift & goto parse_args
if /I "%~1"=="--skip-checkin" set "SKIP_CHECKIN=1" & shift & goto parse_args
if /I "%~1"=="--skip-signin" set "SKIP_CHECKIN=1" & shift & goto parse_args
if /I "%~1"=="--skip-fps-unlock" set "SKIP_FPS_UNLOCK=1" & shift & goto parse_args
if /I "%~1"=="--skip-browser" set "SKIP_MAP=1" & set "SKIP_CHECKIN=1" & shift & goto parse_args
if /I "%~1"=="--skip-all" set "SKIP_XXMI=1" & set "SKIP_AHK=1" & set "SKIP_MAP=1" & set "SKIP_CHECKIN=1" & set "SKIP_FPS_UNLOCK=1" & shift & goto parse_args
shift
goto parse_args
:args_done

rem Load .env variables (format: NAME=VALUE). Lines starting with # or empty ignored.
set "ENV_FILE=%~dp0.env"
if exist "%ENV_FILE%" (
	for /f "usebackq eol=# tokens=1* delims==" %%A in ("%ENV_FILE%") do (
		set "%%A=%%B"
		echo Loaded %%A=%%B
	)
)

rem Example: append PATH_ADDITION to PATH if present
if defined PATH_ADDITION set "PATH=%PATH%;%PATH_ADDITION%"

rem Save the script directory for later use (reliable even after elevation/relaunch).
for %%I in ("%~dp0.") do set "ORIGINAL_DIR=%%~fI"

rem Run startup upgrades early in the launch flow.
if exist "%ORIGINAL_DIR%\py\startup.py" (
	echo Running %ORIGINAL_DIR%\py\startup.py
	where py >nul 2>&1
	if %errorlevel% equ 0 (
		py -3 "%ORIGINAL_DIR%\py\startup.py"
	) else (
		python "%ORIGINAL_DIR%\py\startup.py"
	)
) else (
	echo Skipping: %ORIGINAL_DIR%\py\startup.py not found
)

rem Change working directory to WORKING_DIR from env, if provided.
if defined WORKING_DIR (
	cd /d "%WORKING_DIR%"
	for %%I in (.) do echo Changed directory to %%~fI
) else (
	echo WORKING_DIR is not set. Staying in %CD%
)

rem Launch XXMI in no-GUI mode if configured.

if "%SKIP_XXMI%"=="1" goto skip_xxmi
if not defined XXMI_DIR (
	echo Skipping: XXMI_DIR is not set
	goto skip_xxmi
)
set "XXMI_BIN_DIR=%XXMI_DIR%\Resources\Bin"
set "XXMI_EXE=%XXMI_BIN_DIR%\XXMI Launcher.exe"
if not exist "%XXMI_EXE%" (
	echo Skipping: XXMI launcher not found at %XXMI_EXE%
	goto skip_xxmi
)
set "XXMI_IMPORTER=XXMI"
if defined XXMI_LOADER set "XXMI_IMPORTER=%XXMI_LOADER%"
echo Starting XXMI (no GUI): "%XXMI_EXE%" --nogui --xxmi %XXMI_IMPORTER%
pushd "%XXMI_BIN_DIR%"
start "" "XXMI Launcher.exe" --nogui --xxmi %XXMI_IMPORTER%
popd
:skip_xxmi

rem Launch AutoHotkey script from the original directory if present.
if "%SKIP_AHK%"=="1" (
	echo Skipping AHK launch due to --skip-ahk/--skip-all
) else if exist "%ORIGINAL_DIR%\ahk\g.ahk" (
	echo Starting %ORIGINAL_DIR%\ahk\g.ahk
	if defined NETWORK_ADAPTER_NAME (
		start "" "%ORIGINAL_DIR%\ahk\g.ahk" "%NETWORK_ADAPTER_NAME%"
	) else (
		start "" "%ORIGINAL_DIR%\ahk\g.ahk"
	)
) else (
	echo Skipping: %ORIGINAL_DIR%\ahk\g.ahk not found
)

rem Open helpful pages in the default browser.
if "%SKIP_MAP%"=="1" (
	echo Skipping map page due to --skip-map/--skip-browser/--skip-all
) else (
	start "" "https://act.hoyolab.com/ys/app/interactive-map/index.html?bbs_presentation_style=no_header&utm_id=2&utm_medium=tool&utm_source=hoyolab&bbs_theme=dark&bbs_theme_device=1#/map/2"
)

if "%SKIP_CHECKIN%"=="1" (
	echo Skipping check-in page due to --skip-checkin/--skip-browser/--skip-all
) else (
	start "" "https://act.hoyolab.com/ys/event/signin-sea-v3/index.html?act_id=e202102251931481&hyl_auth_required=true&hyl_presentation_style=fullscreen&utm_source=hoyolab&utm_medium=tools&bbs_theme=dark&bbs_theme_device=1"
)

rem Launch game executable. By default, prefer fps-unlock launcher unless skipped.
set "FPS_LAUNCH_EXE=%GENSHIN_INSTALL_EXE%"
if not defined FPS_LAUNCH_EXE set "FPS_LAUNCH_EXE=%UNLOCK_FPS_EXE%"

if "%SKIP_FPS_UNLOCK%"=="0" (
	if defined FPS_LAUNCH_EXE (
		if exist "%FPS_LAUNCH_EXE%" (
			echo Starting unlock launcher: %FPS_LAUNCH_EXE%
			start "" "%FPS_LAUNCH_EXE%"
		) else (
			echo Unlock launcher not found at %FPS_LAUNCH_EXE%. Falling back to GENSHIN_EXE.
			if defined GENSHIN_EXE if exist "%GENSHIN_EXE%" start "" "%GENSHIN_EXE%"
		)
	) else (
		echo GENSHIN_INSTALL_EXE/UNLOCK_FPS_EXE is not set. Falling back to GENSHIN_EXE.
		if defined GENSHIN_EXE if exist "%GENSHIN_EXE%" start "" "%GENSHIN_EXE%"
	)
) else (
	echo Skipping fps unlock due to --skip-fps-unlock/--skip-all
	if defined GENSHIN_EXE (
		if exist "%GENSHIN_EXE%" (
			echo Starting Genshin: %GENSHIN_EXE%
			start "" "%GENSHIN_EXE%"
		) else (
			echo GENSHIN_EXE not found at %GENSHIN_EXE%
		)
	) else (
		echo GENSHIN_EXE is not set
	)
)

pause
