require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can see all pet names" do
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
                        image: 'http://pngimg.com/uploads/dog/dog_PNG50348.png'
    )
    shelter_2 = Shelter.create(name: 'Denver Hope Center',
                               address: '1111 fake dr.',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '80020')
    pet_2 = Pet.create(
                        name: 'Chanel',
                        age: '7',
                        sex: 'Female',
                        shelter: shelter_2,
                        image: 'https://www.vhv.rs/file/max/36/361319_cute-dog-png.png'
    )

    visit "/pets"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Age: #{pet_1.age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Shelter: #{pet_1.shelter.name}")
    expect(page).to have_css("img[src*='http://pngimg.com/uploads/dog/dog_PNG50348.png']")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content("Age: #{pet_2.age}")
    expect(page).to have_content("Sex: #{pet_2.sex}")
    expect(page).to have_content("Shelter: #{pet_2.shelter.name}")
    expect(page).to have_css("img[src*='https://www.vhv.rs/file/max/36/361319_cute-dog-png.png']")
    
  end
end
