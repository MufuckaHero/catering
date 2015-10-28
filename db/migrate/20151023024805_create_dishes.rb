class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title
      t.integer :sort_order
      t.text :description
      t.float :price
      t.string :type, index: true, using: 'gin'
      t.integer :children_ids, array: true, default: [], index: true, using: 'gin'  
      t.integer :category_id, index: true, using: 'gin'

      t.timestamps null: false
    end
  end
end
