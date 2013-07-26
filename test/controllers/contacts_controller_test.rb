require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should render the new page when logged in" do
    sign_in users(:parker)
    get :new
    assert_response :success
  end

  test "should be logged in to create a contact" do
    post :create, contact: { email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create contact when logged in" do
    sign_in users(:parker)

    assert_difference('Contact.count') do
      post :create, contact: { email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should create contact for the current user when logged in" do
    sign_in users(:parker)

    assert_difference('Contact.count') do
      post :create, contact: { user_id: users(:parker).id, email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    end

    assert_redirected_to contact_path(assigns(:contact))
    assert_equal assigns(:contact).user_id, users(:parker).id
  end

  test "should show contact" do
    get :show, id: @contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit when logged in" do
    sign_in users(:parker)
    get :edit, id: @contact
    assert_response :success
  end

  test "should redirect contact update when not logged in" do
    patch :update, id: @contact, contact: { email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update contact when logged in" do
    sign_in users(:parker)
    patch :update, id: @contact, contact: { email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should update contact for the current user when logged in" do
    sign_in users(:parker)
    patch :update, id: @contact, contact: { user_id: users(:parker).id, email: @contact.email, first_name: @contact.first_name, last_name: @contact.last_name, mobile: @contact.mobile, phone: @contact.phone }
    assert_redirected_to contact_path(assigns(:contact))
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end
end
