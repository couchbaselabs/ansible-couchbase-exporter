#!/usr/bin/env bash

# heading
# -----------------------------------
# Print standard heading
# -----------------------------------
heading() {
  local character="${1}"
  local width="${2}"
  local title="${3}"
  local message="${4}"
  local header="\\x1b[41m"
  local reset="\\x1b[0m"
  local bold="\\x1b[1m"
  echo ""
  echo ""
  echo -e "${header}$(repeat "$width" "$character")${reset}"
  echo -e "${header}$character$(repeat $(( width - 2)) " ")$character${reset}"
  echo -e "${header}$character$(repeat $(( (((width - ${#title}) - 2) / 2))) " ")${bold}$title${reset}${header}$(repeat $((((((width - ${#title}) - 2) + 2 - 1) / 2))) " ")$character${reset}"
  echo -e "${header}$character$(repeat $(( (((width - ${#message}) - 2) / 2))) " ")$message$(repeat $((((((width - ${#message}) - 2) + 2 - 1) / 2))) " ")$character${reset}"
  echo -e "${header}$character$(repeat $(( width - 2)) " ")$character${reset}"
  echo -e "${header}$(repeat "$width" "$character")${reset}"
  echo ""

}

# repeat
# -----------------------------------
# Repeat a Character N number of times
# -----------------------------------
repeat(){
  local times="${1:-80}"
  local character="${2:-=}"
  local start=1
	local range
  range=$(seq "$start" "$times")
  local str=""
  # shellcheck disable=SC2034
	for i in $range; do
    str="$str${character}"
  done
  echo "$str"
}
