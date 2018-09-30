require "application_system_test_case"

class AboutPagesTest < ApplicationSystemTestCase
  setup do
    @about_page = about_pages(:one)
  end

  test "updating a About page" do
    visit about_page_url
    click_on "Edit", match: :first

    fill_in "Body", with: @about_page.body
    fill_in "Meta Description", with: @about_page.meta_description
    fill_in "Title", with: @about_page.title
    click_on "Update Page"

    assert_text "About page was successfully updated"
    click_on "Back"
  end
end
