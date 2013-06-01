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

// f3 menu

function F3TeamMenu(pl)
	pl:ConCommand("team_menu")
end
hook.Add("ShowSpare1", "f3menu", F3TeamMenu)
