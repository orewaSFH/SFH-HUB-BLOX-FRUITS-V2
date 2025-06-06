local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "SFHHUB"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Name = "MainFrame"
MainFrame.Active = true
MainFrame.Draggable = true

local CloseButton = Instance.new("TextButton", MainFrame)
CloseButton.Text = "X"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local MinimizeButton = Instance.new("TextButton", MainFrame)
MinimizeButton.Text = "-"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -70, 0, 5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    for _, v in pairs(MainFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") and v ~= CloseButton and v ~= MinimizeButton then
            v.Visible = not isMinimized
        end
    end
end)

local tabButtons = Instance.new("Frame", MainFrame)
tabButtons.Size = UDim2.new(0, 120, 1, -40)
tabButtons.Position = UDim2.new(0, 0, 0, 40)
tabButtons.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local tabContents = Instance.new("Frame", MainFrame)
tabContents.Position = UDim2.new(0, 120, 0, 40)
tabContents.Size = UDim2.new(1, -120, 1, -40)
tabContents.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local tabs = {}
function createTab(name)
    local button = Instance.new("TextButton", tabButtons)
    button.Text = name
    button.Size = UDim2.new(1, 0, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)

    local content = Instance.new("Frame", tabContents)
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.Visible = false

    button.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabContents:GetChildren()) do
            tab.Visible = false
        end
        content.Visible = true
    end)

    tabs[name] = content
    return content
end

function createFeature(tab, label, callback)
    local btn = Instance.new("TextButton", tab)
    btn.Text = label
    btn.Size = UDim2.new(1, -10, 0, 30)
    btn.Position = UDim2.new(0, 5, 0, #tab:GetChildren() * 35)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.MouseButton1Click:Connect(callback)
end

-- Tabs
local mainTab = createTab("Main")
local questTab = createTab("Quest")
local itemsTab = createTab("Items")
local shopTab = createTab("Shop")
local masteryTab = createTab("Mastery")
local materialTab = createTab("Materials")
local pvpTab = createTab("PvP")
local raceTab = createTab("Race")
local espTab = createTab("ESP")

-- Features Main
createFeature(mainTab, "Auto Farm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20AutoFarm"))()
end)

-- Features Quest
createFeature(questTab, "Auto Quest", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20AutoQuest"))()
end)

-- Features Items
createFeature(itemsTab, "Do All Item Quests", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20ItemQuests"))()
end)

-- Features Shop
createFeature(shopTab, "Buy Fighting Styles", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20BuyStyles"))()
end)

-- Features Mastery
createFeature(masteryTab, "Auto Mastery Farm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20AutoMastery"))()
end)

-- Features Materials
createFeature(materialTab, "Auto Material Farm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20AutoMaterial"))()
end)

-- Features PvP
createFeature(pvpTab, "Enable PvP Features", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20PvP"))()
end)

-- Features Race
createFeature(raceTab, "Auto V2 / V3 / V4", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20Race"))()
end)

-- Features ESP
createFeature(espTab, "Enable ESP (try)", function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/All-Scripts/main/BF%20ESP"))()
    end)
end)
