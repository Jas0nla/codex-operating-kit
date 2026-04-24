# Agent Operating Layer

[English README](./README.md)

`Agent Operating Layer` 是一个给 Codex 环境使用的共享操作层。

它保持入口栈足够轻：

- `AGENTS.md`：线程入口和少量全局协作约束
- `skills/master/SKILL.md`：team-local 路由
- `skills/team-orchestrator/SKILL.md`：问一次，再启动最小可用 roster
- `skills/master/LOCAL.md`：安装后保留的本地 route table
- `memory/rules.md`：高复用短规则和 anti-footguns

## 这个仓库保留什么

这个仓库存的是可复用的 operating capability，不是机器私有信息。

它包含：

- 一套轻量入口契约
- 一个轻量本地路由器
- 一个可复用的 orchestration skill
- 一套小而稳定的 shared custom-agent roster
- 支持 shared files 和 local overlays 的安装脚本

它不包含：

- 真实 hostname、IP、内部 URL、token
- 个人 route table
- 每日笔记和 run log
- 机器专属 helper 值

## 共享执行形态

默认共享执行形态是：

1. 请求可能触及 team-local 时，先进入 `$Master`
2. 优先路由到最具体的本地 skill 或 helper
3. 如果任务有明确可并行 lane，就送到 `$team-orchestrator`
4. 在开启多-agent 前先问一次
5. 从最小可用 roster 开始：
   - `workflow_scout`
   - `repo_researcher`
   - 只有在需要最后可信收口时才加 `final_verifier`

## Shared Custom Agents

这个仓库自带 3 个可复用 custom agents：

- `workflow_scout`
- `repo_researcher`
- `final_verifier`

本地安装后，你可以继续替换或扩展成自己的私有 roster。

## 安装

运行：

```bash
./install.sh
```

也可以指定目标目录：

```bash
./install.sh /path/to/target-codex-home
```

安装脚本会：

- 复制 shared files
- 保留现有私有 local overlay
- 安装 shared custom agents

## 设计规则

- 入口行为放在 `AGENTS.md`
- 本地路由放在 `skills/master/SKILL.md`
- ask-and-launch orchestration 放在 `skills/team-orchestrator/SKILL.md`
- 私有 route-table 细节放在 `skills/master/LOCAL.md`
- 高复用短规则放在 `memory/rules.md`
- durable facts 放在本地 memory files，不放进 shared router
- 能复用成熟方案时，不要重复造轮子

完整分层见 [docs/architecture.md](docs/architecture.md)，迁移方法见 [docs/migration.md](docs/migration.md)。
