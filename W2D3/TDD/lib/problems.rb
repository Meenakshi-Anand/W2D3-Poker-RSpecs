class Array 
  
  def remove_dups
    self.my_uniq
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