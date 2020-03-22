require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can edit pet details" do
    shelter_1 = Shelter.create(name: 'Denver Dog Shelter',
                               address: '8888 fake dr.',
                               city: 'Denver',
                               state: 'Colorado',
                               zip: '80020')
   pet_1 = Pet.create(  description: 'A happy, playful guy who wants to eat meat',
                        name: 'Perry',
                        age: '12',
                        sex: 'Male',
                        shelter: shelter_1,
                        image: 'http://pngimg.com/uploads/dog/dog_PNG50348.png'
    )
    visit "/pets"
    click_link 'Update Pet'
    expect(current_path).to eq("/pets/#{pet_1.id}/edit")

  end
end
