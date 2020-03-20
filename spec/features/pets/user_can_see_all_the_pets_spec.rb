require 'rails_helper'

RSpec.describe "pet index page", type: :feature do
  it "can see all pet names" do
    pet_1 = Pet.create(
                        name: = 'Perry',
                        age: = '12',
                        sex: = 'Male',
                        shelter: = 'Denver Hope Center',
                        image: = 'https://images.app.goo.gl/pSMRBa7jXKCv6jnU6'
    )
    visit "/pets"
    expect(page).to have_content("Name: #{pet_1.name}")
    expect(page).to have_content("Age: #{pet_1.age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Shelter: #{pet_1.shelter}")
    expect(page).to have_css("img[src*='https://images.app.goo.gl/pSMRBa7jXKCv6jnU6']")
  end
end'
