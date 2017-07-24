class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.decimal :resistance
      t.decimal :support
      t.string :direction
      t.decimal :mmp1
      t.decimal :mmp2
      t.string :gap
      t.string :tradingPosition
      t.string :reversalChartPattern
      t.string :continuationChartPattern
      t.string :reversalCandlestick
      t.string :continuationCandlestick
      t.string :rsi
      t.string :rsiCross
      t.string :rsiDivergence
      t.string :stoch
      t.string :stochCross
      t.string :stochDivergence
      t.string :macd
      t.string :macdCross
      t.decimal :buy
      t.decimal :sell
      t.decimal :stopLoss
      t.string :imageUrl
      t.text :note
      t.references :stock, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
