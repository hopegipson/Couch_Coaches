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
      t.integer :team1_total_score
      t.integer :team2_total_score

      t.timestamps
    end
  end
end
