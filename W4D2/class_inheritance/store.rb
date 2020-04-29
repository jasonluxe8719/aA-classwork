class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, salary, title, boss="")
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end

end 


class Manager < Employee
    attr_reader :subordinates
    def initialize(name, salary, title, boss="")
        super
        @subordinates = []
    end

    def add_employee(employee)
        self.subordinates << employee
    end

    def bonus(multiplier)
        self.subs_salaries * multiplier
    end

    def subs_salaries
        sum = 0
        self.subordinates.each do |subordinate|
            if subordinate.is_a?(Manager)
                sum += subordinate.salary + subordinate.subs_salaries
            else
                sum += subordinate.salary
            end
        end
        sum
    end

end 

if $PROGRAM_NAME == __FILE__

    ned = Manager.new("Ned", 1000000, "Founder")
    darren = Manager.new("Darren", 78000, "TA Manager", ned)
    shawna = Employee.new("Shawna", 12000, "TA", darren)
    david = Employee.new("David", 10000, "TA", darren)

    darren.add_employee(shawna)
    darren.add_employee(david)
    ned.add_employee(darren)


   p ned.bonus(5) # => 500_000
   p darren.bonus(4) # => 88_000
   p david.bonus(3) # => 30_000
end