local PlayerCharacter = {}
PlayerCharacter.__index = PlayerCharacter

function PlayerCharacter.new()
    return setmetatable({
        Name = "",
        Race = "",
        
    }, PlayerCharacter)
end

return PlayerCharacter