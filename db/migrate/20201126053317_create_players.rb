class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nfl_team
      t.integer :projected_points
      t.integer :team_id, :default => 0
      #t.integer :week1_points, :default => 0
     # t.integer :week2_points, :default => 0
      #t.integer :week3_points,  :default => 0
     # t.integer :week4_points, :default => 0
     # t.integer :week5_points, :default => 0

      t.timestamps
    end
  end
end
