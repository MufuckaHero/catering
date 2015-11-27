class OneDish < Dish
  validates :sort_order, uniqueness: true

  belongs_to :dish
end