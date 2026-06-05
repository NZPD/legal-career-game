-- GuildSystem.lua
-- Handles guilds, castles, and territory wars

local GuildSystem = {}

local Castles = {
    {id = 1, name = "Azure Castle", location = "North", defense = 100},
    {id = 2, name = "Crimson Fortress", location = "South", defense = 120},
    {id = 3, name = "Shadow Keep", location = "East", defense = 110},
    {id = 4, name = "Golden Palace", location = "West", defense = 130},
    {id = 5, name = "Dragon Spire", location = "Center", defense = 150}
}

local Guilds = {}

function GuildSystem.createGuild(name, leader)
    local guild = {
        id = #Guilds + 1,
        name = name,
        leader = leader,
        members = {leader},
        level = 1,
        treasury = 10000,
        territory = 0,
        castles = {},
        createdAt = os.time()
    }
    table.insert(Guilds, guild)
    
    print("\n" .. string.rep("=", 60))
    print("✅ GUILD CREATED: " .. name)
    print("Leader: " .. leader)
    print("Initial Treasury: $10000")
    print(string.rep("=", 60) .. "\n")
    
    return guild
end

function GuildSystem.addMember(guildId, player)
    if Guilds[guildId] then
        table.insert(Guilds[guildId].members, player)
        print("✅ " .. player .. " joined " .. Guilds[guildId].name)
        return true
    end
    return false
end

function GuildSystem.attackCastle(attackingGuild, defenderGuild, castleId)
    local castle = Castles[castleId]
    if not castle then return false end
    
    local attackPower = #attackingGuild.members * 50 + attackingGuild.level * 20
    local defensePower = castle.defense
    
    if defenderGuild then
        defensePower = defensePower + (#defenderGuild.members * 30)
    end
    
    local didWin = attackPower > defensePower
    
    print("\n" .. string.rep("=", 60))
    print("⚔️  GUILD BATTLE")
    print(string.rep("=", 60))
    print("Attacker: " .. attackingGuild.name)
    print("Attack Power: " .. attackPower)
    print("\nDefending: " .. castle.name)
    print("Defense Power: " .. defensePower)
    
    if didWin then
        print("\n🏆 VICTORY!")
        print(attackingGuild.name .. " captured " .. castle.name)
        table.insert(attackingGuild.castles, castle)
        attackingGuild.territory = attackingGuild.territory + 1
    else
        print("\n❌ DEFEAT")
        print("Defense held strong!")
    end
    
    print(string.rep("=", 60) .. "\n")
    return didWin
end

function GuildSystem.displayGuild(guild)
    print("\n" .. string.rep("=", 60))
    print("👑 GUILD INFORMATION")
    print(string.rep("=", 60))
    print("Name: " .. guild.name)
    print("Leader: " .. guild.leader)
    print("Members: " .. #guild.members)
    print("Level: " .. guild.level)
    print("Treasury: $" .. guild.treasury)
    print("Territory: " .. guild.territory)
    print("\nCastles:")
    for i, castle in ipairs(guild.castles) do
        print(i .. ". " .. castle.name)
    end
    print(string.rep("=", 60) .. "\n")
end

function GuildSystem.getCastles()
    return Castles
end

return GuildSystem