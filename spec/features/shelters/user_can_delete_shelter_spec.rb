require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can delete a shelter" do
    shelter_1 = Shelter.create(name: 'Broomfield Dog Shelter',
                               address: '1111 fake dr.',
                               city: 'Broomfield',
                               state: 'Colorado',
                               zip: '80020')
     shelter_2 = Shelter.create(name: 'Laramie pet Shelter',
                                address: '9999 false st.',
                                city: 'Laramie',
                                state: 'Wyoming',
                                zip: '82072')
    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)

  end
end
