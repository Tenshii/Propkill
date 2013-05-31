GM.Name 	= "PropKill"
GM.Author 	= "Tenshi and Goose"
GM.Email 	= "N/A"
GM.Website 	= "N/A"

// Deriving gamemode from sandbox to allow prop spawns and such
DeriveGamemode ( "sandbox" )

function GM:Initialize()

	self.BaseClass.Initialize( self )
	
end

// Teams

team.SetUp( 1, "Blues", Color( 0, 0, 255 ) )
team.SetUp( 2, "Reds", Color( 255, 0, 0 ) )
team.SetUp( 3, "Spectators", Color( 186, 186, 186 ) )

// Models

util.PrecacheModel( "models/player/kleiner.mdl" )
util.PrecacheModel( "models/player/odessa.mdl" )