local NPC = {}

NPC.__index = NPC

--[[
Creates a new NPC instance as to control a generic NPC. 
]]
function NPC.new(name: string, maxHP: number, model: PVInstance)
    return setmetatable({
        Name = name,
        MaxHP = maxHP,
        HP = maxHP,
        Model = model
    }, NPC)
end

return NPC