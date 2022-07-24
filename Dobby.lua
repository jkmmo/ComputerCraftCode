local modem =  peripheral.find("modem") or error("No modem attached", 0)
local nbt = peripheral.find("nbtStorage") or error("No nbt")
local Chatbox = peripheral.find("chatBox") or error("No Fucking chat")
local Name = "Dobby"
local God = "Leet33"
local BaseUrl = 'https://raw.githubusercontent.com/jkmmo/ComputerCraftCode/main/'
local Prefix = "cmd/"
local Running = true

print("Welcome to the Dobby os, Made by Leet33 aka jkmmo")

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

function Cocain()
    local num = math.random(3)
    sleep(num)
    Chat("Snorts Cocain, IMMMM FREEE")
end

local cmd = {
    [Prefix..'test'] = function ()
       coroutine.resume(coroutine.create(function ()
            Chat("Fuck you Marten!")
       end))
    end,

    [Prefix.."Log"] = function ()
        UpdateB()
        Chat("Done, Can dobby have some food now master?")
    end,
    [Prefix..'ltc'] = function ()
        local s = ""
        for i,v in pairs( nbt.read()) do
            s = s .. v.player..":"..v.date.."\n"
        end
        Chat(s)
    end,
    [Prefix..'name'] = function ()
        Chat("What will dobby's new nickname be master?")
        local Check = Prompt()
        if Check ~= nil then
            Name = Check
            Chat("Dobby loves his new nickname!")
        end
    end,
    [Prefix..'clearm'] = function ()
        modem.transmit(45,43," ")
        Chat("Dobby has made the screen clear. Is master Pround")
    end,
    [Prefix..'killharrypotter'] = function ()
        Chat("~Loads gun")
    end,
    [Prefix..'run'] = function ()
        Chat("What script would you like to run?")
        local Responce = Prompt()
        if Responce then
            local Check = http.get(BaseUrl.. Responce)
            if Check then
                local Dir = Check.readAll()
                coroutine.resume(coroutine.create(function ()
                    print(Dir)
                    loadstring(Dir)()
               end))
            else
                Chat("Could not find <".. Responce .."> in directory.")
            end
        end
    end,
    [Prefix..'kys'] = function ()
        Running = false
    end
}

while Running do
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
           Chat("Your not dobby's master!")
        end
    end
end
Chat("Goodbye master (x_x)")