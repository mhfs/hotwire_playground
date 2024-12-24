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
- [ ] Make back/forward buttons work as expected.
- [ ] Close drawer via X link that returns the previous URL without reloading.

Known Issues:
- [ ] When you load the index page, click on a link to open a drawer and hit the back button, the URL changes back but the drawer remains open.
