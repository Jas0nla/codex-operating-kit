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
- `Property Fact Packet` for property-content tasks

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

## Property Content Gate

For property-content tasks such as `address + 做一期内容`, the required lane order is:

`07-evaluation-observability -> 08-human-governance -> 01-content-creation -> 04-structure-coaching -> 02-sensitive-preflight`

Fixed rules:

- `07` owns fact accuracy
- `08` owns `go / revise / stop`
- `01` may not draft from unapproved claims
- old local reports are reusable source surfaces, not current truth by default
- user-provided materials and system materials must be merged into one labeled fact packet before drafting
