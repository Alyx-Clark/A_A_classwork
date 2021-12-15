require "byebug"
class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h,k| h[k] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def student_capacity
        @student_capacity
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if students.length < @student_capacity
            @students << student
            return true
        else 
            return false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        num_students = @students.length
        num_teachers = @teachers.length
        ratio = (num_students/num_teachers).floor
    end

    def add_grade(student, grade)
        # debugger
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if !enrolled?(student) || @grades[student].empty?
        total = @grades[student].sum
        number = num_grades(student)
        average = (total/number).floor
    end
end
