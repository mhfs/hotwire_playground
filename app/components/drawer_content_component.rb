class DrawerContentComponent < ViewComponent::Base
  renders_one :footer

  def initialize(title:)
    @title = title
  end
end
