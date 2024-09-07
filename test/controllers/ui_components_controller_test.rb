require "test_helper"

class UiComponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ui_component = ui_components(:one)
  end

  test "should get index" do
    get ui_components_url
    assert_response :success
  end

  test "should get new" do
    get new_ui_component_url
    assert_response :success
  end

  test "should create ui_component" do
    assert_difference("UiComponent.count") do
      post ui_components_url, params: { ui_component: { html_content: @ui_component.html_content, name: @ui_component.name } }
    end

    assert_redirected_to ui_component_url(UiComponent.last)
  end

  test "should show ui_component" do
    get ui_component_url(@ui_component)
    assert_response :success
  end

  test "should get edit" do
    get edit_ui_component_url(@ui_component)
    assert_response :success
  end

  test "should update ui_component" do
    patch ui_component_url(@ui_component), params: { ui_component: { html_content: @ui_component.html_content, name: @ui_component.name } }
    assert_redirected_to ui_component_url(@ui_component)
  end

  test "should destroy ui_component" do
    assert_difference("UiComponent.count", -1) do
      delete ui_component_url(@ui_component)
    end

    assert_redirected_to ui_components_url
  end
end
