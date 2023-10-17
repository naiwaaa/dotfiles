#!/bin/sh

if [ ! "$(command -v chezmoi)" ]; then
  echo "error: chezmoi command not found. Please install chezmoi first." >&2
  exit 1
fi

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

chezmoi init --apply --source="$script_dir"
