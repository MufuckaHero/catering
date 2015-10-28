class DailyMenu < ActiveRecord::Base
 before_save :delete_nil

  private
  def delete_nil
    self.dish_ids = self.dish_ids.reject!{ |item| item == nil } 
  end
end