local BaseUrl = 'https://raw.githubusercontent.com/jkmmo/ComputerCraftCode/main/'
local Dir = 'Test.lua'

loadstring(http.get(BaseUrl..Dir).readAll())()
