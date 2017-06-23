#!/usr/local/bin/lua
arr = {}
for line in io.lines("m1.csv") do
    local l = string.gmatch(line, "[^,]+")
    table.insert(arr, l())
end

file = io.open("r.csv", "a")

for line in io.lines("nps.csv") do

    l = string.gmatch(line, "[^,]+")
    l()
    imei = l()

    for k,v in ipairs(arr) do
        if v == imei then
            file:write('M1,'..line)
            break
        end
    end
end

file:close()