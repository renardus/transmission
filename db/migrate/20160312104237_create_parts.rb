class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :category_id
      t.string :name
      t.string :value_type
      t.string :default_value
      t.text :possible_values
      t.string :upper_boundary
      t.string :lower_boundary
      t.boolean :is_required
      t.boolean :is_fixed
      t.boolean :is_in_row
      t.string :hint
      t.string :placeholder
      t.string :label

      t.timestamps null: false
    end
  end
end
