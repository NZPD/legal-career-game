# Installation Guide

## Prerequisites
- Roblox Studio
- Basic understanding of scripts

## Step 1: Create Game Systems Folder
1. Open Roblox Studio
2. Create new place
3. In ServerScriptService, create a Folder named "GameSystems"

## Step 2: Add Server Scripts

In `ServerScriptService/GameSystems/`, create these scripts:

1. **PlayerData** - Manages all player data
2. **ElementSystem** - Element powers system
3. **HunterSystem** - Hunter missions and ranking
4. **GuildSystem** - Guild and kingdom conquest
5. **GameHub** - Main game hub menu

Copy the corresponding Lua code from the ServerScripts/ folder into each.

## Step 3: Add Main Script

In `ServerScriptService` (not in GameSystems):
1. Create Script named "Main"
2. Copy content from StartupScript/Main.lua

## Step 4: Test

1. Press F5 to run
2. Check Output window
3. You should see demo output showing all systems

## Game Selection

When players join, they can choose:
- **Element Awakening** - Elemental powers
- **Kingdom Conquest** - Guild warfare
- **Hunter Association** - Mission-based progression

## Features

### Element Awakening
- 6 random elements
- Level-up system
- Ability unlocking
- Skill points

### Kingdom Conquest
- Guild creation
- Territory control
- Castle battles
- Resource management

### Hunter Association
- F to S rank progression
- 18 different missions
- Money and equipment
- Experience rewards

## Folder Structure

```
ServerScriptService/
├── GameSystems/
│   ├── PlayerData
│   ├── ElementSystem
│   ├── HunterSystem
│   ├── GuildSystem
│   └── GameHub
└── Main
```
