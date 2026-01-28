---
name: Setup DIS
description: Setup DIS account to go with the plugin. 
allowed-tools:
  - Read
  - Edit
  - mcp__plugin_dis_dis__health
  - mcp__plugin_dis_dis__information_query
---
# Setup DIS

Guides the user through the process of setting up their DIS account. This is a simple onboarding script. Be clear, and to the point. Go through each step, make sure you prompt for user verification when needed.

## Instructions

1. **New account** - Prompt the user to create their account at https://app.getdis.ai. The user must verify that they have an account before proceeding to the next step.

2. **New project** - Prompt the user to set up a DIS project at https://app.getdis.ai/projects/.

3. **Check the project FQID** - If there is already a project fqid in the root CLAUDE.MD-file, ask if it's the correct one (you may link to https://app.getdis.ai/projects/${PROJECT_FQID} to verify).

4. **Set the project FQID** - If the project fqid in the root CLAUDE.MD-file was incorrect, or if there was none. Ask the user for the correct project fqid, and add it to the root CLAUDE.MD.

5. **Check system health** - Use the `mcp__plugin_dis_dis__health` tool to verify MCP authentication, and ensure the system is healthy.

6. **Get some information** - Use the `mcp__plugin_dis_dis__information_query` tool to ask DIS about the most recently created issue, and report back to the user.
