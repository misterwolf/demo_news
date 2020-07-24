FactoryGirl.define do
  factory :news, class: News do
    author { association :user }

    title 'test-title'
    content { 'content-test' }
  end
end
