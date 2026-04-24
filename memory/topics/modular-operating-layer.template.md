# Modular Operating Layer Topic Memory

Use this file for durable operating facts about the modular operating layer.

## Purpose

This topic holds the OS-layer rules that make long-running modular work recoverable across threads.

## Stable conventions

- Primary skill: `~/.codex/skills/modular-operating-layer/SKILL.md`
- Existing OS primitives:
  - `thread-continuity-guard`
  - `project-memory`
  - `team-orchestrator`
- Standard continuity thresholds:
  - `60%-75%` observation
  - `75%-85%` handoff-prep
  - `85%+` recommend a new thread

## Required standard objects

- `Task Identity`
- `Board State`
- `Stable Fact`
- `Working Set`
- `Handoff Package`

## Fixed handoff shape

1. `Task Identity`
2. `Current Objective`
3. `Stable Facts`
4. `Active Board Status`
5. `Agent Roster`
6. `Open Loops`
7. `Risks / Conflicts`
8. `Next Actions`
9. `Source Surfaces Used`

## Memory discipline

Promote only durable operating facts here.

Do not store:

- raw transcript dumps
- temporary guesses
- noisy brainstorming fragments
- unresolved contradictions without labels
