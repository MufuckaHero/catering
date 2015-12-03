class DailyMenu < ActiveRecord::Base
  validates :day_number, presence: true, uniqueness: true
  validates :max_total, presence: true, :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/ }

  has_many :daily_rations

  before_save :day
  before_save :delete_nil

  private
  def delete_nil
    self.dish_ids = self.dish_ids.reject!{ |item| item == nil } 
  end

  def day
    _day = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']
    _day.each {|l| if l == self.day_number ; self.day_count = _day.index(l) + 1; end }
  end
end