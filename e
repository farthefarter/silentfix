-- // Dependencies
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/farthefarter/rushpoint/main/silent"))()

-- // Services
local Workspace = game:GetService("Workspace")

-- // Vars
local CurrentCamera = Workspace.CurrentCamera
local CFramelookAt = CFrame.lookAt

-- // Hook
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    -- // Make sure it is the shoot function trying to get the camera's cframe
    if (not checkcaller() and t == CurrentCamera and k == "CFrame" and Aiming.Check() and debug.validlevel(3) and #debug.getupvalues(3) == 11) then
        local Origin = __index(t, k).Position
        local Destination = Aiming.SelectedPart.Position

        local Modified = CFramelookAt(Origin, Destination)
        return Modified
    end

    -- // Return old
    return __index(t, k)
end)
