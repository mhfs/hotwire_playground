require "test_helper"

class AnimalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get animals_index_url
    assert_response :success
  end
end
