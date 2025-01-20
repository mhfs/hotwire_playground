# Hotwire Playground

## Run locally

```bash
gh repo clone mhfs/hotwire_playground
cd hotwire_playground
bundle
bundle exec rails db:setup
bindle rails s
```

## Drawer Component

A Hotwire-powered sliding drawer component with rich features and seamless integration.

### Basic Usage

Add the drawer template to your layout:

```erb
<template id="drawer-template">
  <%= render DrawerFrameComponent.new(animate: true) %>
</template>
```

Use the `link_to_drawer` helper to trigger the drawer:

```erb
<%= link_to_drawer "Open Drawer", drawer_path %>
```

### Features

#### URL Management
- Updates URL when drawer opens
- Preserves state on page reload
- Works with browser back/forward buttons

#### Closing Behavior
- Close via X button
- Close via ESC key
- Close via clicking overlay
- Returns to previous URL without page reload

#### Confirmation Dialog
Add confirmation before closing:

```erb
<%= link_to_drawer "Open Drawer",
                   drawer_path,
                   confirm: true,
                   confirm_message: "Are you sure?" %>
```

Programmatic control via Stimulus:
```js
// In your Stimulus controller
this.drawerOutlet.setConfirmation()   // Require confirmation
this.drawerOutlet.resetConfirmation() // Remove confirmation
```

#### Drawer Sizes
Choose from predefined sizes:

```erb
<%= link_to_drawer "Small Drawer", drawer_path, size: :small %>
<%= link_to_drawer "Medium Drawer", drawer_path, size: :medium %>
<%= link_to_drawer "Large Drawer", drawer_path, size: :large %>
```

#### Structure
The drawer supports a structured layout:

```erb
<%= render DrawerComponent.new(title: "My Drawer") do |drawer| %>
  <div class="drawer-body">
    Main content here
  </div>

  <% drawer.with_footer do %>
    Footer content here
  <% end %>
<% end %>
```

#### Forms Integration
Fully compatible with Turbo Stream responses:

```ruby
def create
  respond_to do |format|
    format.turbo_stream do
      if @record.save
        render turbo_stream: [
          turbo_stream.close_drawer,
          turbo_stream.append("list", partial: "item")
        ]
      end
    end
  end
end
```

#### Interactive Features
- Resizable width via drag handle
- Smooth open/close animations
- Loading state feedback
- Click-away to close

### Implementation Details

The drawer uses a combination of:
- ViewComponents for structured rendering
- Stimulus controllers for behavior
- Turbo Frames for content loading
- Turbo Streams for dynamic updates

See the component files for detailed implementation:
- `app/components/drawer_component.rb`
- `app/javascript/controllers/drawer_controller.js`
- `app/helpers/drawer_helper.rb`

## TODO

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
