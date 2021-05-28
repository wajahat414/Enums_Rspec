require './enums'
describe Enumerable do
    describe '#my_each' do
        it 'iterates upto the number of items in the list and calls block of code if given for every value' do
            array=[1,2,3]
            expect(array.my_each{|num| print num}).to eql(array.each{|num| print num})
            expect((1..5).my_each{|value| print value}).to eql(1..5)
            last=0
            (1..5).my_each{|value| last=value}
            expect(last).to eql(5)
        end
    end
    describe '#my_each_with_index' do
        it 'iterates upto the number of items in the list and calls block of code if given for every value along with its index' do
            array=[]
            [10,20,30].my_each_with_index{|num,i| array[i]=num}
            expect(array).to eql([10,20,30])
        end
    end
    describe '#my_select' do
        it 'iterates through all elements of array and returns only those values which matches the condition' do
            expect([1,2,3,4,5].my_select { |num|  num.even?  }).to eql([2,4])
        end
    end
    describe '#my_all?' do
        it 'returns true only if all elements satisfies the given condition takes pattern and block' do
            expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }).to eql(true)
            expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }).to eql(false)
            expect(%w[ant bear cat].my_all?(/t/) ).to eql(false)
            expect([1, 2i, 3.14].my_all?(Numeric) ).to eql(true)
            expect([nil, true, 99].my_all?).to eql(false)
            expect([].my_all?).to eql(true)
        end
    end
    describe '#my_any?' do
        it 'returns true only if any element satisfies the given condition takes pattern and block' do
            expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
            expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
            expect(%w[ant bear cat].my_any?(/d/) ).to eql(false)
            expect([nil, true, 99].my_any?(Integer)).to eql(true)
            expect([].my_any?).to eql(false)
        end
    end
    describe '#my_none?' do
        it 'The method returns true if the block never returns true for all elements.' do
            expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
            expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to eql(false)
            expect(%w[ant bear cat].my_none?(/d/) ).to eql(true)
            expect([1, 2i, 3.14].my_none?(Float) ).to eql(false)
            expect([nil,false,true].my_none?).to eql(false)
        end
    end
    describe '#my_count' do
        it 'The method returns count for  elements on which  condition is true' do
            expect(%w[ant bear cat].my_count { |word| word.length == 5 }).to eql(0)
            expect(%w[ant bear cat].my_count { |word| word.length >= 4 }).to eql(1)
            expect(%w[ant bear cat].my_count(/d/) ).to eql(0)
        end
    end
    describe '#my_inject' do
        it 'Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.' do
            expect((5..10).my_inject { |sum, n| sum + n }  ).to eql(45)
            expect((5..10).my_inject(1) { |product, n| product * n } ).to eql(151200)
            longest = %w{ cat sheep bear }.my_inject do |memo, word|
                memo.length > word.length ? memo : word
             end
             expect(longest).to eql('sheep')
        end
    end
    describe '#my_map' do
        it 'Returns a new array with the results of running block once for every element in enum.' do
            expect((1..4).my_map { |i| i*i }  ).to eql([1,4,9,16])
        end
    end
    
    
    
end