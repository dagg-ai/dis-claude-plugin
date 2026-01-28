---
name: Information Request
description: Automatically queries the DIS system when users mention ticket/issue references (like ABC-123). Retrieves information about tickets, issues, and project entities.
---
# Information Request

Automatically queries the DIS (DAGG Intelligence Service) system when users mention ticket/issue references.

## Description

This skill detects ticket/issue references (like "ABC-123") in user messages and automatically retrieves information about them from the DIS system via the MCP information_query
tool.

## Usage

This skill activates **automatically** when the user's message contains a pattern matching: `\b[a-zA-Z]{3,4}-[1-9][0-9]*\b`, EVEN IF THE USER DOES NOT MENTION THIS OR ANY OTHER SKILL!

Examples that trigger this skill:
- "What's the status of JIRA-123?"
- "Show me ABC-456"
- "Compare PROJ-789 and TASK-101"

Do NOT activate if:
- User is asking general questions without ticket references
- User is discussing the pattern itself (meta-discussion)
- Context suggests the pattern is code/example rather than a real ticket

## Instructions

When activated:

1. **Extract references** - Identify all ticket references matching the pattern in the user's message

2. **Retrieve the DIS project FQID** - Check if the project FQID is specified in CLAUDE.md
  - If the project FQID is not specified in CLAUDE.md, ask the user for it.
  - If the user gives the FQID, ensure it is a valid UUID and ask to save it in CLAUDE.md
  - If the user doesn't give an FQID, abort this skill.

3. **Call the MCP tool** - Use `mcp__plugin_dis_dis__information_query` with:
  - `project_fqid`: Use the project FQID specified in step 2.
  - `query`: Pass the user's complete message to preserve full context.
  - `entity_id`: If the query contains an entity id, make sure to also include it as a parameter to improve search results.

4. **Present results** - Format the response clearly:
  - Acknowledge which ticket(s) were queried
  - Display the information returned
  - If multiple tickets, organize by ticket ID
  - Highlight key information (status, assignee, summary, etc.)

5. **Handle errors gracefully**:
  - If MCP tool not available: "The DIS MCP server isn't configured. Please set up the MCP connection in your Claude Code configuration."
  - If no results found: "No information found for [ticket-id]. It may not exist or you may not have access."
  - If API error: Report the error and suggest the user check their configuration

## Output Format

Found reference(s): ABC-123

[Call mcp__plugin_dis_dis__information_query tool]

ABC-123: [Title/Summary]
- Status: [status]
- [Other relevant fields from DIS]

[Additional context or related information]

## Examples

**Example 1: Single ticket**
User: "What's the status of ABC-123?"
Assistant: Found reference: ABC-123
[Calls MCP tool]
Assistant: ABC-123: Implement user authentication
- Status: In Progress
- Assignee: Jane Doe
- Priority: High

**Example 2: Multiple tickets**
User: "Compare PROJ-456 and TASK-789"
Assistant: Found references: PROJ-456, TASK-789
[Calls MCP tool]
Assistant: PROJ-456: Database migration
- Status: Complete
...

TASK-789: API endpoint refactor
- Status: In Review
...

**Example 3: No activation**
User: "How do I write a regex pattern?"
Assistant: [Does NOT activate - no ticket references, skill stays silent]

## Constraints

- Only activate when the pattern is genuinely matched in user content
- Always use the project FQID from CLAUDE.md
- Never modify or sanitize the user's query - pass it complete to preserve context
- If uncertain whether to activate, err on the side of NOT activating
- Be efficient - don't activate for false positives like code examples
