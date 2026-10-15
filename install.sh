#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
destination="${HOME}/.agents/skills"
dry_run=false

usage() {
  printf 'Usage: bash install.sh [--dest DIRECTORY] [--dry-run]\n'
  printf 'Links bundled skills into ~/.agents/skills; preserves existing entries.\n'
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dest)
      if [[ $# -lt 2 || -z "$2" ]]; then usage >&2; exit 2; fi
      destination="$2"
      shift 2
      ;;
    --dry-run) dry_run=true; shift ;;
    -h|--help) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

if [[ ! -d "$repo_dir/skills" ]]; then
  printf 'Missing skills directory: %s\n' "$repo_dir/skills" >&2
  exit 1
fi

if [[ "$destination" != /* ]]; then destination="$PWD/$destination"; fi
if ! "$dry_run"; then
  mkdir -p -- "$destination"
  destination="$(cd -- "$destination" && pwd -P)"
fi

linked=0
ready=0
skipped=0
found=0
for skill in "$repo_dir"/skills/*/; do
  [[ -f "$skill/SKILL.md" ]] || continue
  found=$((found + 1))
  skill="${skill%/}"
  name="${skill##*/}"
  target="$destination/$name"

  if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$skill" ]]; then
    printf 'Ready: %s\n' "$name"
    ready=$((ready + 1))
  elif [[ -e "$target" || -L "$target" ]]; then
    printf 'Skipped existing entry: %s\n' "$target"
    skipped=$((skipped + 1))
  elif "$dry_run"; then
    printf 'Would link: %s -> %s\n' "$target" "$skill"
    linked=$((linked + 1))
  else
    ln -s -- "$skill" "$target"
    printf 'Linked: %s\n' "$name"
    linked=$((linked + 1))
  fi
done

if [[ "$found" -eq 0 ]]; then
  printf 'No installable skills found.\n' >&2
  exit 1
fi
printf '\n%d linked/planned, %d already ready, %d skipped.\n' "$linked" "$ready" "$skipped"
