require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe "#pokemons" do
    FactoryBot.rewind_sequences
    let(:pokemon) { build(:pokemon) }
    it "test is valid" do
      expect(pokemon).to be_valid 
    end

    it "test number unique" do
      pokemon1 = create(:pokemon)
      expect(pokemon1).to be_valid
      pokemon2 = build(:pokemon, number: pokemon1.number)
      expect(pokemon2).not_to be_valid

    end
  end
end
