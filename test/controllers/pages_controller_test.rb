require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get lessons" do
    get pages_lessons_url
    assert_response :success
  end

  test "should get reviews" do
    get pages_reviews_url
    assert_response :success
  end

  test "should get trial" do
    get pages_trial_url
    assert_response :success
  end

end
