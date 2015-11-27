class Dish < ActiveRecord::Base
  validates :title, :category_id, presence: true
  validates :price, presence: true, :format => { :with => /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/ }

  has_many :daily_rations
  belongs_to :category
end
