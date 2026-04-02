# Memory Governance

This file explains where the agent environment should store operational knowledge.

Use this document to avoid creating overlapping `.md` files with mixed purposes.

## Layer Map

- `AGENTS.md`
  - purpose: thread-entry policy
  - store here: "should this thread enter `$master` first?"
  - do not store: machine facts, troubleshooting notes, domain details

- `skills/master/SKILL.md`
  - purpose: private workflow routing logic
  - store here: route tables, routing priority, preflight order, memory placement policy
  - do not store: long machine inventories or day-by-day logs

- `rules.md`
  - purpose: short reusable constraints and anti-footguns
  - store here: concise rules worth checking quickly
  - do not store: large explanations, long factual inventories, temporary failures

- `memory.md`
  - purpose: global long-term memory
  - store here: durable facts that matter across days and workflows
  - do not store: one-off UI states, temporary blockers, run-local observations

- `memory/daily/YYYY-MM-DD.md`
  - purpose: daily operational memory
  - store here: today's troubleshooting path, temporary findings, run decisions
  - do not store: facts already proven durable unless they are later promoted

- `memory/topics/*.md`
  - purpose: domain-specific durable memory
  - store here: stable IDs, helper paths, domain dead ends, verified entrypoints
  - do not store: unrelated cross-domain facts or per-run narration

- `automations/<id>/memory.md`
  - purpose: automation-local history
  - store here: per-run outcomes, blockers, schedule-local notes
  - do not store: durable facts that should be promoted to `memory.md`, `rules.md`, or `memory/topics/*.md`

## Placement Rules

Choose the destination by stability:

- clearly durable and cross-workflow -> `memory.md`
- concise reusable rule -> `rules.md`
- durable but domain-specific -> `memory/topics/<domain>.md`
- only useful for today or this run -> `memory/daily/YYYY-MM-DD.md`
- only useful to one automation run stream -> `automations/<id>/memory.md`

## Creation Rules

Do not create a new top-level memory file just because a fact does not fit cleanly at first glance.

Prefer this order:

1. Reuse an existing layer.
2. Reuse an existing topic file.
3. Create a new topic file only when a real domain has repeated durable facts.
4. Create a new top-level governance file only when it changes system structure, not just content.

## Promotion Rules

Promote information upward only after it has become stable:

- daily note -> topic memory when the lesson is durable inside one domain
- daily note -> `memory.md` when it becomes cross-workflow infrastructure knowledge
- automation memory -> topic/global memory when it becomes reusable outside that automation
- long explanation -> `rules.md` only after compressing it into a short durable rule
