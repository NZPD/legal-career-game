-- PlayerManager.lua
-- Handles all player data and stats

local PlayerManager = {}
PlayerManager.__index = PlayerManager

function PlayerManager.new(player)
    local self = setmetatable({}, PlayerManager)
    self.player = player
    self.name = player.Name
    self.userId = player.UserId
    
    -- Element System
    self.element = nil
    self.elementLevel = 1
    self.elementExp = 0
    self.abilities = {}
    self.skillPoints = 0
    
    -- Combat Stats
    self.health = 100
    self.mana = 100
    self.attack = 10
    self.defense = 5
    self.speed = 10
    
    -- Progression
    self.totalLevel = 1
    self.totalExp = 0
    self.money = 5000
    
    -- Hunter Association
    self.hunterRank = "F"
    self.hunterExp = 0
    self.missionsCompleted = 0
    
    -- Kingdom Conquest
    self.guildId = nil
    self.guildRank = "Member"
    self.territory = 0
    
    -- Equipment
    self.weapon = "Iron Sword"
    self.armor = "Leather Armor"
    self.accessories = {}
    
    return self
end

function PlayerManager:awakenElement()
    local elements = {"Fire", "Void", "Lightning", "Ice", "Earth", "Wind"}
    self.element = elements[math.random(#elements)]
    print("\n✨ " .. self.name .. " AWAKENED WITH: " .. self.element)
    return self.element
end

function PlayerManager:gainExp(amount, source)
    self.totalExp = self.totalExp + amount
    self.elementExp = self.elementExp + amount
    
    if self.totalExp >= self.totalLevel * 100 then
        self.totalLevel = self.totalLevel + 1
        self.totalExp = self.totalExp - (self.totalLevel * 100)
        self.health = self.health + 10
        self.mana = self.mana + 5
        self.attack = self.attack + 1
        print("\n⬆️  LEVEL UP! Now level " .. self.totalLevel)
    end
    
    if self.elementExp >= self.elementLevel * 100 then
        self.elementLevel = self.elementLevel + 1
        self.elementExp = self.elementExp - (self.elementLevel * 100)
        self.skillPoints = self.skillPoints + 2
        print("\n⚡ ELEMENT LEVEL UP! " .. self.element .. " is now level " .. self.elementLevel)
    end
end

function PlayerManager:addMoney(amount)
    self.money = self.money + amount
    return self.money
end

function PlayerManager:spendMoney(amount)
    if self.money >= amount then
        self.money = self.money - amount
        return true
    end
    return false
end

function PlayerManager:advanceHunterRank()
    local ranks = {"F", "D", "C", "B", "A", "S"}
    local index = table.find(ranks, self.hunterRank)
    if index and index < #ranks then
        self.hunterRank = ranks[index + 1]
        print("\n🏅 RANK UP! Hunter Rank: " .. self.hunterRank)
        return true
    end
    return false
end

function PlayerManager:displayStats()
    print("\n" .. string.rep("=", 60))
    print("👤 PLAYER PROFILE - " .. self.name)
    print(string.rep("=", 60))
    
    print("\n⚡ ELEMENT SYSTEM")
    print("Element: " .. (self.element or "Not Awakened"))
    print("Element Level: " .. self.elementLevel)
    print("Element Exp: " .. self.elementExp .. " / " .. (self.elementLevel * 100))
    print("Skill Points: " .. self.skillPoints)
    
    print("\n📊 STATS")
    print("Level: " .. self.totalLevel)
    print("Experience: " .. self.totalExp .. " / " .. (self.totalLevel * 100))
    print("Health: " .. self.health)
    print("Mana: " .. self.mana)
    print("Attack: " .. self.attack)
    print("Defense: " .. self.defense)
    print("Speed: " .. self.speed)
    
    print("\n💰 RESOURCES")
    print("Money: $" .. self.money)
    print("Weapon: " .. self.weapon)
    print("Armor: " .. self.armor)
    
    print("\n🏹 HUNTER ASSOCIATION")
    print("Rank: " .. self.hunterRank)
    print("Missions Completed: " .. self.missionsCompleted)
    print("Hunter Exp: " .. self.hunterExp)
    
    print("\n👑 KINGDOM CONQUEST")
    print("Guild: " .. (self.guildId or "None"))
    print("Guild Rank: " .. self.guildRank)
    print("Territory: " .. self.territory)
    
    print(string.rep("=", 60) .. "\n")
end

return PlayerManager