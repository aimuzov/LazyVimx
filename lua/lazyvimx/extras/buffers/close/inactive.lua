return {
	"chrisgrieser/nvim-early-retirement",
	desc = "Send buffers into early retirement by automatically closing them after x minutes of inactivity",
	event = "VeryLazy",
	opts = {
		deleteBufferWhenFileDeleted = true,
		notificationOnAutoClose = true,
	},
}
