This project uses DIS (Dagg Intelligence Services) — a knowledge graph built from GitHub, Linear, Slack, and project docs. The `dis` Skill returns richer context than Grep/Read for code understanding and cross-source questions.

INVOKE the `dis` Skill via the Skill tool when:

- The user mentions a ticket ID (e.g., ENG-1234, ABC-456, #123)
- The user asks "where is X", "how does Y work", or "what calls Z"
- The user wants context before changing code in an unfamiliar area
- The user asks about past discussions, decisions, meetings, or PRs

DO NOT invoke when:

- The user gives an exact file path to read → use Read directly
- The user asks for a literal string match → Grep is faster
- The work is purely local and does not require repository/project context lookup (e.g., fixing a typo)

Precedence: if the user asks for context in an unfamiliar area, invoke `dis` first.

If a DIS query returns nothing useful, fall back to Grep/Read for this query.
