require './lib/employee'
require './lib/department'
require './lib/budget'

RSpec.describe Budget do 
  it 'will exist and have attributes' do 
    budget = Budget.new("2023")

    expect(budget).to be_a(Budget)
    expect(budget.year).to eq("2023")
    expect(budget.departments).to eq([])
  end

  it 'can add departements' do 
    budget = Budget.new("2023")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    brian = Employee.new({name: "Brian Hayes", age: "20", salary: "1000000000"})
    customer_service.hire(bobbi)
    customer_service.hire(aaron)  
    sales.hire(brian)
    budget.add_department(customer_service)
    budget.add_department(sales)

    expect(budget.departments).to eq([customer_service, sales])
  end

  it 'will list all departments with expenses less that 500' do 
    budget = Budget.new("2023")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    brian = Employee.new({name: "Brian Hayes", age: "20", salary: "1000000000"})
    customer_service.hire(bobbi)
    customer_service.hire(aaron)
    sales.hire(brian)
    budget.add_department(customer_service)
    budget.add_department(sales)
    
    expect(budget.low_expenses).to eq([customer_service, sales])

    sales.expense(1000)

    expect(budget.low_expenses).to eq([customer_service])
  end

  it 'will list all of the employees salaries' do 
    budget = Budget.new("2023")
    customer_service = Department.new("Customer Service")
    sales = Department.new("Sales")
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"}) 
    brian = Employee.new({name: "Brian Hayes", age: "20", salary: "1000000000"})
    customer_service.hire(bobbi)
    customer_service.hire(aaron)
    sales.hire(brian)
    budget.add_department(customer_service)
    budget.add_department(sales)
    
    expect(budget.emloyee_salaries).to eq({
      "Bobbi Jaeger" => 100000, 
      "Aaron Tanaka" => 90000, 
      "Brian Hayes" =>  1000000000 
    })
  end
end