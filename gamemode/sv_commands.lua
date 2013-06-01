// console commands

concommand.Add( "team_blue", blues )
concommand.Add( "team_red", reds )
concommand.Add( "team_spec", spec )
concommand.Add( "team_solo", solos )
concommand.Add( "team_menu", AutoTeamChooser )



// chat commands

function changeteam( pl, text, public)
	if string.StartWith(text, "!spec") then
		pl:ConCommand("team_spec")
		return ""
	end
	if string.StartWith(text, "!blue") then
		pl:ConCommand("team_blue")
		return ""
	end
	if string.StartWith(text, "!solo") then
		pl:ConCommand("team_solo")
		return ""
	end
	if string.StartWith(text, "!red") then
		pl:ConCommand("team_red")
		return ""
	end
end

hook.Add("PlayerSay", "changeteam", changeteam)

