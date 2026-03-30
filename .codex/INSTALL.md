# Installing DIS for Codex

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/dagg-ai/dis-plugin.git ~/.codex/dis
   ```

2. Create the skills symlink:

   ```bash
   mkdir -p ~/.agents/skills
   ln -s ~/.codex/dis/skills ~/.agents/skills/dis
   ```

3. If using subagent features, enable multi-agent mode in your Codex config:

   ```toml
   [features]
   multi_agent = true
   ```

4. Restart Codex. The `dis` and `setup-dis` skills will be auto-discovered.

## Setup

After installation, ask Codex to run the `setup-dis` skill. It will guide you through account creation, project setup, and authentication.

## Updating

```bash
cd ~/.codex/dis && git pull
```

## Uninstalling

```bash
rm ~/.agents/skills/dis
rm -rf ~/.codex/dis
```
