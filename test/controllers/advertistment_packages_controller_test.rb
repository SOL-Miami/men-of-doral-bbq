require 'test_helper'

class AdvertistmentPackagesControllerTest < ActionController::TestCase
  setup do
    @advertistment_package = advertistment_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:advertistment_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create advertistment_package" do
    assert_difference('AdvertistmentPackage.count') do
      post :create, advertistment_package: { company: @advertistment_package.company, email: @advertistment_package.email, first_name: @advertistment_package.first_name, last_name: @advertistment_package.last_name, package: @advertistment_package.package, phone: @advertistment_package.phone }
    end

    assert_redirected_to advertistment_package_path(assigns(:advertistment_package))
  end

  test "should show advertistment_package" do
    get :show, id: @advertistment_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @advertistment_package
    assert_response :success
  end

  test "should update advertistment_package" do
    patch :update, id: @advertistment_package, advertistment_package: { company: @advertistment_package.company, email: @advertistment_package.email, first_name: @advertistment_package.first_name, last_name: @advertistment_package.last_name, package: @advertistment_package.package, phone: @advertistment_package.phone }
    assert_redirected_to advertistment_package_path(assigns(:advertistment_package))
  end

  test "should destroy advertistment_package" do
    assert_difference('AdvertistmentPackage.count', -1) do
      delete :destroy, id: @advertistment_package
    end

    assert_redirected_to advertistment_packages_path
  end
end
