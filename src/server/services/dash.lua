local players = game:GetService("Players")
local character = players.LocalPlayer.character
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character.HumanoidRootPart
local camera = workspace.CurrentCamera

local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")

local debounce = false
local force = 25
local movementDir = Vector3.new(0, 0, 0)

local function onDash(_, inputState, _)
    if inputState == Enum.UserInputState.Begin and not debounce then
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            movementDir = Vector3.new(0, 0, -1) * humanoidRootPart.CFrame.LookVector * force
        
        elseif UserInputService:IsKeyDown(Enum.KeyCode.D) then
            movementDir = Vector3.new(1, 0, 0) * humanoidRootPart.CFrame.RightVector * force

        elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
            movementDir = Vector3.new(0, 0, 1) * humanoidRootPart.CFrame.LookVector * force * -1
        elseif UserInputService:IsKeyDown(Enum.KeyCode.A) then
            movementDir = Vector3.new(-1, 0, 0) * humanoidRootPart.CFrame.RightVector * force * -1
        end
    end
end
warn(onDash)

if (not character) then
    local character = players.LocalPlayer.character
    humanoidRootPart = humanoid:WaitForChild("HumanoidRootPart")
    return
end

--No matter where the humanoidrootPart is facing, it will always dash
-- in the orientated direction, which is dependent upon Dash Movement
--FOR EXAMPLE: IF PLAYER PRESSES W, IT WILL MOVE ORIENTATED IN Z - AXIS, HENCE, DIRECTION/LOOKVECTOR.
local worldDir = character:WaitForChild("HumanoidRootPart").CFrame:VectorToWorldSpace(movementDir)

humanoidRootPart:ApplyImpulse(worldDir * force)

if (not humanoidRootPart:ApplyImpulse(worldDir * force)) then
    local linear = Instance.new("LinearVelocity")
    linear.MaxForce = math.huge
    linear.Attachment0 = humanoidRootPart.RootAttachment
    linear.Parent = humanoidRootPart
end

local function Velocity(_, inputState, _)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) and debounce = false then
        humanoidRootPart:ApplyImpulse(linear.VectorVelocity * -1)
    end
    elseif UserInputService:IsKeyDown(Enum.KeyCode.D) and debounce = false then
        humanoidRootPart:ApplyImpulse(linear.VectorVelocity * 1)

    elseif UserInputService:IsKeyDown(Enum.KeyCode.S) and debounce = false then
        humanoidRootPart:ApplyImpulse(linear.VectorVelocity * 1)

    elseif UserInputService:IsKeyDown(Enum.KeyCode.A) and debounce = false then
        humanoidRootPart:ApplyImpulse(linear.VectorVelocity * -1)
    end
end
warn(Velocity)
if (not Velocity) then
    players.LocalPlayer:ApplyImpulse(worldDir * force)
    return
end

humanoidRootPart:ApplyImpulse(Velocity)