class Sprint < ActiveRecord::Base
  validates :title, :aasm_state, presence: true

  has_many :daily_rations

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
