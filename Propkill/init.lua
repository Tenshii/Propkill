/*---------------------------------------------------------
   Author: .Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)
---------------------------------------------------------*/
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

// Setting the Loadouts and welcome messages:
-- Starting in spectator

util.AddNetworkString( "PlayerWelcomeMessage" )
util.AddNetworkString( "ServerJoinMessage" )

function GM:PlayerInitialSpawn( pl )
	pl:SetTeam( 3 )
	net.Start( "PlayerWelcomeMessage" )
	net.Send( pl )
	net.Start( "ServerJoinMessage" )
	net.WriteEntity( pl )
	net.Broadcast()
	
end

// Weapons which teams spawn with:
-- 1&2 only get physguns and 3 gets nothing

function GM:PlayerLoadOut( pl )
   if pl:Team() == 1 then
      pl:Give("weapon_physgun")
      pl:Model("models/breen.mdl")
      pl:SetColor(255,0,0,255)
   elseif pl:Team() == 2 then
      pl:Give("weapon_physgun")
      pl:Model("models/gman.mdl")
      pl:SetColor(0,0,255,255)
   elseif pl:Team() == 3 then
   	return nil
   end
end

// What happens on spawn:
-- Spawns team 3 as spectator

function GM:PlayerSpawn( pl )
   if pl:Team() == 3 then
      GAMEMODE:PlayerSpawnAsSpectator( pl )
   end
end

// Instantly respawns player on death

function GM:PlayerDeathThink( pl )
   pl:Spawn()
end

// changing team concommands

concommand.Add("team_red", function(pl)
	pl:SetTeam(1)
end)
concommand.Add("team_blue", function(pl)
	pl:SetTeam(2)
end)
concommand.Add("team_spec", function(pl)
	pl:SetTeam(3)
end)
   
