HUGO ?= hugo

.PHONY: start build check-posts check clean

start:
	$(HUGO) server -D --disableFastRender

build:
	$(HUGO) --minify --panicOnWarning

check-posts:
	./scripts/check-posts.sh

# Builds drafts too so the blog templates are exercised even before a real post exists.
check: check-posts
	$(HUGO) --minify --panicOnWarning --buildDrafts --destination "$$(mktemp -d)"

clean:
	rm -rf public resources .hugo_build.lock
