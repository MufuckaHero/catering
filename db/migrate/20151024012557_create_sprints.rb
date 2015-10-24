class CreateSprints < ActiveRecord::Migration
  def change
    create_table :sprints do |t|
      t.string :title
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :state

      t.timestamps null: false
    end
  end
end
