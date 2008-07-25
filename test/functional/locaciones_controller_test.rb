require File.dirname(__FILE__) + '/../test_helper'

class LocacionesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:locaciones)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_locacion
    assert_difference('Locacion.count') do
      post :create, :locacion => { }
    end

    assert_redirected_to locacion_path(assigns(:locacion))
  end

  def test_should_show_locacion
    get :show, :id => locaciones(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => locaciones(:one).id
    assert_response :success
  end

  def test_should_update_locacion
    put :update, :id => locaciones(:one).id, :locacion => { }
    assert_redirected_to locacion_path(assigns(:locacion))
  end

  def test_should_destroy_locacion
    assert_difference('Locacion.count', -1) do
      delete :destroy, :id => locaciones(:one).id
    end

    assert_redirected_to locaciones_path
  end
end
