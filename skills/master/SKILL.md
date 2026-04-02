---
name: Master
description: Use as the private workflow router when a request may touch custom local setup, private skills, recurring operating environments, or known team workflows. Master routes to the most specific local skill first, applies private delegation refinement, and prefers known helpers, memory, and entrypoints over ad hoc exploration.
metadata:
  short-description: Route private workflows to the right local skill first
---

# Master

`Master` is the shared router for private workflow logic and private delegation refinement.

Use it as the first routing check for any new thread that may involve custom local setup, known private environments, repeated operating patterns, or a workflow that already has a dedicated skill.

When a thread is not clearly generic, bias toward reading `Master` first.

## Thread Entry Rule

At the start of a new thread:

1. Decide whether the request may touch private workflow logic, machines, accounts, automations, memory, local scripts, or operating conventions.
2. If yes or uncertain, read `Master` first.
3. Let `Master` route to the most specific private skill, helper, memory layer, env file, or known entrypoint.
4. Only skip `Master` when the task is clearly generic and unrelated to the private environment.

## Primary Job

`Master` does not directly execute a whole domain workflow unless no matching private skill exists.

`Master` must:

1. Identify whether the request matches a known private workflow.
2. Route to the most specific private skill first.
3. Prefer known local scripts, env files, helpers, IDs, and memory before generic exploration.
4. Treat generic tools such as browser automation or raw shell exploration as fallback only.
5. Govern private-workflow-specific delegation refinements after the global baseline from `AGENTS.md`.
6. Prevent repeated wheel-rebuilding when a private workflow is already documented.

## Hard Routing Rule

If a request matches a private workflow below, read and follow that private skill first.

Do not skip the private skill just because:

- the current session does not expose an app connector
- a generic tool looks faster
- the task sounds simple
- a browser could probably do it

Missing connector access does not mean the underlying capability is unavailable if local scripts, env files, helpers, or prior memory already cover it.

## Route Table

Replace the examples below with your team's real private workflows.

### Internal PM or Ops System

Route to the matching skill for:

- internal task systems
- custom content libraries
- shared operational dashboards
- recurring internal workflows with stable IDs or helpers

### Environment-Specific Machines

Route to the matching skill for:

- team-managed desktops or laptops
- home-lab or office servers
- remote helper environments
- infrastructure with stable access paths

### GitHub Workflows

Route to the existing GitHub-focused skills for:

- PR review comments
- failing CI
- publishing local changes into a PR
- repo triage when GitHub-focused skills are the best fit

## Specificity Rule

If multiple private skills might apply, choose the most specific one:

1. workflow-specific skills over broad domain skills
2. domain-specific skills over generic environment skills
3. environment-specific skills over generic tools

## Fallback Order

Use this order:

1. Match a local private skill for the environment.
2. Read that skill and use its preferred local scripts, env files, helpers, APIs, IDs, and fixed paths.
3. If no local private skill exists, or the local skill does not fully cover the job, prefer existing local tools, connectors, helpers, and scripts.
4. If local private coverage still does not exist, look for mature external solutions:
   - official tools or connectors
   - widely used public skills or workflows
   - primary-source documentation and established tooling
5. Use local generic execution tools only as a temporary execution layer after the above checks.
6. Invent a new workflow only as the last resort.

Do not jump from "no local private skill" straight to building a new process from scratch.

## Retrieval Order

For private-environment work, use this preflight order:

1. Decide whether the request may touch private workflow logic or private environment.
2. If yes or uncertain, read `Master`.
3. Read `rules.md`.
4. Read `skills/master/LOCAL.md` when it exists.
5. Read the matching topic memory when one exists.
6. Read the most specific private skill.
7. Only then do extra exploration.
8. Only after the private path is exhausted may generic tools become primary.

## Local Overlay

Use `skills/master/LOCAL.md` as the installer-preserved local overlay for private refinements.

Use the local overlay for:

- environment-specific route-table details
- private helper or entrypoint precedence
- private delegation refinements for known local workflows
- narrow local policy additions that should survive shared-layer upgrades

Do not use the local overlay for:

- durable facts that belong in `memory.md` or `memory/topics/*.md`
- tokens, secrets, usernames, or private credentials
- run logs or daily troubleshooting notes
- replacing the shared `Master` entirely

If shared rules and local overlay rules conflict:

- `AGENTS.md` keeps the global delegation baseline
- shared `Master` defines shared private-workflow policy
- `LOCAL.md` may narrow private workflow behavior
- `LOCAL.md` must not loosen the global delegation baseline

## Private Delegation Refinement

`Master` is not the only source of delegation policy anymore.

`AGENTS.md` owns the global delegation baseline for every thread.
`Master` adds private-workflow-specific delegation refinement after a thread has entered the private path.

Use private delegation refinement for:

- extra restrictions for known private workflows
- route precedence between private helpers and private skills
- stricter ownership boundaries for private environments
- private memory-placement rules for delegated work

Do not use private delegation refinement to:

- loosen the global single-agent-first baseline
- bypass route-before-delegate
- allow conflicting write ownership
- treat transient delegated output as durable memory

