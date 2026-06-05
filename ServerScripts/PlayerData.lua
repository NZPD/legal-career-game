-- PlayerData.lua
-- Manages player data for all three games

local PlayerData = {}
PlayerData.__index = PlayerData

function PlayerData.new(player)
    local self = setmetatable({}, PlayerData)
    self.player = player
    self.userId = player.UserId
    self.name = player.Name
    
    -- Element Awakening data
    self.element = nil
    self.elementLevel = 1
    self.elementExp = 0
    self.abilities = {}
    self.skillPoints = 0
    
    -- Kingdom Conquest data
    self.guildId = nil
    self.guildRank = "Member"
    self.territory = 0
    self.castles = {}
    self.resources = {
        gold = 1000,
        ore = 100,
        wood = 100,
        food = 100
    }
    
    -- Hunter Association data
    self.hunterRank = "F"
    self.hunterExp = 0
    self.missionsCompleted = 0
    self.money = 5000
    self.equipment = {
        weapon = "Iron Sword",
        armor = "Leather Armor",
        accessories = {}
    }
    
    return self
end

function PlayerData:awakeneElement()
    local elements = {"Fire", "Void", "Lightning", "Ice", "Earth", "Wind"}
    self.element = elements[math.random(#elements)]
    print(player.Name .. " awakened element: " .. self.element)
    return self.element
end

function PlayerData:gainElementExp(amount)
    self.elementExp = self.elementExp + amount
    local expRequired = self.elementLevel * 100
    
    if self.elementExp >= expRequired then
        self.elementLevel = self.elementLevel + 1
        self.elementExp = self.elementExp - expRequired
        self.skillPoints = self.skillPoints + 2
        return true
    end
    return false
end

function PlayerData:addResources(resourceType, amount)
    if self.resources[resourceType] then
        self.resources[resourceType] = self.resources[resourceType] + amount
        return true
    end
    return false
end

function PlayerData:removeResources(resourceType, amount)
    if self.resources[resourceType] and self.resources[resourceType] >= amount then
        self.resources[resourceType] = self.resources[resourceType] - amount
        return true
    end
    return false
end

function PlayerData:advanceHunterRank()
    local ranks = {"F", "D", "C", "B", "A", "S"}
    local currentIndex = table.find(ranks, self.hunterRank)
    
    if currentIndex and currentIndex < #ranks then
        self.hunterRank = ranks[currentIndex + 1]
        return true
    end
    return false
end

function PlayerData:displayStats()
    print("\n" .. string.rep("=", 50))
    print("📊 PLAYER STATISTICS")
    print(string.rep("=", 50))
    print("Name: " .. self.name)
    
    if self.element then
        print("\n⚡ ELEMENT AWAKENING")
        print("Element: " .. self.element)
        print("Level: " .. self.elementLevel)
        print("Experience: " .. self.elementExp .. " / " .. (self.elementLevel * 100))
        print("Skill Points: " .. self.skillPoints)
    end
    
    print("\n📚 HUNTER ASSOCIATION")
    print("Hunter Rank: " .. self.hunterRank)
    print("Missions Completed: " .. self.missionsCompleted)
    print("Money: $" .. self.money)
    print("Equipment: " .. self.equipment.weapon)
    
    print("\n💵 KINGDOM CONQUEST")
    print("Guild: " .. (self.guildId or "None"))
    print("Territory: " .. self.territory)
    print("Resources - Gold: " .. self.resources.gold .. " | Ore: " .. self.resources.ore)
    
    print(string.rep("=", 50) .. "\n")
end

return PlayerData