require 'rails_helper'

RSpec.describe "shelter show page", type: :feature do
  it "can move to pets page" do
    shelter_1 = Shelter.create(name: 'Broomfield Dog Shelter',
                               address: '1111 fake dr.',
                               city: 'Broomfield',
                               state: 'Colorado',
                               zip: '80020')
    visit "/shelters/#{shelter_1.id}"
    click_link "Pets"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  end
end
