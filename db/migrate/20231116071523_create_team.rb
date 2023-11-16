class CreateTeam < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.timestamps
    end

    add_reference :teams, :entity, foreign_key: true
  end
end
