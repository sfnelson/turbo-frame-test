require "application_system_test_case"

class FrameNavigationsTest < ApplicationSystemTestCase
  test "page navigation with turbo frames" do
    visit root_url

    assert_selector "h1", text: "Hello world"

    assert_selector "turbo-frame", text: "Tab one content"
    assert_current_path root_path

    click_on "Tab two"

    assert_selector "turbo-frame", text: "Tab two content"
    assert_current_path tab_path("two")

    page.go_back

    assert_selector "turbo-frame", text: "Tab one content" # fails as of Turbo 8
    assert_current_path root_path

    page.go_forward

    assert_selector "turbo-frame", text: "Tab two content"
    assert_current_path tab_path("two")

    # we haven't modified the rest of the page (restoration visit)
    assert_selector "h1", text: "Hello world" # fails as of Turbo 8
  end
end
