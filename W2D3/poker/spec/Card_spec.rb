require 'Card'

describe "Card" do 
  subject(:card) { Card.new("A", "clovers")}
  subject(:nilcard) { Card.new }
  describe "#initialize" do 
    
    it "takes a value and a suit, and sets that value and suit" do 
      expect(card.value).to eq(14)
      expect(card.suit).to eq("clovers")
    end 
    
    it "sets a value when none is passed in randomly" do 
      expect(nilcard.value).to_not eq(nil)
      expect(nilcard.suit).to_not eq(nil)
    end 
    
    it "returns an error when passed an improper value" do 
      expect{Card.new("123213", "clovers")}.to raise_error("Error, improper value")
    end 
    
    # it "returns an error when passed an improper suit" do 
    #   expect{Card.new("A", "abcdef")}.to raise_error("Error, improper suit")
    # end 
    
  end 
  
end 