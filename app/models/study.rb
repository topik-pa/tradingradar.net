class Study < ApplicationRecord
  belongs_to :stock
  belongs_to :user
  validates :resistance, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :support, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :direction, inclusion: { in: %w(None Uptrend Lateral Downtrend), message: "%{value} is not a valid direction value" }, allow_blank: true
  validates :mmp1, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :mmp2, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :gap, inclusion: { in: %w(None Up Down), message: "%{value} is not a valid gap value" }, allow_blank: true
  validates :trading_position, inclusion: { in: %w(None Long Neutral Short), message: "%{value} is not a valid trading position value" }, allow_blank: true
  validates :rsi, inclusion: { in: %w(None Overbought Neutral Oversold), message: "%{value} is not a valid RSI value" }, allow_blank: true
  validates :rsi_cross, inclusion: { in: %w(None Rising Falling), message: "%{value} is not a valid RSI crossover value" }, allow_blank: true
  validates :rsi_divergence , inclusion: { in: %w(None Bullish Neutral Bearish), message: "%{value} is not a valid RSI divergence value" }, allow_blank: true
  validates :stoch, inclusion: { in: %w(None Overbought Neutral Oversold), message: "%{value} is not a valid Stochastic value" }, allow_blank: true
  validates :stoch_cross, inclusion: { in: %w(None Rising Falling), message: "%{value} is not a valid Stochastic crossover value" }, allow_blank: true
  validates :stoch_divergence , inclusion: { in: %w(None Bullish Neutral Bearish), message: "%{value} is not a valid Stochastic divergence value" }, allow_blank: true
  validates :macd, inclusion: { in: %w(None Overbought Neutral Oversold), message: "%{value} is not a valid MACD value" }, allow_blank: true
  validates :macd_cross, inclusion: { in: %w(None Rising Falling), message: "%{value} is not a valid MACD crossover value" }, allow_blank: true
  validates :buy, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :sell, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
  validates :stop_loss, numericality: {greater_than_or_equal_to: 0.00}, allow_blank: true
end