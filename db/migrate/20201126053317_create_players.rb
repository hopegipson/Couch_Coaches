class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :team
      t.integer :projected_points
      t.integer :team_id


      t.timestamps
    end
  end
end
