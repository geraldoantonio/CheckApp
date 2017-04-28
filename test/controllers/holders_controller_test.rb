require 'test_helper'

class HoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holder = holders(:one)
  end

  test "should get index" do
    get holders_url
    assert_response :success
  end

  test "should get new" do
    get new_holder_url
    assert_response :success
  end

  test "should create holder" do
    assert_difference('Holder.count') do
      post holders_url, params: { holder: { cnpj: @holder.cnpj, cpf: @holder.cpf, email: @holder.email, name: @holder.name } }
    end

    assert_redirected_to holder_url(Holder.last)
  end

  test "should show holder" do
    get holder_url(@holder)
    assert_response :success
  end

  test "should get edit" do
    get edit_holder_url(@holder)
    assert_response :success
  end

  test "should update holder" do
    patch holder_url(@holder), params: { holder: { cnpj: @holder.cnpj, cpf: @holder.cpf, email: @holder.email, name: @holder.name } }
    assert_redirected_to holder_url(@holder)
  end

  test "should destroy holder" do
    assert_difference('Holder.count', -1) do
      delete holder_url(@holder)
    end

    assert_redirected_to holders_url
  end
end
