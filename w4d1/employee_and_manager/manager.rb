require_relative "employee"
require 'byebug'

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def bonus(multiplier)
        salaries = 0
        @employees.each do |ee|
            if ee.is_a?(Manager)
                return salaries = ee.salary * multiplier + ee.bonus(multiplier)
            elsif ee.is_a?(Employee)
                salaries += ee.salary
            end
        end
        bonus = salaries * multiplier
    end
end