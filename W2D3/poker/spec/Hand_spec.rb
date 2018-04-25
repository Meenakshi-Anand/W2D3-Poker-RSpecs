require 'Hand'
require 'Deck'

describe "Hand" do 
  let(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }
  
  describe "#initialize" do  
    it "initializes a hand of 5 cards" do 
      expect(hand.cards.length).to eq(5)
    end 
  end
  
end 