local BaseUrl = 'https://raw.githubusercontent.com/jkmmo/ComputerCraftCode/main/'
local Dir = 'Test2.lua'

loadstring(http.get(BaseUrl..Dir).readAll())()
