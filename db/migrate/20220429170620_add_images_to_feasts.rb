class AddImagesToFeasts < ActiveRecord::Migration[7.0]
  def change
    add_column :feasts, :image, :string
  end
end
