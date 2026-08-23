--//============ ANTI RE-EXECUTION & TELEPORT QUEUE ============//--
-- Manual-only mode: set getgenv().NoAutoExecute = true before executing this script.
-- Skips re-exec guard and teleport auto-run so you can execute the loader again without rejoining.
local NoAutoExecute = false
pcall(function()
    if getgenv and getgenv() and getgenv().NoAutoExecute == true then
        NoAutoExecute = true
    end
end)

if not NoAutoExecute then
    if getgenv().AlreadyExecutedTheIntruders then return end
    getgenv().AlreadyExecutedTheIntruders = true

    task.spawn(function()
        local _queue_on_teleport = queue_on_teleport or queueonteleport

        if _queue_on_teleport then
            pcall(function()
                _queue_on_teleport(
                    'loadstring(game:HttpGet("https://raw.githubusercontent.com/BestProgramerf/The-Intruders/refs/heads/main/script.lua"))()')
            end)
        end
    end)
end
--//============ END ANTI RE-EXECUTION & TELEPORT QUEUE ============//--

repeat
    task.wait()
until game:IsLoaded()

--//============ UNC TEST CONFIGURATION ============//--
-- Set FAKE_UNC_TEST to true to force the UNC warning to appear (for testing)
-- When enabled, executing the script will always show the warning UI
local FAKE_UNC_TEST = false
-- Alternative: Run  getgenv().FORCE_UNC_WARNING = true  before executing this script
--//============================================//--

local scriptBaseUrl = "https://api.luarmor.net/files/v3/loaders/"

