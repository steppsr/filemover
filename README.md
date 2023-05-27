# filemover
Windows Batch file that will poll a folder and move files from source to destination one at a time.

You set the `source` and `destination` and `pattern` at the top of the batch script.

Source - the folder to poll for files matching the given `pattern`

Destination - the folder to move files into that match the given `pattern`

Pattern - a wildcat string to find the desired files. Ex:  C:\temp\*.plot

