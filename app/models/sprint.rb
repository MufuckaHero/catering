class Sprint < ActiveRecord::Base
  include AASM

  attr_accessor :active_admin_requested_event

  aasm do
    state :pending, :initial => true
    state :started
    state :closed

    event :start do   
      transitions :from => :pending, :to => :started
    end

    event :close do
      transitions :from => :started, :to => :closed
    end
  end
end
