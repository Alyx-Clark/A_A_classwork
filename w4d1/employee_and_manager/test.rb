require 'byebug'

require_relative 'employee'
require_relative 'manager'

ned = Manager.new('Ned', 'Founder', 1000000)
darren = Manager.new('Darren', 'TA Manager', 78000)
shawna = Employee.new('Shawna', 'TA', 12000)
david = Employee.new('David', 'TA', 10000)

darren.set_manager(ned)
shawna.set_manager(darren)
david.set_manager(darren)

# debugger
puts "Ned's bonus: #{ned.bonus(5)}"
puts "Darren's bonus: #{darren.bonus(4)}"
puts "David's bonus: #{david.bonus(3)}"