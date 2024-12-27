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
- [ ] Close drawer via X link that returns the previous URL without reloading.
- [ ] Require confirmation before closing.
- [x] Close drawer on ESC.

Known Issues:
- [ ] Drawer close with window.history.back breaks when opening drawer via link.
- [ ] No user feedback when drawer is opening and taking too long.
- [ ] Back button when oppening a drawer from link does not work. Can we deduce where to default to?
- [ ] Redirect on animals#update is not working due to missing frame
