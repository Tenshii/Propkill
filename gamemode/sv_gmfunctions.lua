// On Join

function GM:PlayerInitialSpawn( pl )

  pl:ConCommand("team_menu")
	pl:SetTeam( 3 )
end

// disable the sandbox SWEPS

function GM:PlayerGiveSWEP( ply, class, wep )
	return false
end

// setting the owner of the prop

function GM:PlayerSpawnedProp( pl, model, ent)
	ent:SetPhysicsAttacker( pl )
end

// Team stuff

function GM:PlayerSpawn( pl )
	if pl:Team() == 1 then
		pl:SetModel( "models/player/kleiner.mdl" )
		pl:Give("weapon_physgun")
		pl:UnSpectate()
		pl:GodEnable()
	elseif pl:Team() == 2 then		
		pl:SetModel( "models/player/odessa.mdl" )
		pl:Give("weapon_physgun")
		pl:UnSpectate()
		pl:GodEnable()
	elseif pl:Team() == 4 then		
		pl:SetModel( "models/player/breen.mdl" )
		pl:Give("weapon_physgun")
		pl:UnSpectate()
		pl:GodEnable()
	elseif pl:Team() == 3 then
	  	pl:StripWeapons()
     		pl:Spectate(6)
	end
end

function GM:PlayerDeathThink(pl)
	pl:Spawn()
end


function GM:PlayerSpawnProp()
	return true
end

function GM:PlayerConnect(pl) 
end

function GM:GetFallDamage( ply, speed )
	return 0 
end

function GM:PhysgunPickup( pl, ent )
        if not pl == ent:GetPhysicsAttacker() then
        	return false
        else 
        	return true
        end
end
