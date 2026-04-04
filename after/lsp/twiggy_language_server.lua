return {
	filetypes = { "twig" },
	root_markers = { "composer.json", ".git" },
	settings = {
		twiggy = {
			framework = "symfony",
			phpExecutable = "php",
			symfonyConsolePath = "bin/console",
			diagnostics = {
				twigCsFixer = true,
			},
		},
	},
}
