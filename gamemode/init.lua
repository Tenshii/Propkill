/*---------------------------------------------------------
   Author: .Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)
---------------------------------------------------------*/

Msg( [[/======================================================================/
PropKill - loaded Successfully
Coded by .Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)
/======================================================================/
]] )

AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_hud.lua" )
AddCSLuaFile( "cl_netmessages.lua" )
AddCSLuaFile( "cl_vgui.lua" )
AddCSLuaFile( "sv_gmfunctions.lua" )
AddCSLuaFile( "sv_commands.lua" )
AddCSLuaFile( "sv_database.lua" )


include( 'shared.lua' )
include( 'cl_hud.lua')
include( 'cl_netmessages.lua' )
include( 'cl_vgui.lua' )
include( 'sv_gmfunctions.lua' )
include( 'sv_commands.lua' )
include( 'sv_database.lua' )

util.AddNetworkString("SendInfo")
util.AddNetworkString("JoinSpec")
util.AddNetworkString("JoinBlue")
util.AddNetworkString("JoinRed")
util.AddNetworkString("JoinSolo")
util.AddNetworkString("SpecDisallow")
util.AddNetworkString("BlueDisallow")
util.AddNetworkString("RedDisallow")
util.AddNetworkString("SoloDisallow")
util.AddNetworkString("TeamChooser")
util.AddNetworkString("goddisable")
util.AddNetworkString("propdeleted")

concommand.Add( "team_blue", blues )
concommand.Add( "team_red", reds )
concommand.Add( "team_spec", spec )
concommand.Add( "team_solo", solos )
concommand.Add( "team_menu", AutoTeamChooser )
