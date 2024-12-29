
# Colors

NO_COLOR=\033[0m
RED=\033[0;31m
CYAN=\033[0;36m
GREEN=\033[0;32m
BLUE=\033[0;34m
PURPLE=\033[0;35m
YELLOW=\033[1;33m

# Commands


setup_mac:
	@echo "⛵️ ${GREEN}Setup macOS${NO_COLOR}"
	@cd setup/macos && brew bundle install
	@go run scripts/setup_zsh.go
	$(MAKE) setup_nvim

setup_nvim:
	@echo "☕️ ${GREEN}Setup nvim${NO_COLOR}"
	git clone git@github.com:BMilliet/kickstart.nvim.git ~/.config/nvim

brew_dump:
	@echo "🌴 ${CYAN}Update brewfile${NO_COLOR}"
	@cd setup/macos && rm Brewfile && brew bundle dump
