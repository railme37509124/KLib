repeat task.wait() until game:IsLoaded()
klib = {
	Tabs={},Hover=false,TabCount=0,DragSpeed=0.2
}

local gui = Instance.new("ScreenGui")
local dragbar = Instance.new("Frame")
local container = Instance.new("Frame")
local selecttabs = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local content = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local div = Instance.new("Frame")
gui.Name = "gui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.Parent = game.Players.LocalPlayer.PlayerGui
dragbar.Parent = gui
dragbar.Size = UDim2.new(0, 576, 0, 69)
dragbar.Position = UDim2.new(0.356, 0, 0.283, 0)
dragbar.BackgroundTransparency = 1
dragbar.ZIndex = 400
local UIS = game:GetService("UserInputService")
function dragify(Frame)
	dragToggle = nil
	dragInput = nil
	dragStart = nil
	dragPos = nil
	function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(klib.DragSpeed, Enum.EasingStyle.Quint), {Position = Position}):Play()
	end
	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end
dragify(dragbar)

UIListLayout.Padding = UDim.new(0, 5)
container.Name = "container"
container.Parent = dragbar
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.BackgroundTransparency = 1.000
container.BorderColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 0
container.Position = UDim2.new(-0.189, 0, -0.116, 0)
container.Size = UDim2.new(0, 694, 0, 450)
selecttabs.Name = "selecttabs"
selecttabs.Parent = container
selecttabs.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
selecttabs.BackgroundTransparency = 0.500
selecttabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
selecttabs.BorderSizePixel = 0
selecttabs.Size = UDim2.new(0.129999995, 0, 1, 0)
UICorner.Parent = selecttabs
ScrollingFrame.Parent = selecttabs
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Size = UDim2.new(1, 0, 0.984, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.ScrollBarThickness = 3
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.Position = UDim2.new(0, 0, 0.016, 0)
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(42, 42, 42)
content.Name = "content"
content.Parent = container
content.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
content.BackgroundTransparency = 0.500
content.BorderColor3 = Color3.fromRGB(0, 0, 0)
content.BorderSizePixel = 0
content.Position = UDim2.new(0.162857056, 0, 0, 0)
content.Size = UDim2.new(0.8357144, 0, 1, 0)
UICorner_2.Parent = content
UIListLayout.Parent = ScrollingFrame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
div.Name = "div"
div.Parent = ScrollingFrame
div.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
div.BackgroundTransparency = 0.500
div.BorderColor3 = Color3.fromRGB(0, 0, 0)
div.BorderSizePixel = 0
div.Position = UDim2.new(0.0289291237, 0, 0, 0)
div.Size = UDim2.new(0, 77, 0, 1)

klib.CreateTab = function(options)
	local tabcreateelementfunc = {}
	local Sometab = Instance.new("Frame")
	local SometabUICorner = Instance.new("UICorner")
	local SometabImageLabel = Instance.new("ImageLabel")
	local SometabUIStroke = Instance.new("UIStroke")
	local SometabClick = Instance.new("TextButton")
	local SomeTabOPH = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local actualcontent = Instance.new("Frame")
	local ophcorner = Instance.new("UICorner")
	local ophScrollingFrame = Instance.new("ScrollingFrame")
	local ophlist = Instance.new("UIListLayout")
	Sometab.Name = options.Name
	Sometab.Parent = ScrollingFrame
	Sometab.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	Sometab.BackgroundTransparency = 0.500
	Sometab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Sometab.BorderSizePixel = 0
	Sometab.Position = UDim2.new(0.112059258, 0, 0, 0)
	Sometab.Size = UDim2.new(0, 70, 0, 70)
	SometabUICorner.CornerRadius = UDim.new(0, 5)
	SometabUICorner.Parent = Sometab
	SometabImageLabel.Parent = Sometab
	SometabImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	SometabImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SometabImageLabel.BackgroundTransparency = 1.000
	SometabImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SometabImageLabel.BorderSizePixel = 0
	SometabImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	SometabImageLabel.Size = UDim2.new(0.45, 0, 0.45, 0)
	SometabImageLabel.Image = options.Image or "rbxassetid://99469135415524"
	SometabImageLabel.ScaleType = Enum.ScaleType.Fit
	SometabImageLabel.ImageColor3 = Color3.fromRGB(169, 169, 169)
	SometabUIStroke.Name = "UIStroke"
	SometabUIStroke.Color = Color3.fromRGB(56, 56, 56)
	SometabUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	SometabUIStroke.Parent = Sometab
	SometabClick.Text = ""
	SometabClick.Size = UDim2.new(1, 0, 1, 0)
	SometabClick.Parent = Sometab
	SometabClick.ZIndex = 2
	SometabClick.BackgroundTransparency = 1
	SomeTabOPH.Name = "SomeTabOPH"
	SomeTabOPH.Parent = content
	SomeTabOPH.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	SomeTabOPH.BackgroundTransparency = 0.500
	SomeTabOPH.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SomeTabOPH.BorderSizePixel = 0
	SomeTabOPH.Position = UDim2.new(0.0241385233, 0, 0.0288888887, 0)
	SomeTabOPH.Size = UDim2.new(0, 554, 0, 59)
	SomeTabOPH.Visible = false
	UICorner.Parent = SomeTabOPH
	TextLabel.Parent = SomeTabOPH
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0, 200, 0, 29)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = options.Name
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	actualcontent.Name = "actualcontent"
	actualcontent.Parent = SomeTabOPH
	actualcontent.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
	actualcontent.BackgroundTransparency = 0.500
	actualcontent.BorderColor3 = Color3.fromRGB(0, 0, 0)
	actualcontent.BorderSizePixel = 0
	actualcontent.Position = UDim2.new(0, 0, 1.18644071, 0)
	actualcontent.Size = UDim2.new(0, 554, 0, 356)
	ophcorner.Name = "ophcorner"
	ophcorner.Parent = actualcontent
	ophScrollingFrame.Name = "ophScrollingFrame"
	ophScrollingFrame.Parent = actualcontent
	ophScrollingFrame.Active = true
	ophScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ophScrollingFrame.BackgroundTransparency = 1.000
	ophScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ophScrollingFrame.BorderSizePixel = 0
	ophScrollingFrame.Position = UDim2.new(0, 0, 0.0155555559, 0)
	ophScrollingFrame.Size = UDim2.new(1, 0, 0.98444438, 0)
	ophScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	ophScrollingFrame.ScrollBarThickness = 3
	ophScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ophlist.Name = "ophlist"
	ophlist.Parent = ophScrollingFrame
	ophlist.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ophlist.SortOrder = Enum.SortOrder.LayoutOrder
	ophlist.Padding = UDim.new(0, 5)
	local SomeTabFunc = {
		Selected = false
	}
	klib.Tabs[Sometab] = {[1] = Sometab, [2] = SomeTabFunc, [3]=SomeTabOPH}
	klib.TabCount+=1
	SomeTabFunc.OnClick = function()
		for i, v in klib.Tabs do
			if v[1] ~= Sometab then
				v[2].Selected = false
				game:GetService("TweenService"):Create(v[1].UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {Color = Color3.fromRGB(56, 56, 56)}):Play()
				game:GetService("TweenService"):Create(v[1], TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundColor3 = Color3.fromRGB(43, 43, 43)}):Play()
				game:GetService("TweenService"):Create(v[1].ImageLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageColor3 = Color3.fromRGB(169, 169, 169)}):Play()
				v[3].Visible = false
			end
		end
		
		SomeTabFunc.Selected = not SomeTabFunc.Selected
		SomeTabOPH.Visible = SomeTabFunc.Selected
		game:GetService("TweenService"):Create(SometabUIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {Color = (SomeTabFunc.Selected and Color3.fromRGB(154, 154, 154)) or Color3.fromRGB(56, 56, 56)}):Play()
		game:GetService("TweenService"):Create(Sometab, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {BackgroundColor3 = (SomeTabFunc.Selected and Color3.fromRGB(52, 52, 52)) or Color3.fromRGB(43, 43, 43)}):Play()
		game:GetService("TweenService"):Create(SometabImageLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageColor3 = (SomeTabFunc.Selected and Color3.fromRGB(255, 255, 255)) or Color3.fromRGB(169, 169, 169)}):Play()
	end

	if klib.TabCount == 1 then SomeTabFunc.OnClick() end
	SometabClick.MouseButton1Click:Connect(SomeTabFunc.OnClick)
	
	function tabcreateelementfunc:MakeToggle(options)
		local togfunc = {
			Toggled = false
		}
		local sometoggle = Instance.new("Frame")
		local togglecorner = Instance.new("UICorner")
		local togindicator = Instance.new("ImageLabel")
		local togdiv = Instance.new("Frame")
		local togname = Instance.new("TextLabel")
		local togclickbox = Instance.new("TextButton")
		sometoggle.Name = "sometoggle"
		sometoggle.Parent = ophScrollingFrame
		sometoggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		sometoggle.BackgroundTransparency = 0.500
		sometoggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sometoggle.BorderSizePixel = 0
		sometoggle.Position = UDim2.new(0.0144404331, 0, 0, 0)
		sometoggle.Size = UDim2.new(0, 538, 0, 38)
		togglecorner.Name = "togglecorner"
		togglecorner.Parent = sometoggle
		togindicator.Name = "togindicator"
		togindicator.Parent = sometoggle
		togindicator.AnchorPoint = Vector2.new(0, 0.5)
		togindicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		togindicator.BackgroundTransparency = 1.000
		togindicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
		togindicator.BorderSizePixel = 0
		togindicator.Position = UDim2.new(0.0111524165, 0, 0.5, 0)
		togindicator.Size = UDim2.new(0, 30, 0, 30)
		togindicator.Image = "rbxassetid://106014360624383"
		togdiv.Name = "togdiv"
		togdiv.Parent = sometoggle
		togdiv.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		togdiv.BorderColor3 = Color3.fromRGB(0, 0, 0)
		togdiv.BorderSizePixel = 0
		togdiv.Position = UDim2.new(0.0669144988, 0, 0.236842111, 0)
		togdiv.Size = UDim2.new(0, 1, 0, 20)
		togname.Name = "togname"
		togname.Parent = sometoggle
		togname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		togname.BackgroundTransparency = 1.000
		togname.BorderColor3 = Color3.fromRGB(0, 0, 0)
		togname.BorderSizePixel = 0
		togname.Position = UDim2.new(0.0817843899, 0, 0.236842111, 0)
		togname.Size = UDim2.new(0, 200, 0, 20)
		togname.Font = Enum.Font.SourceSans
		togname.Text = options.Name
		togname.TextColor3 = Color3.fromRGB(255, 255, 255)
		togname.TextScaled = true
		togname.TextSize = 14.000
		togname.TextWrapped = true
		togname.TextXAlignment = Enum.TextXAlignment.Left	
		togclickbox.Name = "togclickbox"
		togclickbox.Parent = sometoggle
		togclickbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		togclickbox.BackgroundTransparency = 1.000
		togclickbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		togclickbox.BorderSizePixel = 0
		togclickbox.Size = UDim2.new(1, 0, 1, 0)
		togclickbox.ZIndex = 2
		togclickbox.Font = Enum.Font.SourceSans
		togclickbox.Text = ""
		togclickbox.TextColor3 = Color3.fromRGB(0, 0, 0)
		togclickbox.TextSize = 14.000
		
		togclickbox.MouseButton1Click:Connect(function()
			togfunc.Toggled = not togfunc.Toggled
			spawn(function() options.Callback(togfunc.Toggled) end)
			game:GetService("TweenService"):Create(togindicator, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Rotation = 360}):Play()
			task.wait(0.175)
			togindicator.Image = (togfunc.Toggled and "rbxassetid://98734213058901") or "rbxassetid://106014360624383"
			task.wait(0.175)
			togindicator.Rotation = 0
		end)
		
	end
	
	function tabcreateelementfunc:MakeButton(options)
		local somebutton = Instance.new("Frame")
		local buttoncorner = Instance.new("UICorner")
		local buttondiv = Instance.new("Frame")
		local buttonname = Instance.new("TextLabel")
		local buttonclickbox = Instance.new("TextButton")
		local buttonindicator = Instance.new("TextLabel")

		somebutton.Name = "somebutton"
		somebutton.Parent = ophScrollingFrame
		somebutton.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		somebutton.BackgroundTransparency = 0.500
		somebutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		somebutton.BorderSizePixel = 0
		somebutton.Position = UDim2.new(0.0144404331, 0, 0, 0)
		somebutton.Size = UDim2.new(0, 538, 0, 38)
		buttoncorner.Name = "buttoncorner"
		buttoncorner.Parent = somebutton
		buttondiv.Name = "buttondiv"
		buttondiv.Parent = somebutton
		buttondiv.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		buttondiv.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttondiv.BorderSizePixel = 0
		buttondiv.Position = UDim2.new(0.868029714, 0, 0.236842111, 0)
		buttondiv.Size = UDim2.new(0, 1, 0, 20)
		buttondiv.ZIndex = 4
		buttonname.Name = "buttonname"
		buttonname.Parent = somebutton
		buttonname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonname.BackgroundTransparency = 1.000
		buttonname.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonname.BorderSizePixel = 0
		buttonname.Position = UDim2.new(0.0241635684, 0, 0.236842111, 0)
		buttonname.Size = UDim2.new(0, 200, 0, 20)
		buttonname.Font = Enum.Font.SourceSans
		buttonname.Text = options.Name
		buttonname.TextColor3 = Color3.fromRGB(255, 255, 255)
		buttonname.TextScaled = true
		buttonname.TextSize = 14.000
		buttonname.TextWrapped = true
		buttonname.TextXAlignment = Enum.TextXAlignment.Left
		buttonclickbox.Name = "buttonclickbox"
		buttonclickbox.Parent = somebutton
		buttonclickbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonclickbox.BackgroundTransparency = 1.000
		buttonclickbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonclickbox.BorderSizePixel = 0
		buttonclickbox.Size = UDim2.new(1, 0, 1, 0)
		buttonclickbox.ZIndex = 2
		buttonclickbox.Font = Enum.Font.SourceSans
		buttonclickbox.Text = ""
		buttonclickbox.TextColor3 = Color3.fromRGB(0, 0, 0)
		buttonclickbox.TextSize = 14.000
		buttonindicator.Name = "buttonindicator"
		buttonindicator.Parent = somebutton
		buttonindicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		buttonindicator.BackgroundTransparency = 1.000
		buttonindicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
		buttonindicator.BorderSizePixel = 0
		buttonindicator.Position = UDim2.new(0.886617124, 0, 0.236842111, 0)
		buttonindicator.Size = UDim2.new(0, 50, 0, 20)
		buttonindicator.Font = Enum.Font.SourceSans
		buttonindicator.Text = "button"
		buttonindicator.TextColor3 = Color3.fromRGB(117, 117, 117)
		buttonindicator.TextScaled = true
		buttonindicator.TextSize = 14.000
		buttonindicator.TextWrapped = true
		buttonindicator.TextXAlignment = Enum.TextXAlignment.Left
		
		buttonclickbox.MouseButton1Click:Connect(function()
			spawn(function() options.Callback() end)
		end)
	end
	
	function tabcreateelementfunc:MakeTextBox(options)
		local sometextbox = Instance.new("Frame")
		local textboxcorner = Instance.new("UICorner")
		local textboxdiv = Instance.new("Frame")
		local textboxname = Instance.new("TextLabel")
		local textinputholder = Instance.new("Frame")
		local textboxinput = Instance.new("TextBox")
		local textboxcorner_2 = Instance.new("UICorner")

		sometextbox.Name = "sometextbox"
		sometextbox.Parent = ophScrollingFrame
		sometextbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		sometextbox.BackgroundTransparency = 0.500
		sometextbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sometextbox.BorderSizePixel = 0
		sometextbox.Position = UDim2.new(0.0144404331, 0, 0, 0)
		sometextbox.Size = UDim2.new(0, 538, 0, 38)
		textboxcorner.Name = "textboxcorner"
		textboxcorner.Parent = sometextbox
		textboxdiv.Name = "textboxdiv"
		textboxdiv.Parent = sometextbox
		textboxdiv.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		textboxdiv.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textboxdiv.BorderSizePixel = 0
		textboxdiv.Position = UDim2.new(0.719330847, 0, 0.236842111, 0)
		textboxdiv.Size = UDim2.new(0, 1, 0, 20)
		textboxname.Name = "textboxname"
		textboxname.Parent = sometextbox
		textboxname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		textboxname.BackgroundTransparency = 1.000
		textboxname.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textboxname.BorderSizePixel = 0
		textboxname.Position = UDim2.new(0.0241635684, 0, 0.236842111, 0)
		textboxname.Size = UDim2.new(0, 200, 0, 20)
		textboxname.Font = Enum.Font.SourceSans
		textboxname.Text = options.Name
		textboxname.TextColor3 = Color3.fromRGB(255, 255, 255)
		textboxname.TextScaled = true
		textboxname.TextSize = 14.000
		textboxname.TextWrapped = true
		textboxname.TextXAlignment = Enum.TextXAlignment.Left
		textinputholder.Name = "textinputholder"
		textinputholder.Parent = sometextbox
		textinputholder.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
		textinputholder.BackgroundTransparency = 0.500
		textinputholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textinputholder.BorderSizePixel = 0
		textinputholder.Position = UDim2.new(0.737999976, 0, 0.237000003, 0)
		textinputholder.Size = UDim2.new(0, 130, 0, 20)
		textboxinput.Name = "textboxinput"
		textboxinput.Parent = textinputholder
		textboxinput.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
		textboxinput.BackgroundTransparency = 1.000
		textboxinput.BorderColor3 = Color3.fromRGB(0, 0, 0)
		textboxinput.BorderSizePixel = 0
		textboxinput.Position = UDim2.new(0.0461538471, 0, 0, 0)
		textboxinput.Size = UDim2.new(0, 124, 0, 20)
		textboxinput.Font = Enum.Font.SourceSans
		textboxinput.TextColor3 = Color3.fromRGB(255, 255, 255)
		textboxinput.TextSize = 14.000
		textboxinput.TextWrapped = true
		textboxinput.TextXAlignment = Enum.TextXAlignment.Left
		textboxinput.Text = ""
		textboxinput.PlaceholderText = options.Placeholder or "Input Text"
		textboxcorner_2.CornerRadius = UDim.new(0, 5)
		textboxcorner_2.Name = "textboxcorner"
		textboxcorner_2.Parent = textinputholder
		
		textboxinput.FocusLost:Connect(function(enterpressed)
			if (enterpressed) then
				options.Callback(textboxinput.Text)
				textboxinput.Text = ""
			end
		end)
		
	end
	
	function tabcreateelementfunc:MakeDropdown(options)
		local ddfunc = {
			Open = false,
			SelectedItem = false
		}
		local somedropdown = Instance.new("Frame")
		local dropdowncorner = Instance.new("UICorner")
		local dropdowndiv = Instance.new("Frame")
		local dropdownname = Instance.new("TextLabel")
		local dropdownselected = Instance.new("TextLabel")
		local dropdowndiv_2 = Instance.new("Frame")
		local selectsomethingdropdown = Instance.new("ImageLabel")
		local Dropdowncontent = Instance.new("Frame")
		local Dropdowncontentcorner = Instance.new("UICorner")
		local dropdowncontentholder = Instance.new("ScrollingFrame")
		local dropdowncontentholderlist = Instance.new("UIListLayout")
		local dropdownclickbox = Instance.new("TextButton")
		somedropdown.Name = "somedropdown"
		somedropdown.Parent = ophScrollingFrame
		somedropdown.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		somedropdown.BackgroundTransparency = 0.500
		somedropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		somedropdown.BorderSizePixel = 0
		somedropdown.Position = UDim2.new(0.0144404331, 0, 0.368085355, 0)
		somedropdown.Size = UDim2.new(0, 538, 0, 38)
		dropdowncorner.Name = "dropdowncorner"
		dropdowncorner.Parent = somedropdown
		dropdowndiv.Name = "dropdowndiv"
		dropdowndiv.Parent = somedropdown
		dropdowndiv.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		dropdowndiv.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdowndiv.BorderSizePixel = 0
		dropdowndiv.Position = UDim2.new(0, 374, 0, 9)
		dropdowndiv.Size = UDim2.new(0, 1, 0, 20)
		dropdownname.Name = "dropdownname"
		dropdownname.Parent = somedropdown
		dropdownname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownname.BackgroundTransparency = 1.000
		dropdownname.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdownname.BorderSizePixel = 0
		dropdownname.Position = UDim2.new(0, 36, 0, 9)
		dropdownname.Size = UDim2.new(0, 200, 0, 20)
		dropdownname.Font = Enum.Font.SourceSans
		dropdownname.Text = options.Name
		dropdownname.TextColor3 = Color3.fromRGB(255, 255, 255)
		dropdownname.TextScaled = true
		dropdownname.TextSize = 14.000
		dropdownname.TextWrapped = true
		dropdownname.TextXAlignment = Enum.TextXAlignment.Left
		dropdownselected.Name = "dropdownselected"
		dropdownselected.Parent = somedropdown
		dropdownselected.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownselected.BackgroundTransparency = 1.000
		dropdownselected.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdownselected.BorderSizePixel = 0
		dropdownselected.Position = UDim2.new(0, 381, 0, 9)
		dropdownselected.Size = UDim2.new(0, 140, 0, 20)
		dropdownselected.Font = Enum.Font.SourceSans
		dropdownselected.Text = "None"
		dropdownselected.TextColor3 = Color3.fromRGB(117, 117, 117)
		dropdownselected.TextSize = 14.000
		dropdownselected.TextWrapped = true
		dropdowndiv_2.Name = "dropdowndiv"
		dropdowndiv_2.Parent = somedropdown
		dropdowndiv_2.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		dropdowndiv_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdowndiv_2.BorderSizePixel = 0
		dropdowndiv_2.Position = UDim2.new(0, 525, 0, 9)
		dropdowndiv_2.Size = UDim2.new(0, 1, 0, 20)
		selectsomethingdropdown.Name = "selectsomethingdropdown"
		selectsomethingdropdown.Parent = somedropdown
		selectsomethingdropdown.AnchorPoint = Vector2.new(0, 0.5)
		selectsomethingdropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		selectsomethingdropdown.BackgroundTransparency = 1.000
		selectsomethingdropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
		selectsomethingdropdown.BorderSizePixel = 0
		selectsomethingdropdown.Position = UDim2.new(0, 9, 0, 18)
		selectsomethingdropdown.Size = UDim2.new(0, 22, 0, 22)
		selectsomethingdropdown.Image = "rbxassetid://127076449661020"
		Dropdowncontent.Name = "Dropdowncontent"
		Dropdowncontent.Parent = somedropdown
		Dropdowncontent.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		Dropdowncontent.BackgroundTransparency = 0.500
		Dropdowncontent.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Dropdowncontent.BorderSizePixel = 0
		Dropdowncontent.Position = UDim2.new(0.0241635684, 0, 0.244755238, 0)
		Dropdowncontent.Size = UDim2.new(0, 514, 0, 97)
		Dropdowncontent.Visible = false
		Dropdowncontentcorner.Name = "Dropdowncontentcorner"
		Dropdowncontentcorner.Parent = Dropdowncontent
		dropdowncontentholder.Name = "dropdowncontentholder"
		dropdowncontentholder.Parent = Dropdowncontent
		dropdowncontentholder.Active = true
		dropdowncontentholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdowncontentholder.BackgroundTransparency = 1.000
		dropdowncontentholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdowncontentholder.BorderSizePixel = 0
		dropdowncontentholder.Position = UDim2.new(0, 0, 0.0824742243, 0)
		dropdowncontentholder.Size = UDim2.new(1, 0, 0.855670094, 0)
		dropdowncontentholder.CanvasSize = UDim2.new(0, 0, 0, 0)
		dropdowncontentholder.ScrollBarThickness = 4
		dropdowncontentholder.AutomaticCanvasSize = Enum.AutomaticSize.Y
		dropdowncontentholderlist.Name = "dropdowncontentholderlist"
		dropdowncontentholderlist.Parent = dropdowncontentholder
		dropdowncontentholderlist.HorizontalAlignment = Enum.HorizontalAlignment.Center
		dropdowncontentholderlist.SortOrder = Enum.SortOrder.LayoutOrder
		dropdowncontentholderlist.Padding = UDim.new(0, 5)
		dropdownclickbox.Name = "dropdownclickbox"
		dropdownclickbox.Parent = somedropdown
		dropdownclickbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdownclickbox.BackgroundTransparency = 1.000
		dropdownclickbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdownclickbox.BorderSizePixel = 0
		dropdownclickbox.Size = UDim2.new(1, 0, 0, 38)
		dropdownclickbox.ZIndex = 2
		dropdownclickbox.Font = Enum.Font.SourceSans
		dropdownclickbox.Text = ""
		dropdownclickbox.TextColor3 = Color3.fromRGB(0, 0, 0)
		dropdownclickbox.TextSize = 14.000
		ddfunc.OnClick = function()
			ddfunc.Open = not ddfunc.Open
			game:GetService("TweenService"):Create(selectsomethingdropdown, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Rotation = (ddfunc.Open and 180) or 360}):Play()
			game:GetService("TweenService"):Create(somedropdown, TweenInfo.new(0.35, Enum.EasingStyle.Sine), {Size = (ddfunc.Open and UDim2.new(0, 538, 0, 143)) or  UDim2.new(0, 538, 0, 38)}):Play()
			Dropdowncontent.Visible = ddfunc.Open
			if not ddfunc.Open then 
				task.spawn(function()
					task.wait(0.37)
					selectsomethingdropdown.Rotation = 0
				end) 
			end
		end
		dropdownclickbox.MouseButton1Click:Connect(ddfunc.OnClick)
		
		for i, v in options.List do
			local Somedropdownthing = Instance.new("TextButton")
			local dropdownoptioncorner = Instance.new("UICorner")
			Somedropdownthing.Name = "Somedropdownthing"
			Somedropdownthing.Parent = dropdowncontentholder
			Somedropdownthing.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
			Somedropdownthing.BackgroundTransparency = 0.500
			Somedropdownthing.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Somedropdownthing.BorderSizePixel = 0
			Somedropdownthing.Position = UDim2.new(0.00583657576, 0, 0, 0)
			Somedropdownthing.Size = UDim2.new(0, 499, 0, 24)
			Somedropdownthing.AutoButtonColor = false
			Somedropdownthing.Font = Enum.Font.SourceSans
			Somedropdownthing.Text = tostring(v)
			Somedropdownthing.TextColor3 = Color3.fromRGB(255, 255, 255)
			Somedropdownthing.TextSize = 14.000
			dropdownoptioncorner.Name = "dropdownoptioncorner"
			dropdownoptioncorner.Parent = Somedropdownthing
			
			Somedropdownthing.MouseButton1Click:Connect(function()
				ddfunc.OnClick()
				dropdownselected.Text = tostring(v)
				options.Callback(v)
			end)
		end
	end
	
	function tabcreateelementfunc:MakeSlider(options)
		local slfunc = {
			Dragging = false,
			Mouse = game.Players.LocalPlayer:GetMouse()
		}
		local someslider = Instance.new("Frame")
		local slidercorner = Instance.new("UICorner")
		local sliderdiv = Instance.new("Frame")
		local slidername = Instance.new("TextLabel")
		local sliderreal = Instance.new("Frame")
		local sliderline = Instance.new("Frame")
		local sliderhold = Instance.new("Frame")
		local slidereb = Instance.new("TextButton")
		local sliderval = Instance.new("TextLabel")
		someslider.Name = "someslider"
		someslider.Parent = ophScrollingFrame
		someslider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
		someslider.BackgroundTransparency = 0.500
		someslider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		someslider.BorderSizePixel = 0
		someslider.Position = UDim2.new(0.0144404331, 0, 0, 0)
		someslider.Size = UDim2.new(0, 538, 0, 38)
		slidercorner.Name = "slidercorner"
		slidercorner.Parent = someslider
		sliderdiv.Name = "sliderdiv"
		sliderdiv.Parent = someslider
		sliderdiv.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
		sliderdiv.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderdiv.BorderSizePixel = 0
		sliderdiv.Position = UDim2.new(0.736059487, 0, 0.236842111, 0)
		sliderdiv.Size = UDim2.new(0, 1, 0, 20)
		slidername.Name = "slidername"
		slidername.Parent = someslider
		slidername.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		slidername.BackgroundTransparency = 1.000
		slidername.BorderColor3 = Color3.fromRGB(0, 0, 0)
		slidername.BorderSizePixel = 0
		slidername.Position = UDim2.new(0.0241635684, 0, 0.236842111, 0)
		slidername.Size = UDim2.new(0, 200, 0, 20)
		slidername.Font = Enum.Font.SourceSans
		slidername.Text = options.Name
		slidername.TextColor3 = Color3.fromRGB(255, 255, 255)
		slidername.TextScaled = true
		slidername.TextSize = 14.000
		slidername.TextWrapped = true
		slidername.TextXAlignment = Enum.TextXAlignment.Left
		sliderreal.Name = "sliderreal"
		sliderreal.Parent = someslider
		sliderreal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sliderreal.BackgroundTransparency = 1.000
		sliderreal.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderreal.BorderSizePixel = 0
		sliderreal.Position = UDim2.new(0.75836432, 0, 0.236842111, 0)
		sliderreal.Size = UDim2.new(0, 118, 0, 20)
		sliderline.Name = "sliderline"
		sliderline.Parent = sliderreal
		sliderline.AnchorPoint = Vector2.new(0, 0.5)
		sliderline.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
		sliderline.BackgroundTransparency = 0.500
		sliderline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderline.BorderSizePixel = 0
		sliderline.Position = UDim2.new(0, 0, 0.5, 0)
		sliderline.Size = UDim2.new(1, 0, 0, 3)
		sliderhold.Name = "sliderhold"
		sliderhold.Parent = sliderreal
		sliderhold.AnchorPoint = Vector2.new(0, 0.5)
		sliderhold.BackgroundColor3 = Color3.fromRGB(97, 97, 97)
		sliderhold.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderhold.BorderSizePixel = 0
		sliderhold.Position = UDim2.new(0, 0, 0.5, 0)
		sliderhold.Size = UDim2.new(0, 4, 0, 20)
		slidereb.Text = ""
		slidereb.Parent = sliderreal
		slidereb.ZIndex = 2
		slidereb.Size = UDim2.new(1, 0, 1, 0)
		slidereb.BackgroundTransparency = 1
		sliderval.Name = "sliderval"
		sliderval.Parent = someslider
		sliderval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		sliderval.BackgroundTransparency = 1.000
		sliderval.BorderColor3 = Color3.fromRGB(0, 0, 0)
		sliderval.BorderSizePixel = 0
		sliderval.Position = UDim2.new(0.524163544, 0, 0.236842111, 0)
		sliderval.Size = UDim2.new(0, 105, 0, 20)
		sliderval.Font = Enum.Font.SourceSans
		sliderval.Text = options.Min
		sliderval.TextColor3 = Color3.fromRGB(117, 117, 117)
		sliderval.TextScaled = true
		sliderval.TextSize = 14.000
		sliderval.TextWrapped = true
		sliderval.TextXAlignment = Enum.TextXAlignment.Right
		slidereb.MouseButton1Down:Connect(function()
			slfunc.Dragging = true
			task.spawn(function()
				while slfunc.Dragging do
					local output = math.clamp((slfunc.Mouse.X - sliderreal.AbsolutePosition.X)/sliderreal.AbsoluteSize.X, 0, 1)
					sliderhold.Position = UDim2.new(tonumber(output), 0, 0.5, 0)
					output = options.Min + (output * (options.Max - options.Min))
					output = (options.Round and math.round(output)) or output
					sliderval.Text = tostring(output)
					options.Callback(output)
					task.wait()
				end
			end)
		end)
		
		slidereb.MouseButton1Up:Connect(function()
			slfunc.Dragging = false
		end)
	end
	
	return tabcreateelementfunc
