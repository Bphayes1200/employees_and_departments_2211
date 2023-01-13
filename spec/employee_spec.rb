require './lib/employee'

RSpec.describe Employee do 
  it 'will exist and have attributes' do 
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})

    expect(bobbi).to be_a(Employee)
    expect(bobbi.name).to eq("Bobbi Jaeger")
    expect(bobbi.age).to eq(30)
    expect(bobbi.salary).to eq(100000)
  end

  it 'will give a raise to an employee' do 
    bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "$100000"})

    expect(bobbi.salary).to eq(100000)

    bobbi.give_raise(5000)
    
    expect(bobbi.salary).to eq(10500)
  end
end