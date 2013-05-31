AddCSLuaFile( "cl_hud" )
include( 'shared.lua' )
include( 'cl_hud.lua')

//teamchooser

function teamchooser() 

  local teamchooser = vgui.Create( "DFrame" ) -- Creates the frame itself
	teamchooser:SetPos( 500,300 ) -- Position on the players screen
	teamchooser:SetSize( 300, 150 ) -- Size of the frame
	teamchooser:SetTitle( "Choose Your Team!" ) -- Title of the frame
	teamchooser:SetVisible( true )
	teamchooser:SetDraggable( true ) -- Draggable by mouse?
	teamchooser:ShowCloseButton( true ) -- Show the close button?
	teamchooser:MakePopup() -- Show the frame

		 local TButton = vgui.Create( "DButton", teamchooser )
		 TButton:SetText( "Blues" )
		 TButton:SetPos( 35,55 )
		 TButton:SetSize( 100, 75 )
		 function TButton:OnMousePressed()
		 	RunConsoleCommand("team_blue")
		 end
		 function TButton:OnMouseReleased()
			teamchooser:SetVisible(false)
		 end

		 local CTButton = vgui.Create( "DButton", teamchooser )
		 CTButton:SetText( "Reds" )
		 CTButton:SetPos( 160,55 )
		 CTButton:SetSize( 100,75 )
		 function CTButton:OnMousePressed()
		 	RunConsoleCommand("team_red")
		 end 	
		 function CTButton:OnMouseReleased()
			teamchooser:SetVisible(false)
		 end
end


usermessage.Hook( "teamchooser", teamchooser )
concommand.Add( "team_menu", teamchooser )

net.Receive("JoinRed", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has joined the Red team.", NOTIFY_UNDO, 2 )
end)
net.Receive("JoinBlue", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has joined the Blue team.", NOTIFY_UNDO, 2 )
end)
net.Receive("JoinSpec", function()
	notification.AddLegacy( net.ReadEntity():Nick().." has moved to Spectate.", NOTIFY_UNDO, 2 )
end)
net.Receive("RedDisallow", function()
	notification.AddLegacy( "You already are in the Red team.", NOTIFY_ERROR, 2 )
end)
net.Receive("BlueDisallow", function()
	notification.AddLegacy( "You already are in the Blue team.", NOTIFY_ERROR, 2 )
end)
net.Receive("SpecDisallow", function()
	notification.AddLegacy( " You already are in Spectate.", NOTIFY_ERROR, 2 )
end)
net.Receive("connectmessage", function()
	local pl = net.ReadEntity()
	chat.AddText(Color(0,255,0), pl:Nick(), Color(22,104,104)," has joined the game with Steam ID: ", Color(0,255,0), pl:SteamID(), Color(22,104,104), " and IP Address: ", Color(0,255,0),pl:IPAddress())
end)
