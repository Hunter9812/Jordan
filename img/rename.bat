 @echo off&setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /a-d /b') do (
	:next
	set "t=%%~ta"
	@echo %%~nxa    %%~ta 
	set "head=%%~nxa"
	set "head1=!head:~0,4!"
	if "!head1!" == "IMG_" (
		@echo jump filename = %%~nxa
		goto next
	)
	set "t=!t:~0,4!!t:~5,2!!t:~8,2!_!t:~11,2!!t:~14,2!"
	if not "%~n0"=="%%~na" if not exist "IMG_!t!_1%%~xa" (
		ren "%%~nxa" "IMG_!t!_1%%~xa"
	) else (
		call :rennum "%%~nxa"
	)
)
goto :eof
:rennum
set n=1
:loop
set "name=%~1"
set "ext=%~x1" 
if not exist "IMG_!t!_!n!!ext!" (
	ren "%name%" "IMG_!t!_!n!!ext!"
) else (
	set /a n+=1
	goto loop
)