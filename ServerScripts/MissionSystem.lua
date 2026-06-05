-- MissionSystem.lua
-- Handles missions and hunter rank progression

local MissionSystem = {}

local Missions = {
    F = {
        {id = 1, name = "Forest Patrol", desc = "Patrol for beasts", reward = 100, exp = 50},
        {id = 2, name = "Gather Herbs", desc = "Collect medicinal herbs", reward = 80, exp = 40},
        {id = 3, name = "Clear Rats", desc = "Clear rats from cellar", reward = 120, exp = 60}
    },
    D = {
        {id = 4, name = "Wolf Hunt", desc = "Hunt wolves", reward = 300, exp = 150},
        {id = 5, name = "Escort Merchant", desc = "Protect merchant", reward = 250, exp = 120},
        {id = 6, name = "Rescue Mission", desc = "Save missing person", reward = 400, exp = 200}
    },
    C = {
        {id = 7, name = "Dungeon Clear", desc = "Clear abandoned dungeon", reward = 800, exp = 400},
        {id = 8, name = "Beast Slaying", desc = "Hunt dangerous beast", reward = 1000, exp = 500},
        {id = 9, name = "Guard Caravan", desc = "Protect supply caravan", reward = 600, exp = 300}
    },
    B = {
        {id = 10, name = "Monster Nest", desc = "Destroy monster nest", reward = 2000, exp = 1000},
        {id = 11, name = "Dragon Investigation", desc = "Investigate dragons", reward = 2500, exp = 1200},
        {id = 12, name = "Demon Fight", desc = "Defeat demons", reward = 3000, exp = 1500}
    },
    A = {
        {id = 13, name = "Ancient Curse", desc = "Break ancient curse", reward = 5000, exp = 2500},
        {id = 14, name = "Cryptid Hunt", desc = "Hunt cryptid", reward = 6000, exp = 3000},
        {id = 15, name = "Dark Ritual", desc = "Stop dark ritual", reward = 7000, exp = 3500}
    },
    S = {
        {id = 16, name = "Demon Lord", desc = "Defeat Demon Lord", reward = 10000, exp = 5000},
        {id = 17, name = "Gods Challenge", desc = "Challenge the gods", reward = 15000, exp = 7500},
        {id = 18, name = "World Salvation", desc = "Save the world", reward = 20000, exp = 10000}
    }
}

local RankExp = {F = 0, D = 500, C = 2000, B = 5000, A = 10000, S = 20000}

function MissionSystem.getMissions(rank)
    return Missions[rank] or {}
end

function MissionSystem.completeMission(player, missionId)
    local missions = Missions[player.hunterRank]
    
    for _, mission in ipairs(missions) do
        if mission.id == missionId then
            player:addMoney(mission.reward)
            player:gainExp(mission.exp, "mission")
            player.hunterExp = player.hunterExp + mission.exp
            player.missionsCompleted = player.missionsCompleted + 1
            
            print("\n" .. string.rep("=", 60))
            print("✅ MISSION COMPLETE: " .. mission.name)
            print("Reward: $" .. mission.reward)
            print("Experience: " .. mission.exp)
            print(string.rep("=", 60) .. "\n")
            
            -- Check rank up
            for rank, reqExp in pairs(RankExp) do
                if player.hunterExp >= reqExp and rank ~= "S" then
                    if player:advanceHunterRank() then
                        break
                    end
                end
            end
            
            return true
        end
    end
    return false
end

function MissionSystem.displayMissions(rank)
    local missions = Missions[rank] or {}
    
    print("\n" .. string.rep("=", 60))
    print("🏹 RANK " .. rank .. " MISSIONS")
    print(string.rep("=", 60))
    
    for i, mission in ipairs(missions) do
        print(i .. ". " .. mission.name)
        print("   " .. mission.desc)
        print("   Reward: $" .. mission.reward .. " | Exp: " .. mission.exp)
    end
    print(string.rep("=", 60) .. "\n")
end

return MissionSystem