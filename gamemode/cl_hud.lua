 
function hidehud(name)
	for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
		if name == v then return false end
	end
end
hook.Add("HUDShouldDraw", "HideOurHud", hidehud)

function DrawNewHUD()

	local winning = GetGlobalEntity( "Leader" )
	local leading = "No one"
	if winning and winning ~= NULL and winning ~= nil then
		if winning:IsPlayer() then
			if winning == LocalPlayer() then
				leading = "You are"
			else
					leading = winning:Nick() .. winning.Vars.Killstreak
			end
		end
end

	LocalPlayer().Vars.Killstreak = LocalPlayer().Vars.Killstreak or 0
	local pkKills = LocalPlayer():Frags() 
	local pkDeaths = LocalPlayer():Deaths()
	if pkKills == 0 then pkKills = 1 end
	if pkDeaths == 0 then pkDeaths = 1 end
	local KDR = math.Round( pkKills / pkDeaths, 1)

	draw.RoundedBox( 16, ScrW()*0.01, ScrH()*0.82, 300, 125, Color( 52, 54, 61, 255 ) )
	draw.SimpleText( "Killstreak: "  .. LocalPlayer().Vars.KillStreak), "TargetID", ScrW()*0.025, ScrH()*0.96, WHITECOLOUR, 0, 1)
	draw.SimpleText( "Leader: "  .. leading, "TargetID", ScrW()*0.025, ScrH()*0.93, WHITECOLOUR, 0, 1)
	draw.RoundedBox(4, ScrW()*0.029, ScrH()*0.838, 250, 20, Color(32, 32, 32, 255))
	draw.RoundedBox(4, ScrW()*0.029, ScrH()*0.838, math.Clamp( LocalPlayer():Health(), 0, 100 )*2.5, 20, Color(129, 183, 1, 255))
	draw.SimpleText("Health: "..LocalPlayer():Health(), "TargetID", ScrW()*0.09, ScrH()*0.85, WHITECOLOUR, 0, 1)
	draw.RoundedBox(4, ScrW()*0.029, ScrH()*0.879, 250, 20, Color(32, 32, 32, 255))
	draw.RoundedBox(4, ScrW()*0.029, ScrH()*0.879, math.Clamp( KDR, 0, 4 )*62.5, 20, Color(193, 106, 6, 255))
	draw.SimpleText("Kill/Death Ratio: "..KDR..":1", "TargetID", ScrW()*0.067, ScrH()*0.891, WHITECOLOUR, 0, 1)
end

hook.Add("HUDPaint", "NewHUD",DrawNewHUD )
