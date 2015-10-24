class CreateDailyRations < ActiveRecord::Migration
  def change
    create_table :daily_rations do |t|
      t.float :price
      t.integer :quantity
      t.integer :person_id, index: true, using: 'gin'  
      t.integer :daily_menu_id, index: true, using: 'gin'  
      t.integer :spriny_id, index: true, using: 'gin'  
      t.integer :dish_id, index: true, using: 'gin'  

      t.timestamps null: false
    end
  end
end
