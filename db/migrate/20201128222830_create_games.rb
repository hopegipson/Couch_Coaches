class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
     # t.integer :score_1
     # t.integer :score_2
    #  t.references :match, foreign_key: true
     # t.references :winner
     # t.references :loser
    #  t.integer :team1_id
    #  t.integer :team2_id
    #  t.integer :week_id
      t.integer :winner_id
      t.integer :loser_id
      t.integer :team1_total_score, :default => 0
      t.integer :team2_total_score, :default => 0
      t.integer :team1_player1_score, :default => 0
      t.integer :team1_player2_score, :default => 0
      t.integer :team1_player3_score, :default => 0
      t.integer :team1_player4_score, :default => 0
      t.integer :team1_player5_score, :default => 0
      t.integer :team2_player1_score, :default => 0
      t.integer :team2_player2_score, :default => 0
      t.integer :team2_player3_score, :default => 0
      t.integer :team2_player4_score, :default => 0
      t.integer :team2_player5_score, :default => 0
      t.boolean :scored, :default => false
      t.timestamps
    end
  end
end
