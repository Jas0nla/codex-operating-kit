# Agent Operating Layer

`Agent Operating Layer` is a shared operating layer for Codex environments.

This repository does not implement a new agent runtime. It defines how Codex should enter threads, route private workflows, govern memory, and decide when multi-agent delegation is appropriate.

## V2.1 Positioning

`Agent Operating Layer` exists to optimize Codex's operating logic:

- thread entry and preflight routing
- global delegation guardrails for every thread
- private workflow routing through `$master`
- private delegation refinement for known local workflows
- memory placement and promotion rules

It does not:

- replace Codex's underlying runtime
- implement a separate execution engine
- store machine-local secrets, hostnames, tokens, or daily run logs

## Codex Execution Model

Codex works through a main agent plus optional delegated sub-agents.

- The main agent owns the critical path, final judgment, and final user-facing output.
- Sub-agents are optional workers used for bounded exploration, disjoint implementation, or sidecar verification.
- Delegation is not the default mode. The default is single-agent execution.
- The global delegation baseline applies to every thread, including generic work.
- Shared rules live in this repository. Private facts and private overlays stay in each user's local `~/.codex`.

The default policy is `single-agent first, conservative delegation second`.

## Operating Contracts

The shared layer is organized around six contracts:

- `entry contract`
  - `AGENTS.md` decides whether a thread must enter `$master` before work begins.
- `global delegation contract`
  - `AGENTS.md` also defines the minimum delegation baseline that every thread must follow.
- `routing contract`
  - `skills/master/SKILL.md` decides which skill, helper, memory file, or entrypoint should be used first for private workflow threads.
- `private delegation refinement contract`
  - `skills/master/SKILL.md` defines private-workflow-specific delegation refinements after a thread enters `$master`.
- `memory contract`
  - `memory/README.md` and `rules.md` decide what becomes durable knowledge, what stays local to a day or automation, and what should not be stored.
- `install/privacy contract`
  - `install.sh` installs shared files while preserving private machine-local files in `~/.codex`, including the local overlay for private route-table details.

## What This Repository Contains

- `AGENTS.md`: thread-entry policy and global delegation baseline for Codex
- `skills/master/`: shared routing and private-refinement policy source of truth
- `skills/master/LOCAL.template.md`: starter template for installer-preserved private route and delegation refinements
- `memory/README.md`: memory governance and promotion rules
- `memory/rules.md`: concise reusable operating rules
- `memory/*.template.md`: starter templates for machine-local private memory
- `docs/`: architecture and migration guidance
- `install.sh`: installs the shared layer into a user's `~/.codex`

## Mental Model

- `Project / Repo / Branch`: file and version layer
- `Thread`: one task-focused Codex execution context
- `AGENTS.md`: entry gate plus global delegation baseline
- `Master`: private workflow router and private delegation refinement hub
- `LOCAL.md`: local overlay for private routing and delegation details
- `memory`: durable facts, daily notes, and topic memory
- `sub-agents`: optional delegated workers under main-agent control

See [docs/architecture.md](docs/architecture.md) for the full layer diagram.

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
- creates starter private-memory files and local overlay files only when missing
- prints a checklist of values the user still needs to fill in locally

## Local File Ownership

Shared files installed from this repository:

- `AGENTS.md`
- `skills/master/SKILL.md`
- `skills/master/agents/openai.yaml`
- `memory/README.md`
- `rules.md`

Private files each user owns locally:

- `skills/master/LOCAL.md`
- `memory.md`
- `memory/topics/*.md`
- `memory/daily/*.md`
- `automations/*/memory.md`

## Recommended Team Workflow

1. Maintain shared operating logic in this repository.
2. Install it into each team member's `~/.codex`.
3. Let each user maintain their own private facts and private overlay refinements locally.
4. Update the shared routing, global delegation, and memory policies here.
5. Update templates when new reusable domains appear.
