-- upon connection of a new audio object, make it default playback for streams
-- see Playback tab in pavucontrol

-- for user-level, not system-level, fetch WirePlumber API
local wp = require("wireplumber")

local manager = wp.get_manager()

local function switch_bt_on_connect(node)
	if node.properties["media.class"]:match("Audio/Sink") and node.properties["bluez.path"] then
		node:set_default(true)
		print("Bluetooth device auto-set as default sink:", node.properties["device.nick"])
	end
end

manager:connect_signal("object-added", switch_bt_on_connect)