### Result Handling Rules

- The main agent stays accountable for the task outcome.
- Sub-agents should return findings, local implementations, or verification results.
- The main agent integrates, reconciles, and presents final output.
- Only durable lessons may be promoted into long-term memory.

### Memory Handling For Delegated Work

- durable delegation heuristics -> `rules.md`
- domain-specific durable delegation lessons -> `memory/topics/<domain>.md`
- run-local delegated exploration -> `memory/daily/YYYY-MM-DD.md`
- automation-local delegated history -> `automations/<id>/memory.md`
- transient delegated output -> do not store in long-term memory

## Terminal Hygiene

Temporary terminal commands are disposable execution aids, not background work.

Use these rules:

- close or let short-lived diagnostic commands exit as soon as their result is no longer needed
- do not leave `rg`, `find`, inline `python`, or one-off helper calls hanging in the UI
- if a terminal command is clearly stalled, no longer useful, or still consuming resources after the needed output is captured, terminate it
- avoid creating a new terminal command if an existing result already answers the question

## Skill UI Metadata Policy

Long-lived or user-facing skills should also have `agents/openai.yaml`.

That file is the UI metadata layer, not the workflow logic layer.

Use these rules:

- keep `SKILL.md` as the real operational source of truth
- keep `agents/openai.yaml` aligned with the actual skill purpose
- give each skill a clear `display_name`
- keep `short_description` short and scannable
- make `default_prompt` a one-sentence starter that explicitly references `$skill-name`
- do not let UI metadata imply a broader or different workflow than `SKILL.md` supports

## Memory Write Model

Memory is not a background auto-sync system.

It is updated explicitly during execution when a stable event has been confirmed.

Do not wait for the whole conversation to end.
Do not write after every tiny step either.
Write when a durable event boundary has been reached.

## Memory Events

Use these event labels conceptually when deciding what to write:

- `stable_fact_confirmed`
- `dead_end_confirmed`
- `run_step_completed`
- `automation_run_completed`
- `durable_pattern_promoted`
- `transient_observation`

Meaning:

- `stable_fact_confirmed`
  - a stable path, helper, ID, shared session, fixed entrypoint, or durable environment fact has been confirmed
- `dead_end_confirmed`
  - a route is now known to be invalid, unsafe, or not worth retrying by default
- `run_step_completed`
  - a troubleshooting or execution phase finished with a clear intermediate conclusion
- `automation_run_completed`
  - a single automation run produced a coherent outcome
- `durable_pattern_promoted`
  - a repeated lesson is now strong enough to become a rule or topic-level lesson
- `transient_observation`
  - the information is still temporary, noisy, or unstable

## Memory Structure

Use memory in layers instead of piling everything into one file.

### Global Long-Term Memory

- `memory.md`
- `rules.md`

Use `memory.md` for:

- user preferences
- stable paths
- shared session names
- durable service entrypoints
- cross-workflow principles that remain true across days

Use `rules.md` for:

- short anti-footgun rules
- high-reuse constraints
- dead-end reminders
- one-line operating rules worth checking quickly

### Daily Operational Memory

- `memory/daily/YYYY-MM-DD.md`

Use daily memory for:

- today's troubleshooting path
- one-off recovery steps
- temporary observations
- run-specific decisions that are not yet proven durable

### Topic Memory

- `memory/topics/<domain>.md`

Use topic memory for:

- stable IDs
- helper paths
- environment-specific entrypoints
- verified API routes
- confirmed dead ends
- durable lessons inside one domain

### Automation Memory

Automation-local `memory.md` files are allowed, but they are run logs first.

Use automation memory for:

- per-run history
- scheduling context
- run-local blockers
- execution outcomes tied to that automation

If a fact from automation memory becomes durable and reusable, promote it into:

- `memory.md`
- `rules.md`
- the matching topic file

## Memory Placement Rule

Choose the destination by event type:

1. `stable_fact_confirmed`
   - cross-day global fact -> `memory.md`
   - domain-specific durable fact -> `memory/topics/<domain>.md`
2. `dead_end_confirmed`
   - short high-reuse anti-footgun -> `rules.md`
   - domain-specific limitation -> `memory/topics/<domain>.md`
3. `run_step_completed`
   - today's intermediate troubleshooting or execution conclusion -> `memory/daily/YYYY-MM-DD.md`
4. `automation_run_completed`
   - automation-specific run history -> that automation's `memory.md`
5. `durable_pattern_promoted`
   - short reusable rule -> `rules.md`
   - longer domain lesson -> `memory/topics/<domain>.md`
6. `transient_observation`
   - do not write it into long-term memory

## Anti-Wheel-Rebuild Rules

Do not:

- invent a fresh workflow when a matching private skill already exists
- start with browser automation when a local API, helper, or script path exists
- treat missing tool injection as meaning the system lacks that capability
- ignore known local entrypoints and rediscover them from scratch
- delegate work before checking whether a known local path already exists

## When Not to Use Master

You can skip `Master` only when the task is clearly generic and does not touch private environments, private skills, or repeated operating workflows.
