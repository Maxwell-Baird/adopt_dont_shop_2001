require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it 'can create a shelter' do
    shelter_1 = Shelter.create(name: 'Broomfield Dog Shelter',
                               address: '1111 fake dr.',
                               city: 'Broomfield',
                               state: 'Colorado',
                               zip: '80020')
    visit "/shelters/#{shelter_1.id}/pets"
    click_link 'Create pet'
    expect(current_path).to eq('/shelters/#{shelter_1.id}/pets/new')
    fill_in 'name', with: 'Bob'
    fill_in 'description', with: 'A quiet new born puppy'
    fill_in 'age', with: '4'
    fill_in 'sex', with: 'Male'
    fill_in 'image', with: 'http://www.pngall.com/wp-content/uploads/4/Golden-Retriever-Puppy-PNG.png'
    click_button ('Create Pet')

    expect(current_path).to eq('/shelters/#{shelter_1.id}/pets')
    expect(page).to have_content("Bob")
    expect(page).to have_content("Age: 4")
    expect(page).to have_content("Sex: Male")
    expect(page).to have_css("img[src*='http://www.pngall.com/wp-content/uploads/4/Golden-Retriever-Puppy-PNG.pn']")

  end
end
