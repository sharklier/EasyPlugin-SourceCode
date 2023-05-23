-- Thanks for using EasyPlugin!

-- Toolbar & Button
local toolbar = plugin:CreateToolbar(script.Parent.nam.Value)
local openButton = toolbar:CreateButton(
	tostring(math.random()), -- Id
	script.Parent.Des.Value, -- Tooltip
	"rbxasset://" .. script.Parent.Ico.Value, -- Icon
	script.Parent.nam.Value -- Name
)

-- Widget
local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, -- Widget will be initialized in floating panel
	false, -- Widget will be initially enabled
	false, -- Don't override the previous enabled state
	350, -- Default width of the floating window
	350, -- Default height of the floating window
	script.Parent:WaitForChild("WMin").Value, -- Minimum width of the floating window (optional)
	script.Parent:WaitForChild("HMin").Value -- Minimum height of the floating window (optional)
)
local pluginWidget = plugin:CreateDockWidgetPluginGui("PluginUI", widgetInfo)
pluginWidget.Title = script.Parent.nam.Value

-- Gui
local guiObject = script.Parent:WaitForChild(script.Parent.nam.Value .. "UI")
guiObject.Parent = pluginWidget

-- Button
openButton.Click:Connect(function()
	local open = false
	if open == true then
		pluginWidget.Enabled = false
	elseif open == false then
		pluginWidget.Enabled = true
	end
end)
