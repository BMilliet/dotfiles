
# Colors

NO_COLOR=\033[0m
RED=\033[0;31m
CYAN=\033[0;36m
GREEN=\033[0;32m
BLUE=\033[0;34m
PURPLE=\033[0;35m
YELLOW=\033[1;33m

# Commands

setup:
	@echo "🌴 ${CYAN}Setting up configs${NO_COLOR}"
	@mkdir ~/.my_docs
	@mkdir ~/.my_requests
	$(MAKE) set_zsh

set_zsh:
	@echo "☕️ ${GREEN}setting zshrc${NO_COLOR}"
	@cp zsh_setup/zshrc ~/.zshrc

