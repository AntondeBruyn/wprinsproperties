class AddPriceToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :price, :string
  end
end
