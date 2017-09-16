class AddMilanoFinanzaRatingToAnalyses < ActiveRecord::Migration[5.0]
  def change
    add_column :analyses, :milano_finanza_rating, :string
  end
end
