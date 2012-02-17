require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get arhive" do
    get :arhive
    assert_response :success
  end

end