local games = {
    -- Part 4: TapSimulator, ADS, BladeBall, TheForge, WFS, FishIt, AnimeFishingOdyssey
    ADS = {
        gameID = 2655311011,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    aNIMElEGACY = {
        gameID = 4844706238,
        scriptId = "628be512160a9e618f927c85963bbcd1",
    },
    PunshWallSimulator = {
        gameID = 4498728505,
        scriptId = "",
    },
    ACS = {
        gameID = 4280746206,
        scriptId = "4f5eb437a694518fd3ea9d5d7136a05a",
    },
    -- Part 4
    WFS = {
        gameID = 3262314006,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 2
    AnimeEternal = {
        gameID = 7882829745,
        scriptId = "4f5eb437a694518fd3ea9d5d7136a05a",
    },
    -- Part 1
    RebirthChampionsUltimate = {
        gameID = 7178032757,
        scriptId = "e2916767e617f901b150d4de88f4761c",
    },
    AnimeExpeditions = {
        gameID = 7613921865,
        placeId = 84515722934860,
        scriptId = "e2916767e617f901b150d4de88f4761c",
    },
    -- Part 6
    CatchaMonster = {
        gameID = 9141743926,
        scriptId = "879ef174bb3e29652467ea4e8817cddd",
    },
    Evomon = {
        gameID = 9826885587,
        scriptId = "879ef174bb3e29652467ea4e8817cddd",
    },
    Gakuran = {
        gameID = 9199655655,
        placeId = 128736949265057,
        scriptId = "879ef174bb3e29652467ea4e8817cddd",
    },
    -- Part 2
    AnimeCrusaders = {
        gameID = 7660436108,
        scriptId = "4f5eb437a694518fd3ea9d5d7136a05a",
    },
    -- Part 2
    EmergencyHamburg = {
        gameID = 2992873140,
        scriptId = "4f5eb437a694518fd3ea9d5d7136a05a",
    },
    -- Part 2
    AnimeApocalypse = {
        gameID = 9073513091,
        scriptId = "4f5eb437a694518fd3ea9d5d7136a05a",
    },
    -- Part 3
    WeakLegacy2 = {
        gameID = 18337464872,
        scriptId = "628be512160a9e618f927c85963bbcd1",
    },
    -- Part 3
    AnimeLastStand = {
        gameID = 4509896324,
        scriptId = "628be512160a9e618f927c85963bbcd1",
    },
    -- Part 3
    AnimeWeapons = {
        gameID = 79189799490564,
        scriptId = "628be512160a9e618f927c85963bbcd1",
    },
    MurderMystery2 = {
        gameID = 66654135,
        scriptId = "628be512160a9e618f927c85963bbcd1",
    },
    -- Part 4
    TapSimulator = {
        gameID = 8779464785,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 4
    TheForge = {
        gameID = 7671049560,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 4
    FishIt = {
        gameID = 6701277882,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 4
    BladeBall = {
        gameID = 4777817887,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 4
    AnimeFishingOdyssey = {
        gameID = 6936077272,
        placeId = 129705892696035,
        scriptId = "c4ef0d5ea877be9b24a9fb395b5f40d7",
    },
    -- Part 5
    SlimeRNG = {
        gameID = 9792947201,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },
    SellLemons = {
        gameID = 7395930870,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },
    BuildARingFarm = {
        gameID = 10039338037,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },
    SquidGameX = {
        gameID = 2936053166,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },
    BeALuckyBlock = {
        gameID = 9787206684,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },
    GrowaGarden2 = {
        gameID = 10200395747,
        scriptId = "ad915f5b5ca8c28b48b6620e7559fd8e",
    },

    -- Part 6: Universal Hub fallback (unsupported places)
    UniversalHub = {
        isFallback = true,
        scriptId = "879ef174bb3e29652467ea4e8817cddd",
    },

    -- Part 7: Survive the Killer, Vesteria, Escape Log For Brainrots, Survive Zombie Arena, Build a Digging Empire, Iron Soul: Dungeon, MineaPlanet, CutGrassAdventure
    SurviveTheKiller = {
        gameID = 1489026993,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    VesteriaRewritten = {
        gameID = 833209132,
        placeId = 2376885433,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    EscapeLogForBrainrots = {
        gameID = 9497625867,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    SurviveZombieArena = {
        gameID = 9348272796,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    BuildADiggingEmpire = {
        gameID = 8729888050,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    IronSoulDungeon = {
        gameID = 9910245722,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    MineaPlanet = {
        gameID = 10406668651,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },
    CutGrassAdventure = {
        gameID = 10410945205,
        scriptId = "5a5e21b39c4b1967ac7cec975fa715f3",
    },

    -- Part 8: Spin a Baddie, Anime Fighting Simulator: Endless, Build an Empire, Spin a Soccer Card, Heroes RNG, Lineage Piece, Power Per Click, Grow a Chicken Fighter
    SpinABaddie = {
        gameID = 9319914497,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    AnimeFightingSimulatorEndless = {
        gameID = 9266873836,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    BuildAnEmpire = {
        gameID = 8435447325,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    SpinASoccerCard = {
        gameID = 9272693470,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    HeroesRNG = {
        gameID = 10153098880,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    LineagePiece = {
        gameID = 9382839773,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    PowerPerClick = {
        gameID = 10485201326,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },
    GrowaChickenFighter = {
        gameID = 10338952197,
        scriptId = "eccd0fd1b683cad64e81c452dd0190f4",
    },

}



local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerDisplayName = LocalPlayer.DisplayName
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local keyAcquireUrl = "https://ads.luarmor.net/get_key?for=The_Intruders-wnCxRooPLsPs"

-- Link types for different shorteners
local keyLinks = {
    linkvertise = "https://ads.luarmor.net/get_key?for=The_Intruders-wnCxRooPLsPs",
    workink = "https://ads.luarmor.net/get_key?for=The_Intruders_2-qnHTgkOYElFH"
}

--//============ NOTIFY LIBRARY (inlined) ============//--
local NotifyLibrary = (function()
    --//-------------- SERVICES ----------------//*
    local RunService = game:GetService("RunService")

    local NotificationDuration = 6.5
    local NotifyLibrary = {
        Flags = {},
        Theme = {
            Default = {
                TextFont = "Default", -- Default will use the various font faces used across Rayfield
                TextColor = Color3.fromRGB(240, 240, 240),

                Background = Color3.fromRGB(25, 25, 25),
                Topbar = Color3.fromRGB(34, 34, 34),
                Shadow = Color3.fromRGB(20, 20, 20),

                NotificationBackground = Color3.fromRGB(20, 20, 20),
                NotificationActionsBackground = Color3.fromRGB(230, 230, 230),


            },

        },

    }

    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("CoreGui")
    local Rayfield = game:GetObjects("rbxassetid://12673095331")[1]
    Rayfield.Main:Destroy()
    -- Some executors can render the ScreenGui for a frame as soon as it's parented.
    -- Disable during setup so templates can't flash.
    Rayfield.Enabled = false
    Rayfield.Parent = CoreGui
    local Camera = workspace.CurrentCamera

    local Notifications = Rayfield.Notifications

    pcall(function()
        if Notifications and Notifications:FindFirstChild("Template") then
            Notifications.Template.Visible = false
            if Notifications.Template:FindFirstChild("Actions") and Notifications.Template.Actions:FindFirstChild("Template") then
                Notifications.Template.Actions.Template.Visible = false
            end
        end
    end)

    Rayfield.Enabled = true

    local SelectedTheme = NotifyLibrary.Theme.Default

    local neon = (function() -- Open sourced neon module
        local module = {}

        do
            local function IsNotNaN(x)
                return x == x
            end
            local continued = IsNotNaN(Camera:ScreenPointToRay(0, 0).Origin.x)
            while not continued do
                RunService.RenderStepped:wait()
                continued = IsNotNaN(Camera:ScreenPointToRay(0, 0).Origin.x)
            end
        end
        local RootParent = Camera
        if getgenv().SecureMode == nil then
            RootParent = Camera
        else
            if not getgenv().SecureMode then
                RootParent = Camera
            else
                RootParent = nil
            end
        end


        local binds = {}
        local root = Instance.new('Folder', RootParent)
        root.Name = 'neon'


        local GenUid; do
            local id = 0
            function GenUid()
                id = id + 1
                return 'neon::' .. tostring(id)
            end
        end

        local DrawQuad; do
            local acos, max, pi, sqrt = math.acos, math.max, math.pi, math.sqrt
            local sz = 0.2

            function DrawTriangle(v1, v2, v3, p0, p1)
                local s1 = (v1 - v2).magnitude
                local s2 = (v2 - v3).magnitude
                local s3 = (v3 - v1).magnitude
                local smax = max(s1, s2, s3)
                local A, B, C
                if s1 == smax then
                    A, B, C = v1, v2, v3
                elseif s2 == smax then
                    A, B, C = v2, v3, v1
                elseif s3 == smax then
                    A, B, C = v3, v1, v2
                end

                local para = ((B - A).x * (C - A).x + (B - A).y * (C - A).y + (B - A).z * (C - A).z) / (A - B).magnitude
                local perp = sqrt((C - A).magnitude ^ 2 - para * para)
                local dif_para = (A - B).magnitude - para

                local st = CFrame.new(B, A)
                local za = CFrame.Angles(pi / 2, 0, 0)

                local cf0 = st

                local Top_Look = (cf0 * za).lookVector
                local Mid_Point = A + CFrame.new(A, B).LookVector * para
                local Needed_Look = CFrame.new(Mid_Point, C).LookVector
                local dot = Top_Look.x * Needed_Look.x + Top_Look.y * Needed_Look.y + Top_Look.z * Needed_Look.z

                local ac = CFrame.Angles(0, 0, acos(dot))

                cf0 = cf0 * ac
                if ((cf0 * za).lookVector - Needed_Look).magnitude > 0.01 then
                    cf0 = cf0 * CFrame.Angles(0, 0, -2 * acos(dot))
                end
                cf0 = cf0 * CFrame.new(0, perp / 2, -(dif_para + para / 2))

                local cf1 = st * ac * CFrame.Angles(0, pi, 0)
                if ((cf1 * za).lookVector - Needed_Look).magnitude > 0.01 then
                    cf1 = cf1 * CFrame.Angles(0, 0, 2 * acos(dot))
                end
                cf1 = cf1 * CFrame.new(0, perp / 2, dif_para / 2)

                if not p0 then
                    p0 = Instance.new('Part')
                    p0.FormFactor = 'Custom'
                    p0.TopSurface = 0
                    p0.BottomSurface = 0
                    p0.Anchored = true
                    p0.CanCollide = false
                    p0.Material = 'Glass'
                    p0.Size = Vector3.new(sz, sz, sz)
                    local mesh = Instance.new('SpecialMesh', p0)
                    mesh.MeshType = 2
                    mesh.Name = 'WedgeMesh'
                end
                p0.WedgeMesh.Scale = Vector3.new(0, perp / sz, para / sz)
                p0.CFrame = cf0

                if not p1 then
                    p1 = p0:clone()
                end
                p1.WedgeMesh.Scale = Vector3.new(0, perp / sz, dif_para / sz)
                p1.CFrame = cf1

                return p0, p1
            end

            function DrawQuad(v1, v2, v3, v4, parts)
                parts[1], parts[2] = DrawTriangle(v1, v2, v3, parts[1], parts[2])
                parts[3], parts[4] = DrawTriangle(v3, v2, v4, parts[3], parts[4])
            end
        end

        function module:BindFrame(frame, properties)
            if RootParent == nil then return end
            if binds[frame] then
                return binds[frame].parts
            end

            local uid = GenUid()
            local parts = {}
            local f = Instance.new('Folder', root)
            f.Name = frame.Name

            local parents = {}
            do
                local function add(child)
                    if child:IsA 'GuiObject' then
                        parents[#parents + 1] = child
                        add(child.Parent)
                    end
                end
                add(frame)
            end

            local function UpdateOrientation(fetchProps)
                local zIndex = 1 - 0.05 * frame.ZIndex
                local tl, br = frame.AbsolutePosition, frame.AbsolutePosition + frame.AbsoluteSize
                local tr, bl = Vector2.new(br.x, tl.y), Vector2.new(tl.x, br.y)
                do
                    local rot = 0;
                    for _, v in ipairs(parents) do
                        rot = rot + v.Rotation
                    end
                    if rot ~= 0 and rot % 180 ~= 0 then
                        local mid = tl:lerp(br, 0.5)
                        local s, c = math.sin(math.rad(rot)), math.cos(math.rad(rot))
                        local vec = tl
                        tl = Vector2.new(c * (tl.x - mid.x) - s * (tl.y - mid.y), s * (tl.x - mid.x) + c * (tl.y - mid.y)) +
                            mid
                        tr = Vector2.new(c * (tr.x - mid.x) - s * (tr.y - mid.y), s * (tr.x - mid.x) + c * (tr.y - mid.y)) +
                            mid
                        bl = Vector2.new(c * (bl.x - mid.x) - s * (bl.y - mid.y), s * (bl.x - mid.x) + c * (bl.y - mid.y)) +
                            mid
                        br = Vector2.new(c * (br.x - mid.x) - s * (br.y - mid.y), s * (br.x - mid.x) + c * (br.y - mid.y)) +
                            mid
                    end
                end
                DrawQuad(
                    Camera:ScreenPointToRay(tl.x, tl.y, zIndex).Origin,
                    Camera:ScreenPointToRay(tr.x, tr.y, zIndex).Origin,
                    Camera:ScreenPointToRay(bl.x, bl.y, zIndex).Origin,
                    Camera:ScreenPointToRay(br.x, br.y, zIndex).Origin,
                    parts
                )
                if fetchProps then
                    for _, pt in pairs(parts) do
                        pt.Parent = f
                    end
                    for propName, propValue in pairs(properties) do
                        for _, pt in pairs(parts) do
                            pt[propName] = propValue
                        end
                    end
                end
            end

            UpdateOrientation(true)
            RunService:BindToRenderStep(uid, 2000, UpdateOrientation)

            binds[frame] = {
                uid = uid,
                parts = parts,
            }
            return binds[frame].parts
        end

        function module:Modify(frame, properties)
            local parts = module:GetBoundParts(frame)
            if parts then
                for propName, propValue in pairs(properties) do
                    for _, pt in pairs(parts) do
                        pt[propName] = propValue
                    end
                end
            end
        end

        function module:UnbindFrame(frame)
            if RootParent == nil then return end
            local cb = binds[frame]
            if cb then
                RunService:UnbindFromRenderStep(cb.uid)
                for _, v in pairs(cb.parts) do
                    v:Destroy()
                end
                binds[frame] = nil
            end
        end

        function module:HasBinding(frame)
            return binds[frame] ~= nil
        end

        function module:GetBoundParts(frame)
            return binds[frame] and binds[frame].parts
        end

        return module
    end)()

    function NotifyLibrary:Notify(NotificationSettings)
        spawn(function()
            NotificationSettings = NotificationSettings or {}
            local ActionCompleted = true
            local Notification = Notifications.Template:Clone()
            Notification.Parent = Notifications
            Notification.Name = NotificationSettings.Title or "Unknown Title"
            Notification.Visible = true

            local blurlight = nil
            local secureMode = nil
            pcall(function()
                if getgenv then
                    local env = getgenv()
                    if type(env) == "table" then
                        secureMode = env.SecureMode
                    end
                end
            end)

            if not secureMode then
                blurlight = Instance.new("DepthOfFieldEffect", game:GetService("Lighting"))
                blurlight.Enabled = true
                blurlight.FarIntensity = 0
                blurlight.FocusDistance = 51.6
                blurlight.InFocusRadius = 50
                blurlight.NearIntensity = 1
            end

            Notification.Actions.Template.Visible = false

            if NotificationSettings.Actions then
                for _, Action in pairs(NotificationSettings.Actions) do
                    ActionCompleted = false
                    local NewAction = Notification.Actions.Template:Clone()
                    NewAction.BackgroundColor3 = SelectedTheme.NotificationActionsBackground
                    if SelectedTheme ~= NotifyLibrary.Theme.Default then
                        NewAction.TextColor3 = SelectedTheme.TextColor
                    end
                    NewAction.Name = Action.Name
                    NewAction.Visible = true
                    NewAction.Parent = Notification.Actions
                    NewAction.Text = Action.Name
                    NewAction.BackgroundTransparency = 1
                    NewAction.TextTransparency = 1
                    NewAction.Size = UDim2.new(0, NewAction.TextBounds.X + 27, 0, 36)

                    NewAction.MouseButton1Click:Connect(function()
                        local Success, Response = pcall(Action.Callback)
                        if not Success then
                            print("Rayfield | Action: " .. Action.Name .. " Callback Error " .. tostring(Response))
                        end
                        ActionCompleted = true
                    end)
                end
            end
            Notification.BackgroundColor3 = SelectedTheme.Background
            Notification.Title.Text = NotificationSettings.Title or "Unknown"
            Notification.Title.TextTransparency = 1
            Notification.Title.TextColor3 = SelectedTheme.TextColor
            Notification.Description.Text = NotificationSettings.Content or "Unknown"
            Notification.Description.TextTransparency = 1
            Notification.Description.TextColor3 = SelectedTheme.TextColor
            Notification.Icon.ImageColor3 = SelectedTheme.TextColor
            if NotificationSettings.Image then
                Notification.Icon.Image = "rbxassetid://" .. tostring(NotificationSettings.Image)
            else
                Notification.Icon.Image = "rbxassetid://3944680095"
            end

            Notification.Icon.ImageTransparency = 1

            Notification.Parent = Notifications
            Notification.Size = UDim2.new(0, 260, 0, 80)
            Notification.BackgroundTransparency = 1

            TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                { Size = UDim2.new(0, 295, 0, 91) })
                :Play()
            TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                { BackgroundTransparency = 0.1 })
                :Play()
            Notification:TweenPosition(UDim2.new(0.5, 0, 0.915, 0), 'Out', 'Quint', 0.8, true)

            wait(0.3)
            TweenService:Create(Notification.Icon, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { ImageTransparency = 0 })
                :Play()
            TweenService:Create(Notification.Title, TweenInfo.new(0.7, Enum.EasingStyle.Quint), { TextTransparency = 0 })
                :Play()
            TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { TextTransparency = 0.2 }):Play()
            wait(0.2)



            -- Requires Graphics Level 8-10
            if secureMode == nil then
                TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                    { BackgroundTransparency = 0.4 })
                    :Play()
            else
                if not secureMode then
                    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 0.4 }):Play()
                else
                    TweenService:Create(Notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 0 }):Play()
                end
            end

            if Rayfield.Name == "Rayfield" then
                neon:BindFrame(Notification.BlurModule, {
                    Transparency = 0.98,
                    BrickColor = BrickColor.new("Institutional white"),
                })
            end

            if not NotificationSettings.Actions then
                wait(NotificationSettings.Duration or NotificationDuration - 0.5)
            else
                wait(0.8)
                TweenService:Create(Notification, TweenInfo.new(0.7, Enum.EasingStyle.Quint),
                    { Size = UDim2.new(0, 295, 0, 132) }):Play()
                wait(0.3)
                for _, Action in ipairs(Notification.Actions:GetChildren()) do
                    if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                        TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                            { BackgroundTransparency = 0.2 }):Play()
                        TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 0 })
                            :Play()
                        wait(0.05)
                    end
                end
            end

            repeat wait(0.001) until ActionCompleted

            for _, Action in ipairs(Notification.Actions:GetChildren()) do
                if Action.ClassName == "TextButton" and Action.Name ~= "Template" then
                    TweenService:Create(Action, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                        { BackgroundTransparency = 1 })
                        :Play()
                    TweenService:Create(Action, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 })
                        :Play()
                end
            end

            TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { Position = UDim2.new(0.47, 0, 0.234, 0) }):Play()
            TweenService:Create(Notification.Description, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                { Position = UDim2.new(0.528, 0, 0.637, 0) }):Play()
            TweenService:Create(Notification, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { Size = UDim2.new(0, 280, 0, 83) })
                :Play()
            TweenService:Create(Notification.Icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), { ImageTransparency = 1 })
                :Play()
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                { BackgroundTransparency = 0.6 })
                :Play()

            wait(0.3)
            TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { TextTransparency = 0.4 })
                :Play()
            TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { TextTransparency = 0.5 }):Play()
            wait(0.4)
            TweenService:Create(Notification, TweenInfo.new(0.9, Enum.EasingStyle.Quint),
                { Size = UDim2.new(0, 260, 0, 0) })
                :Play()
            TweenService:Create(Notification, TweenInfo.new(0.8, Enum.EasingStyle.Quint), { BackgroundTransparency = 1 })
                :Play()
            TweenService:Create(Notification.Title, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { TextTransparency = 1 })
                :Play()
            TweenService:Create(Notification.Description, TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                { TextTransparency = 1 })
                :Play()
            wait(0.2)
            if not secureMode then
                neon:UnbindFrame(Notification.BlurModule)
                blurlight:Destroy()
            end
            wait(0.9)
            Notification:Destroy()
        end)
    end

    return NotifyLibrary
end)()
--//============ END NOTIFY LIBRARY ============//--

local UDim2 = UDim2
local Enum = Enum
local TweenInfo = TweenInfo
local getgenv = getgenv
local writefile = writefile
local readfile = readfile
local isfile = isfile
local setclipboard = setclipboard
local syn = syn
local gethui = gethui
local get_hidden_gui = get_hidden_gui
local is_sirhurt_closure = is_sirhurt_closure

local function getScriptIdForCurrentGame()
    local currentPlaceId = game.PlaceId
    local currentUniverseId = game.GameId
    for name, data in pairs(games) do
        if not data.isFallback then
            if data.gameID == currentPlaceId
                or data.gameID == currentUniverseId
                or data.placeId == currentPlaceId
                or data.universeId == currentUniverseId then
                return data.scriptId, name
            end
            if type(data.placeIds) == "table" then
                for _, placeId in ipairs(data.placeIds) do
                    if placeId == currentPlaceId then
                        return data.scriptId, name
                    end
                end
            end
        end
    end
    local fallback = games.UniversalHub
    if fallback and type(fallback) == "table" then
        return fallback.scriptId, "UniversalHub"
    end
    return nil, nil
end

local function checkScriptKey()
    if getgenv and getgenv() then
        return getgenv().script_key or script_key
    end
    return script_key
end

local function loadLuarmorLibrary()
    local success, api = pcall(function()
        return loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
    end)
    if success and type(api) == "table" then
        return api
    end
    warn("Failed to load Luarmor library: " .. tostring(api))
    return nil
end

local function validateLuarmorKey(key, api)
    if not api or not key or key == "" then
        return false, "Invalid key or API not loaded", nil
    end
    local status = api.check_key(key)
    if not status then
        return false, "Failed to check key", nil
    end
    local isValid = status.code == "KEY_VALID"
    return isValid, status.message or "Unknown error", status
end

local function ParentObject(Gui)
    local success, failure = pcall(function()
        if get_hidden_gui or gethui then
            local hiddenUI = get_hidden_gui or gethui
            Gui.Parent = hiddenUI()
        elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
            syn.protect_gui(Gui)
            Gui.Parent = CoreGui
        elseif CoreGui then
            Gui.Parent = CoreGui
        end
    end)
    if not success and failure then
        Gui.Parent = LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
    end
end

local function AddDraggingFunctionality(DragPoint, Main)
    pcall(function()
        local Dragging, DragInput, MousePos, FramePos = false, false, false, false
        DragPoint.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                Dragging = true
                MousePos = Input.Position
                FramePos = Main.Position
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        DragPoint.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                DragInput = Input
            end
        end)
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DragInput and Dragging then
                local Delta = Input.Position - MousePos
                TweenService:Create(
                    Main,
                    TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {
                        Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale,
                            FramePos.Y.Offset + Delta.Y)
                    }
                ):Play()
            end
        end)
    end)
