# giovannirossini.github.io

Personal site: who I am, the tools I publish, where I've worked, and what I've written.
Built with [Astro](https://astro.build) and deployed to GitHub Pages on every push to `main`.

## Run locally

Requires Node 22 and `yq`. Run `make` to list targets.

```sh
make install  # npm ci
make dev      # dev server with hot reload, http://localhost:4321
make serve    # build, then serve dist/ the way Pages will
make verify   # install, YAML lint, type check, build, smoke test
```

Run `make verify` before pushing. It runs the same install and build as CI, plus checks CI doesn't.

## Add a tool

1. Add an entry to `src/data/tools.yaml`. The `id` is shown as the directory name in `ls -l tools/`:

   ```yaml
   - id: my-tool
     name: My Tool
     summary: One sentence on what it does.
     details: A short paragraph. Wrap commands in `backticks`.
     url: https://giovannirossini.github.io/my-tool/
     repo: https://github.com/giovannirossini/my-tool
     order: 2
   ```

2. Run `make verify`. The schema in `src/content.config.ts` fails the build if a field is missing.

## Other content

Each section is its own page, shown as a file in the nvim-tree sidebar (desktop)
and a window in the tmux status bar (mobile):

| Page | Tree entry | Content |
|---|---|---|
| `src/pages/index.astro` | `whoami` | Name and the hero `terraform plan` |
| `src/pages/about.astro` | `about.txt` | Bio |
| `src/pages/tools.astro` | `tools/` | `src/data/tools.yaml` |
| `src/pages/career.astro` | `career.log` | `src/data/experience.yaml` (omit `end` for the current role) |
| `src/pages/writing.astro` | `writing/` | `src/data/writing.yaml` |
| `src/pages/contact.astro` | `contact.txt` | Links |

- Layout, tree, status bar, theme toggle, typing and 0–5 key navigation: `src/layouts/Shell.astro`
- One command block (prompt + output): `src/components/Command.astro`
- Adding a tab: create the page, then add it to `tabs` in `Shell.astro` and to `smoke` in the `Makefile`
- Social card: `public/og.png` (1200×630)
