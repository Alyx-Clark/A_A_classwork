require "rspec"
require "problems"

# doesn't use uniq
# takes in array and return new array
# expect [1,2,1,3,3] to be [1,2,3]
describe '#remove_dups' do
    let(:array) {[1,2,1,3,3]}

    before(:each) do
        expect(array).not_to receive(:uniq)
    end

    it "remove duplicates" do
        expect(remove_dups(array)).to eq([1,2,3])
    end

    it "takes in array and returs a new array" do
        new_array = remove_dups(array)
        expect(new_array).not_to be(array)
    end
end

describe '#two_sum' do
    let(:array) {[-1, 0, 2, -2, 1]}

    it "returns indices of numbers that sums to zero" do
        expect(two_sum(array)).to eq([[0, 4], [2, 3]])
    end

    it "handles zero as argument" do
        expect(two_sum([1,0,0])).to eq([[1, 2]])
    end

    it "handles empty arrays" do
        expect(two_sum([])).to eq([])
    end
end

describe '#my_transpose' do
    let(:array) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]}

      let(:transposed) { [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
      ]}
      
    before(:each) do
        expect(array).not_to receive(:transpose)
    end

    it "returns a transposed version of array" do
        expect(my_transpose(array)).to eq(transposed)
    end

    it "handles empty arrays" do
        expect(my_transpose([])).to eq([])
    end
end

describe "#stock_picker" do
    let(:array) { [100, 150, 200, 125, 50, 300]}
    let(:pair) { [4, 5]}

    it "return the most profitable pair" do
        expect(stock_picker(array)).to eq(pair)
    end

    it "return array when array is empty" do
        expect(stock_picker([])).to eq([])
    end
end