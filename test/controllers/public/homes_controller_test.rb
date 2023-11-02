require "test_helper"

class Public::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_homes_top_url
    assert_response :success
  end

  test "should get about" do
    get public_homes_about_url
    assert_response :success
  end

  test "should get index" do
    get public_homes_index_url
    assert_response :success
  end

  test "should get create" do
    get public_homes_create_url
    assert_response :success
  end

  test "should get information" do
    get public_homes_information_url
    assert_response :success
  end

  test "should get complition" do
    get public_homes_complition_url
    assert_response :success
  end
end
