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
- [x] Require confirmation before closing.
  - [x] Add confirm as a option to the drawer component.
  - [x] Customizable confirmation message.
  - [x] Outlet for further control over confirmation requirement.
  - [x] Use a custom dialog instead of browser confirm.
- [x] Slot based drawer content (header/body/footer).
- [x] Make in-drawer form functional.
  - Both new/edit.
  - Do we need an custom stream action to close the drawer?
  - Probably turbo stream?
- [x] Make drawer unique on trigger and set unique identifier.
--- Ready for real world use ---
- [x] Animation on drawer trigger (but not on page load).
- [x] Make drawer resizable.
- [x] Choose drawer size on trigger (small, medium, large).

Known Issues:
- [x] No user feedback when drawer is opening and taking too long.
- [x] Drawer close with window.history.back breaks when opening drawer via link.
- [x] "</div> </div>" bug when reloading with open drawer.
