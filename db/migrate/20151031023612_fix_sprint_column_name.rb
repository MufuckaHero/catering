class FixSprintColumnName < ActiveRecord::Migration
  def change
    rename_column :daily_rations, :spriny_id, :sprint_id
  end
end
