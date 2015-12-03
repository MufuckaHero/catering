class AddDayCountToDailyMenus < ActiveRecord::Migration
  def change
    add_column :daily_menus, :day_count, :integer
  end
end
