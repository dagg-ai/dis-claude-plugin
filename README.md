# DIS Plugin

Connects coding agents to the DIS knowledge graph via the `dis` CLI. Works with Claude Code, Cursor, Codex, OpenCode, and Gemini CLI.

## What is DIS?

Dagg Intelligence Services builds a knowledge graph from GitHub, Linear, Slack, and other development tools. This plugin provides skills backed by that knowledge graph, giving your agent rich context about your project.

## Installation

### Claude Code

```bash
/plugin marketplace add dagg-ai/dis-plugin
/plugin install dis@DIS-marketplace
```

### Cursor

Coming soon.

### Codex

```bash
codex plugin marketplace add dagg-ai/dis-plugin
```

Then restart Codex, open the plugin directory, choose `DIS Marketplace`, and install `DIS`.

Alternatively, tell Codex:

```
Install the DIS Codex plugin from the dagg-ai/dis-plugin marketplace.
```

### OpenCode

Tell OpenCode:

```
Fetch and follow instructions from https://raw.githubusercontent.com/dagg-ai/dis-plugin/refs/heads/main/.opencode/INSTALL.md
```

Detailed docs: [.opencode/INSTALL.md](.opencode/INSTALL.md)

### Gemini CLI

```bash
gemini extensions install https://github.com/dagg-ai/dis-plugin
```

## Setup

After installing, run `/setup-dis` (or ask your agent to run the `setup-dis` skill). It will guide you through:

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

## Updating

### Claude Code / Cursor

```bash
/plugin update dis
```

### Codex

```bash
codex plugin marketplace upgrade dis-marketplace
```

### OpenCode

Restart OpenCode to pull the latest version.

### Gemini CLI

```bash
gemini extensions update dis
```
