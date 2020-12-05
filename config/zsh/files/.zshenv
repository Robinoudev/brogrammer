export CHROME_BIN="/bin/chromium-browser"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='firefox'
GPG_TTY=$(tty)
export GPG_TTY
export READER="zathura"
export PAGER=less

# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.

# usually this means running on a machine with a statically-linked, hand-built
# tmux (and ncurses)
if [ -d "$HOME/share/terminfo" ]; then
  export TERMINFO=$HOME/share/terminfo
fi

# filename (if known), line number if known, falling back to percent if known,
# falling back to byte offset, falling back to dash
export LESSPROMPT='?f%f .?ltLine %lt:?pt%pt\%:?btByte %bt:-...'

# i = case-insensitive searches, unless uppercase characters in search string
# F = exit immediately if output fits on one screen
# M = verbose prompt
# R = ANSI color support
# X = suppress alternate screen
# -#.25 = scroll horizontally by quarter of screen width (default is half)
export LESS="-iFMRX -#.25"

function () {
  # See: `man ls`
  local BLACK=a
  local RED=b
  local GREEN=c
  local BROWN=d
  local BLUE=e
  local MAGENTA=f
  local CYAN=g
  local LIGHT_GRAY=h
  local BOLD_BLACK=A # dark gray
  local BOLD_RED=B
  local BOLD_BROWN=D # yellow
  local BOLD_BLUE=E
  local BOLD_MAGENTA=F
  local BOLD_CYAN=G
  local BOLD_LIGHT_GRAY=H # bright white
  local DEFAULT=x

  # Default is (11 pairs of fg/bg):
  #
  #   exfxcxdxbxegedabagacad
  #   ^ ^ ^ ^ ^ ^ ^ ^ ^ ^ ^
  #   | | | | | | | | | | \
  #   | | | | | | | | | \  - directory (writable, no sticky): black, brown
  #   | | | | | | | | \  --- directory (writable, sticky bit): black, green
  #   | | | | | | | \  ----- executable (setuid): black, cyan
  #   | | | | | | \  ------- executable (setguid): black, red
  #   | | | | | \  --------- character special: blue, brown
  #   | | | | \  ----------- block special: blue, cyan
  #   | | | \  ------------- executable: red, default
  #   | | \  --------------- pipe: brown, defaut
  #   | \  ----------------- socket: green, default
  #   \  ------------------- symbolic link: magenta, default
  #    --------------------- directory: blue, default
  #

  local DIRECTORY="${BOLD_LIGHT_GRAY}${DEFAULT}"
  local SYMBOLIC_LINK="${MAGENTA}${DEFAULT}"
  local SOCKET="${GREEN}${DEFAULT}"
  local PIPE="${BROWN}${DEFAULT}"
  local EXECUTABLE="${BOLD_RED}${DEFAULT}"
  local BLOCK_SPECIAL="${BLUE}${CYAN}"
  local CHARACTER_SPECIAL="${BLUE}${BROWN}"
  local EXECUTABLE_SETGUID="${BLACK}${RED}"
  local EXECUTABLE_SETUID="${BLACK}${CYAN}"
  local DIRECTORY_STICKY="${BLACK}${GREEN}"
  local DIRECTORY_NO_STICKY="${BLACK}${BROWN}"

  LSCOLORS=$DIRECTORY
  LSCOLORS+=$SYMBOLIC_LINK
  LSCOLORS+=$SOCKET
  LSCOLORS+=$PIPE
  LSCOLORS+=$EXECUTABLE
  LSCOLORS+=$BLOCK_SPECIAL
  LSCOLORS+=$CHARACTER_SPECIAL
  LSCOLORS+=$EXECUTABLE_SETGUID
  LSCOLORS+=$EXECUTABLE_SETUID
  LSCOLORS+=$DIRECTORY_STICKY
  LSCOLORS+=$DIRECTORY_NO_STICKY

  export LSCOLORS
}

# Color man pages.
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;208m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;111m'
