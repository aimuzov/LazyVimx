return {
	"piersolenski/wtf.nvim",

	opts = {
		openai_api_key = vim.fn.getenv("OPENAI_API_KEY"),
		openai_model_id = "gpt-3.5-turbo",
		language = "russian",
	},
}
