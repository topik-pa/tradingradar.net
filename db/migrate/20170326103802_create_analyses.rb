class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.string :isin
      t.decimal :borsaItalianaSupport
      t.decimal :borsaItalianaResistance
      t.string :borsaItalianaFTA
      t.decimal :xxivOreSupport
      t.decimal :xxivOreResistance
      t.string :xxivOreShortTrend
      t.string :xxivOreFTAIndex
      t.string :xxivOreRSI
      t.string :xxivOreRSIDiv
      t.decimal :repubblicaSupport
      t.decimal :repubblicaResistance
      t.boolean :investingDotComRating

      t.timestamps
    end
  end
end
