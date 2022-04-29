class AddImagesToVendors < ActiveRecord::Migration[7.0]
  def change
    add_column :vendors, :image, :string
  end
end
