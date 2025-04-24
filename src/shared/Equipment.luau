local Equipment = {}
Equipment.__index = Equipment

function Equipment:new(name: string, type: string, cost: number, weight: number)
    return setmetatable({
        Name = name,
        Type = type,
        Cost = cost,
        Weight = weight
    }, Equipment)
end

local weaponTypes = {
    simpleMelee = "Simple Melee",
    simpleRanged = "Simple Ranged",
    martialMelee = "Martial Melee",
    martialRanged = "Martial Ranged"
}

local Weapon = {}
function Weapon:new(name, type, cost, weight, damageDie, properties, damageBonus, hitBonus)
    self = Equipment:new(name, type, cost, weight)
    self.DamageDie = damageDie
    self.Properties = properties or {}
    self.DamageBonus = damageBonus or 0
    self.HitBonus = hitBonus or 0
    
    self.__index = self
    return self
end

return Equipment