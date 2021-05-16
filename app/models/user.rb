class User < ApplicationRecord
  rolify
  has_secure_password

  belongs_to :store

  validates :email, presence: true, uniqueness: true

  delegate :can?, :cannot?, to: :ability

  def permissions
    ability.permissions
  end

  private

  def ability
    @ability ||= Ability.new(self)
  end
end
