--[[
	Sharklier
	May 22th, 2023
	EasyPlugin Roblox ©
]]

-- Services
local ServerStorage = game:GetService("ServerStorage")
local Selection = game:GetService("Selection")

-- Widget
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, -- Widget will be initialized in floating panel
	false, -- Widget will be initially enabled
	false, -- Don't override the previous enabled state
	350, -- Default width of the floating window
	350, -- Default height of the floating window
	350, -- Minimum width of the floating window (optional)
	350 -- Minimum height of the floating window (optional)
)
local pluginWidget = plugin:CreateDockWidgetPluginGui("PluginUI", widgetInfo)
pluginWidget.Title = "EasyPlugin"

-- Gui
local pluginGui = script.Parent:WaitForChild("EasyPlugin").Back:Clone()
pluginGui.Parent = pluginWidget

-- Toolbar & Button
local toolbar = plugin:CreateToolbar("EasyPlugin1") -- Section Name
local openButton =
	toolbar:CreateButton(tostring(math.random()), "FastPluginMaker.", "rbxasset://13514510123", "PluginCreator") -- btnID, btnDescription, btnIcon, btnName
openButton.Click:Connect(function()
	local open = false
	if open == true then
		pluginWidget.Enabled = false
	elseif open == false then
		pluginWidget.Enabled = true
	end
end)

-- Initalization
local function Create()
	local Name = pluginGui.NameBox
	local Description = pluginGui.DescriptionBox
	local IconID = pluginGui.IconIDBox
	local MinHeight = pluginGui.MinimumHeightBox
	local MinWidth = pluginGui.MinimumWidthBox

	-- Root
	local home = Instance.new("Folder")
	home.Name = Name.Text
	home.Parent = ServerStorage

	-- Handler Script
	local Handler = script.Parent:WaitForChild("Template"):Clone()
	Handler.Parent = home
	Handler.Name = Name.Text .. "Handler"
	Handler.Enabled = true

	-- Gui Clone
	local selected = Selection:Get()[1]:Clone()
	selected.Parent = home
	selected.Name = Name.Text .. "UI"

	-- Description Transport
	local description = Instance.new("StringValue")
	description.Name = "Des"
	description.Value = Description.Text
	description.Parent = home

	-- Name Transport
	local name = Instance.new("StringValue")
	name.Name = "nam"
	name.Value = Name.Text
	name.Parent = home

	-- Icon transport
	local icon = Instance.new("IntValue")
	icon.Name = "Ico"
	icon.Value = tonumber(IconID.Text)
	icon.Parent = home

	-- Minimum Width Transport
	local widthMin = Instance.new("IntValue")
	widthMin.Name = "WMin"
	widthMin.Value = tonumber(MinWidth.Text)
	widthMin.Parent = home

	-- Minimum Height Transport
	local heightMin = Instance.new("IntValue")
	heightMin.Name = "HMin"
	heightMin.Value = tonumber(MinHeight.Text)
	heightMin.Parent = home

	-- Patches Gui
	pluginWidget.Enabled = false
	task.wait(1)
	pluginGui.Parent = pluginWidget
end

pluginGui.Create.MouseButton1Click:Connect(Create)
