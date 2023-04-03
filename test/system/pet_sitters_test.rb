require "application_system_test_case"

class PetSittersTest < ApplicationSystemTestCase
  setup do
    @pet_sitter = pet_sitters(:one)
  end

  test "visiting the index" do
    visit pet_sitters_url
    assert_selector "h1", text: "Pet Sitters"
  end

  test "creating a Pet sitter" do
    visit pet_sitters_url
    click_on "New Pet Sitter"

    fill_in "Cost", with: @pet_sitter.cost
    fill_in "Description", with: @pet_sitter.description
    fill_in "Email", with: @pet_sitter.email
    fill_in "Name", with: @pet_sitter.name
    click_on "Create Pet sitter"

    assert_text "Pet sitter was successfully created"
    click_on "Back"
  end

  test "updating a Pet sitter" do
    visit pet_sitters_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @pet_sitter.cost
    fill_in "Description", with: @pet_sitter.description
    fill_in "Email", with: @pet_sitter.email
    fill_in "Name", with: @pet_sitter.name
    click_on "Update Pet sitter"

    assert_text "Pet sitter was successfully updated"
    click_on "Back"
  end

  test "destroying a Pet sitter" do
    visit pet_sitters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pet sitter was successfully destroyed"
  end
end
