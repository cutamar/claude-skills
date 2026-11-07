# claude-skills: notes for Claude working on this repo

- Agent hook paths point to `$HOME/.claude/skills-hooks/`, a link `install.sh` makes to `hooks/`,
  so agents work wherever the repo is cloned. Run `hooks/test.sh` after editing anything in `hooks/`.
- Read-only agents with `memory: local` need BOTH hooks (readonly-bash + `only-memory-file.sh <name>`):
  memory silently re-grants Write/Edit otherwise. Plugin-packaged agents ignore `hooks`, which is why
  the agents are linked into `~/.claude/agents` instead of shipped as a plugin.
- Worktree subagents write memory inside the worktree; `agent-memory sync` copies it back.
  `bin/agent-memory` must stay stdlib-only Python 3.11+.
- The `.progress.md` ledger format in `skills/dev-team/SKILL.md` is parsed by
  `plugins/dev-team-view/hooks/register.tsx` (`parseLedger`). Change both together and run
  `claude plugin test plugins/dev-team-view`.
- New skills go in `skills/<name>/`; `install.sh` links every folder there into `~/.claude/skills`.
  Keep `uninstall.sh` in sync with anything the installer adds.
