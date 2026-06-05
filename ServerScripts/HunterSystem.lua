-- HunterSystem.lua
-- Manages hunter missions and ranking

local HunterSystem = {}

local Missions = {
    {id = 1, rank = "F", title = "Forest Patrol", description = "Patrol the forest for signs of beasts", reward = 100, exp = 50},
    {id = 2, rank = "F", title = "Gather Herbs", description = "Collect medicinal herbs", reward = 80, exp = 40},
    {id = 3, rank = "F", title = "Clear Rats", description = "Clear rats from the village cellar", reward = 120, exp = 60},
    
    {id = 4, rank = "D", title = "Wolf Hunt", description = "Hunt wolves in the northern woods", reward = 300, exp = 150},
    {id = 5, rank = "D", title = "Escort Merchant", description = "Escort a merchant to the next town", reward = 250, exp = 120},
    {id = 6, rank = "D", title = "Rescue Missing Person", description = "Find a missing villager", reward = 400, exp = 200},
    
    {id = 7, rank = "C", title = "Dungeon Exploration", description = "Explore and clear the abandoned dungeon", reward = 800, exp = 400},
    {id = 8, rank = "C", title = "Beast Slaying", description = "Hunt a dangerous beast threatening the region", reward = 1000, exp = 500},
    {id = 9, rank = "C", title = "Guard Caravan", description = "Protect a caravan from bandits", reward = 600, exp = 300},
    
    {id = 10, rank = "B", title = "Monster Nest Destruction", description = "Destroy a monster nest", reward = 2000, exp = 1000},
    {id = 11, rank = "B", title = "Dragon Sighting", description = "Investigate dragon sightings", reward = 2500, exp = 1200},
    {id = 12, rank = "B", title = "Demon Subjugation", description = "Defeat demons terrorizing a town", reward = 3000, exp = 1500},
    
    {id = 13, rank = "A", title = "Ancient Curse", description = "Break an ancient curse", reward = 5000, exp = 2500},
    {id = 14, rank = "A", title = "Cryptid Hunt", description = "Hunt a legendary cryptid", reward = 6000, exp = 3000},
    {id = 15, rank = "A", title = "Dark Ritual Stop", description = "Stop a dark ritual", reward = 7000, exp = 3500},
    
    {id = 16, rank = "S", title = "Demon Lord Battle", description = "Defeat the Demon Lord", reward = 10000, exp = 5000},
    {id = 17, rank = "S", title = "Gods' Challenge", description = "Survive challenges from the gods", reward = 15000, exp = 7500},
    {id = 18, rank = "S", title = "World Salvation", description = "Save the world from destruction", reward = 20000, exp = 10000}
}

local RankRequirements = {
    F = 0,
    D = 500,
    C = 2000,
    B = 5000,
    A = 10000,
    S = 20000
}

function HunterSystem.getMissionsForRank(rank)
    local missions = {}
    for _, mission in ipairs(Missions) do
        if mission.rank == rank then
            table.insert(missions, mission)
        end
    end
    return missions
end

function HunterSystem.completeMission(playerData, missionId)
    for _, mission in ipairs(Missions) do
        if mission.id == missionId then
            playerData.money = playerData.money + mission.reward
            playerData.hunterExp = playerData.hunterExp + mission.exp
            playerData.missionsCompleted = playerData.missionsCompleted + 1
            
            print("\n🎉 MISSION COMPLETE!")
            print("Reward: $" .. mission.reward)
            print("Experience: " .. mission.exp)
            
            -- Check for rank up
            if playerData.hunterExp >= RankRequirements["S"] then
                if playerData:advanceHunterRank() then
                    print("⭐ RANK UP! New rank: " .. playerData.hunterRank)
                end
            end
            
            return true
        end
    end
    return false
end

function HunterSystem.displayAvailableMissions(rank)
    local missions = HunterSystem.getMissionsForRank(rank)
    
    print("\n" .. string.rep("=", 50))
    print("🎯 RANK " .. rank .. " MISSIONS")
    print(string.rep("=", 50))
    
    for i, mission in ipairs(missions) do
        print(i .. ". " .. mission.title)
        print("   " .. mission.description)
        print("   Reward: $" .. mission.reward .. " | Exp: " .. mission.exp)
    end
    print(string.rep("=", 50) .. "\n")
end

return HunterSystem