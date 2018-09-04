'GINGER_Description Calculate EPOCH TIME For different timezone
'GINGER_$ TIMEZONE_Code
Dim epoch_time

if (Hour(Now()) < 23) then 

	epoch_time=Year(now()) & "-" & Right("0" & Month(now()),2) & "-" & Right("0" & Day(now()),2) & " 00:00"
	
else
	epoch_time=Year(now()) & "-" & Right("0" & Month(now()),2) & "-" & Right("0" & Day(now()+1),2) & " 00:00"
	
end if

Wscript.Echo "~~~GINGER_RC_START~~~"
Wscript.Echo "epoch_time="&epoch_time
Wscript.Echo "~~~GINGER_RC_END~~~"