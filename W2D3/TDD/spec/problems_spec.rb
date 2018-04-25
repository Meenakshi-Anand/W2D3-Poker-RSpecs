require 'problems'
require 'rspec'

describe "#remove_dups" do
  subject(:array) { Array.new }
  
  before(:each) do 
    array = [1,2,1,3,3]
  end 
  it "should remove duplicate elements from an array" do 
    expect(array.remove_dups).to eq(array.uniq)
  end 
  it "should not use built in function uniq" do 
    expect(array).to_not receive(:uniq)
    array.remove_dups
  end 
end  