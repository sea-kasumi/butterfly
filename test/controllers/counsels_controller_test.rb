require 'test_helper'

class CounselsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @counsel = counsels(:one)
  end

  test "should get index" do
    get counsels_url
    assert_response :success
  end

  test "should get new" do
    get new_counsel_url
    assert_response :success
  end

  test "should create counsel" do
    assert_difference('Counsel.count') do
      post counsels_url, params: { counsel: { day: @counsel.day, end_time: @counsel.end_time, start_time: @counsel.start_time, teacher: @counsel.teacher } }
    end

    assert_redirected_to counsel_url(Counsel.last)
  end

  test "should show counsel" do
    get counsel_url(@counsel)
    assert_response :success
  end

  test "should get edit" do
    get edit_counsel_url(@counsel)
    assert_response :success
  end

  test "should update counsel" do
    patch counsel_url(@counsel), params: { counsel: { day: @counsel.day, end_time: @counsel.end_time, start_time: @counsel.start_time, teacher: @counsel.teacher } }
    assert_redirected_to counsel_url(@counsel)
  end

  test "should destroy counsel" do
    assert_difference('Counsel.count', -1) do
      delete counsel_url(@counsel)
    end

    assert_redirected_to counsels_url
  end
end
