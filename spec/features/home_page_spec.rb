RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see list of sitters" do
      visit root_path
      expect(page).to have_text("Sitters Name")
    end
  end
  