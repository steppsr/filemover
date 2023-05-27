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

REM threads is the number of your systems threads you want to use remove the 'REM' from the 
REM beginning of the line below to use threaded processes to move the files.
SET threads=50

REM If you want output display on the screen change the value below to a 'Y' instead of 'N'. 
REM Note - This will cause the move to run slower.
REM SET tee=Y
SET tee=Y

REM If you are move large files, answer 'Y' below to copy using unbuffered I/O
REM SET unbuffered=N
SET unbuffered=Y

REM If you want to log to a file, remove the 'REM' below and set the filename for the log.
REM SET logfile=filemove.log
SET logfile=

REM - END USER CONFIG



REM ====================================================================================================
REM ------------------------------- NO USER CONFIG CHANGES BELOW THIS LINE -----------------------------
REM ====================================================================================================
SET th=""
IF NOT "%threads%"=="" (
	SET th=/MT:%threads%
)

IF "%tee%"=="Y" (
	SET tee=/TEE
) ELSE (
	SET tee=
)

IF "%unbuffered%"=="Y" (
	SET ub=/J
) ELSE (
	SET ub=
)

IF NOT "%logfile%"=="" (
	SET log=/UNILOG+:%logfile%
)

REM main loop of program
:LOOP
	SET file=""
	call :pop %source%%pattern%

	IF NOT "%file%"=="" (
		IF EXIST "%source%%file%" (
			robocopy %source% %destination% %file% /MOV %th% %ub% /ETA %tee% %log%
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
	SETLOCAL ENABLEDELAYEDEXPANSION
	SET "pattern=%1"
	SET "selectedFile="
	FOR %%F IN (%pattern%) DO (
		SET "selectedFile=%%~nxF"
		GOTO :BREAKLOOP
	)

	:BREAKLOOP
	ENDLOCAL&SET file=%selectedFile%
EXIT /B

:END
EXIT /B
