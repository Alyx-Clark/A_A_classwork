class Employee
    def initialize(name, title)
        @name = name
        @title = title
        @earnings = 0
    end

    def name
        @name
    end

    def title
        @title
    end

    def pay(amount)
        @earnings += amount
    end
end
