# 🔧 Setup Instructions

## Quick Setup (5 Scripts)

### Step 1: Create Folder Structure
1. Open Roblox Studio
2. Create new place
3. In `ServerScriptService`, create folder named `Systems`

### Step 2: Add Scripts

In `ServerScriptService/Systems/`, create 5 scripts:

1. **PlayerManager.lua**
2. **GameSystem.lua**  
3. **CombatSystem.lua**
4. **MissionSystem.lua**
5. **GuildSystem.lua**

Copy code from ServerScripts/ folder

### Step 3: Add Main Script

In `ServerScriptService` (not in Systems):
- Create script named **Main.lua**
- Copy from StartupScript/

### Step 4: Test

Press F5 and check Output window

## File Structure

```
ServerScriptService/
├── Systems/
│   ├── PlayerManager
│   ├── GameSystem
│   ├── CombatSystem  
│   ├── MissionSystem
│   └── GuildSystem
└── Main
```

## What Each Script Does

**PlayerManager** - All player data, stats, progression  
**GameSystem** - Element awakening, abilities  
**CombatSystem** - Battles, combat calculations  
**MissionSystem** - Missions, ranks, rewards  
**GuildSystem** - Guilds, castles, territory  

## Test Mode

When you run the game, it displays:
- Player stats
- Available elements
- Sample missions
- Guild battles
