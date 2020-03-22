require 'rails_helper'

RSpec.describe "Pet edit page", type: :feature do
  it "can edit a pet details" do
    shelter_1 = Shelter.create(name: 'Denver Dog Shelter',
                               address: '8888 fake dr.',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '80020')
   pet = Pet.create(
                       name: 'Perry',
                       age: '12',
                       sex: 'Male',
                       shelter: shelter_1,
                       image: 'http://pngimg.com/uploads/dog/dog_PNG50348.png',
                       description: 'A happy, playful guy who wants to eat meat'
    )

    visit "/pets/#{pet.id}"
    click_link 'Update pet'
    expect(current_path).to eq("/pets/#{pet.id}/edit")
    fill_in 'name', with: 'Max'
    fill_in 'image', with: 'https://img.favpng.com/10/3/0/golden-retriever-siberian-husky-puppy-cuteness-pet-png-favpng-U4mu9rCCcrLCDyz1p1PEUiW9U.jpg'
    fill_in 'description', with: 'He likes cats'
    fill_in 'age', with: '5'
    fill_in 'sex', with: 'Male'
    click_button ('Update Pet')
    expect(current_path).to eq("/pets/#{pet.id}")
    expect(page).to have_content('Max')
    expect(page).to have_content("Age: 5")
    expect(page).to have_content("Sex: Male")
    expect(page).to have_content("Status: adoptable")
    expect(page).to have_css("img[src*='https://img.favpng.com/10/3/0/golden-retriever-siberian-husky-puppy-cuteness-pet-png-favpng-U4mu9rCCcrLCDyz1p1PEUiW9U.jpg']")
    expect(page).to have_content('He likes cats')
  end
end
