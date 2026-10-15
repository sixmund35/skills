# Personal agent skills

Snapshots of my installed skills, including scripts, references, and assets.
Git preserves the installed versions and local customizations across machines.

## Install on a new machine

Install Node.js/npm and Git, then use the
[skills CLI](https://github.com/vercel-labs/skills) directly from this repository.
No manual clone or custom installer is needed.

Install all five top-level skills globally for Codex:

```bash
npx skills add sixmund35/skills -g -a codex --skill '*' -y
```

- `-g`: install globally for your user, across projects.
- `-a codex`: target Codex (`~/.agents/skills`).
- `--skill '*'`: select all available skills; quotes prevent shell expansion.
- `-y`: skip confirmation prompts.

List available skills without installing:

```bash
npx skills add sixmund35/skills --list
```

Install a specific skill:

```bash
npx skills add sixmund35/skills -g -a codex --skill draw-io -y
```

Install for multiple agents:

```bash
npx skills add sixmund35/skills -g -a codex claude-code --skill '*' -y
```

For a project-only installation, run the command in that project and omit `-g`.
The Foundry skill includes its nested skills and supporting files in its folder.

## Update and customize

Check installed skills and update global installations with the skills CLI:

```bash
npx skills list -g
npx skills update -g
```

The update command checks all globally installed skills. To update just these
five, name them explicitly:

```bash
npx skills update -g c4-architecture draw-io find-skills mermaid-diagrams microsoft-foundry
```

To add newly published skills, rerun the install-all command above.

To customize the source, clone this repository, edit files under `skills/`, then
review, commit, and push your changes. Other devices can retrieve those changes
with `npx skills update -g`.

These skills are copies, not Git submodules. Updates come from this repository;
review and copy changes from the original repositories manually when desired.

## Included sources

| Folder | Original repository | Original path |
| --- | --- | --- |
| `c4-architecture` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/c4-architecture` |
| `draw-io` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/draw-io` |
| `mermaid-diagrams` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/mermaid-diagrams` |
| `find-skills` | [vercel-labs/skills](https://github.com/vercel-labs/skills) | `skills/find-skills` |
| `microsoft-foundry` | [microsoft/azure-skills](https://github.com/microsoft/azure-skills) | `.github/plugins/azure-skills/skills/microsoft-foundry` |

The table preserves original source attribution. Git records the backed-up
versions and subsequent customizations. `.gitattributes` preserves original
line endings in the skill files across platforms.

The installed copies contained no standalone upstream license files. Existing
license declarations and notices inside files are preserved. Consult the original
repositories for applicable terms and retain their required notices when sharing.

## Tools and connections

The skills CLI installs skill files. Install tools required by the workflows
separately:

- draw.io CLI (`drawio`) for local draw.io exports.
- Mermaid CLI (`mmdc`) for local Mermaid image exports, if needed.
- Azure CLI, PowerShell, SDKs, and MCP connections as required by Foundry tasks.

Some imported instructions contain machine-specific or agent-specific paths;
review them when using a workflow on a new machine.

Codex built-in skills and plugin caches are excluded. Reinstall plugins and
reconnect their accounts separately. Keep credentials and account configuration
outside this repository.
