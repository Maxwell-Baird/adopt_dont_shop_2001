RSpec.describe "pet show page", type: :feature do
  it "can see a pet attributes" do
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
    visit "/pets/#{pet_1.id}"
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content("Age: #{pet_1.age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Status: #{pet_1.status}")
    expect(page).to have_css("img[src*='http://pngimg.com/uploads/dog/dog_PNG50348.png']")
    expect(page).to have_content(pet_1.description)
  end

end
