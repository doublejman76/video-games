require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
        post categories_path, params: { category: { name: "Arcade"} }
        assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Arcade", response.body
  end

  test "get new category form reject invalid and category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
        post categories_path, params: { category: { name: " "} }
    end
    assert_match "Arcade", response.body
  end
end