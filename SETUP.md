# 📋 Setup Guide - Legal Career Progression Game

## Prerequisites
- Roblox Studio installed
- Basic understanding of Roblox

## Step 1: Prepare Your Place
1. Open Roblox Studio
2. Create new place (File > New > Baseplate)
3. Save the place

## Step 2: Create GameSystems Folder
1. Expand **ServerScriptService**
2. Right-click → Insert Object → **Folder**
3. Rename to `GameSystems`

## Step 3: Add Server Scripts
In `ServerScriptService/GameSystems`, create these scripts:
1. **GameManager** (Script)
2. **ReputationSystem** (Script)
3. **FinanceSystem** (Script)
4. **CaseManager** (Script)

Copy content from ServerScripts/ folder

## Step 4: Add Main Script
In **ServerScriptService** (not in GameSystems):
1. Right-click → Insert Object → **Script**
2. Rename to `Main`
3. Copy from StartupScript/Main.lua

## Step 5: Add Tutorial Script
In **ServerScriptService**:
1. Right-click → Insert Object → **Script**
2. Rename to `JudicialSchool`
3. Copy from TutorialScripts/JudicialSchool.lua

## Step 6: Add Client Script
In **StarterPlayer/StarterPlayerScripts**:
1. Right-click → Insert Object → **LocalScript**
2. Rename to `LocalCaseUI`
3. Copy from ClientScripts/LocalCaseUI.lua

## Step 7: Add Config
In **ReplicatedStorage**:
1. Right-click → Insert Object → **ModuleScript**
2. Rename to `GameConfig`
3. Copy from Config/GameConfig.lua

## Step 8: Test
1. Press **F5** or click **Run**
2. Check Output window
3. Look for initialization messages

## Folder Structure

```
ServerScriptService/
├── GameSystems/
│   ├── GameManager
│   ├── ReputationSystem
│   ├── FinanceSystem
│   └── CaseManager
├── Main
└── JudicialSchool

StarterPlayer/
└── StarterPlayerScripts/
    └── LocalCaseUI

ReplicatedStorage/
└── GameConfig
```

## Playing
1. Game loads and tutorial begins
2. Complete Judicial School
3. Take cases
4. Build reputation and money
5. Progress through career stages
6. Become Supreme Court Justice!