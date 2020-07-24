FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    name { 'test-name' }
    lastname { 'test-lastname' }

    # we should install some faker name and lastname here
  end
end
