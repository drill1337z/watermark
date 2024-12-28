local Flash = Instance.new("ColorCorrectionEffect")
Flash.Parent = Lighting

local Blur = Instance.new("BlurEffect")
Blur.Parent = Lighting
Blur.Size = 0

local Gui = Instance.new("ScreenGui")
Gui.Name = "RobloxGui"
Gui.Parent = player:WaitForChild("PlayerGui")
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Image = Instance.new("ImageLabel")
Image.Parent = Gui
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1
Image.Position = UDim2.new(0.405, 0, 0.405, 0)
Image.Size = UDim2.new(0.17, 0, 0.27, 0)
Image.ImageTransparency = 1
Image.Image = "rbxassetid://120861118620679"

local blurTween = TweenService:Create(Blur, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = 50})
blurTween:Play()
blurTween.Completed:Wait()

local imageFadeIn = TweenService:Create(Image, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0.2})
imageFadeIn:Play()
imageFadeIn.Completed:Wait()

local imageResize = TweenService:Create(Image, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Size = UDim2.new(0.15, 0, 0.25, 0)})
imageResize:Play()

local imageReposition = TweenService:Create(Image, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.415, 0, 0.415, 0)})
imageReposition:Play()

Flash.TintColor = Color3.fromRGB(223, 91, 91)
TweenService:Create(Flash, TweenInfo.new(0.7), {TintColor = Color3.fromRGB(255, 255, 255)}):Play()

task.wait(1)

local imageFadeOut = TweenService:Create(Image, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1})
imageFadeOut:Play()

local blurFadeOut = TweenService:Create(Blur, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})
blurFadeOut:Play()
blurFadeOut.Completed:Wait()

Gui:Destroy()
Flash:Destroy()
Blur:Destroy()
