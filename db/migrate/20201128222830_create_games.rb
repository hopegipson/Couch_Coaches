class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.timestamps
    end
  end
end
