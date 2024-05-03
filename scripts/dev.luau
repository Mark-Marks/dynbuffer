--!nocheck
local process = require("@lune/process")
local task = require("@lune/task")

task.spawn(process.spawn, "rojo", {
	"serve",
	"build.project.json",
}, {
	stdio = "forward",
})

task.spawn(process.spawn, "rojo", {
	"sourcemap",
	"default.project.json",
	"-o",
	"sourcemap.json",
	"--watch",
})

task.spawn(process.spawn, "darklua", {
	"process",
	"--config",
	".darklua.json",
	"--watch",
	"src/",
	"dist/",
}, {
	env = {
		"ROBLOX_DEV=true",
	},
	stdio = "forward",
})
