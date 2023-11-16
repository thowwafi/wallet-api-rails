class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps
    end

    add_reference :users, :entity, foreign_key: true
  end
end
