require 'test_helper'

class KibanasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kibana = kibanas(:one)
  end

  test "should get index" do
    get kibanas_url
    assert_response :success
  end

  test "should get new" do
    get new_kibana_url
    assert_response :success
  end

  test "should create kibana" do
    assert_difference('Kibana.count') do
      post kibanas_url, params: { kibana: { url: @kibana.url } }
    end

    assert_redirected_to kibana_url(Kibana.last)
  end

  test "should show kibana" do
    get kibana_url(@kibana)
    assert_response :success
  end

  test "should get edit" do
    get edit_kibana_url(@kibana)
    assert_response :success
  end

  test "should update kibana" do
    patch kibana_url(@kibana), params: { kibana: { url: @kibana.url } }
    assert_redirected_to kibana_url(@kibana)
  end

  test "should destroy kibana" do
    assert_difference('Kibana.count', -1) do
      delete kibana_url(@kibana)
    end

    assert_redirected_to kibanas_url
  end
end
