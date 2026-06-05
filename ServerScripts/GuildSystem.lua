-- GuildSystem.lua
-- Manages guild and kingdom conquest mechanics

local GuildSystem = {}

local Castles = {
    {id = 1, name = "Azure Castle", location = "North", defensePower = 100},
    {id = 2, name = "Crimson Fortress", location = "South", defensePower = 120},
    {id = 3, name = "Shadow Keep", location = "East", defensePower = 110},
    {id = 4, name = "Golden Palace", location = "West", defensePower = 130},
    {id = 5, name = "Dragon Spire", location = "Center", defensePower = 150}
}

function GuildSystem.createGuild(guildName, leader)
    local guild = {
        name = guildName,
        leader = leader,
        members = {leader},
        level = 1,
        treasury = 10000,
        territory = 0,
        castles = {},
        createdAt = os.time()
    }
    
    print("\n✅ Guild created: " .. guildName)
    print("Leader: " .. leader)
    print("Initial treasury: $10000")
    
    return guild
end

function GuildSystem.addMember(guild, player)
    table.insert(guild.members, player)
    print("✓ " .. player .. " joined guild " .. guild.name)
end

function GuildSystem.attackCastle(attackingGuild, defendingGuild, castleId)
    local castle = nil
    
    for _, c in ipairs(Castles) do
        if c.id == castleId then
            castle = c
            break
        end
    end
    
    if not castle then return false end
    
    local attackPower = #attackingGuild.members * 50
    local defensePower = castle.defensePower
    if defendingGuild then
        defensePower = defensePower + (#defendingGuild.members * 30)
    end
    
    local didAttackerWin = attackPower > defensePower
    
    print("\n" .. string.rep("=", 50))
    print("⚡ BATTLE RESULTS")
    print(string.rep("=", 50))
    print("Attacker: " .. attackingGuild.name)
    print("Attack Power: " .. attackPower)
    print("\nDefense Power: " .. defensePower)
    
    if didAttackerWin then
        print("\n🎉 VICTORY! " .. attackingGuild.name .. " captured " .. castle.name)
        table.insert(attackingGuild.castles, castle)
        attackingGuild.territory = attackingGuild.territory + 1
    else
        print("\n😞 DEFEAT! " .. castle.name .. " is too well defended")
    end
    
    print(string.rep("=", 50) .. "\n")
    return didAttackerWin
end

function GuildSystem.displayGuildStats(guild)
    print("\n" .. string.rep("=", 50))
    print("💵 GUILD INFORMATION")
    print(string.rep("=", 50))
    print("Name: " .. guild.name)
    print("Leader: " .. guild.leader)
    print("Members: " .. #guild.members)
    print("Level: " .. guild.level)
    print("Treasury: $" .. guild.treasury)
    print("Territory: " .. guild.territory)
    print("\nCastles:")
    for i, castle in ipairs(guild.castles) do
        print(i .. ". " .. castle.name .. " (" .. castle.location .. ")")
    end
    print(string.rep("=", 50) .. "\n")
end

return GuildSystem