# Architecture

This repository keeps the operating stack small and layered.

## Layer Diagram

```text
Agent Operating Layer
├─ File and Version Layer
│  ├─ Project / Folder
│  ├─ Repo
│  └─ Branch
│
├─ Thread / Session Layer
│  └─ Thread
│
├─ Operating Layer
│  ├─ AGENTS.md
│  │  └─ Thread entry plus small global guardrails
│  ├─ skills/master/SKILL.md
│  │  └─ Team-local routing
│  ├─ skills/team-orchestrator/SKILL.md
│  │  └─ Ask once, then launch multi-agent work
│  ├─ skills/master/LOCAL.md
│  │  └─ Installer-preserved local route table
│  └─ memory/rules.md
│     └─ Short anti-footguns
│
└─ Execution Layer
   ├─ Main Agent
   ├─ Optional Sub-Agents
   └─ Tools / Connectors / Skills
```

## Core Roles

- `AGENTS.md`
  - decides whether a thread should enter `$Master`
- `Master`
  - routes team-local work to the most specific local path
- `team-orchestrator`
  - asks once before multi-agent launch and starts from the smallest useful roster
- `LOCAL.md`
  - holds private route-table details that do not belong in source control
- `memory/rules.md`
  - keeps short reusable operating rules easy to scan
- `custom agents`
  - provide reusable read-only roles for scouting, repo research, and final verification

## Execution Model

- The main agent owns routing, approval, integration, verification, and final output.
- Sub-agents are for bounded discovery, research, and final cross-checks.
- Shared policy should stay thin and executable.
- Private facts and private route tables stay local after install.

## Default Multi-Agent Path

1. `AGENTS.md` sends team-local work into `$Master`.
2. `Master` routes to the most specific skill or helper.
3. Strong multi-lane work goes to `$team-orchestrator`.
4. `team-orchestrator` asks once before launch.
5. After approval, start from:
   - `workflow_scout`
   - `repo_researcher`
   - add `final_verifier` only when needed

## Design Rules

- Keep the entry layer thin.
- Keep the router thin.
- Keep orchestration in one place.
- Keep private route-table detail out of shared files.
- Keep reusable roles generic.
- Prefer existing local assets and mature tools before inventing a new workflow.
