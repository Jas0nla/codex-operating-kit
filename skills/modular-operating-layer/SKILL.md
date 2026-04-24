name: modular-operating-layer
description: Use for a modular operating layer: context budgeting, working-set routing, tiered memory, long-thread continuity, sub-agent context boundaries, and board-state handoff across threads.
metadata:
  short-description: Modular context and continuity OS
---

# Modular Operating Layer

Use this skill when a long-running modular system needs continuity, context control, board-state discipline, or multi-agent context boundaries more than raw transcript replay.

This skill is an operating layer. It does not replace domain work such as content writing, sensitive-word checks, structure work, or publishing. Its job is to keep those lanes recoverable, bounded, and handoff-safe.

## Use When

- the thread is growing long and the user wants durable continuity
- the user wants a stable operating system for modular work across many sessions
- multiple agents may be used and each one should only see the minimum relevant context
- the user wants board-state tracking, working-set control, or handoff packaging
- the user wants to avoid context-window blowups before the business boards are fully built

## Core Components

This skill sits on top of these existing shared or local layers:

- `thread-continuity-guard` for context-risk detection and handoff packages
- `project-memory` for scoped retrieval and durable placement when available locally
- `team-orchestrator` for multi-agent activation after context is bounded
- local safety workflow before changing `.codex` state

Treat those skills as operating primitives. This skill decides when to use which one.

## Working Set Rule

Always build a bounded working set before deeper reasoning or delegation.

The working set should contain only:

1. current objective
2. current board state
3. the smallest relevant stable facts
4. the exact source surfaces needed for the next step
5. current risks or conflicts

Do not replay raw transcript history by default.
Do not pass entire long threads to sub-agents when a compact working set will do.

## Retrieval Order

Use this order when recovering context:

1. current request and immediately referenced artifacts
2. `~/.codex/memory/topics/modular-operating-layer.md`
3. the most relevant domain topic memory such as `~/.codex/memory/topics/xhs.md`
4. the most specific workspace memory via `project-memory` when available locally
5. current-thread handoff package if one exists
6. raw transcript only as the last fallback

If a more authoritative local memory source exists, prefer it over chat recollection.

## Standard Objects

This OS works through five required objects.

### `Task Identity`

- stable thread or task name
- owning workspace or domain
- current objective

### `Board State`

- `board_name`
- `owner_agent`
- current stage
- blocker if any
- next action
- success signal

### `Stable Fact`

A fact is stable only if it is:

- durable across sessions
- useful to future routing or execution
- specific enough to reuse
- not a temporary guess or transient confusion

### `Working Set`

- current objective
- active board state
- required context
- forbidden context
- current risks
- exact source surfaces

### `Handoff Package`

Use the fixed shape from `templates/handoff-package.template.md`.

### `Board Registry Entry`

Use the fixed shape from `templates/board-registry-entry.template.md` when a future business board is formally attached to this OS.

## Continuity Trigger Rules

Use this policy:

- `60%-75%` estimated context use -> observation zone
- `75%-85%` -> handoff-prep zone
- `85%+` -> recommend a new thread by default

If exact percentage is unavailable, infer risk from:

- thread length
- number of active sub-lanes
- number of artifacts or versions being compared
- amount of repeated history-loading

## Routing Logic

Use this sequence:

1. identify whether the task is OS-level, business-level, or mixed
2. build the working set
3. if continuity risk is active, route to `thread-continuity-guard` when available
4. if memory recovery or placement is needed, route to `project-memory` when available
5. if there are `2+` separable lanes after the working set is bounded, route to `team-orchestrator`
6. keep final integration, board updates, and user-facing closeout in the main agent

## Multi-Agent Boundary

When sub-agents are used:

- give each agent a role-specific working set
- include only the board state and source surfaces that agent needs
- do not share unrelated board history
- keep memory placement and final truth reconciliation in the main agent

## Memory Write Discipline

Promote only durable OS facts such as:

- continuity thresholds
- accepted handoff package shape
- stable board registry fields
- named operating conventions for the modular system

Do not write:

- raw transcript excerpts
- temporary hypotheses
- partial debates
- unverified claims about thread state

## Default Output Shape

When this skill responds operationally, default to:

1. `Current Objective`
2. `Board State`
3. `Working Set`
4. `Memory Destination`
5. `Handoff Status`
6. `Agent Roster`
7. `Next Actions`

## Expected Result

After using this skill, the agent should be able to:

- continue a modular system without replaying giant thread history
- hand off safely into a new thread
- keep sub-agents bounded to the right context
- preserve durable operating facts in the correct memory layer
- leave clean attachment points for future business boards
