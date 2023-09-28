require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "get new user page" do
    get new_user_path
    assert_template :new
  end

  test "create user succeeded" do
    assert_difference('User.count') do
      post users_path, params: { user: { email: 'test@example.com', first_name: 'Aiko', last_name: 'Chen', address: '123 Road' } }
    end
    assert_redirected_to users_path
    follow_redirect!
  end

  test "create user failed" do
    assert_no_difference('User.count') do
      post users_path, params: { user: { email: '', first_name: '', last_name: '', address: '' } }
    end
    assert_template :new
  end
end
