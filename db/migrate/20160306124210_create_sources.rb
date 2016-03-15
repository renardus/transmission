class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string  :ancestry
      t.string  :name, null: false
      t.integer :category_id, null: false
      t.integer :user_id
      t.text    :remarks

      t.timestamps null: false
    end
    add_index :sources, :name, unique: true
    add_index :sources, :ancestry
  end
end
