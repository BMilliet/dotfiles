
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
	@echo "🌴 ${CYAN}Setting up configs${NO_COLOR}"
	@echo "⛵️ ${GREEN}install tools${NO_COLOR}"
	@cd config/macos && brew bundle install
	$(MAKE) set_zsh


set_zsh:
	@echo "☕️ ${GREEN}setting zshrc${NO_COLOR}"
	@cp zsh_setup/zshrc ~/.zshrc
	@source ~/.zshrc


brew_dump:
	@cd config/macos && brew bundle dump
