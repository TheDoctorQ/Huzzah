class CreateFeasts < ActiveRecord::Migration[7.0]
  def change
    create_table :feasts do |t|
      t.string :name
      t.string :location
      t.string :variety

      t.timestamps
    end
  end
end
