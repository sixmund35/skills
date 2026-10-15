# Personal agent skills

Snapshots of my installed skills, including scripts, references, and assets.
Git preserves the installed versions and local customizations across machines.

## Set up a new machine

Requires Git and Bash (Linux, macOS, or WSL):

```bash
git clone https://github.com/sixmund35/skills.git "$HOME/repositories/skills"
cd "$HOME/repositories/skills"
bash install.sh --dry-run
bash install.sh
```

The installer links each top-level skill folder into `~/.agents/skills`.
Codex supports personal skills and symlinked skill folders in that location:
https://learn.chatgpt.com/docs/build-skills

Nested skills and supporting files remain inside their original parent folder.
Keep the clone in place because the installed symlinks point into it. Codex
normally detects new skills automatically; restart it if they do not appear.

Existing files, folders, and symlinks (including broken ones) are skipped.
Rerunning the installer is safe. To replace an existing installation, move that
specific skill folder somewhere safe, then rerun the installer. No existing
installation is replaced automatically.

For another agent or a temporary installation, choose a destination:

```bash
bash install.sh --dest /path/to/agent/skills
```

## Update and customize

Edit the files under `skills/`, review the changes, then commit and push them.
On another machine:

```bash
cd "$HOME/repositories/skills"
git pull --ff-only
bash install.sh
```

Existing links see file changes immediately. Rerunning the installer adds new
skill folders. Remove an old symlink manually if its skill was removed from the
repository. If you move the clone, move its old symlinks aside and rerun the
installer to create links to the new location.

These are copies, not Git submodules. The installer does not download upstream
updates; review and copy upstream changes manually to preserve customizations.

## Included sources

| Folder | Original repository | Original path |
| --- | --- | --- |
| `c4-architecture` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/c4-architecture` |
| `draw-io` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/draw-io` |
| `mermaid-diagrams` | [softaworks/agent-toolkit](https://github.com/softaworks/agent-toolkit) | `skills/mermaid-diagrams` |
| `find-skills` | [vercel-labs/skills](https://github.com/vercel-labs/skills) | `skills/find-skills` |
| `microsoft-foundry` | [microsoft/azure-skills](https://github.com/microsoft/azure-skills) | `.github/plugins/azure-skills/skills/microsoft-foundry` |

`sources.json` records provenance from the local installer metadata. Its original
folder hashes are installer hashes, not upstream Git commit SHAs. Exact upstream
revisions were unavailable; the backed-up files preserve the installed versions.
`snapshot-sha256.json` contains the initial per-file checksums. Regenerate it
after intentionally updating the snapshot if you want a current integrity record.
`.gitattributes` preserves original line endings in the skill snapshots so clones
retain the same file checksums across platforms.

The installed copies contained no standalone upstream license files. Existing
license declarations and notices inside files are preserved. Consult the original
repositories for applicable terms and retain their required notices when sharing.

## Tools and connections

The installer only links files. Install tools required by the workflows separately:

- draw.io CLI (`drawio`) for local draw.io exports.
- Mermaid CLI (`mmdc`) for local Mermaid image exports, if needed.
- Node.js/npm for workflows that invoke `npx skills`.
- Azure CLI, PowerShell, SDKs, and MCP connections as required by Foundry tasks.

Some imported instructions contain machine-specific or agent-specific paths;
review them when using a workflow on a new machine.

Codex built-in skills and plugin caches are excluded. Reinstall plugins and
reconnect their accounts separately. Keep credentials and account configuration
outside this repository.
