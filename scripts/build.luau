--!nocheck
local process = require("@lune/process")

process.spawn("zap", {
	"net.zap",
}, {
	stdio = "forward",
})

process.spawn("rojo", {
	"sourcemap",
	"default.project.json",
	"-o",
	"sourcemap.json",
})

process.spawn("darklua", {
	"process",
	"--config",
	".darklua.json",
	"src/",
	"dist/",
}, {
	env = {
		"ROBLOX_DEV=false",
	},
	stdio = "forward",
})

process.spawn("rojo", {
	"build",
	"build.project.json",
	"-o",
	"game.rbxl",
}, {
	stdio = "forward",
})
