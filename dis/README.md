# DIS Plugin

Connects coding agents to the DIS knowledge graph via the `dis` CLI. Works with Claude Code, Codex, and other agents that support skills.

## What is DIS?

Dagg Intelligence Services builds a knowledge graph from GitHub, Linear, Slack, and other development tools. This plugin provides a skill backed by that knowledge graph, giving your agent rich context about your project.

## Installation

### Claude Code

```bash
/plugin marketplace add github.com/dagg-ai/dis-claude-plugin
/plugin install dis
```

### Codex

Copy the skill into your project:

```bash
mkdir -p .agents/skills
cp -r skills/. .agents/skills/
```

## Setup

After installing, run `/setup-dis` to get started. It will guide you through:

1. Account creation at https://app.getdis.ai
2. Project setup and configuration
3. Authentication
4. Connectivity verification

## Features

- Ask questions about code structure, relationships, and definitions
- Query tickets, PRs, and project history
- Search project documentation and meeting notes
- Gather comprehensive implementation context before code changes
- Time-bounded research queries
- Auto-activates on ticket references (e.g., DAG-123, PROJ-456)
