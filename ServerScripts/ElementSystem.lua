-- ElementSystem.lua
-- Manages elemental powers and abilities

local ElementSystem = {}

local Elements = {
    Fire = {
        description = "High damage, area attacks",
        abilities = {
            {name = "Fireball", level = 1, damage = 50, manaCost = 20},
            {name = "Inferno", level = 10, damage = 150, manaCost = 50},
            {name = "Fire Storm", level = 25, damage = 300, manaCost = 100}
        }
    },
    Void = {
        description = "Dark magic, life steal",
        abilities = {
            {name = "Shadow Bolt", level = 1, damage = 45, lifeSteal = 0.3},
            {name = "Void Rift", level = 10, damage = 120, lifeSteal = 0.5},
            {name = "Abyssal Drain", level = 25, damage = 250, lifeSteal = 0.7}
        }
    },
    Lightning = {
        description = "Fast attacks, chain damage",
        abilities = {
            {name = "Lightning Bolt", level = 1, damage = 55, chainTargets = 2},
            {name = "Chain Lightning", level = 10, damage = 140, chainTargets = 4},
            {name = "Thunderstorm", level = 25, damage = 280, chainTargets = 6}
        }
    },
    Ice = {
        description = "Freeze effects, crowd control",
        abilities = {
            {name = "Frost Bolt", level = 1, damage = 40, freezeDuration = 1},
            {name = "Blizzard", level = 10, damage = 110, freezeDuration = 3},
            {name = "Absolute Zero", level = 25, damage = 200, freezeDuration = 5}
        }
    },
    Earth = {
        description = "Defense, shields",
        abilities = {
            {name = "Stone Shield", level = 1, defense = 50},
            {name = "Earth Armor", level = 10, defense = 150},
            {name = "Continental Guard", level = 25, defense = 300}
        }
    },
    Wind = {
        description = "Speed, evasion",
        abilities = {
            {name = "Wind Slash", level = 1, damage = 35, speed = 1.5},
            {name = "Tornado", level = 10, damage = 100, speed = 2.0},
            {name = "Tempest", level = 25, damage = 220, speed = 3.0}
        }
    }
}

function ElementSystem.getElementInfo(elementName)
    return Elements[elementName]
end

function ElementSystem.getAbilitiesForLevel(elementName, level)
    local element = Elements[elementName]
    if not element then return {} end
    
    local unlockedAbilities = {}
    for _, ability in ipairs(element.abilities) do
        if level >= ability.level then
            table.insert(unlockedAbilities, ability)
        end
    end
    return unlockedAbilities
end

function ElementSystem.displayElement(elementName)
    local element = Elements[elementName]
    if not element then return end
    
    print("\n" .. string.rep("=", 50))
    print("⚡ " .. elementName:upper() .. " ELEMENT")
    print(string.rep("=", 50))
    print(element.description)
    print("\nAbilities:")
    for i, ability in ipairs(element.abilities) do
        print(i .. ". " .. ability.name .. " (Unlocks at Level " .. ability.level .. ")")
    end
    print(string.rep("=", 50) .. "\n")
end

return ElementSystem