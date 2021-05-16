FactoryBot.define do
  factory :user, class: 'User' do
    sequence(:email, 'A') { |n| "email_#{n}@example.com"}
    password { "[omitted]" }
    
    factory :user_with_role_admin do 
      after :create do |user|
        user.add_role(:admin)
      end
    end 
  end
end