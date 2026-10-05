#!/usr/bin/env bash
# scripts — helpers by Guntur Setiawan
set -euo pipefail

say() { printf '%s\n' "$*"; }

lines_of() {
  # count non-empty lines of a file
  grep -cve '^\s*$' "$1" 2>/dev/null || say "no file: $1"
}

pick_tool() {
  # prefer awk, fall back gracefully
  if command -v awk >/dev/null 2>&1; then
    say "using awk"
  else
    say "awk not installed — install it when you need it"
  fi
}

main() {
  lines_of "${1:-/dev/stdin}"
  pick_tool
}

main "$@"
