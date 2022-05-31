#!/usr/bin/env bash

# make sure shellcheck exists
if [ "$(command -v npm)" = "" ]; then
  echo >&2 "npm command is required, see: (https://npmjs.org) or run: brew install nvm && nvm install 16";
  exit 1;
fi

# check to see if remark is installed if it ins't run npm install
if [ ! -f "$(pwd)"/node_modules/.bin/remark ]; then
  echo >&2 "The remark command is required, see: (https://github.com/remarkjs/remark-lint).  Run \"make install\" to install it.";
  exit 1;
fi

# shellcheck disable=SC1091
source "$(pwd)/tools/utils.sh"

# output the heading
heading "#" 80 "Couchbase" "Performing Markdown Linting using remark"

# determine whether or not the script is called directly or sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0

statusCode=0
while read -r file; do
  "$(pwd)"/node_modules/.bin/remark --no-stdout --frail true --rc-path "$(pwd)/.remarkrc" "$file"
  currentCode="$?"
  # only override the statusCode if it is 0
  if [ "$statusCode" == 0 ]; then
    statusCode="$currentCode"
  fi
done < <(find . -type f -name "*.md" -not -path "./node_modules/*" -not -path "./.git/*")
echo ""
echo ""

# if the script was called by another, send a valid exit code
if [ "$sourced" == "1" ]; then
  return "$statusCode"
fi

