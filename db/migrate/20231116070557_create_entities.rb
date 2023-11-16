class CreateEntities < ActiveRecord::Migration[7.1]
  def change
    create_table :entities do |t|
      t.string :type
      t.string :email
      t.string :password
      t.string :team_name
      t.string :symbol
      t.timestamps
    end

    add_index :entities, :type
  end
end
