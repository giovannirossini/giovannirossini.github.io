# giovannirossini.github.io

Personal site: who I am, the tools I publish, where I've worked, and what I've written.
Built with [Astro](https://astro.build) and deployed to GitHub Pages on every push to `main`.

## Run locally

Requires Node 22.

```sh
npm ci
npm run dev      # http://localhost:4321
npm run build    # outputs to dist/
npm run preview  # serves dist/
```

## Add a tool

1. Save a 1440×900 screenshot to `src/assets/tools/<tool-id>.png`.
2. Add an entry to `src/data/tools.yaml`:

   ```yaml
   - id: my-tool
     name: My Tool
     summary: One sentence on what it does.
     details: A short paragraph. Wrap commands in `backticks`.
     url: https://giovannirossini.github.io/my-tool/
     repo: https://github.com/giovannirossini/my-tool
     screenshot: ../assets/tools/my-tool.png
     screenshotAlt: What the screenshot shows.
     order: 2
   ```

3. Run `npm run build`. The schema in `src/content.config.ts` fails the build if a field is missing.

## Other content

- Experience: `src/data/experience.yaml` (omit `end` for the current role)
- Writing: `src/data/writing.yaml`
- Bio and the hero plan: `src/pages/index.astro`
- Social card: `public/og.png` (1200×630)
