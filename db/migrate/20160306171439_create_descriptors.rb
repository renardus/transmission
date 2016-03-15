class CreateDescriptors < ActiveRecord::Migration
  def change
    create_table :descriptors do |t|
      t.integer :source_id, null: false
      t.integer :part_id, null: false
      t.string  :name, null: false
      t.text :content

      t.timestamps null: false
    end
  end
end
