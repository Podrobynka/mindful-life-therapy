require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  setup do
    @setting = settings(:one)
  end

  test "updating a Setting" do
    visit settings_url
    click_on "Edit", match: :first

    fill_in "Contact Email", with: @setting.contact_email
    fill_in "Hourly Rate", with: @setting.hourly_rate
    fill_in "Office Address", with: @setting.office_address
    fill_in "Telephone", with: @setting.telephone
    click_on "Update Setting"

    assert_text "Setting was successfully updated"
    click_on "Back"
  end
end
