

class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def set_manager(manager)
        @boss = manager
        manager.employees << self
    end

    def bonus(multiplier)
        bonus = salary * multiplier
    end 

end