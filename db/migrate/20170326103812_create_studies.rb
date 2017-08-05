class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.decimal :resistance
      t.decimal :support
      t.string :direction
      t.decimal :mmp1
      t.decimal :mmp2
      t.string :gap
      t.string :trading_position
      t.string :reversal_chart_pattern
      t.string :continuation_chart_pattern
      t.string :reversal_candlestick
      t.string :continuation_candlestick
      t.string :rsi
      t.string :rsi_cross
      t.string :rsi_divergence
      t.string :stoch
      t.string :stoch_cross
      t.string :stoch_divergence
      t.string :macd
      t.string :macd_cross
      t.decimal :buy
      t.decimal :sell
      t.decimal :stop_loss
      t.string :image_usrl
      t.text :note
      t.references :stock, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
