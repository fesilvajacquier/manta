require "application_system_test_case"

class PubPostsTest < ApplicationSystemTestCase
  test "visiting the index" do
    byebug
    visit root_path
  
    assert_selector "h1", text: "PubPost"
  end
end
