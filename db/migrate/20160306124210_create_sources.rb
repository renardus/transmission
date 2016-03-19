class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string  :ancestry
      t.integer :ancestry_depth, default: 0
      t.string  :names_depth_cache
      t.string  :name, null: false
      t.integer :category_id, null: false
      t.boolean :fertile, default: true
      t.integer :user_id
      t.text    :remarks

      t.timestamps null: false
    end
    add_index :sources, :name, unique: true
    add_index :sources, :ancestry
  end
end
