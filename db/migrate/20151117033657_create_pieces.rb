class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.integer :kind, limit: 1, null: false
      t.integer :color, limit: 1, null: false
      t.integer :x, limit: 1, null: false
      t.integer :y, limit: 1, null: false

      t.integer :boardable_id, index: true
      t.string :boardable_type, limit: 50

      t.timestamps null: false
    end
  end
end
