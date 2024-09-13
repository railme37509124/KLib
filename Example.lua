local klib = loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/KLib/main/KLib.lua"))()

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
})

klib.SendNotification("Script", "Loaded successfully!")
