# dis deps

Show the dependency graph for code entities.

## Usage

```bash
npx @getdis/cli deps "module.ClassName"
npx @getdis/cli deps "package.function_name"
```

## When to Use

- "What does this function depend on?"
- "What calls this class?"
- Understanding impact before making changes
- Tracing dependency chains

## Output

Returns dependency counts and top callers/callees for each entity.
