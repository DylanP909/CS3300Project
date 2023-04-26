require "rails_helper"
describe "Sitter Attribute Requirements on Create", :type => :model do
  context "validation tests" do
    it "should save if everything is present" do
        sitter = PetSitter.new(name:"bob",email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr")
        expect(sitter.valid?).to eq(true)
      end
    it "should not be able to save sitter when name missing" do
      sitter = PetSitter.new(email:"bob@gmail.com",description: "Some description content goes here",cost:"2$/hr")
      expect(sitter.valid?).to eq(false)
    end
    it "should not be able to save sitter when email missing" do
      sitter = PetSitter.new(name:"bob",description: "Some description content goes here",cost:"2$/hr")
      expect(sitter.save).to eq(false)
    end
    it "should not be able to save sitter when desc missing" do
        sitter = PetSitter.new(name:"bob",email:"bob@gmail.com",cost:"2$/hr")
        expect(sitter.save).to eq(false)
    end
    it "should not be able to save sitter when cost missing" do
        sitter = PetSitter.new(name:"bob",email:"bob@gmail.com",description: "Some description content goes here")
        expect(sitter.save).to eq(false)
    end
  end
end
