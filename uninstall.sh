#!/usr/bin/env bash
# Remove everything install.sh added. Agent notes in your projects stay.
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"

unlink_if_ours() { if [ -L "$1" ] && [[ "$(readlink "$1")" == "$REPO"* ]]; then rm "$1"; echo "removed: $1"; fi; }

unlink_if_ours "$HOME/.claude/skills-hooks"
unlink_if_ours "$HOME/.local/bin/agent-memory"
for f in "$REPO"/agents/*.md; do unlink_if_ours "$HOME/.claude/agents/$(basename "$f")"; done
for d in "$REPO"/skills/*/; do unlink_if_ours "$HOME/.claude/skills/$(basename "$d")"; done

if command -v claude >/dev/null; then
  claude plugin uninstall dev-team-view@claude-skills >/dev/null 2>&1 && echo "removed: dev-team-view plugin" || true
  if claude plugin marketplace list 2>/dev/null | grep -qF "$REPO"; then
    claude plugin marketplace remove claude-skills >/dev/null 2>&1 && echo "removed: marketplace claude-skills"
  fi
fi
