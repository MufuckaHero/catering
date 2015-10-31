class ChangeDataTypeForState < ActiveRecord::Migration
  def change
    change_table :sprints do |t|
      t.change :state, :string
    end
  end
end
