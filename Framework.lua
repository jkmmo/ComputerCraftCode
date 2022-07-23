local BaseUrl = "https://raw.githubusercontent.com/jkmmo/ComputerCraftCode/main/"
local Libs = {"Test.lua"}
print(Libs)
for i,v in pairs(Libs) do
    local Request = http.get(BaseUrl..v)
    print(BaseUrl..v)
    loadstring(Request.readAll())()
end