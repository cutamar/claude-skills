# Installing claude-skills: instructions for Claude

You are Claude Code, and the user asked you to install claude-skills. Follow these steps in order.
Keep the user informed in short messages. Never run `sudo`.

## 1. Check the requirements

- `claude --version` works.
- `python3 -c 'import sys; print(sys.version_info >= (3, 11))'` prints `True`.
- `git` and `jq` are installed.

If something is missing, give the user the install command for their system and wait.

## 2. Get the code

Default location: `~/claude-skills`. If the user named another folder, use that.

- Folder doesn't exist: `git clone https://github.com/cutamar/claude-skills ~/claude-skills`
- Folder exists and is this repo: `git -C ~/claude-skills pull --ff-only`
- Folder exists and is something else: ask the user for another location.

## 3. Install

Ask whether the user wants the live `/dev-team` progress panel (a mod beside the chat). Then:

```bash
~/claude-skills/install.sh --panel   # with the panel
~/claude-skills/install.sh           # without
```

If it prints `skip: ... exists and is not a link`, tell the user which file is in the way.

## 4. Finish

Tell the user, briefly:

- `/dev-team <task>` runs the agent team in any session; agents can also be called directly
  ("use the planner to…").
- Sessions that were already running need a restart to see the new agents.
- `~/claude-skills/uninstall.sh` removes everything.

## Updating later

```bash
git -C ~/claude-skills pull --ff-only && ~/claude-skills/install.sh
```
