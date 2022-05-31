#!/usr/bin/env bash

# make sure shellcheck exists
if [ "$(command -v shellcheck)" = "" ]; then
  echo >&2 "shellcheck command is required, see: (https://www.shellcheck.net) or run: brew install shellcheck";
  exit 1;
fi

# shellcheck disable=SC1091
source "$(pwd)/tools/utils.sh"

# output the heading
heading "#" 80 "Couchbase" "Performing Shell Linting using shellcheck"

# determine whether or not the script is called directly or sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0

statusCode=0
while read -r file; do
  shellcheck --external-sources --shell bash "$file"
  currentCode="$?"
  # if the current code is 0, output the file name for logging purposes
  if [ "$currentCode" == 0 ]; then
    echo -e "\\x1b[32m$file\\x1b[0m: no issues found"
  else
    echo ""
  fi
  # only override the statusCode if it is 0
  if [ "$statusCode" == 0 ]; then
    statusCode="$currentCode"
  fi
done < <(find . -type f -name "*.sh" -not -path "./node_modules/*" -not -path "./.git/*")

# if the script was called by another, send a valid exit code
if [ "$sourced" == "1" ]; then
  return "$statusCode"
fi

