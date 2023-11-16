class CreateStock < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.timestamps
    end

    add_reference :stocks, :entity, foreign_key: true
  end
end
