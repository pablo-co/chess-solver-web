class CreatePlayBoards < ActiveRecord::Migration
  def change
    create_table :play_boards do |t|
      t.integer :turn, limit: 1, null: false
      t.references :play, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :play_boards, :plays
  end
end
