class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :type
      t.decimal :amount, precision: 10, scale: 2
      t.references :source_wallet, foreign_key: { to_table: :wallets }
      t.references :target_wallet, foreign_key: { to_table: :wallets }

      t.timestamps
    end
  end
end