end

local function FadeOutGuiTree(Main, duration)
    local fadeDuration = duration or 0.45
    local info = TweenInfo.new(fadeDuration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local function safeTween(obj, props)
        pcall(function()
            TweenService:Create(obj, info, props):Play()
        end)
    end
    for _, obj in ipairs(Main:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            safeTween(obj, { TextTransparency = 1 })
        end
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            safeTween(obj, { ImageTransparency = 1 })
        end
        if obj:IsA("Frame") or obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") or obj:IsA("ImageLabel") or obj:IsA("ImageButton") or obj:IsA("ScrollingFrame") then
            safeTween(obj, { BackgroundTransparency = 1 })
        end
    end
    safeTween(Main, { BackgroundTransparency = 1 })
    task.wait(fadeDuration + 0.05)
end

local playerId = LocalPlayer.UserId
local keyFileName = tostring(playerId) .. "Mykey.txt"

local WARNING_COOLDOWN_SECONDS = 24 * 60 * 60
local warningCooldownFileName = tostring(playerId) .. "_UNCWarningCooldown.txt"

local function getUnixTimestamp()
    local success, result = pcall(function()
        return DateTime.now().UnixTimestamp
    end)
    if success and type(result) == "number" then
        return result
    end

    local altSuccess, altResult = pcall(os.time)
    if altSuccess and type(altResult) == "number" then
        return altResult
    end

    return 0
end

local function loadWarningCooldown()
    if isfile(warningCooldownFileName) then
        local contents = readfile(warningCooldownFileName)
        local timestamp = tonumber(contents)
        if timestamp then
            return timestamp
        end
    end
    return nil
end

local function saveWarningCooldown(timestamp)
    local value = timestamp or getUnixTimestamp()
    writefile(warningCooldownFileName, tostring(value))
end

local function isWarningCooldownActive()
    local lastDismiss = loadWarningCooldown()
    if not lastDismiss then
        return false
    end
    local now = getUnixTimestamp()
    return (now - lastDismiss) < WARNING_COOLDOWN_SECONDS
end

local function saveKey(key)
    writefile(keyFileName, key)
end

local function loadSavedKey()
    if isfile(keyFileName) then
        return readfile(keyFileName)
    else
        writefile(keyFileName, "")
        return ""
    end
end

local SELECTED_SCRIPT_ID = nil

local function executeProtectedScript(api, scriptId)
    local idToUse = scriptId or (api and api.script_id) or SELECTED_SCRIPT_ID
    if not idToUse or idToUse == "" then
        NotifyLibrary:Notify({ Title = "Unsupported Game", Content = "No script configured for this game.", Duration = 7 })
        return
    end

    -- Ensure script_key is set before loading script (required by Luarmor)
    local currentKey = checkScriptKey()
    if not currentKey or currentKey == "" then
        NotifyLibrary:Notify({ Title = "Error!", Content = "Script key not set. Please enter a valid key.", Duration = 7 })
        return
    end

    local ok, err = pcall(function()
        api.load_script()
    end)
    if not ok then
        warn("api.load_script failed, falling back to direct loader: " .. tostring(err))
        local loaderUrl = scriptBaseUrl .. idToUse .. ".lua"
        local success, loaded = pcall(function()
            return loadstring(game:HttpGet(loaderUrl))
        end)
        if success and loaded then
            loaded()
        else
            warn("Failed to load and execute loader for script_id: " .. tostring(idToUse))
        end
    end
end

--//============ EXECUTOR IDENTIFICATION ============//--
local function identifyCurrentExecutor()
    local name = "Unknown"
    pcall(function()
        if type(identifyexecutor) == "function" then
            local result = identifyexecutor()
            if type(result) == "string" and result ~= "" then
                name = result
            end
        elseif type(getexecutorname) == "function" then
            local result = getexecutorname()
            if type(result) == "string" and result ~= "" then
                name = result
            end
        end
    end)
    return name
end

--//============ END EXECUTOR IDENTIFICATION ============//--

--//============ WEAO sUNC API TEST ============//--
-- Fetches real sUNC results from weao.xyz for the detected executor.
-- Returns: suncPercentage (number 0–100), results table { passed = {name,...}, failed = {name,...} }
local function runUNCTest(executorName)
    local results = { passed = {}, failed = {} }
    local suncPercent = 100

    -- We need an HTTP request function
    local httpReq = (type(request) == "function" and request)
        or (type(http_request) == "function" and http_request)

    if not httpReq then
        -- No HTTP function available – can't query the API
        return suncPercent, results
    end

    local WEAO_UA = "WEAO-3PService"
    local lookupName = (executorName and executorName ~= "Unknown") and string.lower(executorName) or nil

    -- ── Step 1: Fetch the exploits list to find suncScrap / suncKey ──
    local suncScrap, suncKey
    local ok1, res1 = pcall(httpReq, {
        Url = "https://weao.xyz/api/status/exploits",
        Method = "GET",
        Headers = { ["User-Agent"] = WEAO_UA },
    })

    if ok1 and res1 and res1.StatusCode == 200 then
        local decodeOk, exploits = pcall(game:GetService("HttpService").JSONDecode,
            game:GetService("HttpService"), res1.Body)
        if decodeOk and type(exploits) == "table" then
            -- Try to match by executor name
            for _, ex in ipairs(exploits) do
                if lookupName and ex.title and string.find(string.lower(ex.title), lookupName, 1, true) then
                    if ex.sunc and ex.sunc.suncScrap and ex.sunc.suncKey then
                        suncScrap = ex.sunc.suncScrap
                        suncKey   = ex.sunc.suncKey
                        -- Use the API-provided percentage if available
                        if type(ex.suncPercentage) == "number" then
                            suncPercent = ex.suncPercentage
                        end
                    end
                    break
                end
            end
        end
    end

    -- ── Step 2: If we have scrap/key, fetch the detailed sUNC results ──
    if suncScrap and suncKey then
        local ok2, res2 = pcall(httpReq, {
            Url = "https://weao.xyz/api/sunc?scrap=" .. suncScrap .. "&key=" .. suncKey,
            Method = "GET",
            Headers = { ["User-Agent"] = WEAO_UA },
        })

        if ok2 and res2 and res2.StatusCode == 200 then
            local decodeOk2, data = pcall(game:GetService("HttpService").JSONDecode,
                game:GetService("HttpService"), res2.Body)
            if decodeOk2 and type(data) == "table" and type(data.tests) == "table" then
                -- Flatten passed list to name strings
                if type(data.tests.passed) == "table" then
                    for _, t in ipairs(data.tests.passed) do
                        table.insert(results.passed, t.name or tostring(t))
                    end
                end
                -- Flatten failed list to name strings
                if type(data.tests.failed) == "table" then
                    for _, t in ipairs(data.tests.failed) do
                        table.insert(results.failed, t.name or tostring(t))
                    end
                end
                -- Recompute percentage from actual test counts if present
                local total = #results.passed + #results.failed
                if total > 0 then
                    suncPercent = math.round(#results.passed / total * 100)
                end
            end
        end
    end

    return suncPercent, results
end
--//============ END WEAO sUNC API TEST ============//--

local spawnKeyUIInstance

local function createUNCWarningUI(uncScore, onContinue, options)
    options = options or {}
    local onManualDismiss = options.onManualDismiss
    local isBlocked = options.isBlocked or false
    local executorName = options.executorName or "Unknown"
    local failedTests = options.failedTests or {}
    local passedTests = options.passedTests or {}

    -- Theme colors
    local bgPrimary = Color3.fromRGB(12, 12, 18)
    local bgCard = Color3.fromRGB(20, 20, 30)
    local bgCardLight = Color3.fromRGB(28, 28, 40)
    local textPrimary = Color3.fromRGB(240, 240, 245)
    local textSecondary = Color3.fromRGB(160, 165, 180)
    local textMuted = Color3.fromRGB(100, 105, 120)
    local accentRed = Color3.fromRGB(235, 65, 65)
    local accentOrange = Color3.fromRGB(245, 158, 50)
    local accentBlue = Color3.fromRGB(65, 120, 255)
    local accentBlueBright = Color3.fromRGB(90, 145, 255)
    local accentGreen = Color3.fromRGB(50, 205, 100)
    local scoreColor = (uncScore >= 85 and accentGreen) or (uncScore >= 50 and accentOrange) or accentRed
    local mainAccent = isBlocked and accentRed or accentOrange

    local totalTests = #passedTests + #failedTests
    local CARD_WIDTH = 480
    local FINAL_HEIGHT = 580

    -- ScreenGui
    local WarningGui = Instance.new("ScreenGui")
    WarningGui.Name = "UNCWarningGui"
    WarningGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    WarningGui.ResetOnSpawn = false
    WarningGui.IgnoreGuiInset = true
    WarningGui.DisplayOrder = options.displayOrder or 220

    -- Dim overlay
    local Overlay = Instance.new("Frame")
    Overlay.Name = "Overlay"
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Overlay.BackgroundTransparency = 1
    Overlay.BorderSizePixel = 0
    Overlay.Active = true
    Overlay.Parent = WarningGui

    -- Main Card
    local Card = Instance.new("Frame")
    Card.Name = "Card"
    Card.Size = UDim2.new(0, 0, 0, 0)
    Card.Position = options.position or UDim2.new(0.5, 0, 0.5, 0)
    Card.AnchorPoint = Vector2.new(0.5, 0.5)
    Card.BackgroundColor3 = bgPrimary
    Card.BorderSizePixel = 0
    Card.ClipsDescendants = true
    Card.Parent = Overlay

    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 14)
    CardCorner.Parent = Card

    local CardStroke = Instance.new("UIStroke")
    CardStroke.Color = Color3.fromRGB(40, 40, 55)
    CardStroke.Thickness = 1.5
    CardStroke.Transparency = 0
    CardStroke.Parent = Card

    -- Top accent bar (thin colored line at the top)
    local AccentBar = Instance.new("Frame")
    AccentBar.Name = "AccentBar"
    AccentBar.Size = UDim2.new(1, 0, 0, 3)
    AccentBar.Position = UDim2.new(0, 0, 0, 0)
    AccentBar.BackgroundColor3 = mainAccent
    AccentBar.BorderSizePixel = 0
    AccentBar.Parent = Card

    -- Content padding
    local PAD = 28

    -- ═══ Header Row: Icon + Title + Subtitle ═══
    local HeaderRow = Instance.new("Frame")
    HeaderRow.Name = "HeaderRow"
    HeaderRow.Size = UDim2.new(1, -PAD * 2, 0, 56)
    HeaderRow.Position = UDim2.new(0, PAD, 0, 18)
    HeaderRow.BackgroundTransparency = 1
    HeaderRow.Parent = Card

    -- Small icon circle
    local IconCircle = Instance.new("Frame")
    IconCircle.Name = "IconCircle"
    IconCircle.Size = UDim2.new(0, 44, 0, 44)
    IconCircle.Position = UDim2.new(0, 0, 0.5, 0)
    IconCircle.AnchorPoint = Vector2.new(0, 0.5)
    IconCircle.BackgroundColor3 = mainAccent
    IconCircle.BorderSizePixel = 0
    IconCircle.Parent = HeaderRow

    local IconCircleCorner = Instance.new("UICorner")
    IconCircleCorner.CornerRadius = UDim.new(1, 0)
    IconCircleCorner.Parent = IconCircle

    -- Subtle glow behind icon
    local IconGlow = Instance.new("Frame")
    IconGlow.Size = UDim2.new(0, 56, 0, 56)
    IconGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    IconGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    IconGlow.BackgroundColor3 = mainAccent
    IconGlow.BackgroundTransparency = 0.85
    IconGlow.BorderSizePixel = 0
    IconGlow.Parent = IconCircle
    Instance.new("UICorner", IconGlow).CornerRadius = UDim.new(1, 0)

    local IconEmoji = Instance.new("TextLabel")
    IconEmoji.Size = UDim2.new(1, 0, 1, 0)
    IconEmoji.BackgroundTransparency = 1
    IconEmoji.Text = isBlocked and "🚫" or "⚠️"
    IconEmoji.TextSize = 22
    IconEmoji.Font = Enum.Font.GothamBold
    IconEmoji.TextColor3 = textPrimary
    IconEmoji.Parent = IconCircle

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, -58, 0, 24)
    TitleLabel.Position = UDim2.new(0, 56, 0, 6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = isBlocked and "Executor Not Supported" or "Executor Compatibility Warning"
    TitleLabel.TextSize = 17
    TitleLabel.TextColor3 = textPrimary
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    TitleLabel.Parent = HeaderRow

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "Subtitle"
    SubtitleLabel.Size = UDim2.new(1, -58, 0, 18)
    SubtitleLabel.Position = UDim2.new(0, 56, 0, 32)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Text = "Detected: " .. executorName
    SubtitleLabel.TextSize = 13
    SubtitleLabel.TextColor3 = isBlocked and accentRed or textSecondary
    SubtitleLabel.Font = Enum.Font.GothamMedium
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.Parent = HeaderRow

    -- Divider after header
    local Divider1 = Instance.new("Frame")
    Divider1.Size = UDim2.new(1, -PAD * 2, 0, 1)
    Divider1.Position = UDim2.new(0, PAD, 0, 80)
    Divider1.BackgroundColor3 = Color3.fromRGB(38, 38, 52)
    Divider1.BorderSizePixel = 0
    Divider1.Parent = Card

    -- ═══ Score Section ═══
    local ScoreSection = Instance.new("Frame")
    ScoreSection.Name = "ScoreSection"
    ScoreSection.Size = UDim2.new(1, -PAD * 2, 0, 75)
    ScoreSection.Position = UDim2.new(0, PAD, 0, 92)
    ScoreSection.BackgroundTransparency = 1
    ScoreSection.Parent = Card

    -- Left: big score number
    local ScoreBig = Instance.new("TextLabel")
    ScoreBig.Name = "ScoreBig"
    ScoreBig.Size = UDim2.new(0, 80, 0, 40)
    ScoreBig.Position = UDim2.new(0, 0, 0, 4)
    ScoreBig.BackgroundTransparency = 1
    ScoreBig.Text = uncScore .. "%"
    ScoreBig.TextSize = 36
    ScoreBig.TextColor3 = scoreColor
    ScoreBig.Font = Enum.Font.GothamBold
    ScoreBig.TextXAlignment = Enum.TextXAlignment.Left
    ScoreBig.Parent = ScoreSection

    local ScoreCaption = Instance.new("TextLabel")
    ScoreCaption.Size = UDim2.new(0, 80, 0, 16)
    ScoreCaption.Position = UDim2.new(0, 0, 0, 44)
    ScoreCaption.BackgroundTransparency = 1
    ScoreCaption.Text = "UNC Score"
    ScoreCaption.TextSize = 11
    ScoreCaption.TextColor3 = textMuted
    ScoreCaption.Font = Enum.Font.GothamMedium
    ScoreCaption.TextXAlignment = Enum.TextXAlignment.Left
    ScoreCaption.Parent = ScoreSection

    -- Right: progress bar + stats
    local BarContainer = Instance.new("Frame")
    BarContainer.Name = "BarContainer"
    BarContainer.Size = UDim2.new(1, -100, 0, 75)
    BarContainer.Position = UDim2.new(0, 100, 0, 0)
    BarContainer.BackgroundTransparency = 1
    BarContainer.Parent = ScoreSection

    -- Pass/Fail counts
    local PassCountLabel = Instance.new("TextLabel")
    PassCountLabel.Size = UDim2.new(0.5, 0, 0, 16)
    PassCountLabel.Position = UDim2.new(0, 0, 0, 2)
    PassCountLabel.BackgroundTransparency = 1
    PassCountLabel.Text = "✓ " .. #passedTests .. " passed"
    PassCountLabel.TextSize = 12
    PassCountLabel.TextColor3 = accentGreen
    PassCountLabel.Font = Enum.Font.GothamMedium
    PassCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    PassCountLabel.Parent = BarContainer

    local FailCountLabel = Instance.new("TextLabel")
    FailCountLabel.Size = UDim2.new(0.5, 0, 0, 16)
    FailCountLabel.Position = UDim2.new(0.5, 0, 0, 2)
    FailCountLabel.BackgroundTransparency = 1
    FailCountLabel.Text = "✗ " .. #failedTests .. " failed"
    FailCountLabel.TextSize = 12
    FailCountLabel.TextColor3 = accentRed
    FailCountLabel.Font = Enum.Font.GothamMedium
    FailCountLabel.TextXAlignment = Enum.TextXAlignment.Right
    FailCountLabel.Parent = BarContainer

    -- Progress bar track
    local BarTrack = Instance.new("Frame")
    BarTrack.Name = "BarTrack"
    BarTrack.Size = UDim2.new(1, 0, 0, 10)
    BarTrack.Position = UDim2.new(0, 0, 0, 26)
    BarTrack.BackgroundColor3 = bgCardLight
    BarTrack.BorderSizePixel = 0
    BarTrack.ClipsDescendants = true
    BarTrack.Parent = BarContainer
    Instance.new("UICorner", BarTrack).CornerRadius = UDim.new(1, 0)

    local BarFill = Instance.new("Frame")
    BarFill.Name = "BarFill"
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = scoreColor
    BarFill.BorderSizePixel = 0
    BarFill.Parent = BarTrack
    Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

    -- Minimum threshold marker at 85%
    local ThresholdLine = Instance.new("Frame")
    ThresholdLine.Size = UDim2.new(0, 2, 1, 4)
    ThresholdLine.Position = UDim2.new(0.85, -1, 0, -2)
    ThresholdLine.BackgroundColor3 = textMuted
    ThresholdLine.BorderSizePixel = 0
    ThresholdLine.Parent = BarTrack

    local ThresholdLabel = Instance.new("TextLabel")
    ThresholdLabel.Size = UDim2.new(0, 60, 0, 14)
    ThresholdLabel.Position = UDim2.new(0.85, -30, 0, 42)
    ThresholdLabel.BackgroundTransparency = 1
    ThresholdLabel.Text = "85% min"
    ThresholdLabel.TextSize = 10
    ThresholdLabel.TextColor3 = textMuted
    ThresholdLabel.Font = Enum.Font.Gotham
    ThresholdLabel.Parent = BarContainer

    -- Status summary text under bar
    local StatusSummary = Instance.new("TextLabel")
    StatusSummary.Size = UDim2.new(1, 0, 0, 14)
    StatusSummary.Position = UDim2.new(0, 0, 0, 58)
    StatusSummary.BackgroundTransparency = 1
    StatusSummary.TextSize = 11
    StatusSummary.Font = Enum.Font.Gotham
    StatusSummary.TextXAlignment = Enum.TextXAlignment.Left
    StatusSummary.TextColor3 = textMuted
    StatusSummary.Parent = BarContainer
    if totalTests > 0 then
        StatusSummary.Text = tostring(#passedTests) .. "/" .. tostring(totalTests) .. " tests passed"
    else
        StatusSummary.Text = "Could not run tests"
    end

    -- Divider
    local Divider2 = Instance.new("Frame")
    Divider2.Size = UDim2.new(1, -PAD * 2, 0, 1)
    Divider2.Position = UDim2.new(0, PAD, 0, 178)
    Divider2.BackgroundColor3 = Color3.fromRGB(38, 38, 52)
    Divider2.BorderSizePixel = 0
    Divider2.Parent = Card

    -- ═══ Message Card ═══
    local MsgCard = Instance.new("Frame")
    MsgCard.Name = "MsgCard"
    MsgCard.Size = UDim2.new(1, -PAD * 2, 0, 68)
    MsgCard.Position = UDim2.new(0, PAD, 0, 190)
    MsgCard.BackgroundColor3 = bgCard
    MsgCard.BorderSizePixel = 0
    MsgCard.Parent = Card
    Instance.new("UICorner", MsgCard).CornerRadius = UDim.new(0, 10)

    -- Colored left edge on message card
    local MsgEdge = Instance.new("Frame")
    MsgEdge.Size = UDim2.new(0, 3, 1, -8)
    MsgEdge.Position = UDim2.new(0, 4, 0, 4)
    MsgEdge.BackgroundColor3 = mainAccent
    MsgEdge.BorderSizePixel = 0
    MsgEdge.Parent = MsgCard
    Instance.new("UICorner", MsgEdge).CornerRadius = UDim.new(0, 2)

    local MsgText = Instance.new("TextLabel")
    MsgText.Name = "MsgText"
    MsgText.Size = UDim2.new(1, -24, 1, -12)
    MsgText.Position = UDim2.new(0, 16, 0, 6)
    MsgText.BackgroundTransparency = 1
    MsgText.TextWrapped = true
    MsgText.TextXAlignment = Enum.TextXAlignment.Left
    MsgText.TextYAlignment = Enum.TextYAlignment.Top
    MsgText.TextSize = 13
    MsgText.Font = Enum.Font.Gotham
    MsgText.TextColor3 = textSecondary
    MsgText.Parent = MsgCard

    if isBlocked then
        MsgText.Text = "Your executor (" ..
            executorName ..
            ") is missing critical functions like hookmetamethod, hookfunction, and newcclosure. You must switch to a supported executor to run this script."
    else
        local failedStr = ""
        if #failedTests > 0 then
            local shown = {}
            for i = 1, math.min(5, #failedTests) do
                table.insert(shown, failedTests[i])
            end
            failedStr = "\nFailed: " .. table.concat(shown, ", ")
            if #failedTests > 5 then failedStr = failedStr .. " (+" .. (#failedTests - 5) .. " more)" end
        end
        MsgText.Text = "Your executor scored below the 85% minimum. Some features may crash or not work properly." ..
            failedStr
    end

    -- ═══ Supported Executors Row ═══
    local SupportedRow = Instance.new("Frame")
    SupportedRow.Name = "SupportedRow"
    SupportedRow.Size = UDim2.new(1, -PAD * 2, 0, 36)
    SupportedRow.Position = UDim2.new(0, PAD, 0, 270)
    SupportedRow.BackgroundTransparency = 1
    SupportedRow.Parent = Card

    local supportedExecs = { "Delta", "Volt/AWP", "Wave" }
    local badgeWidth = math.floor((CARD_WIDTH - PAD * 2 - 8 * (#supportedExecs - 1)) / #supportedExecs)
    for i, eName in ipairs(supportedExecs) do
        local Badge = Instance.new("Frame")
        Badge.Size = UDim2.new(0, badgeWidth, 0, 32)
        Badge.Position = UDim2.new(0, (i - 1) * (badgeWidth + 8), 0, 2)
        Badge.BackgroundColor3 = bgCard
        Badge.BorderSizePixel = 0
        Badge.Parent = SupportedRow
        Instance.new("UICorner", Badge).CornerRadius = UDim.new(0, 8)

        local bStroke = Instance.new("UIStroke")
        bStroke.Color = Color3.fromRGB(45, 55, 70)
        bStroke.Thickness = 1
        bStroke.Parent = Badge

        local bLabel = Instance.new("TextLabel")
        bLabel.Size = UDim2.new(1, -8, 1, 0)
        bLabel.Position = UDim2.new(0, 4, 0, 0)
        bLabel.BackgroundTransparency = 1
        bLabel.Text = "✓ " .. eName
        bLabel.TextSize = 12
        bLabel.TextColor3 = accentGreen
        bLabel.Font = Enum.Font.GothamMedium
        bLabel.Parent = Badge
    end

    -- ═══ Buttons ═══
    local btnY = 318
    local btnHeight = 42
    local btnGap = 10

    -- Primary button (Get executor / Copy link)
    local PrimaryBtn = Instance.new("TextButton")
    PrimaryBtn.Name = "PrimaryBtn"
    PrimaryBtn.Size = UDim2.new(1, -PAD * 2, 0, btnHeight)
    PrimaryBtn.Position = UDim2.new(0, PAD, 0, btnY)
    PrimaryBtn.BackgroundColor3 = accentBlue
    PrimaryBtn.BorderSizePixel = 0
    PrimaryBtn.AutoButtonColor = false
    PrimaryBtn.Text = isBlocked and "Get a Supported Executor" or "Copy Executor Link"
    PrimaryBtn.TextSize = 14
    PrimaryBtn.TextColor3 = textPrimary
    PrimaryBtn.Font = Enum.Font.GothamBold
    PrimaryBtn.Parent = Card
    Instance.new("UICorner", PrimaryBtn).CornerRadius = UDim.new(0, 10)

    PrimaryBtn.MouseEnter:Connect(function()
        TweenService:Create(PrimaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = accentBlueBright }):Play()
    end)
    PrimaryBtn.MouseLeave:Connect(function()
        TweenService:Create(PrimaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = accentBlue }):Play()
    end)

    -- Secondary button (Continue anyway) - always shown so users can bypass
    local SecondaryBtn = Instance.new("TextButton")
    SecondaryBtn.Name = "SecondaryBtn"
    SecondaryBtn.Size = UDim2.new(1, -PAD * 2, 0, btnHeight)
    SecondaryBtn.Position = UDim2.new(0, PAD, 0, btnY + btnHeight + btnGap)
    SecondaryBtn.BackgroundColor3 = bgCardLight
    SecondaryBtn.BorderSizePixel = 0
    SecondaryBtn.AutoButtonColor = false
    SecondaryBtn.Text = isBlocked and "Continue Anyway (Not Recommended)" or "Continue Anyway"
    SecondaryBtn.TextSize = 14
    SecondaryBtn.TextColor3 = isBlocked and accentRed or textSecondary
    SecondaryBtn.Font = Enum.Font.GothamMedium
    SecondaryBtn.Parent = Card
    Instance.new("UICorner", SecondaryBtn).CornerRadius = UDim.new(0, 10)

    local secStroke = Instance.new("UIStroke")
    secStroke.Color = isBlocked and Color3.fromRGB(80, 40, 40) or Color3.fromRGB(50, 50, 65)
    secStroke.Thickness = 1
    secStroke.Parent = SecondaryBtn

    SecondaryBtn.MouseEnter:Connect(function()
        TweenService:Create(SecondaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(38, 38, 50) })
            :Play()
    end)
    SecondaryBtn.MouseLeave:Connect(function()
        TweenService:Create(SecondaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = bgCardLight }):Play()
    end)

    -- ═══ Footer / Timer ═══
    local footerY = btnY + (btnHeight + btnGap) * 2 + 8
    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Name = "TimerLabel"
    TimerLabel.Size = UDim2.new(1, -PAD * 2, 0, 18)
    TimerLabel.Position = UDim2.new(0, PAD, 0, footerY)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.TextSize = 11
    TimerLabel.Font = Enum.Font.Gotham
    TimerLabel.TextColor3 = textMuted
    TimerLabel.TextXAlignment = Enum.TextXAlignment.Center
    TimerLabel.Parent = Card

    if isBlocked then
        TimerLabel.Text = "⚠ Blocked executor — features may not work"
        TimerLabel.TextColor3 = Color3.fromRGB(200, 80, 80)
    else
        TimerLabel.Text = "Auto-closing in 30s..."
    end

    -- ═══ Button Logic ═══
    local dismissed = false

    PrimaryBtn.Activated:Connect(function()
        pcall(function() setclipboard("https://weao.xyz/") end)
        PrimaryBtn.Text = "✓ Link Copied!"
        TweenService:Create(PrimaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = accentGreen }):Play()
        task.wait(1.5)
        if not dismissed then
            PrimaryBtn.Text = isBlocked and "Get a Supported Executor" or "Copy Executor Link"
            TweenService:Create(PrimaryBtn, TweenInfo.new(0.15), { BackgroundColor3 = accentBlue }):Play()
        end
    end)

    local function dismissWarning(shouldRecord)
        if dismissed then return end
        dismissed = true
        if shouldRecord and onManualDismiss then
            pcall(onManualDismiss)
        end
        -- Fade out card
        TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Size = UDim2.new(0, CARD_WIDTH, 0, FINAL_HEIGHT - 20), BackgroundTransparency = 1 }):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
        FadeOutGuiTree(Card, 0.25)
        task.wait(0.35)
        WarningGui:Destroy()
        if onContinue then
            onContinue()
        end
    end

    SecondaryBtn.Activated:Connect(function()
        dismissWarning(true)
    end)

    -- Auto-dismiss timer (30 seconds) - disabled for blocked executors
    task.spawn(function()
        if isBlocked then return end
        local remaining = 30
        while remaining >= 0 do
            if dismissed then break end
            TimerLabel.Text = "Auto-closing in " .. remaining .. "s..."
            if remaining <= 10 then
                TimerLabel.TextColor3 = accentRed
            elseif remaining <= 20 then
                TimerLabel.TextColor3 = accentOrange
            else
                TimerLabel.TextColor3 = textMuted
            end
            task.wait(1)
            remaining = remaining - 1
        end
        if not dismissed then
            dismissWarning(false)
        end
    end)

    -- ═══ Parent & Animate ═══
    ParentObject(WarningGui)
    AddDraggingFunctionality(Card, Card)

    -- Fade in overlay
    TweenService:Create(Overlay, TweenInfo.new(0.35), { BackgroundTransparency = 0.45 }):Play()

    -- Pop-in card
    TweenService:Create(Card, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        { Size = UDim2.new(0, CARD_WIDTH, 0, FINAL_HEIGHT) }):Play()

    -- Animate progress bar fill after card opens
    task.delay(0.5, function()
        if BarFill and BarFill.Parent then
            local fillFrac = totalTests > 0 and math.clamp(#passedTests / totalTests, 0, 1) or 0
            TweenService:Create(BarFill, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { Size = UDim2.new(fillFrac, 0, 1, 0) }):Play()
        end
    end)

    -- Gentle icon glow pulse
    task.spawn(function()
        while WarningGui.Parent do
            TweenService:Create(IconGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                { BackgroundTransparency = 0.7 }):Play()
            task.wait(1.2)
            TweenService:Create(IconGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                { BackgroundTransparency = 0.92 }):Play()
            task.wait(1.2)
        end
    end)

    return WarningGui
end

--[[ COMMENTED OUT - Link Selection Popup UI (Uncomment to enable)
local function createLinkTypeSelectionUI(onSelectCallback)
    local SelectionGui = Instance.new("ScreenGui")
    SelectionGui.Name = "LinkTypeSelection"
    SelectionGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SelectionGui.ResetOnSpawn = false
    SelectionGui.IgnoreGuiInset = true
    SelectionGui.DisplayOrder = 250

    local BlurBg = Instance.new("Frame")
    BlurBg.Name = "BlurBg"
    BlurBg.Size = UDim2.new(1, 0, 1, 0)
    BlurBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    BlurBg.BackgroundTransparency = 0.4
    BlurBg.BorderSizePixel = 0
    BlurBg.Parent = SelectionGui

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = BlurBg

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(80, 120, 255)
    MainStroke.Thickness = 2
    MainStroke.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(1, -40, 0, 50)
    Title.Position = UDim2.new(0, 20, 0, 20)
    Title.BackgroundTransparency = 1
    Title.Text = "🔗 Select Link Type"
    Title.TextSize = 24
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = MainFrame

    local Subtitle = Instance.new("TextLabel")
    Subtitle.Name = "Subtitle"
    Subtitle.Size = UDim2.new(1, -40, 0, 30)
    Subtitle.Position = UDim2.new(0, 20, 0, 70)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "Choose your preferred link shortener"
    Subtitle.TextSize = 14
    Subtitle.TextColor3 = Color3.fromRGB(180, 180, 190)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextXAlignment = Enum.TextXAlignment.Left
    Subtitle.Parent = MainFrame

    local OptionsContainer = Instance.new("Frame")
    OptionsContainer.Name = "OptionsContainer"
    OptionsContainer.Size = UDim2.new(1, -40, 0, 240)
    OptionsContainer.Position = UDim2.new(0, 20, 0, 110)
    OptionsContainer.BackgroundTransparency = 1
    OptionsContainer.Parent = MainFrame

    local options = {
        { name = "Linkvertise", icon = "🌐", description = "Fast and reliable", color = Color3.fromRGB(59, 130, 246), linkKey = "linkvertise" },
        { name = "Loot Lab", icon = "💎", description = "Rewards & bonuses", color = Color3.fromRGB(168, 85, 247), linkKey = "lootlab" },
        { name = "Work Inc", icon = "⚡", description = "Quick verification", color = Color3.fromRGB(34, 197, 94), linkKey = "workinc" }
    }

    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Name = option.name
        OptionButton.Size = UDim2.new(1, 0, 0, 70)
        OptionButton.Position = UDim2.new(0, 0, 0, (i - 1) * 80)
        OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
        OptionButton.BorderSizePixel = 0
        OptionButton.AutoButtonColor = false
        OptionButton.Text = ""
        OptionButton.Parent = OptionsContainer

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 12)
        BtnCorner.Parent = OptionButton

        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = option.color
        BtnStroke.Thickness = 2
        BtnStroke.Transparency = 0.5
        BtnStroke.Parent = OptionButton

        local Icon = Instance.new("TextLabel")
        Icon.Size = UDim2.new(0, 40, 0, 40)
        Icon.Position = UDim2.new(0, 15, 0.5, -20)
        Icon.BackgroundTransparency = 1
        Icon.Text = option.icon
        Icon.TextSize = 28
        Icon.Font = Enum.Font.GothamBold
        Icon.Parent = OptionButton

        local NameLabel = Instance.new("TextLabel")
        NameLabel.Size = UDim2.new(1, -70, 0, 25)
        NameLabel.Position = UDim2.new(0, 60, 0, 12)
        NameLabel.BackgroundTransparency = 1
        NameLabel.Text = option.name
        NameLabel.TextSize = 18
        NameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        NameLabel.Font = Enum.Font.GothamBold
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        NameLabel.Parent = OptionButton

        local DescLabel = Instance.new("TextLabel")
        DescLabel.Size = UDim2.new(1, -70, 0, 20)
        DescLabel.Position = UDim2.new(0, 60, 0, 38)
        DescLabel.BackgroundTransparency = 1
        DescLabel.Text = option.description
        DescLabel.TextSize = 13
        DescLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.Parent = OptionButton

        OptionButton.MouseEnter:Connect(function()
            TweenService:Create(OptionButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(50, 50, 60) })
                :Play()
            TweenService:Create(BtnStroke, TweenInfo.new(0.2), { Transparency = 0 }):Play()
        end)

        OptionButton.MouseLeave:Connect(function()
            TweenService:Create(OptionButton, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(40, 40, 50) })
                :Play()
            TweenService:Create(BtnStroke, TweenInfo.new(0.2), { Transparency = 0.5 }):Play()
        end)

        OptionButton.Activated:Connect(function()
            TweenService:Create(OptionButton, TweenInfo.new(0.1), { Size = UDim2.new(0.95, 0, 0, 65) }):Play()
            task.wait(0.1)
            TweenService:Create(OptionButton, TweenInfo.new(0.1), { Size = UDim2.new(1, 0, 0, 70) }):Play()
            TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, 0) }):Play()
            TweenService:Create(BlurBg, TweenInfo.new(0.3), { BackgroundTransparency = 1 }):Play()
            task.wait(0.3)
            SelectionGui:Destroy()
            if onSelectCallback then onSelectCallback(option.linkKey) end
        end)
    end

    ParentObject(SelectionGui)
    AddDraggingFunctionality(MainFrame, MainFrame)
    TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        { Size = UDim2.new(0, 450, 0, 390) }):Play()
    return SelectionGui
