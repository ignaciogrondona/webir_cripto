require "application_system_test_case"

class CriptocurrenciesTest < ApplicationSystemTestCase
  setup do
    @criptocurrency = criptocurrencies(:one)
  end

  test "visiting the index" do
    visit criptocurrencies_url
    assert_selector "h1", text: "Criptocurrencies"
  end

  test "creating a Criptocurrency" do
    visit criptocurrencies_url
    click_on "New Criptocurrency"

    fill_in "Name", with: @criptocurrency.name
    click_on "Create Criptocurrency"

    assert_text "Criptocurrency was successfully created"
    click_on "Back"
  end

  test "updating a Criptocurrency" do
    visit criptocurrencies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @criptocurrency.name
    click_on "Update Criptocurrency"

    assert_text "Criptocurrency was successfully updated"
    click_on "Back"
  end

  test "destroying a Criptocurrency" do
    visit criptocurrencies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Criptocurrency was successfully destroyed"
  end
end
