class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.text :description
      t.references :account_from
      t.references :account_to

      t.timestamps
    end
  end
end
