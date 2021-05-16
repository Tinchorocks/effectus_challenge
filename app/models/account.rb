class Account < ApplicationRecord
  belongs_to :user
  validates :currency, presence: true
end
