require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise "There is an error"
        else
            @employees << Employee.new(employee_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        amount = self.salaries[employee.title]
        raise "There is not enough funding" if amount > @funding
        employee.pay(amount)
        @funding -= amount
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]    
        end
        sum / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each {|k, v| @salaries[k] = v if !salaries.has_key?(k)}
        @employees = @employees + other_startup.employees
        other_startup.close
    end

end
