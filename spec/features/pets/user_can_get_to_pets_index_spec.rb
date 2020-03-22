require 'rails_helper'

RSpec.describe "navigation", type: :feature do
  it "can move to pets index page" do
    shelter_1 = Shelter.create(name: 'Broomfield Dog Shelter',
                               address: '1111 fake dr.',
                               city: 'Broomfield',
                               state: 'Colorado',
                               zip: '80020')

    pet_1 = Pet.create(
                        name: 'Perry',
                        age: '12',
                        sex: 'Male',
                        shelter: shelter_1,
                        image: 'http://pngimg.com/uploads/dog/dog_PNG50348.png',
                        description: 'A happy, playful guy who wants to eat meat'
    )
    visit "/shelters/#{shelter_1.id}"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/new"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{shelter_1.id}/edit"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{shelter_1.id}/edit"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{shelter_1.id}/edit"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/pets/#{pet_1.id}"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{pet_1.id}/pets/new"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/shelters/#{shelter_1.id}/pets"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
    visit "/pets/#{pet_1.id}/edit"
    click_link "Pet's Index"
    expect(current_path).to eq("/pets/")
  end
end
