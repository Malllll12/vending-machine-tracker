require 'rails_helper'

RSpec.describe "Show page" do
  it 'displays all snacks' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    ralphs  = owner.machines.create!(location: "Ralphs Snacks")
    cheezits = ralphs.snacks.create!(name: "Cheezits", price: 5)
    cheetos = dons.snacks.create!(name: "Cheetos", price: 3)
    reeses = dons.snacks.create!(name: "Reeses", price: 2)
    twix = dons.snacks.create!(name: "Twix", price: 1)

    visit "/machines/#{dons.id}"

    expect(page).to_not have_content(cheezits.name)

    expect(page).to have_content(cheetos.name)
    expect(page).to have_content(cheetos.price)
    expect(page).to have_content(reeses.name)
    expect(page).to have_content(reeses.price)
    expect(page).to have_content(twix.name)
    expect(page).to have_content(twix.price)
  end

  it "displays the average price for the machine" do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    ralphs  = owner.machines.create!(location: "Ralphs Snacks")
    cheezits = ralphs.snacks.create!(name: "Cheezits", price: 5)
    cheetos = dons.snacks.create!(name: "Cheetos", price: 3.5)
    reeses = dons.snacks.create!(name: "Reeses", price: 2.5)
    twix = dons.snacks.create!(name: "Twix", price: 1.5)

    visit "/machines/#{dons.id}"

    expect(page).to have_content("Average Price: $2.5")
  end
end
