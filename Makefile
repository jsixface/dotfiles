.PHONY: all personal work git shell tmux vim finicky-personal finicky-work ssh gradle ghostty ideavim bin clean-single

all: git shell tmux vim finicky-personal ssh gradle ghostty ideavim bin

work: git shell tmux vim finicky-work ssh gradle ghostty ideavim bin

clean-single:
	stow -D -t $(HOME) $(PKG)

git: 
	$(MAKE) clean-single PKG=git
	stow -t $(HOME) git

shell:
	$(MAKE) clean-single PKG=shell
	cd shell && ./pre.sh
	stow -t $(HOME) shell

tmux:
	$(MAKE) clean-single PKG=tmux
	stow -t $(HOME) tmux

vim:
	$(MAKE) clean-single PKG=vim
	stow -t $(HOME) vim

finicky-personal:
	$(MAKE) clean-single PKG=finicky-personal
	stow -t $(HOME) finicky-personal

finicky-work:
	$(MAKE) clean-single PKG=finicky-work
	stow -t $(HOME) finicky-work

ssh:
	$(MAKE) clean-single PKG=ssh
	cd ssh && ./pre.sh
	stow -t $(HOME) ssh

gradle:
	$(MAKE) clean-single PKG=gradle
	cd gradle && ./pre.sh
	stow -t $(HOME) gradle

ghostty:
	$(MAKE) clean-single PKG=ghostty
	stow -t $(HOME) ghostty

ideavim:
	$(MAKE) clean-single PKG=ideavim
	stow -t $(HOME) ideavim

bin:
	$(MAKE) clean-single PKG=bin
	stow -t $(HOME) bin

clean:
	stow -D -t $(HOME) git shell tmux vim finicky-personal finicky-work ssh gradle ghostty ideavim bin
