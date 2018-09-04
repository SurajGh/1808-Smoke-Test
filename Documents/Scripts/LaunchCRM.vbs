'GINGER_Description Calculate EPOCH TIME For different timezone
'GINGER_$ UserID
'GINGER_$ Password

userid=WScript.Arguments(0)
pwd=WScript.Arguments(1)



set WshShell = WScript.CreateObject("WScript.Shell")
set shellApp = WScript.CreateObject("Shell.Application")
set objIE = Wscript.CreateObject("InternetExplorer.Application")

windowLoaded=false
k=0
logintimes=0
loginstatus=false

Do Until windowLoaded=true
	k=k+1


	if k>=55 then
		msgbox "CRM timeout. Launch Failed."
		WScript.Quit
	end if

	for each objW in shellApp.Windows
		
		if (LCase(objW.LocationName) = LCase("AT&T Security Server: Login")) then
			set objIE=objW
			windowLoaded=true
			exit Do
		end if
	next
WScript.Sleep 5000


Loop



WshShell.AppActivate "Login"

do


	logintimes = logintimes+1
	
	objIE.Document.getElementsByName("userid")(0).value=userid
	objIE.Document.getElementsByName("password")(0).value=pwd
	objIE.Document.getElementsByName("btnSubmit").Item(0).click
	

	WScript.Sleep 1000

	if objW.LocationName="AT&T Security Server: Login" then
		
		if logintimes=1 then
			pwd="unix11"
		elseif logintimes=2 then
			pwd="123123a"
		elseif logintimes=3 then
			pwd=userid
		end if
	else	
		loginstatus=true
	end if
	
loop until loginstatus=true

							
if (LCase(objW.LocationName) = LCase("AT&T - Log On Successful")) then
	set objIE=objW
	ObjIE.Document.getElementsByName("successOK").item(0).Click
end if


'shellApp.Quit
'objIE.Quit
'WshShell.Quit

set objIE = nothing
set WshShell = nothing
set shellApp = nothing

	
Wscript.Echo "~~~GINGER_RC_START~~~"
Wscript.Echo "len=324"
Wscript.Echo "~~~GINGER_RC_END~~~"

