# Agent Operating Layer

`Agent Operating Layer` is a shared operating layer for Codex environments.

It keeps the entry stack thin:

- `AGENTS.md`: thread entry plus a small global delegation baseline
- `skills/master/SKILL.md`: team-local routing
- `skills/team-orchestrator/SKILL.md`: ask once, then launch the smallest useful roster
- `skills/master/LOCAL.md`: installer-preserved local route table
- `memory/rules.md`: short reusable anti-footguns

## What This Repository Preserves

This repository preserves reusable operating capability, not machine-private facts.

It includes:

- a thin entry contract
- a thin local router
- a reusable orchestration skill
- a small shared custom-agent roster
- installation support for shared files and local overlays

It does not include:

- real hostnames, IPs, internal URLs, or tokens
- personal route tables
- daily notes or run logs
- machine-specific helper values

## Shared Execution Shape

The shared default is:

1. Enter `$Master` when a request may be team-local.
2. Route to the most specific local skill or helper first.
3. If the work has clear parallel lanes, send it to `$team-orchestrator`.
4. Ask once before opening multi-agent work.
5. Start from the smallest useful roster:
   - `workflow_scout`
   - `repo_researcher`
   - add `final_verifier` only when needed

## Shared Custom Agents

This repository ships three reusable custom agents:

- `workflow_scout`
- `repo_researcher`
- `final_verifier`

Local installs may replace or extend that roster with private agents.

## Installation

Run:

```bash
./install.sh
```

Optional target:

```bash
./install.sh /path/to/target-codex-home
```

The installer copies shared files, preserves private local overlays, and installs the shared custom agents.

## Design Rules

- Keep entry behavior in `AGENTS.md`
- Keep local routing in `skills/master/SKILL.md`
- Keep ask-and-launch orchestration in `skills/team-orchestrator/SKILL.md`
- Keep private route-table details in `skills/master/LOCAL.md`
- Keep short reusable rules in `memory/rules.md`
- Keep durable facts in local memory files, not in the shared router
- Prefer mature solutions before invention

See [docs/architecture.md](docs/architecture.md) for the layer model and [docs/migration.md](docs/migration.md) for how to port a private setup into this shared form.
