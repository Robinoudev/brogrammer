# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR='vim'
export TERMINAL='alacritty'
export BROWSER='brave'
export GPG_TTY=($tty)
export READER="zathura"

# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

export CHROME_BIN='/bin/brave' # Needed for headless chrome in Karma testing


# Work related stuff
#
## ozone

export REDIS_URL=redis://herokuRedis:6379
export LOCKBOX_MASTER_KEY='0000000000000000000000000000000000000000000000000000000000000000'
export BLIND_INDEX_MASTER_KEY=ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
export FDOC='1'
export FPROF='1'
export TAG_PROF=type
export RECAPTCHA_SECRET_KEY=6Le-HucUAAAAAMjut9M_xOBpXHk4AiZMtjg8NEGU
export RUBYOPT='-W:no-deprecated -W:no-experimental'
