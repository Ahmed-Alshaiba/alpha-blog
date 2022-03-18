require "test_helper"

class SignupNewUserTest < ActionDispatch::IntegrationTest
  def setup
    # @new_user = User.create(username: "signup test",
    #   email: "signup@test.com", password: "password")
  end
  
  test "signup new user" do
    get "/signup"
    assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { username: "some", email: "some@gmail.com", password: "password" }
      assert_response :redirect
    end
  end 
end
