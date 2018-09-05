'GINGER_Description Renamefile

'Set obj=CreateObject("InternetExplorer.Application")
'obj.quit

Dim oShell : Set oShell = CreateObject("WScript.Shell")


WScript.Sleep 1000

set service = GetObject ("winmgmts:")

for each Process in Service.InstancesOf ("Win32_Process")
	If Process.Name = "jp2launcher.exe" then
		oShell.Run "taskkill /F /im jp2launcher.exe", , True
		'wscript.echo "CRM running"
		wscript.quit
	End If
next
'wscript.echo "CRM not running"

' output results to Ginger
Wscript.echo "~~~GINGER_RC_START~~~" 
 Wscript.echo "PricePlan list =" + Cstr(count)
Wscript.echo "~~~GINGER_RC_END~~~" 
