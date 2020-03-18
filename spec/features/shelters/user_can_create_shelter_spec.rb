require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it 'can create a shelter' do

    visit "shelters/new"
    within("#shelter") do
      fill_in 'Name', with: 'New York Pet Shelter'
      fill_in 'Address', with: '1111 fake st.'
      fill_in 'City', with: 'New York City'
      fill_in 'State', with: 'New York'
      fill_in 'zip', with: '10012'
    end
    click_button 'Submit'
    expect(page).to have_content ('New York Pet Shelter')
    expect(page).to have_content ('1111 fake st.')
    expect(page).to have_content ('New York City')
    expect(page).to have_content ('New York')
    expect(page).to have_content ('10012')
  end
end
