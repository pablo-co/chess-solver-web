class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :value, null: false
      t.references :game_board, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :plays, :game_boards
  end
end
