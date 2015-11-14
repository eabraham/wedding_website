require 'test_helper'

class RsvpControllerTest < ActionController::TestCase
  test "should get rsvp" do
    get :rsvp
    assert_response :success
  end

end
