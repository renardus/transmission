class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :category_id
      t.string :name
      t.string :value_type
      t.string :default_value, default: ''
      t.text :possible_values, default: ''
      t.string :upper_boundary, default: ''
      t.string :lower_boundary, default: ''
      t.boolean :is_required, default: false
      t.boolean :is_fixed, default: false
      t.boolean :is_in_row, default: false
      t.string :hint, default: ''
      t.string :placeholder, default: ''
      t.string :label, default: ''

      t.timestamps null: false
    end
  end
end
