require 'rails_helper'

RSpec.describe "shelter edit page", type: :feature do
  it "can edit shelter details" do
    shelter_1 = Shelter.create(name: 'Denver Dog Shelter',
                               address: '8888 fake dr.',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '80020')

    visit "/shelters/#{shelter_1.id}/edit"
    fill_in 'shelter[name]', with: 'Denver Dog Shelter'
    fill_in 'shelter[city]', with: 'Denver'
    fill_in 'shelter[state]', with: 'Colorado'
    fill_in 'shelter[address]', with: '1111 fake st.'
    fill_in 'shelter[zip]', with: '99099'
    click_button ('submit')
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content ('1111 fake st.')
    expect(page).to have_content('99099')
    expect(page).to have_content('Colorado')
    expect(page).to have_content('Denver')
    expect(page).to have_content('Denver Dog Shelter')
  end
end
