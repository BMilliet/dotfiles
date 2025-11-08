
# Colors

NO_COLOR=\033[0m
RED=\033[0;31m
CYAN=\033[0;36m
GREEN=\033[0;32m
BLUE=\033[0;34m
PURPLE=\033[0;35m
YELLOW=\033[1;33m

# Commands

FISH_PATH := $(shell which fish)

setup_mac:
	@echo "⛵️ ${GREEN}Setup macOS${NO_COLOR}"
	@cd setup/macos && brew bundle install
	@$(MAKE) create_docs
	@$(MAKE) create_bin
	@$(MAKE) create_workspace
	@$(MAKE) setup_nvim
	@$(MAKE) set_fish

setup_nvim:
	@echo "☕️ ${GREEN}Setup nvim${NO_COLOR}"
	@if [ ! -d ~/.config/nvim ]; then \
		git clone git@github.com:BMilliet/nvim.git ~/.config/nvim; \
	else \
		echo "⚡️ ${YELLOW}nvim config already exists, skipping clone${NO_COLOR}"; \
	fi

create_workspace:
	@echo "📁 ${CYAN}Creating ~/workspace directory${NO_COLOR}"
	@if [ ! -d ~/workspace ]; then \
		mkdir ~/workspace && echo "✅ ${GREEN}~/workspace created${NO_COLOR}"; \
	else \
		echo "⚡️ ${YELLOW}~/workspace already exists, skipping${NO_COLOR}"; \
	fi

create_docs:
	@echo "📁 ${CYAN}Creating docs directory${NO_COLOR}"
	@if [ ! -d docs ]; then \
		mkdir docs && echo "✅ ${GREEN}docs created${NO_COLOR}"; \
	else \
		echo "⚡️ ${YELLOW}docs already exists, skipping${NO_COLOR}"; \
	fi

create_bin:
	@echo "📁 ${CYAN}Creating bin directory${NO_COLOR}"
	@if [ ! -d bin ]; then \
		mkdir bin && echo "✅ ${GREEN}custom_bin created${NO_COLOR}"; \
	else \
		echo "⚡️ ${YELLOW}custom_bin already exists, skipping${NO_COLOR}"; \
	fi

set_custom_zsh:
	@echo 'source ~/.config/dotfiles/zsh_my_stuff.sh' >> ~/.zshrc

set_fish:
	@cp fish/fish.sh ~/.config/fish/config.fish

brew_dump:
	@echo "🌴 ${CYAN}Update brewfile${NO_COLOR}"
	@cd setup/macos && rm Brewfile && brew bundle dump
