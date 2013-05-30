
function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud:D", hidehud)

function DrawNewHUD()
	local winning = GetGlobalEntity( "Leader" )
	local leading = "No one"
	if winning and winning ~= NULL and winning ~= nil then
		if winning:IsPlayer() then
			if winning == LocalPlayer() then
				leading = "You are"
			else
					leading = winning:Nick() .. winning:GetNWInt( "killstreak" )
			end
		end
	end

	draw.SimpleText( "Killstreak: "  .. LocalPlayer():GetNWInt( "killstreak" ), "UiBold", 48, ScrH() - 47, WHITECOLOUR, 0, 1)
	draw.SimpleText( "Leader: "  .. leading, "UiBold", , ScrH() - 35, WHITECOLOUR, 0, 1)
	draw.RoundedBox( 16, ScrW()*0.01, ScrH()*0.82, 300, 125, Color( 52, 54, 61, 255 ) )
end

hook.Add("HUDPaint", "NewHUD",DrawNewHUD )
