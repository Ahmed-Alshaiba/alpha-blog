require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "Books")
    @category2 = Category.create(name: "Art")
    @new_user = User.create(username: "categories list test",
      email: "categorieslist@test.com", password: "password")
  end
  
  test "show categories listing" do
    sign_in_as(@new_user)
    get "/categories"
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end