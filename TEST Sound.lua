AntiCheat = {

	IntroAudioOff = false;
    
}

local AudioIds = {7105034056}

if AntiCheat.IntroAudioOff == false then
	local Sound2 = Instance.new("Sound", nil)
	local c = getconnections(game:GetService("PolicyService").ChildAdded)
	for i,v in pairs(c) do v:Disable() end
	Sound2.Parent = game:GetService("PolicyService")
	for i,v in pairs(c) do v:Enable() end
	Sound2.Name = "19324854"
	Sound2.SoundId = "http://www.roblox.com/asset/?id="..AudioIds[1]
	Sound2:Play()
end

---------------------------------------|
while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui do wait() end
-- Constraints: -----------------------|
local ver = "0.0.1"
local cordCode = "LungJuay#9813"
---------------------------------------|
Parents = {[1] = game:GetService("CoreGui"):FindFirstChild("RobloxGui"), [2] = game:GetService("CoreGui"), [3] = game:GetService("Players").LocalPlayer.PlayerGui}
if Parents[1] then
	getParent = Parents[1]
else
	getParent = Parents[2]
end
if PROTOSMASHER_LOADED and get_hidden_gui then getParent = get_hidden_gui() end

local firetouchinterest = firetouchinterest or fake_touch or nil

for _, v in pairs(Parents[1]:GetDescendants()) do
	if v.Name == "holder" then 
		v.Parent:Destroy() 
	end
end
for _, v in pairs(Parents[2]:GetDescendants()) do
	if v.Name == "holder" then 
		v.Parent:Destroy() 
	end
end

if game:GetService("UserInputService").VREnabled then 
	getParent = Parents[3]
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/projects/nexus_support.lua"))()
end

Unnamed = Instance.new("ScreenGui", getParent)
Unnamed.Name = "Unnamed"
Unnamed.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Unnamed.ResetOnSpawn = false
Unnamed.DisplayOrder = 2147483647
if not syn then syn = {} end
if not syn.queue_on_teleport then syn.queue_on_teleport = queue_on_teleport end
if not is_sirhurt_closure and syn.protect_gui then syn.protect_gui(Unnamed) end

sgui = Instance.new("ScreenGui", Unnamed)
sgui.IgnoreGuiInset = true
local function Draw(positionsent, line, thickness)
	local positions = {
		[1] = positionsent and positionsent[1] and UDim2.new(0, positionsent[1].X, 0, positionsent[1].Y) or UDim2.new(0, 0, 0, 0),
		[2] = positionsent and positionsent[2] and UDim2.new(0, positionsent[2].X, 0, positionsent[2].Y) or UDim2.new(0, 0, 0, 0)
	}
	local distances = {
		X = positions[2].X.Offset - positions[1].X.Offset,
		Y = positions[2].Y.Offset - positions[1].Y.Offset
	}
	local distance = (distances.X ^ 2 + distances.Y ^ 2) ^ .5
	local angle = math.atan2(distances.Y, distances.X)
	line.Size = UDim2.new(0, distance, 0, thickness)
	local center = Vector2.new(
		(positions[1].X.Offset + positions[2].X.Offset) / 2,
		(positions[1].Y.Offset + positions[2].Y.Offset) / 2
	)
	line.Position = UDim2.new(0, center.X - distance / 2, 0, center.Y - thickness / 2)
	line.Rotation = math.deg(angle)
	line.BorderSizePixel = 0
	return line
end

