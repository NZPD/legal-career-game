-- GameSystem.lua
-- Handles element system, abilities, and core mechanics

local GameSystem = {}

local ElementData = {
    Fire = {
        color = Color3.fromRGB(255, 100, 0),
        abilities = {
            {name = "Fireball", level = 1, damage = 50, cost = 20},
            {name = "Inferno", level = 10, damage = 150, cost = 50},
            {name = "Meteor Storm", level = 25, damage = 300, cost = 100}
        }
    },
    Void = {
        color = Color3.fromRGB(50, 0, 100),
        abilities = {
            {name = "Shadow Bolt", level = 1, damage = 45, cost = 20},
            {name = "Void Rift", level = 10, damage = 120, cost = 50},
            {name = "Abyssal Drain", level = 25, damage = 250, cost = 100}
        }
    },
    Lightning = {
        color = Color3.fromRGB(255, 255, 0),
        abilities = {
            {name = "Lightning Bolt", level = 1, damage = 55, cost = 20},
            {name = "Chain Lightning", level = 10, damage = 140, cost = 50},
            {name = "Thunderstorm", level = 25, damage = 280, cost = 100}
        }
    },
    Ice = {
        color = Color3.fromRGB(100, 200, 255),
        abilities = {
            {name = "Frost Bolt", level = 1, damage = 40, cost = 15},
            {name = "Blizzard", level = 10, damage = 110, cost = 45},
            {name = "Absolute Zero", level = 25, damage = 200, cost = 90}
        }
    },
    Earth = {
        color = Color3.fromRGB(139, 69, 19),
        abilities = {
            {name = "Stone Shield", level = 1, defense = 50, cost = 15},
            {name = "Earth Armor", level = 10, defense = 150, cost = 40},
            {name = "Continental Guard", level = 25, defense = 300, cost = 80}
        }
    },
    Wind = {
        color = Color3.fromRGB(100, 200, 150),
        abilities = {
            {name = "Wind Slash", level = 1, damage = 35, cost = 15},
            {name = "Tornado", level = 10, damage = 100, cost = 40},
            {name = "Tempest", level = 25, damage = 220, cost = 85}
        }
    }
}

function GameSystem.getElement(name)
    return ElementData[name]
end

function GameSystem.getAbilities(element, level)
    local elem = ElementData[element]
    if not elem then return {} end
    
    local unlocked = {}
    for _, ability in ipairs(elem.abilities) do
        if level >= ability.level then
            table.insert(unlocked, ability)
        end
    end
    return unlocked
end

function GameSystem.displayElements()
    print("\n" .. string.rep("=", 60))
    print("⚡ AVAILABLE ELEMENTS")
    print(string.rep("=", 60))
    
    for name, data in pairs(ElementData) do
        print("\n" .. name .. ":")
        print("  Abilities:")
        for i, ability in ipairs(data.abilities) do
            print("  " .. i .. ". " .. ability.name .. " (Lvl " .. ability.level .. ")")
        end
    end
    print(string.rep("=", 60) .. "\n")
end

function GameSystem.learnAbility(player, abilityName)
    local elem = ElementData[player.element]
    if not elem then return false end
    
    for _, ability in ipairs(elem.abilities) do
        if ability.name == abilityName then
            if player.elementLevel >= ability.level then
                table.insert(player.abilities, ability)
                print("\n📚 Learned ability: " .. abilityName)
                return true
            end
        end
    end
    return false
end

return GameSystem