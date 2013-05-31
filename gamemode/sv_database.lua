  function SpawnProtection(pl)
    timer.Simple(2, function()
  	pl:GodDisable()
  	net.Start("goddisable")
  	net.Send(pl)
end)

hook.Add("PlayerSpawn","SpawnProtection",SpawnProtection)

// choosing teams

util.AddNetworkString("JoinSpec")
util.AddNetworkString("JoinBlue")
util.AddNetworkString("JoinRed")
util.AddNetworkString("JoinSolo")
util.AddNetworkString("SpecDisallow")
util.AddNetworkString("BlueDisallow")
util.AddNetworkString("RedDisallow")
util.AddNetworkString("SoloDisallow")

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

// teammenu

function teamchooser( ply ) 
    umsg.Start( "teamchooser", ply ) 
    umsg.End()
end 
hook.Add("ShowSpare1", "MyHook", teamchooser)
