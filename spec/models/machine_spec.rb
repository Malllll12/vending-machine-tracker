require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many :snacks }
  end

  describe 'Methods' do
    it ".average_price" do
      owner = Owner.create!(name: "Sam's Snacks")
      dons  = owner.machines.create!(location: "Don's Mixed Drinks")
      ralphs  = owner.machines.create!(location: "Ralphs Snacks")
      cheezits = ralphs.snacks.create!(name: "Cheezits", price: 5)
      cheetos = dons.snacks.create!(name: "Cheetos", price: 3.5)
      reeses = dons.snacks.create!(name: "Reeses", price: 2.5)
      twix = dons.snacks.create!(name: "Twix", price: 1.5)

      expect(dons.average_price).to eq(2.5)
    end
  end
end
