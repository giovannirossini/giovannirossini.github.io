PORT ?= 4321
URL  := http://localhost:$(PORT)

.DEFAULT_GOAL := help
.PHONY: help install dev build preeview stop check lint smoke verify clean

help: ## List targets
	@grep -E '^[a-z]+:.*## ' $(MAKEFILE_LIST) | awk -F ':.*## ' '{printf "  %-10s %s\n", $$1, $$2}'

install: ## Clean install from package-lock.json (same as CI)
	npm ci

dev: ## Start the dev server with hot reload
	npx astro dev --port $(PORT)

build: ## Build the site into dist/
	npm run build

preview: build ## Build, then preeview dist/ locally (default port 4321, override with PORT=)
	npx astro preview --port $(PORT)

stop: ## Stop a preview server left running for this project
	npx astro preview stop

check: ## Type-check Astro and TypeScript files
	npx astro check

lint: ## Validate data and workflow YAML with yq
	@for f in src/data/*.yaml .github/workflows/*.yml; do \
		yq e 'true' "$$f" >/dev/null || { echo "invalid YAML: $$f"; exit 1; }; \
		echo "ok  $$f"; \
	done

smoke: ## preeview dist/ and check that key URLs return 200
	@npx astro preview --port $(PORT) >/dev/null 2>&1 & \
	trap 'npx astro preview stop >/dev/null 2>&1' EXIT; \
	for i in $$(seq 1 30); do curl -sf -o /dev/null $(URL)/ && break; sleep 0.5; done; \
	fail=0; \
	for path in / /about/ /tools/ /career/ /writing/ /contact/ /og.png /favicon.svg; do \
		code=$$(curl -s -o /dev/null -w '%{http_code}' $(URL)$$path); \
		echo "$$code $$path"; [ "$$code" = 200 ] || fail=1; \
	done; \
	for img in $$(curl -s $(URL)/ | grep -o '/_astro/[^" ]*\.webp' | sort -u); do \
		code=$$(curl -s -o /dev/null -w '%{http_code}' $(URL)$$img); \
		echo "$$code $$img"; [ "$$code" = 200 ] || fail=1; \
	done; \
	exit $$fail

verify: install lint check build smoke ## Run everything CI runs, plus checks; use before pushing
	@echo "verify: all checks passed"

clean: ## Remove build output and caches
	rm -rf dist .astro node_modules/.vite
