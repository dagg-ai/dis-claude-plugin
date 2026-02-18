# DIS Plugin for Claude Code

Dagg Intelligence Services (DIS) builds a knowledge graph from your development tools—GitHub, Slack, Linear, and more. This plugin provides MCP tools backed by your knowledge graph, giving Claude rich context about your project.

## Installation

To install from this repository, first add the plugin:

```bash
/plugin marketplace add dagg-ai/dis-claude-plugin
```

Next, install DIS: 

```bash
/plugin install dis
```

After installation, restart Claude Code and ask Claude to help you set up DIS. The `setup-dis` skill will guide you through account creation and setup.

## Features

- Query tickets and issues across your connected tools
- Gather comprehensive implementation context from your knowledge graph
- Plan features with historical context and existing patterns

See [dis/README.md](./dis/README.md) for usage examples.
