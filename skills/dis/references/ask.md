# dis ask

Ask questions about source code. Uses semantic code search to find relevant files, functions, and relationships.

## Usage

```bash
scripts/dis ask "How does authentication work?"
scripts/dis ask "Where is the background task runner defined?"
scripts/dis ask "What modules handle webhook processing?"
```

## When to Use

- "How does X work?"
- "Where is X defined?"
- "What modules handle Y?"
- "Explain the relationship between X and Y"
- Finding code by intent rather than exact string matching

## Output

Returns `{answer, sources}` where `answer` is the LLM response and `sources` is a list of entity references with file locations (e.g., `"entity:auth.service.login src/auth.py:42-68"`).
