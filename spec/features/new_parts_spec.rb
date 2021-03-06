require 'rails_helper'

RSpec.feature "NewParts", type: :feature do
  xscenario "Adds a new part to catalog" do
    visit "/"
    click_link "New Part"
    fill_in 'Name', with: 'Robot-interface IG-88'
    fill_in 'Min', with: 10
    fill_in 'Max', with: 200

    click_button('Save Part')
    expect(page).to have_text('Robot-interface IG-88')

  end

  xscenario "Adds renders errors if part not valid" do
    visit "/"
    click_link "New Part"
    fill_in 'Min', with: 10
    fill_in 'Max', with: 200

    click_button('Save Part')
    expect(page).to have_text("Name can't be blank")

  end
end
