require "rails_helper"
RSpec.feature "PetSitter", type: :feature do

    context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
          fill_in "Email", with: "testing@test.com"
          fill_in "Password", with: "123456"
          fill_in "Password confirmation", with: "123456"
          click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end


        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Logged in")
        end

        scenario "should log out" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          click_link "Logout"
          expect(page).to have_content("Login")
        end

        scenario "should cancel account" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          click_link "Edit profile"
          click_button "Cancel my account"
          expect(page).to have_content("Your account has been successfully cancelled.")
        
      end
    end
    

    context "Update sitter" do
      let(:sitter) { PetSitter.create(name:"bob",email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        visit edit_pet_sitter_path(sitter)
      end
 
      scenario "update name: should be successful" do
        within("form") do
          fill_in "Name", with: "New name"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end
 
      scenario "update desc: should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end

      scenario "update emaiL: should be successful" do
        within("form") do
          fill_in "Email", with: "New email"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end

      scenario "update cost: should be successful" do
        within("form") do
          fill_in "Cost", with: "4$/hr"
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Pet sitter was successfully updated.")
      end
 
      scenario "attempt to update blank name: should fail" do
        within("form") do
          fill_in "Name", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Name can't be blank")
      end

      scenario "attempt to update blank desc: should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "attempt to update blank cost: should fail" do
        within("form") do
          fill_in "Cost", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Cost can't be blank")
      end

      scenario "attempt to update blank email: should fail" do
        within("form") do
          fill_in "Email", with: ""
        end
        click_button "Update Pet sitter"
        expect(page).to have_content("Email can't be blank")
      end
    end

    context "Make a new sitter" do
      let(:sitter) { PetSitter.create(name:"bob",email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit root_path
        visit new_pet_sitter_path(sitter)
      end

      scenario "Create sitter: should be successful" do
        within("form") do
          fill_in "Name", with: sitter.name
          fill_in "Email", with: sitter.email
          fill_in "Description", with: sitter.description
          fill_in "Cost", with: sitter.cost
        end
        click_button "Create Pet sitter"
        expect(page).to have_content("Pet sitter was successfully created.")
      end

      scenario "Create sitter missing name: should fail" do
        within("form") do
          fill_in "Email", with: sitter.email
          fill_in "Description", with: sitter.description
          fill_in "Cost", with: sitter.cost
        end
        click_button "Create Pet sitter"
        expect(page).to have_content("Name can't be blank")
      end

      scenario "Create sitter missing email: should fail" do
        within("form") do
          fill_in "Name", with: sitter.name
          fill_in "Description", with: sitter.description
          fill_in "Cost", with: sitter.cost
        end
        click_button "Create Pet sitter"
        expect(page).to have_content("Email can't be blank")
      end

      scenario "Create sitter missing desc: should fail" do
        within("form") do
          fill_in "Name", with: sitter.name
          fill_in "Email", with: sitter.email
          fill_in "Cost", with: sitter.cost
        end
        click_button "Create Pet sitter"
        expect(page).to have_content("Description can't be blank")
      end

      scenario "Create sitter missing cost: should fail" do
        within("form") do
          fill_in "Name", with: sitter.name
          fill_in "Email", with: sitter.email
          fill_in "Description", with: sitter.description
        end
        click_button "Create Pet sitter"
        expect(page).to have_content("Cost can't be blank")
      end
    end




end
