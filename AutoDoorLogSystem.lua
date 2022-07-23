local detector = peripheral.find("playerDetector")
local integrator = peripheral.find("redstoneIntegrator")
local nbt = peripheral.find("nbtStorage")


while true do
    local Player = detector.getPlayersInRange(4)[1]
    if Player then
        if Player ~= "Leet33" then
            local Data = {}
              --  print(os.date())
            local PlayerData = {}
            --table.insert(Data,PlayerData)
            for i,v in pairs(nbt.read()) do
                table.insert(Data,v)
            end
            PlayerData["player"] = Player
             PlayerData["date"] = os.date() 
            table.insert(Data,PlayerData)
            nbt.writeTable(Data)
        end
        integrator.setOutput("top", true)
    else
        integrator.setOutput("top", false)
    end
end