end
--]]



local function showKeyInputUI(luarmorApi)
    -- Check for fake UNC test toggle (for developer testing)
    local forceWarning = FAKE_UNC_TEST
    if not forceWarning then
        pcall(function()
            if getgenv and getgenv() and getgenv().FORCE_UNC_WARNING then
                forceWarning = true
            end
        end)
    end

    local executorName = identifyCurrentExecutor()

    -- Run WEAO sUNC API test (wrapped in pcall for safety)
    local uncScore = 100
    local testResults = { passed = {}, failed = {} }
    pcall(function()
        uncScore, testResults = runUNCTest(executorName)
    end)
    testResults = testResults or { passed = {}, failed = {} }

    -- Override score when testing
    if forceWarning and uncScore >= 85 then
        uncScore = 42 -- Simulate a bad executor for testing
    end

    local keyUI = spawnKeyUIInstance and spawnKeyUIInstance(luarmorApi)
    if keyUI then
        pcall(function()
            keyUI.DisplayOrder = 210
            if keyUI.Main then
                keyUI.Main.Visible = true
            end
        end)
    end



    -- Show warning UI if score is below 85%
    if uncScore < 85 or forceWarning then
        if not forceWarning then
            local cooldownActive = isWarningCooldownActive()
            if cooldownActive then return end
        end

        createUNCWarningUI(uncScore, function()
            if keyUI and keyUI.Parent and keyUI.Main then
                TweenService:Create(keyUI.Main, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundTransparency = 0 }):Play()
            elseif not keyUI or not keyUI.Parent then
                keyUI = spawnKeyUIInstance and spawnKeyUIInstance(luarmorApi)
            end
        end, {
            keyUI = keyUI,
            dimBackground = true,
            displayOrder = 220,
            position = UDim2.new(0.5, 0, 0.5, 0),
            executorName = executorName,
            isBlocked = false,
            failedTests = testResults.failed,
            passedTests = testResults.passed,
            onManualDismiss = function()
                saveWarningCooldown()
            end,
        })
        return
    end

    -- UNC is good, key UI already visible
