class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :isin
      t.string :cod
      t.string :name
      t.string :sector
      t.decimal :lastPrice
      t.string :variation
      t.string :marketPhase

      t.timestamps
    end
  end
end
