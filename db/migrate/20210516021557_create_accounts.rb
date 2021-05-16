class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :currency
      t.decimal :amount, default: nil, precision: 8, scale: 2
      t.references :user
    end
  end
end
