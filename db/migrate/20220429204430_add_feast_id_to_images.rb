class AddFeastIdToImages < ActiveRecord::Migration[7.0]
  
  def change
    add_column :images, :feast_id, :integer
  end
  
end
