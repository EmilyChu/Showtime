FactoryGirl.define do
  factory :movie do 
    sequence(:title) { |n| "Movie#{n}"}
    description "blah blah" 
    rating { ["G", "PG", "PG-13", "R", "NC-17"].sample }
  end

end
