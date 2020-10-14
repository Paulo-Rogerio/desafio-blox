require "application_system_test_case"

class SalasTest < ApplicationSystemTestCase
  setup do
    @sala = salas(:one)
  end

  test "visiting the index" do
    visit salas_url
    assert_selector "h1", text: "Salas"
  end

  test "creating a Sala" do
    visit salas_url
    click_on "New Sala"

    fill_in "Descricao", with: @sala.descricao
    click_on "Create Sala"

    assert_text "Sala was successfully created"
    click_on "Back"
  end

  test "updating a Sala" do
    visit salas_url
    click_on "Edit", match: :first

    fill_in "Descricao", with: @sala.descricao
    click_on "Update Sala"

    assert_text "Sala was successfully updated"
    click_on "Back"
  end

  test "destroying a Sala" do
    visit salas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sala was successfully destroyed"
  end
end
