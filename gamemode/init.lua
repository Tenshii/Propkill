/*---------------------------------------------------------
   Author: .Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)
---------------------------------------------------------*/

Msg( [[/==================================================/
PropKill - loaded Successfully
Coded by .Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)
/==================================================/
]] )

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_netmessages.lua" )
AddCSLuaFile( "cl_vgui.lua" )
include( 'shared.lua' )
include( 'cl_hud.lua')
include( 'cl_netmessages.lua' )
include( 'cl_vgui.lua' )


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
util.AddNetworkString("goddisable")

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
	timer.Simple(2, function()
	pl:GodDisable()
	net.Start("goddisable")
	net.Send(pl)
end)
end

function GM:PlayerDeathThink(pl)
	pl:Spawn()
end


function GM:PlayerSpawnProp()
	return true
end

util.AddNetworkString("connectmessage")

function GM:PlayerConnect(pl) 
	net.Start("connectmessage")
	net.WriteEntity(pl)
	net.Broadcast()
end

function GM:GetFallDamage( ply, speed )
	return 0 
end

function GM:PhysgunPickup( pl, ent )
        if not pl == ent:GetPhysicsAttacker() then
        	return false
        end
end