end

local function setupKeyUI(KeyUI, luarmorApi)
    local KeyMain = KeyUI.Main
    KeyMain.Title.Text = "The Intruders - Key Required"
    KeyMain.Subtitle.Text = "Enter your Luarmor key"
    KeyMain.NoteMessage.Text =
    "Join our discord for support discord.com/invite/vfkD5VCRKU\nTired of the key system? Get the paid script in our Discord."
    pcall(function()
        KeyMain.NoteMessage.TextWrapped = true
        KeyMain.NoteMessage.TextYAlignment = Enum.TextYAlignment.Top
        KeyMain.NoteMessage.AutomaticSize = Enum.AutomaticSize.Y
    end)

    AddDraggingFunctionality(KeyMain, KeyMain)

    KeyMain.Size = UDim2.new(0, 505, 0, 175)
    KeyMain.BackgroundTransparency = 1
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { BackgroundTransparency = 0 }):Play()
    TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Quint), { Size = UDim2.new(0, 540, 0, 187) }):Play()

    local InputBox = KeyMain.Input.InputBox
    local HidenInput = KeyMain.Input.HidenInput
    local function updateHiddenMaskText()
        local text = InputBox.Text or ""
        HidenInput.Text = string.rep("•", #text)
    end
    InputBox:GetPropertyChangedSignal("Text"):Connect(updateHiddenMaskText)
    updateHiddenMaskText()
    HidenInput.TextTransparency = 0
    InputBox.TextTransparency = 1

    -- Panel widened above (540px) to fit three buttons in one row: Linkvertise, Workink, Verify Key
    local CopyBut = KeyMain.Copy
    local rowY = CopyBut.Position.Y
    local btnW, btnH, btnGap, rowStartX = 76, 28, 10, 27

    CopyBut.Text = "Linkvertise"
    CopyBut.Position = UDim2.new(0, rowStartX, rowY.Scale, rowY.Offset)
    CopyBut.Size = UDim2.new(0, btnW, 0, btnH)
    CopyBut.Activated:Connect(function()
        setclipboard(keyLinks.linkvertise)
        NotifyLibrary:Notify({ Title = "Key Link Copied!", Content = "Visit the Linkvertise link to get your key.", Duration = 7 })
    end)

    local WorkinkBut = CopyBut:Clone()
    WorkinkBut.Name = "Workink"
    WorkinkBut.Text = "Workink"
    WorkinkBut.Position = UDim2.new(0, rowStartX + btnW + btnGap, rowY.Scale, rowY.Offset)
    WorkinkBut.Parent = KeyMain
    WorkinkBut.Activated:Connect(function()
        setclipboard(keyLinks.workink)
        NotifyLibrary:Notify({ Title = "Key Link Copied!", Content = "Visit the Work.ink link to get your key.", Duration = 7 })
    end)

    local CheckBut = KeyMain.Check
    CheckBut.Text = "Verify Key"
    CheckBut.Position = UDim2.new(0, rowStartX + (btnW + btnGap) * 2, rowY.Scale, rowY.Offset)
    CheckBut.Size = UDim2.new(0, btnW, 0, btnH)

    local function verifyKey()
        local inputKey = KeyUI.Main.Input.InputBox.Text
        if not inputKey or inputKey == "" then
            NotifyLibrary:Notify({ Title = "Error!", Content = "Please enter a key first.", Duration = 5 })
            return
        end

        -- Validate the key BEFORE saving
        local isValid, message, status = validateLuarmorKey(inputKey, luarmorApi)

        if isValid and status and status.code == "KEY_VALID" then
            -- Only save and proceed if key is valid
            saveKey(inputKey)
            if getgenv and getgenv() then
                getgenv().script_key = inputKey
            end
            script_key = inputKey

            NotifyLibrary:Notify({
                Title = "Success!",
                Content = "Key verified and saved successfully! Welcome " ..
                    playerDisplayName,
                Duration = 7
            })

            FadeOutGuiTree(KeyMain, 0.5)
            KeyUI:Destroy()
            executeProtectedScript(luarmorApi, luarmorApi.script_id)
            return
        end

        -- Handle different error codes
        if status and status.code then
            if status.code == "KEY_HWID_LOCKED" then
                NotifyLibrary:Notify({
                    Title = "HWID Locked",
                    Content = "Key linked to a different HWID. Please reset it using our bot.",
                    Duration = 7
                })
            elseif status.code == "KEY_INCORRECT" then
                NotifyLibrary:Notify({
                    Title = "Invalid Key",
                    Content = "Key is wrong or deleted!",
                    Duration = 7
                })
            elseif status.code == "KEY_EXPIRED" then
                NotifyLibrary:Notify({
                    Title = "Key Expired",
                    Content = "This key has expired and can no longer be used.",
                    Duration = 7
                })
            elseif status.code == "KEY_BANNED" then
                NotifyLibrary:Notify({
                    Title = "Key Banned",
                    Content = "This key has been blacklisted and can not be used.",
                    Duration = 7
                })
            elseif status.code == "KEY_INVALID" then
                NotifyLibrary:Notify({
                    Title = "Invalid Format",
                    Content = "Key format is invalid. Please check your key.",
                    Duration = 7
                })
            else
                local errorMsg = message or ("Failed to validate key. Error: " .. (status.code or "Unknown"))
                NotifyLibrary:Notify({
                    Title = "Key Error",
                    Content = errorMsg,
                    Duration = 7
                })
            end
        else
            NotifyLibrary:Notify({
                Title = "Validation Failed",
                Content = message or "Failed to validate key. Please try again.",
                Duration = 7
            })
        end
        -- Don't proceed if key is invalid
    end
    CheckBut.Activated:Connect(verifyKey)
    KeyUI.Main.Input.InputBox.FocusLost:Connect(function(EnterPressed)
        if EnterPressed and #KeyUI.Main.Input.InputBox.Text > 0 then
            verifyKey()
        end
    end)
    local Hidden = true
    KeyMain.HideP.MouseButton1Click:Connect(function()
        Hidden = not Hidden
        if Hidden then
            updateHiddenMaskText()
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                { TextTransparency = 0 }):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                { TextTransparency = 1 }):Play()
        else
            TweenService:Create(KeyMain.Input.HidenInput, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                { TextTransparency = 1 }):Play()
            TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                { TextTransparency = 0 }):Play()
        end
    end)
    KeyMain.Hide.MouseButton1Click:Connect(function()
        FadeOutGuiTree(KeyMain, 0.5)
        KeyUI:Destroy()
    end)
