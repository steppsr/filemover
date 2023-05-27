@echo off
REM source should be the path where the files are. 
REM Be sure it ends with a backslash. Ex:  c:\plot_temp\
SET source=c:\plot_temp\

REM destination should be the path where the files 
REM will be moved. Be sure it ends with a backslash. 
REM Ex:  d:\plot_farm\
SET destination=F:\testnet\plots\

REM pattern is the wildcard search to get your files
SET pattern=*.plot

REM main loop of program
:LOOP
	SET file=""
	call :pop %source%%pattern%

	IF NOT "%file%"=="" (
		IF EXIST "%source%%file%" (
			robocopy %source% %destination% %file% /MOV /MT:50 /ETA /TEE /UNILOG+:filemover.log
		) ELSE (
			ECHO File does not exist.
		)
	) ELSE (
		ECHO No file found.
	)

	choice /C XC /T 10 /D C /N /M "Press C to continue or X to exit... otherwise continuing in 10 seconds."

	IF ERRORLEVEL 2 (
		GOTO :LOOP
	) 
GOTO :END

REM pop will get one file matching the pattern provided
:pop
	setlocal enabledelayedexpansion
	set "pattern=%1"
	set "selectedFile="
	for %%F in (%pattern%) do (
		set "selectedFile=%%~nxF"
		goto :BreakLoop
	)

	:BreakLoop
	endlocal&set file=%selectedFile%
EXIT /B

:END
EXIT /B
