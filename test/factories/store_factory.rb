FactoryBot.define do
  factory :store, class: 'Store' do
    sequence(:name, 'A') { |n| "Test Store #{n}" }
  end
end