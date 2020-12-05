# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
export GPG_TTY=($tty)
export READER="zathura"

# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

export CHROME_BIN='/bin/chromium-browser' # Needed for headless chrome in Karma testing
