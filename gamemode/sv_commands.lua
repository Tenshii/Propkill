// choosing teams

function blues( pl )
  if pl:Team() == 1 then
			net.Start("BlueDisallow")
			net.Send(pl)
		else
			pl:SetTeam( 1 )
			pl:Spawn()
			net.Start("JoinBlue")
			net.WriteEntity(pl)
			net.Broadcast()
		end
end

function solos( pl )
	if pl:Team() == 4 then
			net.Start("SoloDisallow")
			net.Send(pl)
		else
			pl:SetTeam( 4 )
			pl:Spawn()
			net.Start("JoinSolo")
			net.WriteEntity(pl)
			net.Broadcast()
		end
end

function reds( pl )
	if pl:Team() == 2 then
			net.Start("RedDisallow")
			net.Send(pl)
		else
			pl:SetTeam( 2 )
			pl:Spawn()
			net.Start("JoinRed")
			net.WriteEntity(pl)
			net.Broadcast()
		end
end

function spec( pl )
	if pl:Team() == 3 then
			net.Start("SpecDisallow")
			net.Send(pl)
		else
			pl:SetTeam( 3 )
			pl:Spawn()
			net.Start("JoinSpec")
			net.WriteEntity(pl)
			net.Broadcast()
		end
end

// console commands

concommand.Add( "team_blue", blues )
concommand.Add( "team_red", reds )
concommand.Add( "team_spec", spec )
concommand.Add( "team_solo", solos )


// teammenu

function teamchooser( ply ) 
    umsg.Start( "teamchooser", ply ) 
    umsg.End()
end 
hook.Add("ShowSpare1", "MyHook", teamchooser)

// chat commands

util.AddNetworkString("JoinSpec")
util.AddNetworkString("JoinBlue")
util.AddNetworkString("JoinRed")
util.AddNetworkString("JoinSolo")
util.AddNetworkString("SpecDisallow")
util.AddNetworkString("BlueDisallow")
util.AddNetworkString("RedDisallow")
util.AddNetworkString("SoloDisallow")

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
