local Request = game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
    local DataDecoded,Servers = HttpService:JSONDecode(Request).data,{}
    for Index,ServerData in ipairs(DataDecoded) do
        if type(ServerData) == "table" and ServerData.id ~= game.JobId then
            table.insert(Servers,ServerData.id)
        end
    end
    if #Servers > 0 then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, Servers[math.random(1, #Servers)])
    end
