require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can delete a shelter" do
    shelter_1 = Shelter.create(name: 'Laramie Frog Center',
                               address: '1112 Main St.',
                               city: 'Laramie',
                               state: 'Wyoming',
                               zip: '82072')
    shelter_2 = Shelter.create(name: 'Boulder Frog Center',
                               address: '1412 Main St.',
                               city: 'Boulder',
                               state: 'Colorado',
                               zip: '82002')
    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
    visit "/shelters/#{shelter_1.id}"
    click_button "delete"
    expect(page).to have_content(shelter_2.name)
    expect(current_path).to have_no_content(shelter_1.name)
  end
end
