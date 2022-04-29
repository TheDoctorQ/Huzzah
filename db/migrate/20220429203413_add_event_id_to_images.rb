class AddEventIdToImages < ActiveRecord::Migration[7.0]
  
  def change
    add_column :images, :event_id, :integer
  end
  
end
