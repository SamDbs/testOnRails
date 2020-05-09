require 'test_helper'

class FluxsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fluxs_index_url
    assert_response :success
  end

  test "should get new" do
    get fluxs_new_url
    assert_response :success
  end

  test "should get create" do
    get fluxs_create_url
    assert_response :success
  end

end
