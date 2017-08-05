class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.string :isin
      t.decimal :borsa_italiana_support
      t.decimal :borsa_italiana_resistance
      t.string :borsa_italiana_fta
      t.decimal :xxivore_support
      t.decimal :xxivore_resistance
      t.string :xxivore_shorttrend
      t.decimal :xxivore_ftaindex
      t.decimal :xxivore_rsi
      t.string :xxivore_rsidiv
      t.decimal :repubblica_support
      t.decimal :repubblica_resistance
      t.boolean :investing_dotcomrating
      
      t.references :stock, foreign_key: true

      t.timestamps
    end
  end
end
