require "rails_helper"
RSpec.describe PetSittersController, :type => :controller do

    login_user
    let(:valid_attributes) {
        { :name => "bob", :email => "bob@gmail.com", :description => "Some description content goes here", :cost => "2$/hr"}
    }

    let(:valid_session) { {} }

    describe "test web requests" do
        context "GET #index" do
            it "returns a success response" do
            get :index, params: {}, session: valid_session
            expect(response).to have_http_status(:ok)
            end
        end
        context "GET #show" do
            let!(:sitter) { PetSitter.create(name:"bob",email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr") }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
        context "GET #new" do
            let!(:sitter) { PetSitter.create() }
            it "returns a success response" do
                expect(response).to have_http_status(:ok)
            end
        end
    end
end
