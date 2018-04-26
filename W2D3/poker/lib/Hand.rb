require_relative "Deck"
require 'byebug'

class Hand
  
  HAND_RANK = { :high_card => 1, :one_pair => 2, :two_pair => 3, :three_of_a_kind => 4, :straight => 5,
    :flush => 6, :full_house => 7, :four_of_a_kind => 8, :straight_flush => 9, :five_of_a_kind => 10
  }
  attr_reader :cards, :rank 
  
  def initialize(deck)
    @cards = draw_five(deck) 
  end  
  
  def cheat(passed_in_array)
    # used for debugging 
    @cards = passed_in_array
    @cards = sort(@cards) 
  end 
  
  def discard 
  end 
  
  def compare(other_hand)
    comparison = @rank <=> other_hand.rank
    if comparison == 0 
      # check who has the higher value cards 
    else 
      comparison 
    end   
  end 
  
  def calculate_hand
    if five_of_a_kind
      @rank = :five_of_a_kind
      return @rank 
    elsif straight_flush 
      @rank = :straight_flush
      return @rank
    elsif four_of_a_kind 
      @rank = :four_of_a_kind
      return @rank
    elsif full_house
      @rank = :full_house
      return @rank 
    elsif flush 
      @rank = :flush
      return @rank 
    elsif straight 
      @rank = :straight 
      return @rank 
    elsif three_of_a_kind
      @rank = :three_of_a_kind
      return @rank 
    elsif two_pair
      @rank = :two_pair
      return @rank 
    elsif one_pair
      @rank = :one_pair
      return @rank 
    else 
      @rank = :high_card
      return @rank
    end 
  end 

  def five_of_a_kind
   @cards.all? { |card| card.compare(@cards[0]) == 0 } 
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

  
  def straight_flush
    flush && straight
  end 
  
  def four_of_a_kind
    hash = Hash.new(0)
    @cards.each do |card| 
      hash[card.value] += 1 
    end 
    !hash.select{|k,v| v == 4}.empty? 
  end 
   
  def full_house
    one_pair && three_of_a_kind
  end 
  
  def flush
    @cards.all? { |card| card.suit == @cards[0].suit } 
  end 
  
  def straight
    @cards.last.value - @cards.first.value == 4 && unique?  
  end
  
  def unique?
    value_holder = []
    @cards.each do |card| 
       value_holder.push(card.value) unless value_holder.include?(card.value)
    end
    value_holder.length == 5 
  end 
  
  def three_of_a_kind
    hash = Hash.new(0)
    @cards.each do |card| 
      hash[card.value] += 1 
    end 
    !hash.select{|k,v| v == 3}.empty? 
  end 
  
  def two_pair
    hash = Hash.new(0)
    @cards.each do |card| 
      hash[card.value] += 1 
    end 
    hash.select{|k,v| v == 2}.size == 2 
  end 
  
  def one_pair
    hash = Hash.new(0)
    @cards.each do |card| 
      hash[card.value] += 1 
    end 
    hash.select{|k,v| v == 2}.size == 1 
  end
  
end 

if __FILE__ == $0 
  deck = Deck.new 
  hand = Hand.new(deck)
  hand.cheat([Card.new("3", "diamonds"), Card.new("3", "diamonds"), Card.new("5", "diamonds"), 
    Card.new("6", "diamonds"), Card.new("7", "clovers")])
  puts("This should get straight!")
  hand.calculate_hand
  p hand.cards 
  puts hand.rank 
  
end 