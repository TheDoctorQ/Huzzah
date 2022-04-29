class AddVendorIdToImages < ActiveRecord::Migration[7.0]
  
  def change
    add_column :images, :vendor_id, :integer
  end
  
end
