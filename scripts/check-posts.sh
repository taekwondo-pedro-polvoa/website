#!/usr/bin/env bash
# Single enforcement point for blog rules: every post has a pt and an en version, a description
# and, when it declares an image, an image_alt. Fails loud on the first run with all findings.
set -euo pipefail
cd "$(dirname "$0")/.."
fail=0
shopt -s nullglob
for dir in content/blog/*/; do
  pt="${dir}index.pt.md"
  # Every post must exist in both pt and en.
  for lang in pt en; do
    [ -f "${dir}index.${lang}.md" ] || { echo "MISSING ${lang} version: $dir"; fail=1; }
  done
  [ -f "$pt" ] || continue
  for f in "${dir}"index.*.md; do
    grep -Eq '^description: *".+"' "$f" || { echo "MISSING description: $f"; fail=1; }
    if grep -Eq '^image: *".+"' "$f"; then
      grep -Eq '^image_alt: *".+"' "$f" || { echo "MISSING image_alt: $f"; fail=1; }
    fi
  done
done
for f in content/blog/*.md; do
  case "$f" in */_index.*) ;; *) echo "POST must be a page bundle (dir/index.pt.md): $f"; fail=1 ;; esac
done
# A published page must not carry editorial placeholders.
for f in $(find content -name '*.md'); do
  if grep -Eq '\[(POR CONFIRMAR|TO CONFIRM)' "$f" &&! grep -Eq '^draft: *true' "$f"; then
    echo "PLACEHOLDER in a non-draft page: $f"; fail=1
  fi
done
exit $fail
