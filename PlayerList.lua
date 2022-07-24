local Chatbox = peripheral.find("chatBox")
os.loadAPI("json")

ip="147.135.44.154"

str = http.get("https://mcapi.us/server/status?ip="..ip).readAll()
obj = json.decode(str)
players = obj.players.sample
has_target = false

for i=1, #players do
    Chatbox.sendMessage(players[i]["name"],"Server")
end
