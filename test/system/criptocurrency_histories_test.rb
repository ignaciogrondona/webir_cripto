require "application_system_test_case"

class CriptocurrencyHistoriesTest < ApplicationSystemTestCase
  setup do
    @criptocurrency_history = criptocurrency_histories(:one)
  end

  test "visiting the index" do
    visit criptocurrency_histories_url
    assert_selector "h1", text: "Criptocurrency Histories"
  end

  test "creating a Criptocurrency history" do
    visit criptocurrency_histories_url
    click_on "New Criptocurrency History"

    fill_in "Name", with: @criptocurrency_history.name
    click_on "Create Criptocurrency history"

    assert_text "Criptocurrency history was successfully created"
    click_on "Back"
  end

  test "updating a Criptocurrency history" do
    visit criptocurrency_histories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @criptocurrency_history.name
    click_on "Update Criptocurrency history"

    assert_text "Criptocurrency history was successfully updated"
    click_on "Back"
  end

  test "destroying a Criptocurrency history" do
    visit criptocurrency_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Criptocurrency history was successfully destroyed"
  end
end
