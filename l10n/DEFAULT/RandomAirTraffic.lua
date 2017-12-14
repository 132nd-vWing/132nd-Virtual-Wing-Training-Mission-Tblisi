
--env.info('Random Air Traffic is temporarily disabled for debugging')
 -- Create RAT object. Additionally, to the template group name we give the group an alias to be able to distinguish to another group created from this template.
 RussianYak=RAT:New("Russian Civilian Airtraffic")


 -- Change coalition of Yak to blue.
 RussianYak:SetCoalitionAircraft("red")


 -- This restricts the possible departure and destination airports the airports belonging to the red coalition.
 -- Here it is important that in the mission editor enough (>2) airports have been set to red! Otherwise there will be no possible departure and/or destination airports.
 RussianYak:SetCoalition("sameonly")

 -- Explicitly exclude Senaki from possible departures and destinations.
 RussianYak:ExcludedAirports({ "Anapa-Vityazevo" , "Krymsk" , "Novorossiysk" , "Kobuleti" })

 -- We also change the livery of these groups. If a table of liveries is given, each spawned group gets a random livery.
 RussianYak:Livery({"Georgian Airlines", "Aeroflot", "Olympic Airways", "Ukrainian" })


 -- This makes aircraft respawn at their destination airport instead of another random airport.
 RussianYak:ContinueJourney()




 -- Spawn three aircraft.
 RussianYak:StatusReports(false) 
 RussianYak:Spawn(3)

