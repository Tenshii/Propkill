GM.Name  	= "PropKill"
GM.Author	= ".Tenshi (STEAM_0:1:47827646) and Goose (STEAM_0:0:10650470)"

function GM:Initialize()

 self.BaseClass.Initialize( self )
	
end
 
team.SetUp( 1, "Reds", Color( 255, 0, 0, 255 ) ) -- Red Team (Team 1)
team.SetUp( 2, "Blues", Color( 0, 0, 255, 255 ) ) -- Blue Team (Team 2)
team.SetUp( 3, "Spectator", Color( 156, 156, 156, 255 ) ) -- Spectators (Team 3)

util.PrecacheModel( "models/breen.mdl" )
util.PrecacheModel( "models/gman.mdl" )
