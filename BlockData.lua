local Connected_peripherals = {}
local printer = peripheral.find('printer')

for i,Side in pairs(peripheral.getNames()) do
    local per = peripheral.getType(Side)
    if per ~= 'printer' then
        local  name = per
        local p = peripheral.find(per)
        local methods = peripheral.getMethods(per)
        local tab = {name = name, p = p , methods = methods}
        table.insert(Connected_peripherals,tab)
    end
end

for i,pref in pairs(Connected_peripherals) do
    print(pref.name,pref.methods)
end