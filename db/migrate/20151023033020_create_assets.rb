class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :filename
      t.string :type
      t.integer :assetable_id, index: true
      t.string :assetable_type, index: true

      t.timestamps null: false
    end
  end
end