oldDrawing = Drawing
newDrawing = {new = function(DrawingType)
	if DrawingType == "Line" then 
		local line = {}
		local line_object = Instance.new("Frame", sgui)
		line_object.ZIndex = 3000
		return setmetatable({},{
			__index = function(self,key)
				if key == "Remove" then
					line_object:Destroy()
					return function() end
				end
			end,
			__newindex = function(self,key,value)
				local thickness = 1
				if key == "Visible" then
					line_object.Visible = value
				elseif key == "From" or key == "To" then
					line[key] = value
				elseif key == "Thickness" then
					thickness = value
				end
				Draw({line.From, line.To}, line_object, thickness * 2)
			end
		})
	elseif DrawingType == "Circle" then
		local circle = {}
		local circle_object = Instance.new("Frame",Parent)
		circle_object.BorderSizePixel = 0
		circle_object.AnchorPoint = Vector2.new(0.5, 0.5)
		Instance.new("UICorner",circle_object).CornerRadius = UDim.new(1,0)
		return setmetatable({},{
			__index = function(self,key)
				if key == "Remove" then
					return function() circle_object:Destroy() end
				end
			end,
			__newindex = function(self,key,value)
				if key == "Visible" then
					circle_object.Visible = value
				elseif key == "Color" then
					circle_object.BackgroundColor3 = value
				elseif key == "Position" then
					circle_object.Position = UDim2.new(0, value.X, 0, value.Y)
				elseif key == "Radius" then
					circle_object.Size = UDim2.new(0, value * 2, 0, value * 2)
				end
			end
		})
	elseif DrawingType == "Text" then
		local text = {}
		local text_object = Instance.new("TextLabel",Parent)
		text_object.BorderSizePixel = 0
		text_object.AnchorPoint = Vector2.new(0.5, 0.5)
		return setmetatable({},{
			__index = function(self,key)
				if key == "Remove" then
					return function() text_object:Destroy() end
				end
			end,
			__newindex = function(self,key,value)
				if key == "Visible" then
					text_object.Visible = value
				elseif key == "Color" then
					text_object.TextColor3 = value
				elseif key == "Position" then
					text_object.Position = UDim2.new(0,value.X,0,value.Y)
				elseif key == "Size" then
					text_object.TextSize = value
				elseif key == "Text" then
					text_object.Text = value
				end
			end
		})
	elseif DrawingType == "Square" then
		local box = {}
		local box_object = Instance.new("Frame",Parent)
		box_object.BorderSizePixel = 0
		box_object.AnchorPoint = Vector2.new(0.5, 0.5)
		return setmetatable({},{
			__index = function(self,key)
				if key == "Remove" then
					return function() box_object:Destroy() end
				end
			end,
			__newindex = function(self,key,value)
				if key == "Visible" then
					box_object.Visible = value
				elseif key == "Color" then
						box_object.BackgroundColor3 = value
				elseif key == "Position" then
					box_object.Position = UDim2.new(0,value.X,0,value.Y)
				elseif key == "Size" then
					box_object.Size = UDim2.new(0,value.X,0,value.Y)
				end
			end
		})
	end
end}
Drawing = Drawing or newDrawing
if drawingtype == "new" then
	if Drawing then
		setreadonly(Drawing, false)
	end
	Drawing = newDrawing
	setreadonly(Drawing, true)
end

local mt = getrawmetatable(game)
local oldindex = mt.__index
setreadonly(mt, false)
mt.__index = newcclosure(function(self,...)
	local args = {...}
	if not checkcaller() and self == getParent and args[1] == Unnamed.Name then
		return nil
	end
	return oldindex(self,...)
end)
setreadonly(mt, true)

_G.Unnamed = Unnamed
_G.dontTween = false
_G.dragVars = {}
_G.connections = {}

function createDrag(object)
	_G.dragVars[object] = {}
	object.MouseEnter:Connect(function()
		_G.dragVars[object].checkMouse = true
		_G.dragVars[object].mdwn = object.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				_G.dragVars[object].startpos = object.Position
				_G.dragVars[object].startdrag = input.Position
				_G.dragVars[object].mouseDown = true
				_G.dragVars[object].mou = input
				_G.dragVars[object].mloo = game:GetService("RunService").RenderStepped:Connect(function()
					if _G.dragVars[object].mouseDown then
						_G.dragVars[object].delta = _G.dragVars[object].mou.Position - _G.dragVars[object].startdrag
						object.Position = UDim2.new(_G.dragVars[object].startpos.X.Scale, _G.dragVars[object].startpos.X.Offset + _G.dragVars[object].delta.X, _G.dragVars[object].startpos.Y.Scale, _G.dragVars[object].startpos.Y.Offset + _G.dragVars[object].delta.Y)
					end
				end)
			end
		end) 
		_G.dragVars[object].mmoved = object.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				_G.dragVars[object].mou = input
			end
		end) 
		object.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				_G.dragVars[object].mouseDown = false
				_G.dragVars[object].mmoved:Disconnect()
				if _G.dragVars[object].mloo then _G.dragVars[object].mloo:Disconnect() end
			end    
		end)
	end)
	object.MouseLeave:Connect(function()
		if _G.dragVars[object].mdwn then
			_G.dragVars[object].mdwn:Disconnect()
		end
	end)
end

