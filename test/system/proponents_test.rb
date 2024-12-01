require "application_system_test_case"

class ProponentsTest < ApplicationSystemTestCase
  setup do
    @proponent = proponents(:one)
  end

  test "visiting the index" do
    visit proponents_url
    assert_selector "h1", text: "Proponents"
  end

  test "should create proponent" do
    visit proponents_url
    click_on "New proponent"

    fill_in "Address", with: @proponent.address_id
    fill_in "Birthday", with: @proponent.birthday
    fill_in "Contact", with: @proponent.contact_id
    fill_in "Cpf", with: @proponent.cpf
    fill_in "Inss discount", with: @proponent.inss_discount
    fill_in "Name", with: @proponent.name
    fill_in "Salary", with: @proponent.salary
    click_on "Create Proponent"

    assert_text "Proponent was successfully created"
    click_on "Back"
  end

  test "should update Proponent" do
    visit proponent_url(@proponent)
    click_on "Edit this proponent", match: :first

    fill_in "Address", with: @proponent.address_id
    fill_in "Birthday", with: @proponent.birthday
    fill_in "Contact", with: @proponent.contact_id
    fill_in "Cpf", with: @proponent.cpf
    fill_in "Inss discount", with: @proponent.inss_discount
    fill_in "Name", with: @proponent.name
    fill_in "Salary", with: @proponent.salary
    click_on "Update Proponent"

    assert_text "Proponent was successfully updated"
    click_on "Back"
  end

  test "should destroy Proponent" do
    visit proponent_url(@proponent)
    click_on "Destroy this proponent", match: :first

    assert_text "Proponent was successfully destroyed"
  end
end
