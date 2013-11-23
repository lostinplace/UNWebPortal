require 'test_helper'

class LawsControllerTest < ActionController::TestCase
  setup do
    @law = laws(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laws)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create law" do
    assert_difference('Law.count') do
      post :create, law: { description: @law.description, effective_on: @law.effective_on, tags: @law.tags, title: @law.title }
    end

    assert_redirected_to law_path(assigns(:law))
  end

  test "should show law" do
    get :show, id: @law
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @law
    assert_response :success
  end

  test "should update law" do
    patch :update, id: @law, law: { description: @law.description, effective_on: @law.effective_on, tags: @law.tags, title: @law.title }
    assert_redirected_to law_path(assigns(:law))
  end

  test "should destroy law" do
    assert_difference('Law.count', -1) do
      delete :destroy, id: @law
    end

    assert_redirected_to laws_path
  end
end
