
-- credits to vm#8491 edited by targetcframe

local client_info = {}

function client_info.ping_changed(callback)
    task.spawn(function()
        while wait() do
            local ping = tonumber(math.floor(tostring(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()):split(" ")[1]))
            callback(ping)
        end
    end)
end

function client_info.fps_changed(callback)
    task.spawn(function()
        local LastIteration, Start
        local FrameUpdateTable = {}
        local CurrentFPS = 0
        game:GetService("RunService").Heartbeat:Connect(function()
            LastIteration = tick()
            for Index = #FrameUpdateTable, 1, -1 do
                FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
            end
            FrameUpdateTable[1] = LastIteration
            callback(math.floor((tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))))
        end)
        Start = tick()
    end)
end

client_info.game_name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local watermark = {name = "Aerial", accent = Color3.fromRGB(207, 89, 201), visible = true}

local Box = Drawing.new("Square")
Box.Transparency = 1
Box.Size = Vector2.new(246, 30)
Box.Position = Vector2.new(10, 10)
Box.Filled = true
Box.Visible = true
Box.Thickness = 0
Box.Color = Color3.fromRGB(20, 20, 20)

local Box2 = Drawing.new("Square")
Box2.Transparency = 1
Box2.Size = Vector2.new(240, 24)
Box2.Position = Vector2.new(13, 13)
Box2.Filled = true
Box2.Visible = true
Box2.Thickness = 9
Box2.Color = Color3.fromRGB(33, 33, 33)

local Box3 = Drawing.new("Square")
Box3.Transparency = 1
Box3.Size = Vector2.new(238, 1)
Box3.Position = Vector2.new(14, 14)
Box3.Filled = true
Box3.Visible = true
Box3.Thickness = 0
Box3.Color = watermark.accent or Color3.fromRGB(51,102,255)

local text = Drawing.new("Text")
text.Transparency = 1
text.Position = Vector2.new(14, 17)
text.Font = Drawing.Fonts.Plex
text.Size = 16
text.Visible = true
text.Center = false
text.Color = Color3.fromRGB(255, 255, 255)
text.Text = " " .. watermark.name .. " | 0 FPS | 0ms"

client_info.fps_changed(function(fps)
    local ping = 0
    client_info.ping_changed(function(newPing)
        ping = newPing
        text.Text = " " .. watermark.name .. " | " .. fps .. " FPS | " .. ping .. "ms"
        
        Box.Size = Vector2.new(text.TextBounds.X + 10, 30)
        Box2.Size = Vector2.new(Box.Size.X - 6, 24)
        Box3.Size = Vector2.new(Box2.Size.X - 2, 1)
        Box3.Color = watermark.accent or Color3.fromRGB(51,102,255)
        
        text.Visible = watermark.visible
        Box.Visible = watermark.visible
        Box2.Visible = watermark.visible
        Box3.Visible = watermark.visible
    end)
end)

return client_info
