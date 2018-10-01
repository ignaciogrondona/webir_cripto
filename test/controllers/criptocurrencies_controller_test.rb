require 'test_helper'

class CriptocurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criptocurrency = criptocurrencies(:one)
  end

  test "should get index" do
    get criptocurrencies_url
    assert_response :success
  end

  test "should get new" do
    get new_criptocurrency_url
    assert_response :success
  end

  test "should create criptocurrency" do
    assert_difference('Criptocurrency.count') do
      post criptocurrencies_url, params: { criptocurrency: { name: @criptocurrency.name } }
    end

    assert_redirected_to criptocurrency_url(Criptocurrency.last)
  end

  test "should show criptocurrency" do
    get criptocurrency_url(@criptocurrency)
    assert_response :success
  end

  test "should get edit" do
    get edit_criptocurrency_url(@criptocurrency)
    assert_response :success
  end

  test "should update criptocurrency" do
    patch criptocurrency_url(@criptocurrency), params: { criptocurrency: { name: @criptocurrency.name } }
    assert_redirected_to criptocurrency_url(@criptocurrency)
  end

  test "should destroy criptocurrency" do
    assert_difference('Criptocurrency.count', -1) do
      delete criptocurrency_url(@criptocurrency)
    end

    assert_redirected_to criptocurrencies_url
  end
end
