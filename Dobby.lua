local modem =  peripheral.find("modem") or error("No modem attached", 0)
local nbt = peripheral.find("nbtStorage") or error("No nbt")
local Chatbox = peripheral.find("chatBox") or error("No Fucking chat")
local Name = "Dobby"
local God = "Leet33"

function UpdateB()
    for i,v in pairs(nbt.read()) do
        modem.transmit(43,43,v.player..":"..v.date)
    end
end

function Chat(Message)
    Chatbox.sendMessage(Message,Name)
end

function Prompt()
    local event,player,message = os.pullEvent("chat")
    if player == God then
        if message == "cancel" then
            Chat("Prompt cancelled!")
            return nil
        else
            return message
        end
    end

end


local cmd = {}
cmd["cmd/log"] = function()
    UpdateB()
    Chat("Done, Can dobby have some food now master?")
end

cmd["cmd/ltc"] = function() 
    local s = ""
    for i,v in pairs( nbt.read()) do
        s = s .. v.player..":"..v.date.."\n"
    end
    Chat(s)
end

cmd["cmd/name"] = function()
    Chat("What will dobby's new nickname be master?")
   local Check = Prompt()
   if Check ~= nil then
       Name = Check
       Chat("Dobby loves his new nickname!")
   end
end

cmd["cmd/clearm"] = function()
    modem.transmit(45,43," ")
    Chat("Dobby has made the screen clear. Is master Pround")
end

cmd["cmd/killharrypotter"] = function()
    Chat("~Loads gun")
end

function Cocain()
    local num = math.random(3)
    sleep(num)
    Chat("Snorts Cocain, IMMMM FREEE")
end

while  true do
    local Event,Player,Message = os.pullEvent("chat")
    if Message == "Goodbye dobby" then
        Chat("Good by "..Player.." ;(")
        pcall(function() 
            sleep(4)
            Chat("Snorts Cocain, IMMMM FREEE BITCHES")
        end)
    end
    if cmd[Message] then
        if Player == God then
           cmd[Message]()
           else
           Chat("You'r not dobby's master!")
        end
    end
end