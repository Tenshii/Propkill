
net.Receive("JoinRed", function()
  notification.AddLegacy( net.ReadEntity():Nick().." has joined the Red team.", NOTIFY_UNDO, 2 )
end)
net.Receive("JoinBlue", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has joined the Blue team.", NOTIFY_UNDO, 2 )
end)
net.Receive("JoinSolo", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has joined the Solo team.", NOTIFY_UNDO, 2 )
end)
net.Receive("JoinSpec", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has moved to Spectate.", NOTIFY_UNDO, 2 )
end)
net.Receive("RedDisallow", function()
	notification.AddLegacy( "You already are in the Red team.", NOTIFY_ERROR, 2 )
end)
net.Receive("SoloDisallow", function()
	notification.AddLegacy( "You already are in the Solo team.", NOTIFY_ERROR, 2 )
end)
net.Receive("BlueDisallow", function()
	notification.AddLegacy( "You already are in the Blue team.", NOTIFY_ERROR, 2 )
end)
net.Receive("SpecDisallow", function()
	notification.AddLegacy( "You already are in Spectate.", NOTIFY_ERROR, 2 )
end)
net.Receive("connectmessage", function()
	local pl = net.ReadEntity()
	chat.AddText(Color(0,255,0), pl:Nick(), Color(22,104,104)," has joined the game with Steam ID: ", Color(0,255,0), pl:SteamID(), Color(22,104,104), " and IP Address: ", Color(0,255,0),pl:IPAddress())
end)
net.Receive("goddisable", function()
	notification.AddLegacy( "Your spawn protection has ended.", NOTIFY_UNDO, 2 )
end)
