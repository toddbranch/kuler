require 'test_helper'

class PalettesControllerTest < ActionController::TestCase
  setup do
    @palette = palettes(:one)
    @test_colors = [ "AAAAAA", "AAAAAA", "AAAAAA", "AAAAAA", "AAAAAA", "AAAAAA"]
  end

  test "should get index" do
    get :index
    assert_response :success, "GET palettes route broken"
    assert_not_nil assigns(:palettes), "GET palettes not assigned palettes variable"
  end

  test "should get new" do
    get :new
    assert_response :success, "GET new palette route broken"
  end

  test "should create palette" do
    assert_difference('Palette.count') do
      post :create, palette: { name: "New Name", colors: @test_colors }
    end

    assert_redirected_to palette_path(assigns(:palette)), "create palette redirect broken"
  end

  test "should not create a palette with a duplicate name" do
    assert_no_difference('Palette.count') do
      post :create, palette: { name: "A Palette", colors: @test_colors }
    end
  end

  test "should show palette" do
    get :show, id: @palette
    assert_not_nil assigns(:palette), "GET palette not assigning palette variable"
    assert_response :success, "GET palette route broken"
  end

  test "should get edit" do
    get :edit, id: @palette
    assert_not_nil assigns(:palette), "GET edit palette not assigning palette variable"
    assert_response :success, "GET edit palette route broken"
  end

  test "should update palette" do
    patch :update, id: @palette, palette: { name: @palette.name, colors: @test_colors }
    assert_redirected_to palette_path(assigns(:palette)), "update palette redirect broken"
  end

  test "should destroy palette" do
    assert_difference('Palette.count', -1) do
      delete :destroy, id: @palette
    end

    assert_redirected_to palettes_path, "destroy palette redirect broken"
  end

  test "should share palettes" do
    get :share, id: @palette, share: { email: "todd.branchflower@gmail.com" }
    assert_redirected_to @palette, "share palette does not redirect back to palette"
    assert_equal "Palette shared!", flash[:notice], "share flash message broken"
  end
end
