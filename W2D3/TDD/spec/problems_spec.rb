require 'problems'
require 'rspec'

describe "Array Exercises" do
  subject(:array) { Array.new } 
  
  before(:each) do 
    array = [1,2,1,3,3]
  end
  
  describe "#remove_dups" do
    it "should remove duplicate elements from an array" do 
      expect(array.remove_dups).to eq(array.uniq)
    end
     
    it "should not use built in function uniq" do 
      expect(array).to_not receive(:uniq)
      array.remove_dups
    end   
  end
    
  describe "#two_sum" do 
    it "should return the indices of elements that add up to 0" do 
      array = [1, 3, -1, -2, 4, -3, 2]
      expect(array.two_sum).to eq([[0,2], [1, 5], [3,6]])
    end
    it "should return an empty array if no two indices ad up to 0" do 
      expect(array.two_sum).to eq([])
    end 
  end  
end  