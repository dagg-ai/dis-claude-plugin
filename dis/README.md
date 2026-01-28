# DIS Claude Code Plugin

Connects Claude Code to the DIS knowledge graph via MCP tools. See the [plugin documentation](https://docs.claude.com/en/docs/claude-code/plugins).

## What is DIS?

Dagg Intelligence Services builds a knowledge graph from GitHub, Linear, Slack, and other development tools. This plugin provides MCP tools backed by that knowledge graph, giving Claude rich context about your project.

## Setup

After installing the plugin, ask Claude to help you set up DIS. The `setup-dis` skill will guide you through account creation and setup.

## Usage Examples

**Setup:**
- "Help me set up DIS" - activates guided onboarding

**Query tickets:**
- "What's the status of PROJ-123?"
- "Show me details about ABC-456"

**Implementation planning:**
- "Implement feature X" - triggers comprehensive context gathering
- "Plan the implementation of Y" - gathers related code, docs, and historical decisions
