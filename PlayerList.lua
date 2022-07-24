local Chatbox = peripheral.find("chatBox")


ip="147.135.44.154"

str = http.get("https://mcapi.us/server/status?ip="..ip).readAll()
obj = textutils.unserialiseJSON(str)
players = obj.players.sample
has_target = false

for i,v in pairs(players) do
    print(v.name)
end
