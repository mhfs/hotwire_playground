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
- [x] Close drawer on ESC.
- [ ] Require confirmation before closing.
  - Customizable confirmation message.
  - Outlet for further control over confirmation requirement.
  - Use a prettier dialog?
- [ ] Slot based drawer content (header/body/footer).
- [ ] Animation on drawer trigger (but not on page load).
- [ ] Make in-drawer form functional.
  - Do we need an custom stream action to close the drawer?
- [ ] Make drawer resizable.

Known Issues:
- [x] No user feedback when drawer is opening and taking too long.
- [x] Drawer close with window.history.back breaks when opening drawer via link.
- [x] "</div> </div>" bug when reloading with open drawer.
- [ ] Would it make sense to have a single controller instead of two?
