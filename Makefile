
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
	@touch zsh_custom.sh
	@$(MAKE) create_my_docs
	@$(MAKE) create_workspace
	@cd setup/macos && brew bundle install
	@go run scripts/setup_zsh.go
	@$(MAKE) setup_nvim

setup_nvim:
	@echo "☕️ ${GREEN}Setup nvim${NO_COLOR}"
	@if [ ! -d ~/.config/nvim ]; then \
		git clone git@github.com:BMilliet/nvim.git ~/.config/nvim; \
	else \
		echo "⚡️ ${YELLOW}nvim config already exists, skipping clone${NO_COLOR}"; \
	fi

create_my_docs:
	@echo "📁 ${CYAN}Creating ~/.my_docs directory${NO_COLOR}"
	@if [ ! -d ~/.my_docs ]; then \
		mkdir ~/.my_docs && echo "✅ ${GREEN}~/.my_docs created${NO_COLOR}"; \
	else \
		echo "⚡️ ${YELLOW}~/.my_docs already exists, skipping${NO_COLOR}"; \
	fi

create_workspace:
	@echo "📁 ${CYAN}Creating ~/workspace directory${NO_COLOR}"
	@if [ ! -d ~/workspace ]; then \
		mkdir ~/workspace && echo "✅ ${GREEN}~/workspace created${NO_COLOR}"; \
	else \
		echo "⚡️ ${YELLOW}~/workspace already exists, skipping${NO_COLOR}"; \
	fi


brew_dump:
	@echo "🌴 ${CYAN}Update brewfile${NO_COLOR}"
	@cd setup/macos && rm Brewfile && brew bundle dump
