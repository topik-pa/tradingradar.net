class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :isin
      t.string :cod
      t.string :name
      t.string :sector
      t.decimal :last_price
      t.string :variation
      t.string :market_phase

      t.timestamps
    end
  end
end
