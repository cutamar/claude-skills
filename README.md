# claude-skills

**My Claude Code skills: a ready-made dev team of subagents with real guardrails, per-agent memory,
and a live progress panel.**

An Opus planner, cheaper Sonnet/Haiku workers, read-only reviewers that really can't write, and a
`/dev-team` skill that runs them in parallel waves. Works in any Claude Code session. Pairs well with
[claude-fleet](https://github.com/cutamar/claude-fleet) (always-on named sessions), but doesn't need it.

## Quick start

Paste this into any Claude Code session:

```text
Install claude-skills from https://github.com/cutamar/claude-skills. Follow its INSTALL.md.
```

or run:

```bash
git clone https://github.com/cutamar/claude-skills ~/claude-skills
~/claude-skills/install.sh --panel      # --panel also installs the progress panel mod
```

Running sessions pick up the agents after a restart, and the panel after `/reload-plugins`.

**Requirements:** Linux, [Claude Code](https://code.claude.com) 2.1.3xx or newer,
Python 3.11+, `jq`.

## A dev team: `/dev-team <task>`

| Agent | Model | Memory | Role |
|---|---|---|---|
| `planner` | Opus | ✓ | read-only architect: tasks, parallel waves, risk, model per task |
| `implementer` | Sonnet | ✓ | one task per run, self-review, status report |
| `test-engineer` | Sonnet | ✓ | tests (test-first when asked) |
| `debugger` | Sonnet | ✓ | root cause + minimal verified fix |
| `reviewer` | Sonnet | ✓ | read-only gate: spec compliance + code quality |
| `security-reviewer` | Opus | ✓ | read-only, for security-sensitive changes |
| `scout` | Haiku | – | fast lookups (a cheap replacement for general-purpose agents) |
| `docs-writer` | Haiku | – | docs |

How a `/dev-team` run goes:

1. The planner writes a plan of small tasks grouped into **waves**.
2. You approve it.
3. Each wave runs **in parallel**, each task in its own git worktree, then the worktrees are merged.
4. Every task is reviewed before the next wave starts. Failed fixes escalate to a stronger model.
5. The whole branch gets a final review, then docs are updated.

Progress is kept in `.claude/plans/<slug>.progress.md`, so long runs survive context compaction.
You can also call one agent directly: *"use the planner to…"*, *"@scout where is…"*.

Built on conventions from [obra/superpowers](https://github.com/obra/superpowers),
[everything-claude-code](https://github.com/affaan-m/everything-claude-code),
[wshobson/agents](https://github.com/wshobson/agents) and the
[official subagent docs](https://code.claude.com/docs/en/sub-agents).

## Guardrails and memory

- **Read-only agents really are read-only.** `hooks/readonly-bash.sh` blocks shell commands that write
  files, change git state or install packages.
- **Memory without losing that.** Agents that run repeatedly keep dated notes in
  `<project>/.claude/agent-memory-local/<agent>/MEMORY.md`, loaded automatically at start.
  Memory normally gives an agent Write/Edit, so `hooks/only-memory-file.sh` limits each read-only agent
  to **its own notes file and nothing else**.
- At the end of a `/dev-team` run, stable rules from the notes are proposed for `CLAUDE.md`
  (applied only with your OK).
- Workers can't spawn their own subagents, every agent has a turn cap, and every subagent call names
  its model, so nothing silently runs on Opus.

## Live progress panel (optional mod)

The `dev-team-view` mod adds a panel beside the chat that follows the current run, plus a one-line
summary above the prompt:

```text
Add --version flag
running · wave 2/3 · base 8d59750

Wave 1
T1   DONE       ✅   implementer/haiku · flag added
Wave 2
T2   running    -    test-engineer/sonnet
T3   DONE_WITH_CONCERNS ❌ r1 implementer/sonnet · README row

Rulings: 1 · last: print bare version — user asked — low
```

```text
dev-team: Add --version flag · wave 2/3 · 1 running · 1 need fixes · 1/3 done   [Open] [Hide]
```

It opens by itself when a run starts. Open it any time with `/dev-team-view`.

## `agent-memory`

| Command | Does |
|---|---|
| `agent-memory [repo...]` | sizes of each agent's notes file; warns past 180 lines (only 200 are loaded) |
| `agent-memory sync [repo]` | copy notes from worktree runs back into the repo (`/dev-team` does this after each wave) |

## Uninstall

```bash
~/claude-skills/uninstall.sh
```

Removes the links, the panel and the marketplace. Agent notes in your projects stay.

## Repository layout

```text
agents/                       dev-team subagent definitions
skills/dev-team/SKILL.md      the /dev-team orchestration workflow
hooks/                        read-only and memory-file guards (+ test.sh)
bin/agent-memory              agent notes: sizes and worktree sync (Python, stdlib only)
plugins/dev-team-view/        the progress panel mod
.claude-plugin/marketplace.json
install.sh / uninstall.sh
INSTALL.md                    step-by-step install instructions for Claude
```

## License

MIT
