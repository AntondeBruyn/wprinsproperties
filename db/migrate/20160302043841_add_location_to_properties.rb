class AddLocationToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :location, :string
  end
end