end

function klib.SendNotification(title, text)
	local newnotif = Instance.new("Frame")
	local bottomline = Instance.new("Frame")
	local notifcorner2 = Instance.new("UICorner")
	local bottomlinecornerfix = Instance.new("Frame")
	local notifcorner1 = Instance.new("UICorner")
	local topline = Instance.new("Frame")
	local newnotifTextLabel = Instance.new("TextLabel")
	local newnotifTextLabel_2 = Instance.new("TextLabel")
	newnotif.Name = "newnotif"
	newnotif.Parent = game.StarterGui.guia.notifications
	newnotif.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	newnotif.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newnotif.BorderSizePixel = 0
	newnotif.Position = UDim2.new(0.468010247, 0, 0, 0)
	newnotif.Size = UDim2.new(0, 421, 0, 100)
	bottomline.Name = "bottomline"
	bottomline.Parent = newnotif
	bottomline.BackgroundColor3 = Color3.fromRGB(15, 123, 255)
	bottomline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bottomline.BorderSizePixel = 0
	bottomline.Position = UDim2.new(0, 0, 0.930000007, 0)
	bottomline.Size = UDim2.new(0, 421, 0, 7)
	notifcorner2.Name = "notifcorner2"
	notifcorner2.Parent = bottomline
	bottomlinecornerfix.Name = "bottomlinecornerfix"
	bottomlinecornerfix.Parent = bottomline
	bottomlinecornerfix.BackgroundColor3 = Color3.fromRGB(15, 123, 255)
	bottomlinecornerfix.BorderColor3 = Color3.fromRGB(0, 0, 0)
	bottomlinecornerfix.BorderSizePixel = 0
	bottomlinecornerfix.Size = UDim2.new(0, 421, 0, 2)
	notifcorner1.Name = "notifcorner1"
	notifcorner1.Parent = newnotif
	topline.Name = "topline"
	topline.Parent = newnotif
	topline.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	topline.BorderColor3 = Color3.fromRGB(0, 0, 0)
	topline.BorderSizePixel = 0
	topline.Size = UDim2.new(0, 421, 0, 7)
	newnotifTextLabel.Parent = newnotif
	newnotifTextLabel.AnchorPoint = Vector2.new(0.5, 0)
	newnotifTextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	newnotifTextLabel.BackgroundTransparency = 1.000
	newnotifTextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newnotifTextLabel.BorderSizePixel = 0
	newnotifTextLabel.Position = UDim2.new(0.5, 0, 0.0700000003, 0)
	newnotifTextLabel.Size = UDim2.new(1, 0, -0.0700000003, 28)
	newnotifTextLabel.Font = Enum.Font.Arial
	newnotifTextLabel.Text = title
	newnotifTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	newnotifTextLabel.TextScaled = true
	newnotifTextLabel.TextSize = 14.000
	newnotifTextLabel.TextWrapped = true
	newnotifTextLabel_2.Parent = newnotif
	newnotifTextLabel_2.AnchorPoint = Vector2.new(0.5, 0)
	newnotifTextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	newnotifTextLabel_2.BackgroundTransparency = 1.000
	newnotifTextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	newnotifTextLabel_2.BorderSizePixel = 0
	newnotifTextLabel_2.Position = UDim2.new(0.497849405, 0, 0.280000001, 0)
	newnotifTextLabel_2.Size = UDim2.new(0.943097234, 0, 0.289999992, 28)
	newnotifTextLabel_2.Font = Enum.Font.Arial
	newnotifTextLabel_2.Text = text
	newnotifTextLabel_2.TextColor3 = Color3.fromRGB(158, 158, 158)
	newnotifTextLabel_2.TextSize = 14.000
	newnotifTextLabel_2.TextWrapped = true
	newnotifTextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
end

--[[

Example:

Home = klib.CreateTab{
	Name = "Home",
	Image = "rbxassetid://95258930411714"
	
}

Home:MakeButton({
	Name = "Reload Script",
	Callback = function()
		print("This is a button")
	end
})

Home:MakeSlider({
	Name = "Drag Speed",
	Callback = function(value)
		klib.DragSpeed = value
	end,
	Min = 0,
	Max = 1,
	Round = false
})

Home:MakeToggle({
	Name = "Enable autofarm",
	Callback = function(state)
		print(state)
	end
})

Home:MakeTextBox({
	Name = "Enter Player Name",
	Callback = function(text)
		print(text)
	end
})

Home:MakeDropdown({
	Name = "Player list",
	List = game.Players:GetPlayers(),
	Callback = function(player)
		print(player)
	end
})]]

return klib
