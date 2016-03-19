class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :ancestry
      t.integer :ancestry_depth, default: 0
      t.string :names_depth_cache
      t.boolean :retrievable, default: false
      t.boolean :fertile, default: true
      t.string :remarks

      t.timestamps null: false
    end
    add_index :categories, :ancestry
  end
end
