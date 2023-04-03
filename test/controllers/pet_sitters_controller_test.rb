require "test_helper"

class PetSittersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pet_sitter = pet_sitters(:one)
  end

  test "should get index" do
    get pet_sitters_url
    assert_response :success
  end

  test "should get new" do
    get new_pet_sitter_url
    assert_response :success
  end

  test "should create pet_sitter" do
    assert_difference('PetSitter.count') do
      post pet_sitters_url, params: { pet_sitter: { cost: @pet_sitter.cost, description: @pet_sitter.description, email: @pet_sitter.email, name: @pet_sitter.name } }
    end

    assert_redirected_to pet_sitter_url(PetSitter.last)
  end

  test "should show pet_sitter" do
    get pet_sitter_url(@pet_sitter)
    assert_response :success
  end

  test "should get edit" do
    get edit_pet_sitter_url(@pet_sitter)
    assert_response :success
  end

  test "should update pet_sitter" do
    patch pet_sitter_url(@pet_sitter), params: { pet_sitter: { cost: @pet_sitter.cost, description: @pet_sitter.description, email: @pet_sitter.email, name: @pet_sitter.name } }
    assert_redirected_to pet_sitter_url(@pet_sitter)
  end

  test "should destroy pet_sitter" do
    assert_difference('PetSitter.count', -1) do
      delete pet_sitter_url(@pet_sitter)
    end

    assert_redirected_to pet_sitters_url
  end
end
