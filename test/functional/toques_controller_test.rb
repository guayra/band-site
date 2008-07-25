require File.dirname(__FILE__) + '/../test_helper'

class ToquesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:toques)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_toque
    assert_difference('Toque.count') do
      post :create, :toque => { }
    end

    assert_redirected_to toque_path(assigns(:toque))
  end

  def test_should_show_toque
    get :show, :id => toques(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => toques(:one).id
    assert_response :success
  end

  def test_should_update_toque
    put :update, :id => toques(:one).id, :toque => { }
    assert_redirected_to toque_path(assigns(:toque))
  end

  def test_should_destroy_toque
    assert_difference('Toque.count', -1) do
      delete :destroy, :id => toques(:one).id
    end

    assert_redirected_to toques_path
  end
end
