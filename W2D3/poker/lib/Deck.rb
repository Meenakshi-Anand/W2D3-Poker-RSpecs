require_relative 'Card'

class Deck
  VALUES = { "2" => 2,"3" => 3,"4" => 4,"5" => 5,"6" => 6,"7" => 7,"8" => 8,"9" => 9,"T" => 10,"J" => 11,
    "Q" => 12,"K" => 13, "A" => 14}
  SUITS = ["spades", "clovers", "hearts", "diamonds"]
  
  attr_reader :deck 
  
  def initialize
    @deck = setup.shuffle 
  end
  
  def setup
    results = []
    VALUES.keys.each do |value| 
      SUITS.each do |suit|
        results.push(Card.new(value, suit)) 
      end 
    end
    results  
  end 
  
  def shuffle 
    @deck.shuffle! 
  end 
   
  def inspect 
    "deck with 52 cards"
  end 

end 
