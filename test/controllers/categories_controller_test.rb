require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports")
    @normal_user = User.create(username: "normal", email: "normal@test.com",
      password: "password")
    @admin_user = User.create(username: "admin", email: "admin@test.com",
      password: "password", admin: true)
  end

  test "should get index" do
    sign_in_as(@normal_user)
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: "Movies" } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test "should not create category if not admin" do
    sign_in_as(@normal_user)
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: "Travel" } }
    end

    assert_redirected_to categories_url
  end
  
  test "should show category" do
    sign_in_as(@normal_user)
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
