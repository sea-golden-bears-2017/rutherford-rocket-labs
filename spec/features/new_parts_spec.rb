require 'rails_helper'

RSpec.feature "NewParts", type: :feature do
  scenario "Adds a new part to catalog" do
    visit "/"
    click_link "New Part"
    fill_in 'Name', with: 'Robot-interface IG-88'
    fill_in 'Min', with: 10
    fill_in 'Max', with: 200

    click_button('Save Part')
    expect(page.has_content?('Save Part'))

  end

  scenario "Adds renders errors if part not valid" do
    visit "/"
    click_link "New Part"
    fill_in 'Min', with: 10
    fill_in 'Max', with: 200

    click_button('Save Part')
    expect(page.has_content?("Name can't be blank"))

  end
end
