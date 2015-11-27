class Category < ActiveRecord::Base
  validates :title, presence: true
  validates :sort_order, uniqueness: true

  has_many :dishes
end
