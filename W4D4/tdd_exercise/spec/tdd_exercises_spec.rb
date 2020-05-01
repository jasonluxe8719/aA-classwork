require 'rspec'
require 'tdd_exercises'

describe '#my_uniq' do
    it "will remove duplicate entries" do
        expect(my_uniq([1, 2, 1, 3, 3])).to eq([1, 2, 3])
    end  
end

describe Array do
    describe '#two_sum' do
        it 'finds all pairs of positions where the elements sum to zero' do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4], [2,3]])
        end
        
        it 'will be sorted with smaller indices first' do
            expect([-1, 0, 2, -2, 1].two_sum).not_to eq([[2,3], [0,4]])
        end
    end
end

describe '#my_transpose' do
  it 'will convert between the row oriented to the col oriented representations' do
    rows = [[0, 1, 2],[3, 4, 5],[6, 7, 8]]
    cols = [[0, 3, 6], [1, 4, 7], [2, 5, 8]]
    expect(my_transpose(rows)).to eq(cols)
  end
end

describe '#stock_picker' do
    it 'should accept an array as an argument' do
        expect{ stock_picker([1, 2, 3]) }.to_not raise_error
    end

    it 'returns the most profitable pair of days to buy and then sell' do
        arr = [3, 6, 1]
        expect(stock_picker(arr)).to eq([6,1])
    end   
end

describe TowerOfHanoi do
  subject(:tower) {TowerOfHanoi.new}
  describe '#initialize' do
    it "should be initialized with a 2d array with 3 subarrays" do
        expect(tower.board.length).to eq(3)
    end

    it "should start with three discs on the first index" do
        expect(tower.board.first).to eq([3, 2, 1])
    end
  end

describe '#get_pos' do
    it 'should prompt the use to choose a start pile and end pile' do
      prompt = double("0 2\n", :chomp=>"0 2")
      allow(tower).to receive(:gets).and_return(prompt)
      expect{tower.get_pos}.to output(/choose a start pile and end pile/).to_stdout
    end

    it 'should call gets.chomp to get input from user' do
      prompt = double("0 2\n", :chomp=>"0 2")
      allow(tower).to receive(:gets).and_return(prompt)
      
      expect(prompt).to receive(:chomp)
      expect(tower).to receive(:gets)
      tower.get_pos
    end

    it 'should return an array containing the start pile and end pile' do
        prompt = double("0 2\n", :chomp=>"0 2")
        allow(tower).to receive(:gets).and_return(prompt)
        expect(tower.get_pos).to eq([0, 2])
    end
end

  describe '#move' do
    it 'moves disc from start pile to end pile' do
        arr = TowerOfHanoi.new 
        updated_arr = [[3,2], [1], []]
        expect(arr.move([0,1])).to eq(updated_arr)
    end  

    it 'should raise error if a bigger disk is put on a smaller disk' do
      arr = TowerOfHanoi.new
      arr.board = [[3], [2], [1]]
      expect{arr.move([0,2])}.to raise_error('Invalid Move')
    end
    
  end

  describe '#won?' do
    it 'will have all discs in the last rod from biggest to smallest' do
        arr = TowerOfHanoi.new
        arr.board = [[],[],[3,2,1]]
        expect(arr.won?).to be(true)
    end
  end

  describe 'play'
    it 'should include get_pos'
    

    it 'should include move'
    

    it 'should determine if the game is won'
    
  end
end