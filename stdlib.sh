# https://github.com/wklken/bash-utils/blob/master/utils.sh
# https://github.com/niieani/bash-oo-framework/blob/master/lib/util/command.sh
# https://github.com/donnemartin/dev-setup/blob/master/brew.sh
# https://github.com/thoughtbot/laptop/blob/master/mac
# https://github.com/mattolenik/stdlib.sh/blob/master/stdlib.sh
# https://github.com/srcshelton/stdlib.sh/blob/master/stdlib.sh

is_command_exists () {
  command -v "$1" &> /dev/null
}


