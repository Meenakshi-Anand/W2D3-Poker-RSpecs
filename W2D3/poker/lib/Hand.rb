require_relative "Deck"

class Hand
  
  HAND_RANK = { :high_card => 1, :one_pair => 2, :two_pair => 3, :three_of_a_kind => 4, :straight => 5,
    :flush => 6, :full_house => 7, :four_of_a_kind => 8, :straight_flush => 9, :five_of_a_kind => 10
  }
  attr_reader :cards 
  
  def initialize(deck)
    @cards = draw_five(deck) 
  end  
  
  def cheat
    # used for debugging 
    @cards = [Card.new()] 
  end 
  
  def discard 
  end 
  
  def calculate_hand
    case @cards 
    when five_of_a_kind
      @rank = :five_of_a_kind
      return @rank 
    when straight_flush 
      @rank = :straight_flush
      return @rank
    when four_of_a_kind 
      @rank = :four_of_a_kind
      return @rank 
    else 
      @rank = :high_card
      return @rank
    end 
  end 
  
  protected 
  def sort(array)
     array.sort { |x, y| x.compare(y) }
  end 
  
  def draw_five(deck)
    hand = []
    5.times {hand.push(deck.deck.pop)} 
    sort(hand)  
  end 
  
  def five_of_a_kind
   @cards.all? { |card| card.compare(@cards[0]) == 0 } 
  end 
  
  def straight_flush
    @cards.all? { |card| card.suit == @cards[0].suit } && in_sequence
  end 
  
  def four_of_a_kind
    hash = Hash.new(0)
    @cards.each do |card| 
      hash[card.value] += 1 
    end 
    !hash.select{|k,v| v == 4}.empty? 
  end 
  
  def in_sequence
    @cards.last.value - @cards.first.value  == 4 
  end 
  
  
end 