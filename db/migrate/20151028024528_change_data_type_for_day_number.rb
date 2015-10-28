class ChangeDataTypeForDayNumber < ActiveRecord::Migration
  def change
    change_table :daily_menus do |t|
      t.change :day_number, :string
    end
  end
end
