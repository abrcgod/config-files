local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "9ac3e9541bbabd9d73663d757e4fe48a675bb054" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "7747bbae60074acf0b9e3a4c13950be7a2dff444" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "e1fe53117aab24c378d5e6deaad786789c360123" }
  use { "kyazdani42/nvim-web-devicons", commit = "986875b7364095d6535e28bd4aac3a9357e91bbe" }
  use {"JoosepAlviste/nvim-ts-context-commentstring", commit = "ba6aee23ef1ff04889c6bad1cc30c72fddc4d41e"}

  --Colorschmes
  use {"EdenEast/nightfox.nvim", commit = "a53ff3f99c3cf4e598c5febad367fd3cad341b90"}

  --Completion
  use {"hrsh7th/nvim-cmp", commit = "935b4069ce73b60ba9075bf05ee6ab50ed3af1a9"}
  use {"hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa"}
  use {"hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23"}
  use {"hrsh7th/cmp-cmdline", commit = "5af1bb7d722ef8a96658f01d6eb219c4cf746b32"}
  use {"saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566"}
  use {"L3MON4D3/LuaSnip", commit="b4bc24c4925aeb05fd47d2ee9b24b7f73f5d7e32"}
  use {"hrsh7th/cmp-nvim-lsp", commit="0e6b2ed705ddcff9738ec4ea838141654f12eeef"}
  
  -- LSP 
  use {"neovim/nvim-lspconfig", commit = "df58d91c9351a9dc5be6cf8d54f49ab0d9a64e73"}
  use {"williamboman/mason.nvim", commit = "e634134312bb936f472468a401c9cae6485ab54b"}
  use {"williamboman/mason-lspconfig.nvim", commit="90a8bbf106b85b76951a34c542058ffa807de2b1"}
  use {"nvim-telescope/telescope.nvim", commit = "d77b37f4520e5fc2cf4c74c12e42ed4b589bd367"}

  --treesitter
  use {"nvim-treesitter/nvim-treesitter", commit = "680807fa6a482c639119098bc48ca3831c66db13"}

	-- Git
  use {"lewis6991/gitsigns.nvim", commit = "f412f51d0eaf0905a2759c8087090071689bb8fb"}

  --Tree 
  use {"nvim-tree/nvim-tree.lua", commit = "736c7ff59065275f0483af4b7f07a9bc41449ad0"}

  --Jdtls
  use {"mfussenegger/nvim-jdtls", commit = "355de7458fd63ccef9c6485d952ea118ba2cb46a"}




	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
