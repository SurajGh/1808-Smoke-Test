Dim oShell : Set oShell = CreateObject("WScript.Shell")


WScript.Sleep 1000

set service = GetObject ("winmgmts:")

for each Process in Service.InstancesOf ("Win32_Process")
	If Process.Name = "javaw.exe" then
		oShell.Run "taskkill /F /im javaw.exe", , True
		'wscript.echo "CRM running"
		wscript.quit
	End If
next
'wscript.echo "CRM not running"
