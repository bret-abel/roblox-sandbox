GameTile = {}

function GameTile.new(basePart)
    print("Instantiating GameTile on "..basePart.Name)
    return setmetatable({
        Tile = basePart
    }, GameTile)
end

return GameTile