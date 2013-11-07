# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "Project 1"
    customer "Customer 1"
    key "some_key"
  end
end
