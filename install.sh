#!/usr/bin/env bash
# Install claude-skills. Safe to re-run; undo with ./uninstall.sh
#   - links the dev-team agents into ~/.claude/agents and the /dev-team skill into ~/.claude/skills
#   - links the agent guard hooks to ~/.claude/skills-hooks (the agents' hook paths point there)
#   - links the `agent-memory` command into ~/.local/bin
#   - adds this repo as the `claude-skills` plugin marketplace
# Options:
#   --panel   also install the dev-team-view progress panel mod
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"
PANEL=0
for arg in "$@"; do
  case "$arg" in
    --panel) PANEL=1 ;;
    -h|--help) sed -n '2,8p' "$0"; exit 0 ;;
    *) echo "unknown option: $arg" >&2; exit 2 ;;
  esac
done

need() { command -v "$1" >/dev/null 2>&1 || { echo "missing: $1 ($2)" >&2; exit 1; }; }
need claude "install Claude Code first: https://code.claude.com"
need python3 "Python 3.11 or newer"
need jq "used by the agent guard hooks"

link() {  # link SRC DEST, refusing to overwrite a real file
  local src="$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "skip: $dest exists and is not a link (move it away to install)"; return
  fi
  ln -sfn "$src" "$dest"; echo "link: $dest"
}

mkdir -p "$HOME/.local/bin" "$HOME/.claude/agents" "$HOME/.claude/skills"
chmod +x "$REPO/bin/agent-memory" "$REPO"/hooks/*.sh
link "$REPO/hooks" "$HOME/.claude/skills-hooks"
link "$REPO/bin/agent-memory" "$HOME/.local/bin/agent-memory"
for f in "$REPO"/agents/*.md; do link "$f" "$HOME/.claude/agents/$(basename "$f")"; done
for d in "$REPO"/skills/*/; do link "${d%/}" "$HOME/.claude/skills/$(basename "$d")"; done

if claude plugin marketplace list 2>/dev/null | grep -qF "$REPO"; then
  echo "ok:   marketplace claude-skills"
elif claude plugin marketplace add "$REPO" >/dev/null 2>&1; then
  echo "on:   marketplace claude-skills ($REPO)"
fi
if [ "$PANEL" = 1 ]; then
  claude plugin install dev-team-view@claude-skills >/dev/null 2>&1 \
    && echo "on:   dev-team-view progress panel" \
    || echo "todo: claude plugin install dev-team-view@claude-skills"
fi

case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) echo "note: add ~/.local/bin to your PATH" ;; esac
echo
echo "Done. Running Claude sessions see new agents after a restart."
[ "$PANEL" = 1 ] || echo "Progress panel: claude plugin install dev-team-view@claude-skills"
