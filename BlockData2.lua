local Connected_peripherals = {}
local printer = peripheral.find('printer') or error("A printer is needed for this program")

for i,Side in pairs(peripheral.getNames()) do
    local per = peripheral.getType(Side)
    if per ~= 'printer' then
        local  name = per
        local p = peripheral.find(per)
        local tab = {name = name, p = p}
        table.insert(Connected_peripherals,tab)
    end
end

for i,pref in pairs(Connected_peripherals) do
    local y = 2
    printer.newPage()
    printer.setPageTitle(pref.name)
    printer.write(pref.name)
    for x,v in pairs(pref.p) do
        printer.write(x..", "..type(v))
        y = y + 1
        printer.setCursorPos(1,y)
    end
    printer.endPage()
end