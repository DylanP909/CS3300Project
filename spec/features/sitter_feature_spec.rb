require "rails_helper"
RSpec.feature "PetSitter", type: :feature do
    context "Update sitter" do
      let(:sitter) { PetSitter.create(name:"bob",email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr") }
      before(:each) do
        visit edit_pet_sitter_path(sitter)
      end
 
      scenario "should be successful" do
        within("form") do
          fill_in "Name", with: "New name"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end

      scenario "should be successful" do
        within("form") do
          fill_in "Email", with: "New email"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end

      scenario "should be successful" do
        within("form") do
          fill_in "Cost", with: "4$/hr"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end
 
      scenario "should fail" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Name can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Cost", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Cost can't be blank")
      end

      scenario "should fail" do
        within("form") do
          fill_in "Email", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Email can't be blank")
      end

    end
end
