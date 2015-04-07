require 'test_helper'

class TeamRegistrationsControllerTest < ActionController::TestCase
  setup do
    @team_registration = team_registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_registration" do
    assert_difference('TeamRegistration.count') do
      post :create, team_registration: { captain_email: @team_registration.captain_email, captain_name: @team_registration.captain_name, team_members: @team_registration.team_members, team_name: @team_registration.team_name }
    end

    assert_redirected_to team_registration_path(assigns(:team_registration))
  end

  test "should show team_registration" do
    get :show, id: @team_registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_registration
    assert_response :success
  end

  test "should update team_registration" do
    patch :update, id: @team_registration, team_registration: { captain_email: @team_registration.captain_email, captain_name: @team_registration.captain_name, team_members: @team_registration.team_members, team_name: @team_registration.team_name }
    assert_redirected_to team_registration_path(assigns(:team_registration))
  end

  test "should destroy team_registration" do
    assert_difference('TeamRegistration.count', -1) do
      delete :destroy, id: @team_registration
    end

    assert_redirected_to team_registrations_path
  end
end
