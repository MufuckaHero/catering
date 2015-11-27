class BusinessLunch < Dish
  validates :sort_order, uniqueness: true

  has_many :one_dishes
end