#!/usr/bin/env bash
if [ ! -f "$(pwd)"/node_modules/.bin/textlint ]; then
  echo >&2 "The textlint command is required, see: (https://github.com/textlint/textlint).  Run \"make install\" to install it.";
  exit 1;
fi

# shellcheck disable=SC1091
source "$(pwd)/tools/utils.sh"

# output the heading
heading "#" 80 "Couchbase" "Performing Text Linting using textlint"

# determine whether or not the script is called directly or sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0

statusCode=0
while read -r file; do
  "$(pwd)"/node_modules/.bin/textlint --config "$(pwd)/.textlintrc" "$file"
  currentCode="$?"
  # if the current code is 0, output the file name for logging purposes
  if [ "$currentCode" == 0 ]; then
    echo -e "\\x1b[32m$file\\x1b[0m: no issues found"
  fi
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
