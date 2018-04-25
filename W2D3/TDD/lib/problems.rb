require 'byebug'
class Array 
  
  def remove_dups
    self.my_uniq
  end
  
  def two_sum
    results = [] 
    size.times.each do |start| 
      (start + 1...size).each do |stop|
        results << [start, stop] if self[start] + self[stop] == 0 
      end
    end
    results     
  end 
  
  def my_transpose 
    results = []
    self.each_with_index do |row, idx1| 
      rows = []
      (0...row.size).each do |idx2| 
        rows.push(self[idx2][idx1])
      end 
      results.push(rows)
    end 
    results 
  end
  
  def stock_picker
    raise "Need at least two days of data for all stocks!" if size < 2 
    most_profit = [] # this will return an array of [day_to_buy, day_to_sell]
    highest_value = 0
    size.times do |start| 
      (start + 1...size).each do |stop| 
        value = self[stop] - self[start]
        if value > highest_value
          highest_value = value 
          most_profit = [start, stop]
        end 
      end 
    end  
    most_profit
  end 
   
  protected
   
  def my_uniq
    results = []
    self.each do |el| 
      results << el unless results.include?(el)
    end
    results  
  end
  
  
  
end 


