require 'test_helper'

class CriptocurrencyHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criptocurrency_history = criptocurrency_histories(:one)
  end

  test "should get index" do
    get criptocurrency_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_criptocurrency_history_url
    assert_response :success
  end

  test "should create criptocurrency_history" do
    assert_difference('CriptocurrencyHistory.count') do
      post criptocurrency_histories_url, params: { criptocurrency_history: { name: @criptocurrency_history.name } }
    end

    assert_redirected_to criptocurrency_history_url(CriptocurrencyHistory.last)
  end

  test "should show criptocurrency_history" do
    get criptocurrency_history_url(@criptocurrency_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_criptocurrency_history_url(@criptocurrency_history)
    assert_response :success
  end

  test "should update criptocurrency_history" do
    patch criptocurrency_history_url(@criptocurrency_history), params: { criptocurrency_history: { name: @criptocurrency_history.name } }
    assert_redirected_to criptocurrency_history_url(@criptocurrency_history)
  end

  test "should destroy criptocurrency_history" do
    assert_difference('CriptocurrencyHistory.count', -1) do
      delete criptocurrency_history_url(@criptocurrency_history)
    end

    assert_redirected_to criptocurrency_histories_url
  end
end
