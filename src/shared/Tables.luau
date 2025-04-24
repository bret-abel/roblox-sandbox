local Tables = {}

Tables.Attributes = {
    "Strength", "Dexterity", "Intelligence", "Wisdom", "Charisma"
}

Tables.Skills = {
    ["Strength"] = {
        athletics = "Athletics"
    },
    ["Dexterity"] = {
        acrobatics = "Acrobatics", 
        sleightOfHand = "Sleight of Hand",
        stealth = "Stealth"
    },
    ["Intelligence"] = {
        arcana = "Arcana",
        history = "History",
        investigation = "Investigation",
        nature = "Nature",
        religion = "Religion"
    },
    ["Wisdom"] = {
        animalHandling = "Animal Handling",
        insight = "Insight",
        medicine = "Medicine",
        perception = "Perception",
        survival = "Survival"
    },
    ["Charisma"] = {
        deception = "Deception",
        intimidation = "Intimidation",
        performance = "Performance",
        persuasion = "Persuasion"
    }
}

return Tables