class CreateGameBoards < ActiveRecord::Migration
  def change
    create_table :game_boards do |t|
      t.string :name, limit: 256, null: false
      t.integer :status, limit: 1, null: false
      t.integer :turn, limit: 1, null: false
      t.integer :total_boards, limit: 8, null: false, default: 0
      t.integer :completed_boards, limit: 8, null: false, default: 0
      t.integer :draws, limit: 8
      t.integer :white_wins, limit: 8
      t.integer :black_wins, limit: 8

      t.timestamps null: false
    end
  end
end
