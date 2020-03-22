require 'rails_helper'

RSpec.describe "pet show page", type: :feature do
  it "can delete a pet" do
    shelter_1 = Shelter.create(name: 'Laramie Frog Center',
                               address: '1112 Main St.',
                               city: 'Laramie',
                               state: 'Wyoming',
                               zip: '82072')
     pet_1 = Pet.create(
                         name: 'Perry',
                         age: '12',
                         sex: 'Male',
                         shelter: shelter_1,
                         image: 'http://pngimg.com/uploads/dog/dog_PNG50348.png',
                         description: 'A happy, playful guy who wants to eat meat'
     )
     pet_2 = Pet.create( description: 'A happy, playful guy who wants to eat meat',
                         name: 'Chanel',
                         age: '7',
                         sex: 'Female',
                         shelter: shelter_1,
                         image: 'https://www.vhv.rs/file/max/36/361319_cute-dog-png.png'
     )
    visit "/pets/#{pet_1.id}"
    click_button "Delete Pet"
    expect(current_path).to eq('/pets')
    expect(page).to have_content(pet_2.name)
    expect(page).to have_no_content(pet_1.name)
  end

end
