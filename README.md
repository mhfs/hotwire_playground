# Hotwire Playground

## Run locally

```bash
gh repo clone mhfs/hotwire_playground
cd hotwire_playground
bundle
bundle exec rails db:setup
bindle rails s
```

## Drawer

Requirements:
- [x] Open drawer via regular link without any JS.
- [x] Change the URL when drawer opens and preserve state when reloading.
- [x] Make back/forward buttons work as expected.
- [x] Close drawer via X link that returns the previous URL without reloading.

Known Issues:
