require File.dirname(__FILE__) + '/../test_helper'

class NoticiasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:noticias)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_noticia
    assert_difference('Noticia.count') do
      post :create, :noticia => { }
    end

    assert_redirected_to noticia_path(assigns(:noticia))
  end

  def test_should_show_noticia
    get :show, :id => noticias(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => noticias(:one).id
    assert_response :success
  end

  def test_should_update_noticia
    put :update, :id => noticias(:one).id, :noticia => { }
    assert_redirected_to noticia_path(assigns(:noticia))
  end

  def test_should_destroy_noticia
    assert_difference('Noticia.count', -1) do
      delete :destroy, :id => noticias(:one).id
    end

    assert_redirected_to noticias_path
  end
end
