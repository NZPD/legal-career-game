-- CombatSystem.lua
-- Handles battles and combat calculations

local CombatSystem = {}

function CombatSystem.calculateDamage(attacker, defender, ability)
    local baseDamage = ability.damage or 50
    local attackerAttack = attacker.attack * (1 + attacker.elementLevel * 0.1)
    local defenderDefense = defender.defense * 0.8
    
    local finalDamage = math.max(1, baseDamage + attackerAttack - defenderDefense)
    local variance = math.random(80, 120) / 100
    
    return math.floor(finalDamage * variance)
end

function CombatSystem.simulateBattle(attacker, defender, abilityName)
    print("\n" .. string.rep("=", 60))
    print("⚔️  BATTLE")
    print(string.rep("=", 60))
    print(attacker.name .. " (" .. attacker.element .. ")") 
    print("vs")
    print(defender.name .. " (" .. (defender.element or "Unknown") .. ")")
    
    local attackerHealth = attacker.health
    local defenderHealth = defender.health
    
    -- Find ability
    local ability = nil
    for _, ab in ipairs(attacker.abilities) do
        if ab.name == abilityName then
            ability = ab
            break
        end
    end
    
    if not ability then
        print("\n❌ Ability not found!")
        return false
    end
    
    -- Calculate damage
    local damage = CombatSystem.calculateDamage(attacker, defender, ability)
    defenderHealth = defenderHealth - damage
    
    print("\n" .. attacker.name .. " uses " .. ability.name)
    print("Damage dealt: " .. damage)
    print("\nDefender health: " .. math.max(0, defenderHealth))
    
    if defenderHealth <= 0 then
        print("\n🏆 " .. attacker.name .. " WINS!")
        attacker:gainExp(100, "battle")
        attacker:addMoney(200)
        print("Rewards: +100 Exp, +$200")
        return true
    else
        print("\n❌ " .. attacker.name .. " lost")
        return false
    end
    
    print(string.rep("=", 60) .. "\n")
end

return CombatSystem