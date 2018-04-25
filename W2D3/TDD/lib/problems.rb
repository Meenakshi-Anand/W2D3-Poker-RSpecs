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
  
  protected
   
  def my_uniq
    results = []
    self.each do |el| 
      results << el unless results.include?(el)
    end
    results  
  end
  
  
end 


