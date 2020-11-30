class CreateCompetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :competitions do |t|
     # t.integer :winner_id
     # t.integer :loser_id
      t.integer :team1_id
      t.integer :team2_id
      t.integer :game_id
      t.integer :game_week
      #t.integer :team1_score
      #t.integer :team2_score

      t.timestamps
    end
  end
end
