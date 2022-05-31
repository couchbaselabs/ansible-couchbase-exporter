#!/usr/bin/env bash
# shellcheck disable=SC1091

# this is a single script to perform all of the linting from within the Jenkins job, this allows for all linting to be
# ran instead of exiting as soon as the first lint failure is detected

# lint markdown files
source "$(pwd)/tools/lint-markdown.sh"
currentCode="$?"
statusCode="$currentCode"

# lint shell scripts
source "$(pwd)/tools/lint-shell.sh"
currentCode="$?"
# only override the statusCode if it is 0
if [ "$statusCode" == 0 ]; then
  statusCode="$currentCode"
fi

# lint text
source "$(pwd)/tools/lint-text.sh"
currentCode="$?"
# only override the statusCode if it is 0
if [ "$statusCode" == 0 ]; then
  statusCode="$currentCode"
fi

# lint yaml files
source "$(pwd)/tools/lint-yaml.sh"
currentCode="$?"
# only override the statusCode if it is 0
if [ "$statusCode" == 0 ]; then
  statusCode="$currentCode"
fi

exit "$statusCode"
