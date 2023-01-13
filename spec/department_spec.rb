require './lib/employee'
require './lib/department'

RSpec.describe Department do 
  it 'will exist and have attributes' do 
    customer_service = Department.new("Customer Service")   

    expect(customer_service).to be_a(Department)
    expect(customer_service.name).to eq("Customer Service")
    expect(customer_service.employees).to eq([])
  end
end