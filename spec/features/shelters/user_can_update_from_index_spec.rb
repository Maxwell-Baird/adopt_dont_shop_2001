require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can edit shelter details" do
    shelter_1 = Shelter.create(name: 'Denver Dog Shelter',
                               address: '8888 fake dr.',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '80020')


    visit "/shelters"
    click_link 'Update Shelter'
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

  end
end
