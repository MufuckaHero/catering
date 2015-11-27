class DailyRation < ActiveRecord::Base
  validates :price, :dish_id, :sprint_id, presence: true

  belongs_to :person
  belongs_to :daily_menu
  belongs_to :sprint
  belongs_to :dish
end
