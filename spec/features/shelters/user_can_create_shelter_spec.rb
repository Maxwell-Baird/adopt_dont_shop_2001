require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it 'can create a shelter' do

    visit "/shelters/new"
    fill_in 'shelter[name]', with: 'New York Pet Shelter'
    fill_in 'shelter[address]', with: '1111 fake st.'
    fill_in 'shelter[city]', with: 'New York City'
    fill_in 'shelter[state]', with: 'New York'
    fill_in 'shelter[zip]', with: '10012'
    click_button ('submit')

    expect(current_path).to eq('/shelters')
    expect(current_path).to have_content("New York Pet Shelter")
  end
end
