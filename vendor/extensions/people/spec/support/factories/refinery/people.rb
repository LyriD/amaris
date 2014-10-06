
FactoryGirl.define do
  factory :person, :class => Refinery::People::Person do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

