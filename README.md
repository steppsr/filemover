![filemover](https://github.com/steppsr/filemover/blob/main/images/filemover_logo.png?raw=true)

## Description

Windows Batch file that will poll a folder and move files from source to destination one at a time.

## Definitions

You set the source, destination, and pattern at the top of the batch script.

`Source` - the folder to poll for files matching the given pattern.

`Destination` - the folder to move files into that match the given pattern.

`Pattern` - a wildcat string to find the desired files. Ex:  C:\temp\*.plot

## How to use

1. Download and save the script in a folder on your Windows computer.
2. Right-click on the file `filemover.bat` then choose Edit.
3. Edit the `source`, `destination`, and `pattern` to fit you needs.
4. Save the file.
5. Exit
6. Launch a Command-prompt, Terminal, or Powershell.
7. Change to the folder where you save the `filemover.bat` file.
```
cd c:\users\steve\documents\code\filemover\
```
8. You can now run the Batch script with the following command:
```
filemover
```

## Running state

The Batch script will continue to poll the folder endless if there isn't input from the user. It will check for a file, and if not found then wait 10 seconds before doing another search. During that 10 seconds you can hit the 'x' key to close the script.

## Additional Configuration Settings available
```
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

```
