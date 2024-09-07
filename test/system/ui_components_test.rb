require "application_system_test_case"

class UiComponentsTest < ApplicationSystemTestCase
  setup do
    @ui_component = ui_components(:one)
  end

  test "visiting the index" do
    visit ui_components_url
    assert_selector "h1", text: "Ui components"
  end

  test "should create ui component" do
    visit ui_components_url
    click_on "New ui component"

    fill_in "Html content", with: @ui_component.html_content
    fill_in "Name", with: @ui_component.name
    click_on "Create Ui component"

    assert_text "Ui component was successfully created"
    click_on "Back"
  end

  test "should update Ui component" do
    visit ui_component_url(@ui_component)
    click_on "Edit this ui component", match: :first

    fill_in "Html content", with: @ui_component.html_content
    fill_in "Name", with: @ui_component.name
    click_on "Update Ui component"

    assert_text "Ui component was successfully updated"
    click_on "Back"
  end

  test "should destroy Ui component" do
    visit ui_component_url(@ui_component)
    click_on "Destroy this ui component", match: :first

    assert_text "Ui component was successfully destroyed"
  end
end
