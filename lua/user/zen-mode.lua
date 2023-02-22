local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
	return
end

local status_ok_twilight, twilight = pcall(require, "twilight")
if not status_ok_twilight then
	return
end

twilight.setup()
zen_mode.setup()
