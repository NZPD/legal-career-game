-- GameHub.lua
-- Main game hub that lets players choose which game to play

local GameHub = {}
local Players = game:GetService("Players")

function GameHub.displayMainHub()
    print("\n" .. string.rep("=", 60))
    print("🎮 WELCOME TO GAME HUB 🎮")
    print(string.rep("=", 60))
    print("\nChoose a game to play:\n")
    
    print("1. ⚡ ELEMENT AWAKENING")
    print("   Discover random elemental powers and level them up")
    print("   - Fire, Void, Lightning, Ice, Earth, Wind")
    print("   - Unlock new abilities as you progress\n")
    
    print("2. 💵 KINGDOM CONQUEST")
    print("   Join a guild and fight for territory and castles")
    print("   - Capture and defend castles")
    print("   - Manage guild resources")
    print("   - Strategic warfare\n")
    
    print("3. 🎯 HUNTER ASSOCIATION")
    print("   Complete missions and rank up from F to S rank")
    print("   - Various mission types")
    print("   - Earn money and equipment")
    print("   - Advance your hunter career\n")
    
    print(string.rep("=", 60))
end

function GameHub.selectGame(gameNumber)
    if gameNumber == 1 then
        return "ElementAwakening"
    elseif gameNumber == 2 then
        return "KingdomConquest"
    elseif gameNumber == 3 then
        return "HunterAssociation"
    end
    return nil
end

return GameHub