require 'rails_helper'

RSpec.describe 'Show page' do
  it 'displays snack name and price' do
    owner = Owner.create!(name: "Sam's Snacks")

    basement  = owner.machines.create!(location: "Turing basment")
    hallway  = owner.machines.create!(location: "Dorm hallway")
    lobby  = owner.machines.create!(location: "Hotel lobby")

    taki = Snack.create!(name: "Taki", price: 3)
    dulce = Snack.create!(name: "Dulce", price: 2)
    cheezits = Snack.create!(name: "Cheezits", price: 5)
    cheetos = Snack.create!(name: "Cheetos", price: 3.5)
    reeses = Snack.create!(name: "Reeses", price: 2.5)
    twix = Snack.create!(name: "Twix", price: 1.5)

    basement.snacks << taki
    basement.snacks << dulce
    basement.snacks << cheezits
    hallway.snacks << cheezits
    hallway.snacks << cheetos
    lobby.snacks << dulce
    lobby.snacks << reeses
    lobby.snacks << twix

    visit "/snacks/#{twix.id}"

    expect(page).to have_content(twix.name)
    expect(page).to have_content(twix.price)
  end

  it 'can list locations with vending machines that carry that snack' do
    owner = Owner.create!(name: "Sam's Snacks")

    basement  = owner.machines.create!(location: "Turing basment")
    hallway  = owner.machines.create!(location: "Dorm hallway")
    lobby  = owner.machines.create!(location: "Hotel lobby")

    taki = Snack.create!(name: "Taki", price: 3)
    dulce = Snack.create!(name: "Dulce", price: 2)
    cheezits = Snack.create!(name: "Cheezits", price: 5)
    cheetos = Snack.create!(name: "Cheetos", price: 3.5)
    reeses = Snack.create!(name: "Reeses", price: 2.5)
    twix = Snack.create!(name: "Twix", price: 1.5)

    basement.snacks << taki
    basement.snacks << dulce
    basement.snacks << cheezits
    hallway.snacks << cheezits
    hallway.snacks << cheetos
    lobby.snacks << dulce
    lobby.snacks << reeses
    lobby.snacks << twix

    visit "/snacks/#{dulce.id}"

    expect(page).to have_content(basement.location)
    expect(page).to have_content(lobby.location)
  end

  it 'average price for snacks in those vending machines' do
    owner = Owner.create!(name: "Sam's Snacks")

    basement  = owner.machines.create!(location: "Turing basment")
    hallway  = owner.machines.create!(location: "Dorm hallway")
    lobby  = owner.machines.create!(location: "Hotel lobby")

    taki = Snack.create!(name: "Taki", price: 3)
    dulce = Snack.create!(name: "Dulce", price: 2)
    cheezits = Snack.create!(name: "Cheezits", price: 5)
    cheetos = Snack.create!(name: "Cheetos", price: 3.5)
    reeses = Snack.create!(name: "Reeses", price: 2.5)
    twix = Snack.create!(name: "Twix", price: 1.5)

    basement.snacks << taki
    basement.snacks << dulce
    basement.snacks << cheezits
    hallway.snacks << cheezits
    hallway.snacks << cheetos
    lobby.snacks << dulce
    lobby.snacks << reeses
    lobby.snacks << twix

    visit "/snacks/#{taki.id}"

    expect(page).to have_content("Average Price: $3.33")
  end

  it 'counts  the different kinds of items in that vending machine.' do
    owner = Owner.create!(name: "Sam's Snacks")

    basement  = owner.machines.create!(location: "Turing basment")
    hallway  = owner.machines.create!(location: "Dorm hallway")
    lobby  = owner.machines.create!(location: "Hotel lobby")

    taki = Snack.create!(name: "Taki", price: 3)
    dulce = Snack.create!(name: "Dulce", price: 2)
    cheezits = Snack.create!(name: "Cheezits", price: 5)
    cheetos = Snack.create!(name: "Cheetos", price: 3.5)
    reeses = Snack.create!(name: "Reeses", price: 2.5)
    twix = Snack.create!(name: "Twix", price: 1.5)

    basement.snacks << taki
    basement.snacks << dulce
    basement.snacks << cheezits
    hallway.snacks << cheezits
    hallway.snacks << cheetos
    lobby.snacks << dulce
    lobby.snacks << reeses
    lobby.snacks << twix

    visit "/snacks/#{taki.id}"

    expect(page).to have_content("Snack Count: 3")
  end
end
