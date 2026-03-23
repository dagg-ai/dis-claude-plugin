# dis deps

Show the dependency graph for code entities.

## Usage

```bash
scripts/dis deps "module.ClassName"
scripts/dis deps "package.function_name"
```

## When to Use

- "What does this function depend on?"
- "What calls this class?"
- Understanding impact before making changes
- Tracing dependency chains

## Output

Returns dependency counts and top callers/callees for each entity.
