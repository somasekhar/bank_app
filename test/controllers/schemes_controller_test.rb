require 'test_helper'

class SchemesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schemes_index_url
    assert_response :success
  end

end
