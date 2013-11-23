require 'factory_girl'

FactoryGirl.define do
  sequence(:sequential_email) {|n| "test#{n}@test.com"}
  sequence(:sequential_name) {|n| "Name #{n}"}
  sequence(:sequential_system) {|n| "System #{n}"}

  factory :user do
    email { generate(:sequential_email) }
    password 'test1234'
  end

  factory :appointment do
    user
    country
  end

  factory :country do
    name { generate(:sequential_name) }
    political_system { generate( :sequential_system) }
  end
  
end