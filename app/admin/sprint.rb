ActiveAdmin.register Sprint do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end



  permit_params :title, :started_at, :finished_at, :aasm_state

  index do
    selectable_column
    column :title
    column :started_at
    column :finished_at
    column "State", :aasm_state
    actions
  end

  after_save do |sprint|
    event = params[:sprint][:active_admin_requested_event]
    unless event.blank?
      # whitelist to ensure we don't run an arbitrary method
      safe_event = (sprint.aasm.events.map(&:name) & [event.to_sym]).first
      raise "Forbidden event #{event} requested on instance #{sprint.id}" unless safe_event
      # launch the event with bang
      sprint.send("#{safe_event}!")
    end
  end

  form do |f|
    f.inputs 'Sprint' do
    # your form ...
      f.input :title
      f.input :started_at
      f.input :finished_at



    # display current status as disabled to avoid modifying it directly
      f.input :aasm_state, :input_html => { :disabled => true }, :label => 'Current status'

    # use the attr_accessor to pass the data
      f.input :active_admin_requested_event, :label => 'Change status', :as => :select, :collection => f.object.aasm.events.map(&:name)
    end
    f.actions 

  end


end
