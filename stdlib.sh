# https://github.com/wklken/bash-utils/blob/master/utils.sh
# https://github.com/niieani/bash-oo-framework/blob/master/lib/util/command.sh
# https://github.com/donnemartin/dev-setup/blob/master/brew.sh
# https://github.com/thoughtbot/laptop/blob/master/mac
# https://github.com/mattolenik/stdlib.sh/blob/master/stdlib.sh
# https://github.com/srcshelton/stdlib.sh/blob/master/stdlib.sh

# Path {{{
###########

# http://stackoverflow.com/questions/3915040/bash-fish-command-to-print-absolute-path-to-a-file
__dirname() {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
}

absolutename() {
  readlink -m "$1"
}

filename() {
	base=$(basename "$1")
	echo ${base%.*}
}

extname() {
	base=$(basename "$1")
	[[ "$base" =~ \. ]] && echo "${base##*.}" || echo ""
}

abs_dirname() {
	local cwd=`pwd`
  local path="$1"
  while [ -n "$path" ]; do
    cd "${path%/*}"
    local name="${path##*/}"
    path=`readlink "$name" || true`
  done
  pwd
  cd "$cwd"
}
# }}}

# echo title
echot() {
  echo -e "##################\n# $@ \n##################\n"
}

sudo_ask_pass() {
  # Ask for the administrator password upfront.
  sudo -v
  # Keep-alive: update existing `sudo` time stamp until the script has finished.
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

# if ! command_exists brew; then .. fi
command_exists () {
  command -v "$1" &> /dev/null
}

## detect platform
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script
# case $OSTYPE in
#   darwin*) .. ;;
#   linux*) .. ;;
#   msys* ) .. ;;
# esac

## cmd
# case $1 in
#   "" ) without argument ;;
#   foo | bar* ) shift; hello "$@" ;;
#   * ) others ;;
# esac

## echo
# usage() {
#   cat <<-EOF
# $ hello CMD
#   EOF

## Github
# VERSION=$(cat VERSION)
# github-release --verbose upload --user gutenye --repo gnote-cli --tag $VERSION --name macos --file gnote.homebrew.amd64-$VERSION.tar.gz


## Process manager
# cd "$(dirname "$(realpath "$0")")"
# if pgrep -f time-doctor.js &>/dev/null; then
#   echo "stop"
#   pkill -f time-doctor.js
# else
#   echo "start"
#   node time-doctor.js &
# fi


# vim: fdm=marker