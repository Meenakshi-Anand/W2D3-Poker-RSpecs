require 'Deck'

describe "Deck" do 
  subject(:card_deck) { Deck.new}
  describe "#initialize" do 
    
    it "calls setup to make a deck with 52 cards" do 
      expect(card_deck.deck.length).to eq(52)
      expect(card_deck.deck[0]).to be_an_instance_of(Card)
    end 
    
  end
  
  describe "#shuffle" do 
    it "doesn't change the length of the deck" do 
      expect(card_deck.shuffle.length).to eq(52) 
    end 
    it "calls the array shuffle method" do 
      expect(card_deck.deck).to receive(:shuffle!)
      card_deck.shuffle 
    end 
  end  
  
end 