require 'test_helper'

class HealthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health = healths(:one)
  end

  test "should get index" do
    get healths_url
    assert_response :success
  end

  test "should get new" do
    get new_health_url
    assert_response :success
  end

  test "should create health" do
    assert_difference('Health.count') do
      post healths_url, params: { health: { condition: @health.condition, day: @health.day, symptom_id: @health.symptom_id, temperature: @health.temperature, user_id: @health.user_id } }
    end

    assert_redirected_to health_url(Health.last)
  end

  test "should show health" do
    get health_url(@health)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_url(@health)
    assert_response :success
  end

  test "should update health" do
    patch health_url(@health), params: { health: { condition: @health.condition, day: @health.day, symptom_id: @health.symptom_id, temperature: @health.temperature, user_id: @health.user_id } }
    assert_redirected_to health_url(@health)
  end

  test "should destroy health" do
    assert_difference('Health.count', -1) do
      delete health_url(@health)
    end

    assert_redirected_to healths_url
  end
end
