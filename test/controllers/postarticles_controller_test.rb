require 'test_helper'

class PostarticlesControllerTest < ActionController::TestCase
  setup do
    @postarticle = postarticles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postarticles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postarticle" do
    assert_difference('Postarticle.count') do
      post :create, postarticle: { content: @postarticle.content, spot_id: @postarticle.spot_id, title: @postarticle.title, user_id: @postarticle.user_id }
    end

    assert_redirected_to postarticle_path(assigns(:postarticle))
  end

  test "should show postarticle" do
    get :show, id: @postarticle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postarticle
    assert_response :success
  end

  test "should update postarticle" do
    patch :update, id: @postarticle, postarticle: { content: @postarticle.content, spot_id: @postarticle.spot_id, title: @postarticle.title, user_id: @postarticle.user_id }
    assert_redirected_to postarticle_path(assigns(:postarticle))
  end

  test "should destroy postarticle" do
    assert_difference('Postarticle.count', -1) do
      delete :destroy, id: @postarticle
    end

    assert_redirected_to postarticles_path
  end
end
