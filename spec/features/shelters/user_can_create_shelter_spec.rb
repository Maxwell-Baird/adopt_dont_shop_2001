require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it 'can create a shelter' do
    visit "/shelters"
    click_link 'New Shelter'
    expect(current_path).to eq('/shelters/new')
    fill_in 'name', with: 'New York Pet Shelter'
    fill_in 'address', with: '1111 fake st.'
    fill_in 'city', with: 'New York City'
    fill_in 'state', with: 'New York'
    fill_in 'zip', with: '10012'
    click_button ('submit')

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("New York Pet Shelter")
  end
end
