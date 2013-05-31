  function SpawnProtection(pl)
    timer.Simple(2, function()
  	pl:GodDisable()
  	net.Start("goddisable")
  	net.Send(pl)
end)

hook.Add("PlayerSpawn","SpawnProtection",SpawnProtection)
