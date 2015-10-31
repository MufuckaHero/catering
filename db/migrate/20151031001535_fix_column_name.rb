class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :sprints, :state, :aasm_state
  end
end
