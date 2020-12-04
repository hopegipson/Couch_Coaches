class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.integer :team1_total_score, :default => 0
      t.integer :team2_total_score, :default => 0
      t.integer :team1_player1_score, :default => 0
      t.integer :team1_player2_score, :default => 0
      t.integer :team1_player3_score, :default => 0
      t.integer :team1_player4_score, :default => 0
      t.integer :team1_player5_score, :default => 0
      t.integer :team1_player6_score, :default => 0
      t.integer :team1_player7_score, :default => 0
      t.integer :team2_player1_score, :default => 0
      t.integer :team2_player2_score, :default => 0
      t.integer :team2_player3_score, :default => 0
      t.integer :team2_player4_score, :default => 0
      t.integer :team2_player5_score, :default => 0
      t.integer :team2_player6_score, :default => 0
      t.integer :team2_player7_score, :default => 0

      t.boolean :scored, :default => false
      t.timestamps
    end
  end
end
