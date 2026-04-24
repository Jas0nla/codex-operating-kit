---
name: team-orchestrator
description: Ask once, then launch the shared multi-agent roster.
metadata:
  short-description: Ask and launch multi-agent work
---

# Team Orchestrator

Use this skill only after routing has already identified the correct local work surface.

## Candidate test

Treat the task as a multi-agent candidate when both are true:

1. It has `2+` separable lanes, such as:
   - remote or external-system reads
   - local asset or repo discovery
   - rule, source, or schema reconciliation
   - validation, tests, recomputation, or cross-checks
   - multi-source structured synthesis
2. The main agent still has meaningful integration, acceptance, or final-judgment work after delegation.

Do not use multi-agent mode for trivial work, strongly serial work, overlapping writes, or singular blockers.

## Confirmation

Before broad execution, ask one short confirmation question.

Default shared prompt:

`This task fits multi-agent mode. Open it?`

Treat the following as approval:

- `yes`
- `open`
- `use multi-agent`

Local installs may replace the exact confirmation wording.

Do not open sub-agents before that confirmation lands.

## After activation

Start from the smallest useful shared roster:

- `workflow_scout`
- `repo_researcher`

Add `final_verifier` only when the output needs a final credibility pass.

Keep the main agent responsible for:

- routing
- approval
- integration
- final verification
- final output

Use simple `spawn_agent` calls.
If `fork_context=true`, do not also pass `agent_type`, `model`, or `reasoning_effort`.
