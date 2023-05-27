# filemover

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

![filemover](https://github.com/steppsr/filemover/blob/main/images/filemover_logo.png?raw=true)
