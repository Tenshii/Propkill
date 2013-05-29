include('shared.lua') 

local pl = LocalPlayer()

 net.Receive("PlayerWelcomeMessage", function(pl)
   chat.AddText(Color(0,204,204), "Hello, ", Color(0,255,0), pl:Nick(), Color(0,204,204), ", welcome to the server!")
 end)

net.Receive("ServerJoinMessage", function()
	chat.AddText(Color(0,255,0), net.ReadEntity():Nick(), Color(0,204,204), " with SteamID: ", Color(0,255,0), net.ReadEntity():SteamID(), Color(0,204,204), " has joined the server.") 
end)
