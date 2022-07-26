local integrator = peripheral.find("redstoneIntegrator") or error("No redstoneIntegrator")
local Chatbox = peripheral.find("chatBox") or error("No Fucking chat")

while Running do
    local Event,Player,Message = os.pullEvent("chat")
    if Player == "Leet33" then
        if Message == "ev/up" then
            integrator.setOutput("top", true)
        elseif Message == "ev/down" then
            integrator.setOutput("top", false)
        end
    end
end