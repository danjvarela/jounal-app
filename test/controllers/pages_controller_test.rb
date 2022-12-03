require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get "/users/sign_in"
    sign_in users :one
    post user_session_url
  end

  test "should get home" do
    get root_path
    assert_response :success
  end
end
