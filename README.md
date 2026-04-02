# Agent Operating Layer

`Agent Operating Layer` is a team-shareable operating layer for Codex-style agent environments.

It separates reusable workflow logic from machine-local private facts.

## What This Repository Contains

- `AGENTS.md`: team-wide thread entry policy
- `skills/master/`: shared private-workflow router
- `memory/README.md`: memory governance rules
- `memory/rules.md`: concise reusable operating rules
- `memory/*.template.md`: starter templates for machine-local private memory
- `docs/`: architecture and migration guidance
- `install.sh`: installs the shared layer into a user's `~/.codex`

## Mental Model

- `Project / Repo / Branch`: file and version layer
- `Thread`: task conversation and execution context
- `AGENTS.md`: entry gate for new threads
- `Master`: workflow router
- `memory`: durable facts, daily notes, and domain memory

See [architecture.md](/Users/jason/Documents/project/agentOperatingLayer/docs/architecture.md) for the full diagram.

## What Must Stay Private

Do not store these in this repository:

- real hostnames, IPs, tailnet addresses, or internal URLs
- real usernames, emails, tokens, secrets, or keys
- personal daily notes or automation run logs
- machine-specific absolute paths unless they are clearly example values

Keep those in each user's local `~/.codex` files instead.

## Installation

Run:

```bash
./install.sh
```

Optional target:

```bash
./install.sh /path/to/target-codex-home
```

The installer:

- copies shared files into the target Codex home
- preserves existing private files
- creates starter private-memory files only when missing
- prints a checklist of values the user still needs to fill in locally

## Local File Ownership

Shared files installed from this repository:

- `AGENTS.md`
- `skills/master/SKILL.md`
- `skills/master/agents/openai.yaml`
- `memory/README.md`
- `rules.md`

Private files each user owns locally:

- `memory.md`
- `memory/topics/*.md`
- `memory/daily/*.md`
- `automations/*/memory.md`

## Recommended Team Workflow

1. Maintain shared operating logic in this repository.
2. Install it into each team member's `~/.codex`.
3. Let each user maintain their own private facts locally.
4. Update templates when new reusable domains appear.
