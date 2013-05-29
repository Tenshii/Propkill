 include('shared.lua') 

local pl = LocalPlayer()

 net.Receive("PlayerWelcomeMessage", function(pl)
 	chat.AddText(Color(0,204,204), "Hello, ", Color(0,255,0), pl:Nick(), Color(0,204,204), ", welcome to the server!")
 end)

net.Receive("ServerJoinMessage", function()
	local net.ReadEntity() = ply
	chat.AddText(Color(0,255,0), ply:Nick(), Color(0,204,204), " with SteamID: ", Color(0,255,0), ply:SteamID(), Color(0,204,204), " has joined the server.")
	if pl:IsAdmin() or pl:IsSuperAdmin() then
		return end
	else chat.AddText(Color(0,204,204),ply:Nick().."'s IP Address is: ", Color(0,255,0), ply:IPAddress())
	end
end)
