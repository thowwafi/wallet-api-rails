class CreateWallets < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.decimal :balance, default: 0.0
      t.references :owner, polymorphic: true
      t.timestamps
    end
  end
end
