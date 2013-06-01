PK = {}

function PK.SetUpTables(pl)
	pl.Vars = {}
	pl.Vars.KillStreak = 0
end

hook.Add("PlayerInitialSpawn","SetUpTables",PK.SetUpTables)

function PK.SendInfo(pl)
	if IsValid(pl) then
		net.Start("SendInfo")
		net.WriteTable(pl.Vars)
		net.Send(pl)
	end
end

function PK.KillStreak(pl,item,attacker)
	if not pl == attacker then
		pl.Vars.KillStreak = 0
		attacker.Vars.KillStreak = attacker.Vars.KillStreak + 1
	end
		PK.SendInfo(pl)
		PK.SendInfo(attacker)
	end
end

hook.Add("PlayerDeath","Killstreak",PK.KillStreak)

function PK.SpawnProtection(pl)
    timer.Simple(2, function()
  	pl:GodDisable()
  	net.Start("goddisable")
  	net.Send(pl)
end)
end

hook.Add("PlayerSpawn","SpawnProtection",PK.SpawnProtection)

function PK.SmallKillFeed(pl,item,attacker)
	net.Start("YouWereKilled")
	net.WriteEntity(attacker)
	net.Send(pl)
	net.Start("YouKilled")
	net.WriteEntity(pl)
	net.Send(attacker)
end
hook.Add("PlayerDeath", "KillFeed",SmallKillFeed)

function PK.AutoDelete(pl,mdl,ent)
	timer.Simple(10, function()
		if IsValid(ent) then
			ent:Remove()
			net.Start("propdeleted")
			net.Send(pl)
		end
	end)
end

hook.Add("PlayerSpawnedProp","AutoDelete",PK.AutoDelete)

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

function AutoTeamChooser(pl)
	net.Start("TeamChooser")
	net.Send(pl)
end

hook.Add("PlayerInitialSpawn","AutoTeamCHooser",AutoTeamChooser)

function PK.GetLeader(pl)
	for k,v in pairs(player.GetAll()) do
		if IsValid(v) then
			if math.max(v.Vars.KillStreak) > 0 then
				math.max(v.Vars.KillStreak)
				SetGlobalEntity("Leader",v)
			end
		end
	end
end

