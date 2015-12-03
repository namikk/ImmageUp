require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
 fixtures :users
 
  test "login and browse site" do
    # login via https
    https!
    get "/sign_in"
    assert_response :success
 
 
    https!(false)
    get "/users/"
    assert redirect?
  end
end