function Stand(Text1,Text2,Text3,Text4,Text5,Text6,Text7,Btn)
	if game:GetService("UserInputService").VREnabled then 
		RunDude = true
		return 
	end
	RunDude = false
	LoadingFrame = Instance.new("Frame", getParent)
	RandomReason = Instance.new("TextLabel", getParent)
    RandomReason2 = Instance.new("TextLabel", getParent)
	RunQuestion = Instance.new("TextLabel", getParent)
	Executors = Instance.new("TextLabel", getParent)
	Paid = Instance.new("TextLabel", getParent)
	Free = Instance.new("TextLabel", getParent)
	Help = Instance.new("TextLabel", getParent)
	HmmButton = Instance.new("TextButton", getParent)

	LoadingFrame.Name = "LoadingFrame"
	LoadingFrame.Parent = Unnamed
	LoadingFrame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
	LoadingFrame.BackgroundTransparency = 0.100
	LoadingFrame.Position = UDim2.new(-9.31322575e-10, 0, -0.101388887, 0)
	LoadingFrame.Size = UDim2.new(1, 0, 1.20000005, 0)

	RandomReason.Name = "Random/Reason"
	RandomReason.Parent = LoadingFrame
	RandomReason.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RandomReason.BackgroundTransparency = 1.000
	RandomReason.Position = UDim2.new(0.469992511, 0, 0.335111082, 0)
	RandomReason.Size = UDim2.new(0.0199999996, 0, 0.0500000007, 0)
	RandomReason.Font = Enum.Font.GothamBold
	RandomReason.Text = Text1
	RandomReason.TextColor3 = Color3.fromRGB(255, 0, 0)
	RandomReason.TextSize = 50.000

    RandomReason2.Name = "Random/Reason2"
	RandomReason2.Parent = LoadingFrame
	RandomReason2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RandomReason2.BackgroundTransparency = 1.000
	RandomReason2.Position = UDim2.new(0.689562511, 0, 0.335111082, 0)
	RandomReason2.Size = UDim2.new(0.0199999996, 0, 0.0500000007, 0)
	RandomReason2.Font = Enum.Font.GothamBold
	RandomReason2.Text = Text7
	RandomReason2.TextColor3 = Color3.fromRGB(255, 255, 255)
	RandomReason2.TextSize = 50.000

	RunQuestion.Name = "RunQuestion"
	RunQuestion.Parent = LoadingFrame
	RunQuestion.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	RunQuestion.BackgroundTransparency = 1.000
	RunQuestion.Position = UDim2.new(0.500002511, 0, 0.383953691, 0)
	RunQuestion.Size = UDim2.new(0.0199999996, 0, 0.0500000007, 0)
	RunQuestion.Font = Enum.Font.GothamBold
	RunQuestion.Text = Text2
	RunQuestion.TextColor3 = Color3.fromRGB(255, 255, 255)
	RunQuestion.TextSize = 25.000

	Executors.Name = "Executors"
	Executors.Parent = LoadingFrame
	Executors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Executors.BackgroundTransparency = 1.000
	Executors.Position = UDim2.new(0.492968768, 0, 0.474129587, 0)
	Executors.Size = UDim2.new(0.0130000003, 0, 0.0500000007, 0)
	Executors.Font = Enum.Font.GothamBold
	Executors.Text = Text3
	Executors.TextColor3 = Color3.fromRGB(255, 255, 255)
	Executors.TextSize = 20.000

	Paid.Name = "Paid"
	Paid.Parent = LoadingFrame
	Paid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Paid.BackgroundTransparency = 1.000
	Paid.Position = UDim2.new(0.492968738, 0, 0.496083349, 0)
	Paid.Size = UDim2.new(0.0130000003, 0, 0.0500000007, 0)
	Paid.Font = Enum.Font.GothamBold
	Paid.Text = Text4
	Paid.TextColor3 = Color3.fromRGB(255, 255, 255)
	Paid.TextSize = 17.000

	Help.Name = "Help"
	Help.Parent = LoadingFrame
	Help.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Help.BackgroundTransparency = 1.000
	Help.Position = UDim2.new(0.492968738, 0, 0.66259259, 0)
	Help.Size = UDim2.new(0.0130000003, 0, 0.0500000007, 0)
	Help.Font = Enum.Font.GothamBold
	Help.Text = "Discord : "..cordCode
	Help.TextColor3 = Color3.fromRGB(255, 255, 255)
	Help.TextSize = 20.000

	HmmButton.Name = "HmmButton"
	HmmButton.Parent = LoadingFrame
	HmmButton.BackgroundColor3 = Color3.fromRGB(93, 93, 93)
	HmmButton.BackgroundTransparency = 0.700
	HmmButton.BorderColor3 = Color3.fromRGB(53, 51, 51)
	HmmButton.BorderSizePixel = 0
	HmmButton.Position = UDim2.new(0.424718767, 0, 0.582555592, 0)
	HmmButton.Size = UDim2.new(0.150000006, 0, 0.0500000007, 0)
	HmmButton.Font = Enum.Font.GothamBold
	HmmButton.Text = Text6
	HmmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	HmmButton.TextSize = 30.000
	HmmButton.Visible = Btn
	HmmButton.MouseButton1Down:Connect(function()
		LoadingFrame:Destroy()
		RunDude = true
	end)

	Free.Name = "Free"
	Free.Parent = LoadingFrame
	Free.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Free.BackgroundTransparency = 1.000
	Free.Position = UDim2.new(0.492968738, 0, 0.514601827, 0)
	Free.Size = UDim2.new(0.0130000003, 0, 0.0500000007, 0)
	Free.Font = Enum.Font.GothamBold
	Free.Text = Text5
	Free.TextColor3 = Color3.fromRGB(255, 255, 255)
	Free.TextSize = 17.000
end

local cmdp = game:GetService("Players")
local cmdlp = cmdp.LocalPlayer

Stand("A K A S E N S E I        ", "-----------------------------------------------------------------", " KRATUK JIT KRACHAK JAI ", "", "Sound TEST Version Not have Script | CreditGui:CMDX", "Continue","H U B", true)
while not RunDude do wait() end