end

spawnKeyUIInstance = function(luarmorApi)
    local KeyUI = game:GetObjects("rbxassetid://14681919890")[1]
    if not KeyUI then
        return nil
    end

    KeyUI.Enabled = true
    KeyUI.ResetOnSpawn = false

    pcall(function()
        if getgenv and getgenv() and getgenv().KeyUI then
            getgenv().KeyUI:Destroy()
        end
    end)

    if getgenv and getgenv() then
        getgenv().KeyUI = KeyUI
    end

    ParentObject(KeyUI)

    pcall(function()
        KeyUI.DisplayOrder = 210
        if KeyUI.Main then
            KeyUI.Main.Visible = true
        end
    end)

    setupKeyUI(KeyUI, luarmorApi)

    return KeyUI
end

local function clearInvalidKey()
    -- Clear invalid key from storage
    writefile(keyFileName, "")
    if getgenv and getgenv() then
        getgenv().script_key = nil
    end
    script_key = nil
end

local function initializeKeySystem(api)
    -- Check if user has already set script_key
    local existingKey = checkScriptKey()
    if existingKey and existingKey ~= "" then
        -- Validate the existing key before using it
        local isValid, message, status = validateLuarmorKey(existingKey, api)
        if isValid and status and status.code == "KEY_VALID" then
            -- Key is valid, proceed
            saveKey(existingKey)
            if getgenv and getgenv() then
                getgenv().script_key = existingKey
            end
            script_key = existingKey
            NotifyLibrary:Notify({
                Title = "Key Found!",
                Content = "Using existing script key. Welcome " ..
                    playerDisplayName,
                Duration = 5
            })
            executeProtectedScript(api, api.script_id)
            return true
        else
            -- Existing key is invalid, clear it
            clearInvalidKey()
            NotifyLibrary:Notify({
                Title = "Key Invalid",
                Content = "Existing key is invalid or expired. Please enter a new key.",
                Duration = 7
            })
        end
    end

    -- Check for saved key in file
    local savedKey = loadSavedKey()
    if savedKey and savedKey ~= "" then
        -- Validate the saved key before using it
        local isValid, message, status = validateLuarmorKey(savedKey, api)
        if isValid and status and status.code == "KEY_VALID" then
            -- Key is valid, proceed
            saveKey(savedKey)
            if getgenv and getgenv() then
                getgenv().script_key = savedKey
            end
            script_key = savedKey
            NotifyLibrary:Notify({ Title = "Auto-Login!", Content = "Using saved key. Welcome " .. playerDisplayName, Duration = 5 })
            executeProtectedScript(api, api.script_id)
            return true
        else
            -- Saved key is invalid, clear it
            clearInvalidKey()
            if status and status.code then
                if status.code == "KEY_EXPIRED" then
                    NotifyLibrary:Notify({
                        Title = "Saved Key Expired",
                        Content = "Your saved key has expired. Please enter a new key.",
                        Duration = 7
                    })
                elseif status.code == "KEY_HWID_LOCKED" then
                    NotifyLibrary:Notify({
                        Title = "HWID Locked",
                        Content = "Your saved key is locked to a different HWID. Please enter a new key or reset it.",
                        Duration = 7
                    })
                else
                    NotifyLibrary:Notify({
                        Title = "Saved Key Invalid",
                        Content = "Your saved key is no longer valid. Please enter a new key.",
                        Duration = 7
                    })
                end
            else
                NotifyLibrary:Notify({
                    Title = "Key Validation Failed",
                    Content = "Failed to validate saved key. Please enter a new key.",
                    Duration = 7
                })
            end
        end
    end

    -- Only show GUI if no valid key is found
    showKeyInputUI(api)
    return false
end

local function main()
    local scriptId, gameName = getScriptIdForCurrentGame()
    if not scriptId then
        NotifyLibrary:Notify({ Title = "Unsupported Game", Content = "This game is not supported.", Duration = 7 })
        return
    end
    if scriptId == "" then
        NotifyLibrary:Notify({ Title = "Missing Loader", Content = "No script_id configured for this game.", Duration = 7 })
        return
    end
    local api = loadLuarmorLibrary()
    if not api then
        NotifyLibrary:Notify({ Title = "Error!", Content = "Failed to load Luarmor API. Please try again later.", Duration = 7 })
        return
    end
    api.script_id = scriptId
    SELECTED_SCRIPT_ID = scriptId
    initializeKeySystem(api)
end

main()
