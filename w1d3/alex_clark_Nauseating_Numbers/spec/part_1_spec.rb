require "part_1"

describe "Part 1:" do
    describe "strange_sums" do
        it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
            expect { partition([2, -3, 3, 4, -2])}.to_not raise_error
            expect { partition([42, 3, -1, -42])}.to_not raise_error
            expect { partition([-5, 5])}.to_not raise_error
            expect { partition([19, 6, -3, -20])}.to_not raise_error
            expect { partition([9])}.to_not raise_error
        end
    end
end