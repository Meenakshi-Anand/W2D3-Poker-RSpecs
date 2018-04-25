require 'problems'
require 'rspec'

describe "Array Exercises" do
    let(:array) { [1,2,1,3,3] }
  
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
    let(:array) { [1, 3, -1, -2, 4, -3, 2] }
    let(:array1) { [1,2,1,3,3] }
    
    it "should return the indices of elements that add up to 0" do 
      expect(array.two_sum).to eq([[0,2], [1, 5], [3,6]])
    end
    it "should return an empty array if no two indices ad up to 0" do 
      expect(array1.two_sum).to eq([])
    end 
  end
  
  describe "#my_transpose" do 
    let(:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    # first array = length 3 
    # inside array = length 2
    # after transposing
    # first array = length 2
    # inside array = length 3 
    it "should have the correct size after transposing" do 
      expect(matrix.my_transpose.size).to eq(matrix.transpose.size)
    end 
    
    it "why rspec why" do 
      expect(matrix.my_transpose[0].size).to eq(matrix.transpose[0].size)
    end 
    
    it "should transpose a matrix" do  
      expect(matrix.my_transpose).to eq(matrix.transpose)
    end 
    
    it "should not use the built in transpose method" do 
      expect(matrix.my_transpose).to_not receive(:transpose)
    end 
  end
  
  describe "#stock_picker" do 
    let(:stocks) { [0,7,3,4,2,1,5,6] }
    let(:badstocks) { [0] }
    #array[0] = stock 1
    #array[1] = stock 2
    #array[2] = stock 3
    #array[0][0] = stock 1's price on day 1 
    # should return [0, 2], [0, 2], [0, 2]
        
    it "should return an array with when to buy the stock, and when to sell it" do 
      expect(stocks.stock_picker).to eq([0,1])
    end 
    
    it 'needs to buy the stock before it can sell the stock' do 
      temp = stocks.stock_picker
      expect(temp[1]).to be > temp[0]
    end 
    
    it 'should return an error if less than 2 days are given for a stock' do 
      
      expect {badstocks.stock_picker}.to raise_error("Need at least two days of data for all stocks!")
    end 
    
  end 
end  

