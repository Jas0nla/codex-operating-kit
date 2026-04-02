# Architecture

This repository separates versioned files, Codex thread execution, operating policy, and Codex's execution layer.

## Layer Diagram

```text
Agent Operating Layer
├─ File and Version Layer
│  ├─ Project / Folder
│  │  └─ The working directory that holds files and code
│  ├─ Repo
│  │  └─ The git repository for that project
│  └─ Branch
│     └─ A development line inside the repo
│
├─ Thread / Session Layer
│  └─ Thread
│     └─ One task-focused Codex conversation and execution context
│
├─ Operating Policy Layer
│  ├─ AGENTS.md
│  │  └─ Entry preflight plus global delegation baseline for every thread
│  ├─ skills/master/SKILL.md
│  │  ├─ Private workflow routing
│  │  ├─ Retrieval order
│  │  └─ Private delegation refinement
│  ├─ skills/master/LOCAL.md
│  │  └─ Installer-preserved local overlay for private route-table and delegation details
│  ├─ rules.md
│  │  └─ Short reusable operating rules and anti-footguns
│  └─ Memory Governance
│     ├─ memory.md
│     ├─ memory/daily/YYYY-MM-DD.md
│     ├─ memory/topics/*.md
│     └─ automations/<automation-id>/memory.md
│
└─ Execution Layer
   ├─ Main Codex Agent
   │  └─ Owns critical path, final judgment, and final user output
   ├─ Optional Sub-Agents
   │  └─ Delegated workers for bounded exploration, disjoint implementation, or sidecar verification
   └─ Tools / Connectors / Skills
      └─ The execution capabilities used by the main agent and approved delegated workers
```

## Core Roles

- `Project / Repo / Branch`
  - where files live and how versions move
- `Thread`
  - one active task context for Codex
- `AGENTS.md`
  - entry gate and global delegation baseline
- `Master`
  - private workflow routing and private delegation refinement hub
- `LOCAL.md`
  - local overlay for private route-table details and private delegation refinements
- `rules.md`
  - compact operating rules that should be checked quickly
- `memory`
  - long-term, daily, topic, and automation-local facts
- `sub-agents`
  - optional execution helpers controlled by the main agent

## Execution Model

Codex is treated as a main-agent system with optional delegation.

- The main agent stays responsible for critical decisions, main-path progress, and final synthesis.
- Sub-agents belong to the execution layer, not the policy layer.
- The operating layer does not implement a runtime. It governs when delegation is allowed and how delegated work should be handled.
- Global delegation guardrails live in `AGENTS.md`; private refinements live in `skills/master/SKILL.md` and optional local overlay files.
- The default mode is single-agent execution. Delegation is a conditional tool, not a default behavior.

## Design Rules

- Keep entry behavior and the global delegation baseline in `AGENTS.md`
- Keep private routing and delegation refinement in `skills/master/SKILL.md`
- Keep private route-table overrides in `skills/master/LOCAL.md`
- Keep concise reusable rules in `rules.md`
- Keep durable facts in `memory.md` or `memory/topics/*.md`
- Keep run-specific observations in daily or automation memory
- Route before delegating
- Let the main agent own final responsibility for delegated work
