include( 'shared.lua' )
include( 'cl_hud.lua')
include( 'cl_netmessages.lua' )

// open dat spawn menu if the sandbox derive is retarded
function GM:SpawnMenuEnabled()
// return true;
end

//teamchooser

function teamchooser() 

  local teamchooser = vgui.Create( "DFrame" ) -- Creates the frame itself
	teamchooser:SetPos( 500,300 ) -- Position on the players screen
	teamchooser:SetSize( 400, 150 ) -- Size of the frame
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
		 CTButton:SetSize( 100, 75 )
		 function CTButton:OnMousePressed()
		 	RunConsoleCommand("team_red")
		 end 	
		 function CTButton:OnMouseReleased()
			teamchooser:SetVisible(false)
		 end
		 
		 local RButton = vgui.Create( "DButton", teamchooser )
		 RButton:SetText( "Solo" )
		 RButton:SetPos( 285,55 )
		 RButton:SetSize( 100, 75 )
		 function RButton:OnMousePressed()
		 	RunConsoleCommand("team_solo")
		 end
		 function RButton:OnMouseReleased()
			teamchooser:SetVisible(false)
		 end
end


usermessage.Hook( "teamchooser", teamchooser )
concommand.Add( "team_menu", teamchooser )
