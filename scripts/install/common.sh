#!/usr/bin/env bash
# common helpers and variables
ansi_art1='
████████▄   ▄██████▄      ███        ▄████████     ████      ████
███   ▀███ ███    ███ ▀█████████▄   ███    ███   ██████    ██████
███    ███ ███    ███    ▀███▀▀██   ███    █▀      ████      ████
███    ███ ███    ███     ███   ▀   ███            ████      ████
███    ███ ███    ███     ███     ▀███████████     ████      ████
███    ███ ███    ███     ███              ███     ████      ████
███   ▄███ ███    ███     ███        ▄█    ███     ████      ████
████████▀   ▀██████▀     ▄████▀    ▄████████▀    ████████  ████████
                                                                 '
# prompt_yes_no: returns 0 for yes, 1 for no
prompt_yes_no() {
  local ans
  read -rp "$1 (y/n): " ans
  ans=${ans,,}
  if [[ "$ans" == "y" ]]; then
    return 0
  elif [[ "$ans" == "n" ]]; then
    return 1
  else
    echo "Invalid input. Please enter 'y' or 'n'." >&2
    return 1
  fi
}

# run_script: run helper script if present and executable
run_script() {
  local script="$1"
  local label="${2:-Running}"
  if [[ -f "$script" && -x "$script" ]]; then
    echo "==> $label: ${script##*/}"
    ( "$script" )
  else
    echo "Skipping ${script##*/}: not found or not executable"
  fi
}

