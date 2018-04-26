class Card 
  VALUES = { "2" => 2,"3" => 3,"4" => 4,"5" => 5,"6" => 6,"7" => 7,"8" => 8,"9" => 9,"T" => 10,"J" => 11,
    "Q" => 12,"K" => 13, "A" => 14}
  SUITS = ["spades", "clovers", "hearts", "diamonds"]
  
  attr_reader :suit
  
  def initialize(value_input = random_value, suit_input = random_suit)
     raise "Error, improper value" unless VALUES.keys.include?(value_input)
     raise "Error, improper suit" unless SUITS.include?(suit_input)
    @suit = suit_input
    @value = value_input 
  end
  
  def random_value 
    VALUES.keys.sample
  end 
  
  def random_suit
    SUITS.sample 
  end 
  
  def compare(other_card)
    self.value <=> other_card.value 
  end
  
  def value
    VALUES[@value] 
  end  
  
  def inspect
    {"value" => value, "suit" => @suit}.inspect   
  end 
end 