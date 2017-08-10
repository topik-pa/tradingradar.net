class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.string :isin
      t.decimal :borsa_italiana_support, precision: 10, scale: 4
      t.decimal :borsa_italiana_resistance, precision: 10, scale: 4
      t.string :borsa_italiana_fta
      t.decimal :xxivore_support, precision: 10, scale: 4
      t.decimal :xxivore_resistance, precision: 10, scale: 4
      t.string :xxivore_shorttrend
      t.decimal :xxivore_ftaindex
      t.decimal :xxivore_rsi
      t.string :xxivore_rsidiv
      t.decimal :repubblica_support, precision: 10, scale: 4
      t.decimal :repubblica_resistance, precision: 10, scale: 4
      t.boolean :investing_dotcomrating
      
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
