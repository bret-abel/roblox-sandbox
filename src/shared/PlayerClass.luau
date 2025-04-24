Dice = require(script.Parent.Dice)
Tables = require(script.Parent.Tables)
local Skills = Tables.Skills

local PlayerClass = {}

local PlayerClasses = {
    ["Barbarian"] = {
        HitDice = Dice.new(12),
        ["Proficiencies"] = {
            ["Armor"] = {"light", "medium", "shields"},
            ["Weapons"] = {"simple", "martial"},
            ["Tools"] = {},
            ["Saving Throws"] = {"strength", "constitution"},
            ["Skills"] = {
                numAvailable = 2,
                ["Choices"] = {
                    Skills.Wisdom.animalHandling,
                    Skills.Strength.athletics,
                    Skills.Charisma.intimidation,
                    Skills.Intelligence.nature,
                    Skills.Wisdom.perception,
                    Skills.Wisdom.survival
                }
            }
        },
        ["Starting Equipment"] = {}
    }
}

function PlayerClass.new(className: string)
    return setmetatable({}, PlayerClasses[className])
end

return PlayerClass