RS = game:GetService("ReplicatedStorage")
CS = game:GetService("CollectionService")
modules = RS:WaitForChild("Shared")
GameTile = require(modules.GameTile)

local map = {}

for _, tile in (CS:GetTagged("GameTile")) do
    table.insert(map, GameTile.new(tile))
end
