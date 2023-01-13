class Budget
  attr_reader :year, :departments

  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def low_expenses
    @departments.find_all { |department| department.expenses < 500}
  end

  def employee_salaries
    employee_salary_hash = {}
    @departments.each do |department|
      department.employees.each do |employee|
        employee_salary_hash[employee.name] = employee.salary
      end
    end
    employee_salary_hash
  end
end