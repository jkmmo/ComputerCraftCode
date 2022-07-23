local BaseUrl = "https://raw.githubusercontent.com/jkmmo/ComputerCraftCode/main/"
local Libs = {"AutoDoorLog"}
print(Libs)
for i,v in pairs(Libs) do
    print("Attempting to load"..v)
    local s,e = pcall(function ()
        local Request = http.get(BaseUrl..v)
        print(BaseUrl..v)
        loadstring(Request.readAll())()
    end)
    if not s then
        print("Failed to load "..v.." Error -> "..e)
    end
end