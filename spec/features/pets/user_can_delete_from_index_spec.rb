require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can delete a pet" do
    shelter_1 = Shelter.create(name: 'Broomfield Dog Shelter',
                               address: '1111 fake dr.',
                               city: 'Broomfield',
                               state: 'Colorado',
                               zip: '80020')
    pet_1 = Pet.create( description: 'A happy, playful guy who wants to eat meat',
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
    pet_2 = Pet.create( description: 'A happy, playful guy who wants to eat meat',
                        name: 'Chanel',
                        age: '7',
                        sex: 'Female',
                        shelter: shelter_2,
                        image: 'https://www.vhv.rs/file/max/36/361319_cute-dog-png.png'
    )

    visit "/pets"
    click_button( "Delete Pet #{pet_1.id}")
    expect(page).to have_content(pet_2.name)
    expect(page).to have_no_content(pet_1.name)
  end
end
