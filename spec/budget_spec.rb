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
end