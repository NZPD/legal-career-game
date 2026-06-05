-- JudicialSchool.lua
local JudicialSchool = {}
JudicialSchool.__index = JudicialSchool

function JudicialSchool.new(playerData)
    local self = setmetatable({}, JudicialSchool)
    self.playerData = playerData
    self.lessonsCompleted = 0
    self.totalLessons = 5
    return self
end

function JudicialSchool:startTutorial()
    print("\n" .. string.rep("=", 50))
    print("🎓 WELCOME TO JUDICIAL SCHOOL 🎓")
    print("=", 50))
    print("\nComplete this mandatory training!")
    print("\n📚 LESSONS:")
    print("1. Legal Ethics & Professional Responsibility")
    print("2. Understanding the Court System")
    print("3. Case Preparation Fundamentals")
    print("4. Courtroom Procedure")
    print("5. Your First Case")
    print(string.rep("=", 50))
    
    self:runLessons()
end

function JudicialSchool:runLessons()
    local lessons = {
        "Legal Ethics & Professional Responsibility",
        "Understanding the Court System",
        "Case Preparation Fundamentals",
        "Courtroom Procedure",
        "Your First Case"
    }
    
    for i, lessonName in ipairs(lessons) do
        self:completeLesson(i, lessonName)
        wait(1)
    end
end

function JudicialSchool:completeLesson(lessonNumber, lessonName)
    print("\n📚 Lesson " .. lessonNumber .. "/" .. self.totalLessons .. ": " .. lessonName)
    
    self.lessonsCompleted = self.lessonsCompleted + 1
    self.playerData.money = self.playerData.money + 1000
    print("✅ Complete! +$1,000")
    
    if self.lessonsCompleted == self.totalLessons then
        self:completeTutorial()
    end
end

function JudicialSchool:completeTutorial()
    print("\n" .. string.rep("=", 50))
    print("✅ CONGRATULATIONS! 🎉")
    print(string.rep("=", 50))
    print("\nYou completed Judicial School!")
    print("\nRewards:")
    print("• $5,000 Starting Capital")
    print("• Access to Case System")
    print("• Career Path Unlocked")
    print("\nYour career as an Intern begins!")
    print(string.rep("=", 50) .. "\n")
    
    self.playerData.completedTutorial = true
    self.playerData.money = self.playerData.money + 5000
end

return JudicialSchool