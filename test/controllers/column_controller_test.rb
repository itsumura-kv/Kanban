require 'test_helper'

class ColumnControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get column_new_url
    assert_response :success
  end

  test "should get create" do
    get column_create_url
    assert_response :success
  end

  test "should get edit" do
    get column_edit_url
    assert_response :success
  end

  test "should get update" do
    get column_update_url
    assert_response :success
  end

  test "should get destroy" do
    get column_destroy_url
    assert_response :success
  end

end
