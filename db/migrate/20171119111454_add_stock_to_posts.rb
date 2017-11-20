class AddStockToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :stock, :string
  end
end
